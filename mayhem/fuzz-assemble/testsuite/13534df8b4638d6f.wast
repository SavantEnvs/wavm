(module
  (type $0 (func (param v128) (result v128)))
  (export "i32x4.extadd_pairwise_i16x8_s" (func $1))
  (export "i32x4.extadd_pairwise_i16x8_u" (func $2))
  
  (func $1 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i32x4.extadd_pairwise_i16x8_s
    )
  
  (func $2 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i32x4.extadd_pairwise_i16x8_u
    ))