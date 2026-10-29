(module
  (type $proc (func (result i32)))
  (type $sig (func (param i32) (result i32)))
  (export "f" (func $0))
  (export "g" (func $1))
  (export "p" (func $2))
  
  (func $0 (type $sig)
    (param $var i32)
    (result i32)
    (local $0 i32)
    local.get $0
    )
  
  (func $g (type $sig)
    (param $var i32)
    (result i32)
    (local $0 i32)
    local.get $0
    )
  
  (func $1 (type $sig)
    (param $0 i32)
    (result i32)
    local.get $0
    call $g
    )
  
  (func $2 (type $proc)
    (result i32)
    (local $var i32)
    i32.const 42
    local.set $var
    local.get $var
    ))