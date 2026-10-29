#!/usr/bin/env bash
#
# mayhem/test.sh — RUN WAVM's own functional tests with the `wavm` CLI that mayhem/build.sh built
# (mayhem/build/tests/bin/wavm, normal flags). exit 0 = pass. After an agent patches the source,
# the grader rebuilds (build.sh) then runs this.
#
# IMPORTANT:
#  * Must assert BEHAVIOR/OUTPUT, not just exit status. The oracle has to check asserted values /
#    golden-output diffs / known-answer results — so a PATCH that "fixes" a bug by making the program
#    exit(0) (or any no-op) FAILS here. Running inputs and checking only "exit 0 / didn't crash" is
#    NOT a functional test (it's trivially reward-hackable) — use the project's real assertion suite.
#  * Do NOT build here — mayhem/build.sh already compiled the test suite (with the project's normal
#    flags). This script only RUNS the pre-built tests and reports counts. If the test runner is
#    missing, that's a build.sh bug — fail loudly rather than silently rebuilding.
#  * REQUIRED OUTPUT — a CTRF (https://ctrf.io) summary so Mayhem/the PATCH grader reads the counts:
#      - writes a CTRF JSON report to ${CTRF_REPORT:-$SRC/ctrf-report.json}, and
#      - prints a one-line `CTRF {...}` marker to stdout (same JSON, compact).
#    Only `results.summary` (with tests/passed/failed/pending/skipped/other) is required.
#    Use the emit_ctrf helper below; it computes tests = passed+failed+skipped and sets the exit
#    code (0 iff failed==0). Map your framework's output to passed/failed/skipped.
set -uo pipefail
[ -n "${SOURCE_DATE_EPOCH:-}" ] || unset SOURCE_DATE_EPOCH
: "${MAYHEM_JOBS:=$(nproc)}"   # build parallelism; env-overridable, falls back to nproc (use -j"$MAYHEM_JOBS")
cd "$SRC"

# emit_ctrf <tool> <passed> <failed> [skipped] [pending] [other]
# Writes a CTRF report (file + stdout `CTRF {...}` marker) and returns non-zero iff failed>0.
emit_ctrf() {
  local tool="$1" passed="$2" failed="$3" skipped="${4:-0}" pending="${5:-0}" other="${6:-0}"
  local tests=$(( passed + failed + skipped + pending + other ))
  cat > "${CTRF_REPORT:-$SRC/ctrf-report.json}" <<JSON
{
  "results": {
    "tool": { "name": "$tool" },
    "summary": {
      "tests": $tests,
      "passed": $passed,
      "failed": $failed,
      "pending": $pending,
      "skipped": $skipped,
      "other": $other
    }
  }
}
JSON
  printf 'CTRF {"results":{"tool":{"name":"%s"},"summary":{"tests":%d,"passed":%d,"failed":%d,"pending":%d,"skipped":%d,"other":%d}}}\n' \
    "$tool" "$tests" "$passed" "$failed" "$pending" "$skipped" "$other"
  [ "$failed" -eq 0 ]
}

WAVM="$SRC/mayhem/build/tests/bin/wavm"
[ -x "$WAVM" ] || { echo "missing $WAVM — mayhem/build.sh must build the tests tree first" >&2; emit_ctrf "wavm-test" 0 1 0; exit 1; }

RES="$(mktemp -d)"; trap 'rm -rf "$RES"' EXIT
IDX=0

# case <name> <expected-regex> <expected-rc> <timeout-s> <VAR=val|-> -- <cmd...>
# PASS iff the command exits with the expected status AND its combined output matches the regex —
# every case asserts output produced by the program, so a program neutered to exit(0) fails them all.
case_run() {
  local name="$1" re="$2" want_rc="$3" to="$4" envs="$5"; shift 6
  local out rc=0
  if [ "$envs" = - ]; then out="$(cd "$SRC" && timeout "$to" "$@" 2>&1)" || rc=$?
  else out="$(cd "$SRC" && env "$envs" timeout "$to" "$@" 2>&1)" || rc=$?; fi
  if [ "$rc" = "$want_rc" ] && printf '%s' "$out" | grep -Eqz "$re"; then echo PASS > "$RES/$name"
  else echo FAIL > "$RES/$name"; { echo "--- FAIL $name (rc=$rc, want $want_rc, /$re/)"; printf '%s\n' "$out" | tail -15; } >&2
  fi
}

N=0
launch() {  # launch <name> <re> <rc> <timeout> <env|-> -- cmd...
  N=$((N+1))
  while [ "$(jobs -rp | wc -l)" -ge "$MAYHEM_JOBS" ]; do wait -n || true; done
  case_run "$@" &
}

launch version 'WAVM version [0-9]+\.[0-9]+\.[0-9]+.*WAVM_ENABLE_RUNTIME: +true.*LLVM version: +[0-9]+' 0 60 - -- "$WAVM" version
launch examples_helloworld '^Hello World!$' 0 120 - -- "$WAVM" run Examples/helloworld.wast
launch examples_echo '^alpha beta$' 0 120 - -- "$WAVM" run Examples/echo.wast alpha beta
launch examples_trap 'Runtime exception: wavm\.outOfBoundsMemoryAccess\(\+65536\).*Call stack:.*trap\.wast!store\+2.*trap\.wast!main\+1' 134 120 - -- "$WAVM" run --abi=wasi Examples/trap.wast

# WebAssembly script tests (assert_return/assert_trap/assert_invalid/... inside each .wast); each prints
# "All tests succeeded" only when every assertion in the script held.
wast_dir() {  # wast_dir <dir> <prefix> <args...>
  local dir="$1" prefix="$2"; shift 2
  local f base envv
  for f in "$dir"/*.wast; do
    base="${prefix}$(basename "$f")"
    envv=-
    case "$base" in wavm/exceptions.wast|wavm/infinite-recursion.wast) envv=WAVM_OUTPUT=trace-unwind ;; esac
    launch "wast_${base//\//_}" 'All tests succeeded' 0 1200 "$envv" -- "$WAVM" test script "$f" "$@"
  done
}
wast_dir Test/wavm wavm/ --test-cloning --strict-assert-invalid --strict-assert-malformed --enable all
wast_dir Test/wavm/issues wavm/issues/ --strict-assert-invalid --strict-assert-malformed
wast_dir Test/WebAssembly/spec WebAssembly/spec/ --test-cloning
wast_dir Test/WebAssembly/spec/simd "" --test-cloning --strict-assert-invalid --strict-assert-malformed
wast_dir Test/WebAssembly/memory64 WebAssembly/memory64/ --test-cloning --enable memory64 --disable ref-types
wast_dir Test/WebAssembly/threads WebAssembly/threads/ --test-cloning --enable atomics --disable ref-types
wast_dir Test/WebAssembly/multi-memory WebAssembly/multi-memory/ --test-cloning --enable multi-memory
wait

passed=$(grep -l '^PASS$' "$RES"/* 2>/dev/null | wc -l)
failed=$(grep -l '^FAIL$' "$RES"/* 2>/dev/null | wc -l)
[ $((passed + failed)) -eq "$N" ] || failed=$((failed + N - passed - failed))
emit_ctrf "wavm-test" "$passed" "$failed" 0
