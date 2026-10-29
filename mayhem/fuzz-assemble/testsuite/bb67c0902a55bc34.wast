(module
  (type $0 (func (param f64) (result v128)))
  (type $1 (func (param v128) (result v128)))
  (export "loop" (func $2))
  
  (func $2 (type $0)
    (param $x f64)
    (result v128)
    local.get $x
    f64x2.splat
    loop $loop (param v128) (result v128)
      f64x2.neg
    end ;; $loop
    ))