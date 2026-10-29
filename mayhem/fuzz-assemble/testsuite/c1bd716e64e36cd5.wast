(module
  (type $0 (func (result f32)))
  (type $1 (func (result i32)))
  (type $2 (func))
  (memory $3  1 1)
  (export "f32.load" (func $5))
  (export "i32.load" (func $6))
  (export "f32.store" (func $7))
  (export "i32.store" (func $8))
  (export "reset" (func $9))
  
  (func $5 (type $0)
    (result f32)
    i32.const 0
    f32.load
    )
  
  (func $6 (type $1)
    (result i32)
    i32.const 0
    i32.load
    )
  
  (func $7 (type $2)
    i32.const 0
    f32.const +nan:0x500001
    f32.store
    )
  
  (func $8 (type $2)
    i32.const 0
    i32.const 2144337921
    i32.store
    )
  
  (func $9 (type $2)
    i32.const 0
    i32.const 0
    i32.store
    )
  
  (data $4 (i32.const 0)
    "\01\00\d0\7f"))