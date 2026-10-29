(module
  (type $0 (func (param i64)))
  (type $1 (func (param i32 i32) (result i32)))
  (type $2 (func (param i32 i32 i64) (result i32)))
  (type $3 (func (param i32 i64 i64) (result i32)))
  (memory $4  1 1 shared)
  (export "init" (func $5))
  (export "memory.atomic.notify" (func $6))
  (export "memory.atomic.wait32" (func $7))
  (export "memory.atomic.wait64" (func $8))
  
  (func $5 (type $0)
    (param $value i64)
    i32.const 0
    local.get $value
    i64.store
    )
  
  (func $6 (type $1)
    (param $addr i32)
    (param $count i32)
    (result i32)
    local.get $addr
    local.get $count
    memory.atomic.notify
    )
  
  (func $7 (type $2)
    (param $addr i32)
    (param $expected i32)
    (param $timeout i64)
    (result i32)
    local.get $addr
    local.get $expected
    local.get $timeout
    memory.atomic.wait32
    )
  
  (func $8 (type $3)
    (param $addr i32)
    (param $expected i64)
    (param $timeout i64)
    (result i32)
    local.get $addr
    local.get $expected
    local.get $timeout
    memory.atomic.wait64
    ))