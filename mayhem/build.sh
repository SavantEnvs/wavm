#!/usr/bin/env bash
#
# mayhem/build.sh — build WAVM's four libFuzzer harnesses (fuzz-assemble, fuzz-disassemble,
# fuzz-instantiate, fuzz-compile-model), their run-once reproducers, and the `wavm` CLI used by
# mayhem/test.sh. Runs inside the commit image as `mayhem` in /mayhem. Air-gapped and re-runnable:
# LLVM comes from the image (/opt/toolchains/llvm) and nothing here fetches anything.
set -euo pipefail

[ -n "${SOURCE_DATE_EPOCH:-}" ] || unset SOURCE_DATE_EPOCH

: "${SANITIZER_FLAGS=-fsanitize=address,undefined -fno-sanitize-recover=all -fno-omit-frame-pointer}"
: "${DEBUG_FLAGS:=-g -gdwarf-3}"
: "${CC:=clang}" ; : "${CXX:=clang++}" ; : "${LIB_FUZZING_ENGINE:=-fsanitize=fuzzer}"
: "${MAYHEM_JOBS:=$(nproc)}"
: "${COVERAGE_FLAGS=}"
: "${LLVM_DIR:=/opt/toolchains/llvm/lib/cmake/llvm}"
export SANITIZER_FLAGS DEBUG_FLAGS CC CXX LIB_FUZZING_ENGINE MAYHEM_JOBS COVERAGE_FLAGS

cd "$SRC"
BUILD="$SRC/mayhem/build"   # gitignored by mayhem/.gitignore
mkdir -p "$BUILD"

SAN_OPTS=()
case "$SANITIZER_FLAGS" in *address*) SAN_OPTS+=(-DWAVM_ENABLE_ASAN=ON) ;; esac
case "$SANITIZER_FLAGS" in *undefined*) SAN_OPTS+=(-DWAVM_ENABLE_UBSAN=ON) ;; esac

# LeakSanitizer off at build time: a TU defining __lsan_is_turned_off, linked into every sanitized binary.
$CXX $SANITIZER_FLAGS $DEBUG_FLAGS -c "$SRC/mayhem/lsan_off.cc" -o "$BUILD/lsan_off.o"

FUZZERS="fuzz-assemble fuzz-disassemble fuzz-instantiate fuzz-compile-model"

# A re-run can resolve the compiler to a different path than the first run did (e.g. under the
# image's ccache pre-fill); CMake then wipes its cache itself and, on this project, loses LLVM_DIR
# mid-configure. Dropping the cache up front makes every run a clean, deterministic configure.
configure() {  # configure <dir> <extra cmake args...>
  local dir="$1"; shift
  rm -f "$dir/CMakeCache.txt"
  cmake -S "$SRC" -B "$dir" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX" \
    -DLLVM_DIR="$LLVM_DIR" "$@"
}

# 1) libFuzzer binaries: WAVM compiled with the sanitizers + libFuzzer coverage instrumentation.
configure "$BUILD/fuzz" \
  -DWAVM_ENABLE_STATIC_LINKING=ON -DWAVM_ENABLE_RELEASE_ASSERTS=ON -DWAVM_ENABLE_FUZZ_TARGETS=ON \
  -DWAVM_ENABLE_LIBFUZZER=ON "${SAN_OPTS[@]}" \
  -DCMAKE_C_FLAGS="$SANITIZER_FLAGS $DEBUG_FLAGS" \
  -DCMAKE_CXX_FLAGS="$SANITIZER_FLAGS $DEBUG_FLAGS" \
  -DCMAKE_EXE_LINKER_FLAGS="$BUILD/lsan_off.o"
# shellcheck disable=SC2086
cmake --build "$BUILD/fuzz" -j"$MAYHEM_JOBS" --target $FUZZERS
for f in $FUZZERS; do cp "$BUILD/fuzz/bin/$f" "$SRC/$f"; done

# 2) Run-once reproducers: the same harnesses linked against WAVM's own file/directory input driver
#    (Test/fuzz/FuzzTargetCommonMain.h, used when WAVM_ENABLE_LIBFUZZER is off) instead of libFuzzer.
configure "$BUILD/standalone" \
  -DWAVM_ENABLE_STATIC_LINKING=ON -DWAVM_ENABLE_RELEASE_ASSERTS=ON -DWAVM_ENABLE_FUZZ_TARGETS=ON \
  "${SAN_OPTS[@]}" \
  -DCMAKE_C_FLAGS="$SANITIZER_FLAGS $DEBUG_FLAGS" \
  -DCMAKE_CXX_FLAGS="$SANITIZER_FLAGS $DEBUG_FLAGS" \
  -DCMAKE_EXE_LINKER_FLAGS="$BUILD/lsan_off.o"
# shellcheck disable=SC2086
cmake --build "$BUILD/standalone" -j"$MAYHEM_JOBS" --target $FUZZERS
for f in $FUZZERS; do cp "$BUILD/standalone/bin/$f" "$SRC/$f-standalone"; done

# 3) The `wavm` CLI with the project's NORMAL flags (no sanitizers), run by mayhem/test.sh.
configure "$BUILD/tests" \
  -DWAVM_ENABLE_FUZZ_TARGETS=OFF \
  -DCMAKE_C_FLAGS="$COVERAGE_FLAGS" -DCMAKE_CXX_FLAGS="$COVERAGE_FLAGS"
cmake --build "$BUILD/tests" -j"$MAYHEM_JOBS" --target wavm
