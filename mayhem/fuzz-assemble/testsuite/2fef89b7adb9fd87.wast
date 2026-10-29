(module
  (type $0 (func))
  (type $S (func))
  (type $1 (func))
  (type $2 (func (result i32)))
  (type $3 (func (result i32)))
  (type $T (func (param i32) (result i32)))
  (type $U (func (param i32)))
  (import "spectest" "print_i32" (func $print (param i32)))
  (export "one" (func $6))
  (export "two" (func $7))
  (export "three" (func $8))
  (export "four" (func $9))
  
  (func $4 (type $0)
    )
  
  (func $5 (type $S)
    )
  
  (func $6 (type $3)
    (result i32)
    i32.const 13
    )
  
  (func $7 (type $T)
    (param $0 i32)
    (result i32)
    local.get $0
    i32.const 1
    i32.add
    )
  
  (func $8 (type $T)
    (param $a i32)
    (result i32)
    local.get $a
    i32.const 2
    i32.sub
    )
  
  (func $9 (type $U)
    (param $0 i32)
    local.get $0
    call $print
    ))