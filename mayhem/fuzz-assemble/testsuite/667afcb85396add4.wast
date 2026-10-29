(module
  (type $0 (func (param v128) (result v128)))
  (export "i64x2.abs-i64x2.abs" (func $1))
  
  (func $1 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    i64x2.abs
    i64x2.abs
    ))