(module
  (type $0 (func (param v128) (result v128)))
  (export "i32x4.trunc_sat_f64x2_s_zero" (func $1))
  (export "i32x4.trunc_sat_f64x2_u_zero" (func $2))
  
  (func $1 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i32x4.trunc_sat_f64x2_s_zero
    )
  
  (func $2 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i32x4.trunc_sat_f64x2_u_zero
    ))