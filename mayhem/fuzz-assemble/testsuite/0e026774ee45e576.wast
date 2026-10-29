(module
  (type $0 (func (param i32 i32 i32)))
  (type $1 (func (param i32) (result i32)))
  (memory $2  1)
  (export "init" (func $4))
  (export "load8_u" (func $5))
  
  (func $4 (type $0)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    local.get $0
    local.get $1
    local.get $2
    memory.init $3
    )
  
  (func $5 (type $1)
    (param $0 i32)
    (result i32)
    local.get $0
    i32.load8_u
    )
  
  (data $3 
    "\aa\bb\cc\dd"))