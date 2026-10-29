(module
  (type $0 (func (param f64 f64) (result i32)))
  (export "eq" (func $1))
  (export "ne" (func $2))
  (export "lt" (func $3))
  (export "le" (func $4))
  (export "gt" (func $5))
  (export "ge" (func $6))
  
  (func $1 (type $0)
    (param $x f64)
    (param $y f64)
    (result i32)
    local.get $x
    local.get $y
    f64.eq
    )
  
  (func $2 (type $0)
    (param $x f64)
    (param $y f64)
    (result i32)
    local.get $x
    local.get $y
    f64.ne
    )
  
  (func $3 (type $0)
    (param $x f64)
    (param $y f64)
    (result i32)
    local.get $x
    local.get $y
    f64.lt
    )
  
  (func $4 (type $0)
    (param $x f64)
    (param $y f64)
    (result i32)
    local.get $x
    local.get $y
    f64.le
    )
  
  (func $5 (type $0)
    (param $x f64)
    (param $y f64)
    (result i32)
    local.get $x
    local.get $y
    f64.gt
    )
  
  (func $6 (type $0)
    (param $x f64)
    (param $y f64)
    (result i32)
    local.get $x
    local.get $y
    f64.ge
    ))