(module
  (type $0 (func))
  (memory $1  1)
  (memory $m  1)
  
  (func $2 (type $0)
    (local $v v128)
    i32.const 0
    local.get $v
    v128.load8_lane 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.load8_lane $m 1
    drop
    i32.const 0
    local.get $v
    v128.store8_lane 1
    i32.const 0
    local.get $v
    v128.store8_lane 1
    i32.const 0
    local.get $v
    v128.store8_lane 1
    i32.const 0
    local.get $v
    v128.store8_lane 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    i32.const 0
    local.get $v
    v128.store8_lane $m 1
    ))