(module
  (type $0 (func (param v128 v128) (result v128)))
  (export "f64x2.eq" (func $1))
  (export "f64x2.ne" (func $2))
  (export "f64x2.lt" (func $3))
  (export "f64x2.le" (func $4))
  (export "f64x2.gt" (func $5))
  (export "f64x2.ge" (func $6))
  
  (func $1 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    f64x2.eq
    )
  
  (func $2 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    f64x2.ne
    )
  
  (func $3 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    f64x2.lt
    )
  
  (func $4 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    f64x2.le
    )
  
  (func $5 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    f64x2.gt
    )
  
  (func $6 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    f64x2.ge
    ))