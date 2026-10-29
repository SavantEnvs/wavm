(module
  (type $0 (func (result f64)))
  (type $1 (func (result i64)))
  (type $2 (func))
  (memory $3  i64 1 1)
  (export "f64.load" (func $5))
  (export "i64.load" (func $6))
  (export "f64.store" (func $7))
  (export "i64.store" (func $8))
  (export "reset" (func $9))
  
  (func $5 (type $0)
    (result f64)
    i64.const 0
    f64.load
    )
  
  (func $6 (type $1)
    (result i64)
    i64.const 0
    i64.load
    )
  
  (func $7 (type $2)
    i64.const 0
    f64.const +nan:0xc000000000001
    f64.store
    )
  
  (func $8 (type $2)
    i64.const 0
    i64.const 9222246136947933185
    i64.store
    )
  
  (func $9 (type $2)
    i64.const 0
    i64.const 0
    i64.store
    )
  
  (data $4 (i64.const 0)
    "\01\00\00\00\00\00\fc\7f"))