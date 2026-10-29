(module
  (type $0 (func (param f32 f32) (result i32)))
  (export "eq" (func $1))
  (export "ne" (func $2))
  (export "lt" (func $3))
  (export "le" (func $4))
  (export "gt" (func $5))
  (export "ge" (func $6))
  
  (func $1 (type $0)
    (param $x f32)
    (param $y f32)
    (result i32)
    local.get $x
    local.get $y
    f32.eq
    )
  
  (func $2 (type $0)
    (param $x f32)
    (param $y f32)
    (result i32)
    local.get $x
    local.get $y
    f32.ne
    )
  
  (func $3 (type $0)
    (param $x f32)
    (param $y f32)
    (result i32)
    local.get $x
    local.get $y
    f32.lt
    )
  
  (func $4 (type $0)
    (param $x f32)
    (param $y f32)
    (result i32)
    local.get $x
    local.get $y
    f32.le
    )
  
  (func $5 (type $0)
    (param $x f32)
    (param $y f32)
    (result i32)
    local.get $x
    local.get $y
    f32.gt
    )
  
  (func $6 (type $0)
    (param $x f32)
    (param $y f32)
    (result i32)
    local.get $x
    local.get $y
    f32.ge
    ))