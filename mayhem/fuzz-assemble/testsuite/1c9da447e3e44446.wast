(module
  (type $0 (func))
  (type $1 (func (param i32) (result externref)))
  (type $2 (func (param i32) (result funcref)))
  (type $3 (func (param i32 externref)))
  (type $4 (func (param i32 funcref)))
  (type $5 (func (param i32 i32)))
  (type $6 (func (param i32) (result i32)))
  (table $t2  1 externref)
  (table $t3  2 funcref)
  (export "get-externref" (func $8))
  (export "get-funcref" (func $f3))
  (export "set-externref" (func $9))
  (export "set-funcref" (func $10))
  (export "set-funcref-from" (func $11))
  (export "is_null-funcref" (func $12))
  (elem $7 (table $t3) (i32.const 1)
    $dummy)
  
  (func $dummy (type $0)
    )
  
  (func $8 (type $1)
    (param $i i32)
    (result externref)
    local.get $i
    table.get $t2
    )
  
  (func $f3 (type $2)
    (param $i i32)
    (result funcref)
    local.get $i
    table.get $t3
    )
  
  (func $9 (type $3)
    (param $i i32)
    (param $r externref)
    local.get $i
    local.get $r
    table.set $t2
    )
  
  (func $10 (type $4)
    (param $i i32)
    (param $r funcref)
    local.get $i
    local.get $r
    table.set $t3
    )
  
  (func $11 (type $5)
    (param $i i32)
    (param $j i32)
    local.get $i
    local.get $j
    table.get $t3
    table.set $t3
    )
  
  (func $12 (type $6)
    (param $i i32)
    (result i32)
    local.get $i
    call $f3
    ref.is_null
    ))