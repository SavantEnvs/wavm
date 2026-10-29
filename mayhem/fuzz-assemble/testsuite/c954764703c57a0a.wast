(module
  (type $0 (func (param v128) (result v128)))
  (export "i16x8.extadd_pairwise_i8x16_s" (func $1))
  (export "i16x8.extadd_pairwise_i8x16_u" (func $2))
  
  (func $1 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i16x8.extadd_pairwise_i8x16_s
    )
  
  (func $2 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i16x8.extadd_pairwise_i8x16_u
    ))