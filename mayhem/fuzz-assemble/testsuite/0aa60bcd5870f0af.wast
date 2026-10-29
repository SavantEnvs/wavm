(module
  (type $0 (func (param v128) (result v128)))
  (export "f32x4.ceil" (func $1))
  (export "f32x4.floor" (func $2))
  (export "f32x4.trunc" (func $3))
  (export "f32x4.nearest" (func $4))
  
  (func $1 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    f32x4.ceil
    )
  
  (func $2 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    f32x4.floor
    )
  
  (func $3 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    f32x4.trunc
    )
  
  (func $4 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    f32x4.nearest
    ))