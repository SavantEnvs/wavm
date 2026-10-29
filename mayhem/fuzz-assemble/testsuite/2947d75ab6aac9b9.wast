(module
  (type $0 (func (param i32 i32 i32 i32) (result i32)))
  (type $1 (func (param i32)))
  (type $2 (func))
  (type $3 (func (result i32)))
  (memory $5  1 5)
  (table $4  3 6 funcref)
  (global $14  (mut i32) (i32.const 0))
  (global $15  (mut f32) (f32.const 0x0.000000p-127))
  (global $16  (mut i64) (i64.const 0))
  (global $17  (mut f64) (f64.const 0x0.0000000000000p-1023))
  (export "to_test" (func $22))
  (elem $18 (i32.const 0)
    $23 $24 $25)
  
  (func $22 (type $2)
    i32.const -2147483648
    i32.const 0
    i32.const 0
    table.init $18
    )
  
  (func $23 (type $3)
    (result i32)
    i32.const 4
    )
  
  (func $24 (type $3)
    (result i32)
    i32.const 5
    )
  
  (func $25 (type $3)
    (result i32)
    i32.const 6
    ))