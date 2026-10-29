(module
  (type $0 (func))
  (type $1 (func (param i32)))
  (type $2 (func (param f32)))
  (type $3 (func (result i32)))
  (type $4 (func (result f32)))
  (type $5 (func (param i32) (result i32)))
  (type $6 (func (param i64) (result i64)))
  (memory $9  2)
  (table $7  10 funcref)
  (table $8  10 20 funcref)
  (global $10  i32 (i32.const 55))
  (global $11  f32 (f32.const 0x1.600000p+5))
  (global $12  (mut i64) (i64.const 66))
  (export "func" (func $13))
  (export "func-i32" (func $14))
  (export "func-f32" (func $15))
  (export "func->i32" (func $16))
  (export "func->f32" (func $17))
  (export "func-i32->i32" (func $18))
  (export "func-i64->i64" (func $19))
  (export "global-i32" (global $10))
  (export "global-f32" (global $11))
  (export "global-mut-i64" (global $12))
  (export "table-10-inf" (table $7))
  (export "table-10-20" (table $8))
  (export "memory-2-inf" (memory $9))
  
  (func $13 (type $0)
    )
  
  (func $14 (type $1)
    (param $0 i32)
    )
  
  (func $15 (type $2)
    (param $0 f32)
    )
  
  (func $16 (type $3)
    (result i32)
    i32.const 22
    )
  
  (func $17 (type $4)
    (result f32)
    f32.const 0x1.600000p+3
    )
  
  (func $18 (type $5)
    (param $0 i32)
    (result i32)
    local.get $0
    )
  
  (func $19 (type $6)
    (param $0 i64)
    (result i64)
    local.get $0
    ))