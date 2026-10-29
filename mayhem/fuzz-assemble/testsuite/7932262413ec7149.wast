(module
  (type $0 (func))
  (import "mem" "shared" (memory $1 1 10 shared))
  (export "run" (func $2))
  
  (func $2 (type $0)
    i32.const 0
    i32.const 42
    i32.store
    ))