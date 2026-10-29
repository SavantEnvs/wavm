(module
  (type $0 (func (result f64)))
  (type $1 (func (result i64)))
  (type $2 (func))
  (memory $3  1 1)
  (export "f64.load" (func $5))
  (export "i64.load" (func $6))
  (export "f64.store" (func $7))
  (export "i64.store" (func $8))
  (export "reset" (func $9))
  
  (func $5 (type $0)
    (result f64)
    i32.const 0
    f64.load
    )
  
  (func $6 (type $1)
    (result i64)
    i32.const 0
    i64.load
    )
  
  (func $7 (type $2)
    i32.const 0
    f64.const +nan:0x4000000000000
    f64.store
    )
  
  (func $8 (type $2)
    i32.const 0
    i64.const 9219994337134247936
    i64.store
    )
  
  (func $9 (type $2)
    i32.const 0
    i64.const 0
    i64.store
    )
  
  (data $4 (i32.const 0)
    "\00\00\00\00\00\00\f4\7f"))