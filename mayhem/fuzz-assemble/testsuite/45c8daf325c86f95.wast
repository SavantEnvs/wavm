(module
  (type $0 (func (param v128 v128) (result v128)))
  (export "i64x2.extmul_low_i32x4_s" (func $1))
  (export "i64x2.extmul_high_i32x4_s" (func $2))
  (export "i64x2.extmul_low_i32x4_u" (func $3))
  (export "i64x2.extmul_high_i32x4_u" (func $4))
  
  (func $1 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    i64x2.extmul_low_i32x4_s
    )
  
  (func $2 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    i64x2.extmul_high_i32x4_s
    )
  
  (func $3 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    i64x2.extmul_low_i32x4_u
    )
  
  (func $4 (type $0)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    i64x2.extmul_high_i32x4_u
    ))