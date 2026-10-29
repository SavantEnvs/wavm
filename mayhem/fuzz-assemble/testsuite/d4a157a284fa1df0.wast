(module
  (type $0 (func (param i32 i32 i64) (result i32)))
  (type $1 (func (param i32 i64 i64) (result i32)))
  (type $2 (func (param i32 i32) (result i32)))
  (type $3 (func (param i32 i32)))
  (type $4 (func (param i32 i64)))
  (memory $5  1 1 shared)
  (export "memory.atomic.wait32" (func $6))
  (export "memory.atomic.wait64" (func $7))
  (export "memory.atomic.notify" (func $8))
  (export "i32.atomic.store" (func $9))
  (export "i64.atomic.store" (func $10))
  
  (func $6 (type $0)
    (param $addr i32)
    (param $expected i32)
    (param $timeout i64)
    (result i32)
    local.get $addr
    local.get $expected
    local.get $timeout
    memory.atomic.wait32
    )
  
  (func $7 (type $1)
    (param $addr i32)
    (param $expected i64)
    (param $timeout i64)
    (result i32)
    local.get $addr
    local.get $expected
    local.get $timeout
    memory.atomic.wait64
    )
  
  (func $8 (type $2)
    (param $addr i32)
    (param $numWaiters i32)
    (result i32)
    local.get $addr
    local.get $numWaiters
    memory.atomic.notify
    )
  
  (func $9 (type $3)
    (param $addr i32)
    (param $value i32)
    local.get $addr
    local.get $value
    i32.atomic.store
    )
  
  (func $10 (type $4)
    (param $addr i32)
    (param $value i64)
    local.get $addr
    local.get $value
    i64.atomic.store
    ))