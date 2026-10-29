(module
  (type $0 (func (result i32)))
  (type $1 (func (param i32) (result i32)))
  (table $t1  4 externref)
  (table $t2  4 funcref)
  (table $t3  4 funcref)
  (export "call_indirect $t2" (func $6))
  (export "call_indirect $t3" (func $7))
  (elem $2 (table $t2) (i32.const 0)
    $0_0 $1_0 $2_0 $3_0)
  (elem $3 (table $t3) (i32.const 0)
    $4 $5)
  
  (func $0_0 (type $0)
    (result i32)
    i32.const 0
    )
  
  (func $1_0 (type $0)
    (result i32)
    i32.const 1
    )
  
  (func $2_0 (type $0)
    (result i32)
    i32.const 2
    )
  
  (func $3_0 (type $0)
    (result i32)
    i32.const 3
    )
  
  (func $4 (type $0)
    (result i32)
    i32.const 4
    )
  
  (func $5 (type $0)
    (result i32)
    i32.const 5
    )
  
  (func $6 (type $1)
    (param $index i32)
    (result i32)
    local.get $index
    call_indirect $t2 (type $0)
    )
  
  (func $7 (type $1)
    (param $index i32)
    (result i32)
    local.get $index
    call_indirect $t3 (type $0)
    ))