(module
  (type $0 (func (result i32)))
  (export "a" (func $1))
  (export "b" (func $1))
  (export "c" (func $1))
  
  (func $1 (type $0)
    (result i32)
    i32.const 42
    ))