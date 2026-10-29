(module
  (type $0 (func))
  (type $1 (func (param i32) (result i32)))
  (memory $2  1 1)
  (export "memory0" (memory $2))
  (export "test" (func $7))
  (export "load8_u" (func $8))
  
  (func $7 (type $0)
    i32.const 7
    i32.const 0
    i32.const 4
    memory.init $4
    data.drop $4
    i32.const 15
    i32.const 1
    i32.const 3
    memory.init $6
    data.drop $6
    i32.const 20
    i32.const 15
    i32.const 5
    memory.copy
    i32.const 21
    i32.const 29
    i32.const 1
    memory.copy
    i32.const 24
    i32.const 10
    i32.const 1
    memory.copy
    i32.const 13
    i32.const 11
    i32.const 4
    memory.copy
    i32.const 19
    i32.const 20
    i32.const 5
    memory.copy
    )
  
  (func $8 (type $1)
    (param $0 i32)
    (result i32)
    local.get $0
    i32.load8_u
    )
  
  (data $3 (i32.const 2)
    "\03\01\04\01")
  
  (data $4 
    "\02\07\01\08")
  
  (data $5 (i32.const 12)
    "\07\05\02\03\06")
  
  (data $6 
    "\05\09\02\07\06"))