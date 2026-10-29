(module
  (type $0 (func (param f32) (result f32)))
  (type $1 (func (param f64) (result f64)))
  (export "f32.no_fold_recip_recip" (func $2))
  (export "f64.no_fold_recip_recip" (func $3))
  
  (func $2 (type $0)
    (param $x f32)
    (result f32)
    f32.const 0x1.000000p-0
    f32.const 0x1.000000p-0
    local.get $x
    f32.div
    f32.div
    )
  
  (func $3 (type $1)
    (param $x f64)
    (result f64)
    f64.const 0x1.0000000000000p-0
    f64.const 0x1.0000000000000p-0
    local.get $x
    f64.div
    f64.div
    ))