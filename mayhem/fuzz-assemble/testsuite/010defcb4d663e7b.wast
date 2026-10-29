(module
  (type $0 (func (param v128 v128) (result v128)))
  (export "i16x8.narrow_i32x4_u" (func $1))
  
  (func $1 (type $0)
    (param $a v128)
    (param $b v128)
    (result v128)
    local.get $a
    local.get $b
    i16x8.narrow_i32x4_u
    ))