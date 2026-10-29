(module
  (type $0 (func (result i32)))
  (export "call" (func $1))
  
  (func $1 (type $0)
    (result i32)
    call $g
    )
  
  (func $g (type $0)
    (result i32)
    i32.const 2
    ))