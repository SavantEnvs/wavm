(module
  (type $0 (func))
  (type $1 (func (result i32)))
  (type $2 (func (param i32) (result i32)))
  (import "Mt" "call" (func $f (param i32) (result i32)))
  (import "Mt" "h" (func $h (result i32)))
  (table $3  5 5 funcref)
  (export "Mt.call" (func $f))
  (export "call Mt.call" (func $5))
  (export "call" (func $6))
  (elem $4 (i32.const 0)
    $g $g $g $h $f)
  
  (func $g (type $1)
    (result i32)
    i32.const 5
    )
  
  (func $5 (type $2)
    (param $0 i32)
    (result i32)
    local.get $0
    call $f
    )
  
  (func $6 (type $2)
    (param $0 i32)
    (result i32)
    local.get $0
    call_indirect $3 (type $1)
    ))