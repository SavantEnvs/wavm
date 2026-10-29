(module
  (type $0 (func (result i64)))
  (type $1 (func (param i64 i32)))
  (type $2 (func (param i64) (result i32)))
  (type $3 (func (param i64) (result i64)))
  (memory $4  i64 1)
  (export "store" (func $5))
  (export "load" (func $6))
  (export "memory.grow" (func $7))
  
  (func $addr_limit (type $0)
    (result i64)
    memory.size
    i64.const 65536
    i64.mul
    )
  
  (func $5 (type $1)
    (param $i i64)
    (param $v i32)
    call $addr_limit
    local.get $i
    i64.add
    local.get $v
    i32.store
    )
  
  (func $6 (type $2)
    (param $i i64)
    (result i32)
    call $addr_limit
    local.get $i
    i64.add
    i32.load
    )
  
  (func $7 (type $3)
    (param $0 i64)
    (result i64)
    local.get $0
    memory.grow
    ))