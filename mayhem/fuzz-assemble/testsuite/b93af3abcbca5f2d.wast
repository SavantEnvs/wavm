(module
  (type $0 (func (result i32)))
  (import "mem" "shared" (memory $1 1 1 shared))
  (export "run" (func $2))
  
  (func $2 (type $0)
    (result i32)
    i32.const 0
    i32.load
    ))