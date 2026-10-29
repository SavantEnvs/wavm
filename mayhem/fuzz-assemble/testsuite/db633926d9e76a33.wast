(module
  (type $0 (func (param v128 v128) (result v128)))
  (export "eq" (func $1))
  (export "ne" (func $2))
  (export "lt_s" (func $3))
  (export "le_s" (func $4))
  (export "gt_s" (func $5))
  (export "ge_s" (func $6))
  
  (func $1 (type $0)
    (param $x v128)
    (param $y v128)
    (result v128)
    local.get $x
    local.get $y
    i64x2.eq
    )
  
  (func $2 (type $0)
    (param $x v128)
    (param $y v128)
    (result v128)
    local.get $x
    local.get $y
    i64x2.ne
    )
  
  (func $3 (type $0)
    (param $x v128)
    (param $y v128)
    (result v128)
    local.get $x
    local.get $y
    i64x2.lt_s
    )
  
  (func $4 (type $0)
    (param $x v128)
    (param $y v128)
    (result v128)
    local.get $x
    local.get $y
    i64x2.le_s
    )
  
  (func $5 (type $0)
    (param $x v128)
    (param $y v128)
    (result v128)
    local.get $x
    local.get $y
    i64x2.gt_s
    )
  
  (func $6 (type $0)
    (param $x v128)
    (param $y v128)
    (result v128)
    local.get $x
    local.get $y
    i64x2.ge_s
    ))