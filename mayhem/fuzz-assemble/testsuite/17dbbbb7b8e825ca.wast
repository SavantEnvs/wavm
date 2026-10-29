(module
  (type $0 (func (result i32)))
  (memory $mem1  1)
  (memory $mem2  1)
  (export "init1" (func $1))
  (export "init2" (func $2))
  
  (func $1 (type $0)
    (result i32)
    i32.const 1
    i32.const 0
    i32.const 4
    memory.init $d
    i32.const 1
    i32.load
    )
  
  (func $2 (type $0)
    (result i32)
    i32.const 1
    i32.const 4
    i32.const 4
    memory.init $mem2 $d
    i32.const 1
    i32.load $mem2
    )
  
  (data $d 
    "\01\00\00\00\02\00\00\00"))