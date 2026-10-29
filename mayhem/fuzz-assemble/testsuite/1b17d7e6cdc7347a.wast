(module
  (type $0 (func (param i32) (result i32)))
  (type $1 (func))
  (type $2 (func (result i32)))
  (type $3 (func (result i64)))
  (export "select-trap-left" (func $4))
  (export "select-trap-right" (func $5))
  (export "select-unreached" (func $6))
  (export "select_unreached_result_1" (func $7))
  (export "select_unreached_result_2" (func $8))
  (export "unreachable-num" (func $9))
  (export "unreachable-ref" (func $10))
  
  (func $4 (type $0)
    (param $cond i32)
    (result i32)
    unreachable
    i32.const 0
    local.get $cond
    select
    )
  
  (func $5 (type $0)
    (param $cond i32)
    (result i32)
    i32.const 0
    unreachable
    local.get $cond
    select
    )
  
  (func $6 (type $1)
    unreachable
    select
    unreachable
    i32.const 0
    select
    unreachable
    i32.const 0
    i32.const 0
    select
    unreachable
    i32.const 0
    i32.const 0
    i32.const 0
    select
    unreachable
    f32.const 0x0.000000p-127
    i32.const 0
    select
    unreachable
    )
  
  (func $7 (type $2)
    (result i32)
    unreachable
    select
    i32.add
    )
  
  (func $8 (type $3)
    (result i64)
    unreachable
    i64.const 0
    i32.const 0
    select
    i64.add
    )
  
  (func $9 (type $1)
    unreachable
    select
    i32.eqz
    drop
    )
  
  (func $10 (type $1)
    unreachable
    select
    ref.is_null
    drop
    ))