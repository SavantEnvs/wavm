(module
  (type $0 (func (param i32) (result i32)))
  (type $1 (func (param i64) (result i64)))
  (export "i32.no_fold_div_s_mul" (func $2))
  (export "i32.no_fold_div_u_mul" (func $3))
  (export "i64.no_fold_div_s_mul" (func $4))
  (export "i64.no_fold_div_u_mul" (func $5))
  
  (func $2 (type $0)
    (param $x i32)
    (result i32)
    local.get $x
    i32.const 6
    i32.div_s
    i32.const 6
    i32.mul
    )
  
  (func $3 (type $0)
    (param $x i32)
    (result i32)
    local.get $x
    i32.const 6
    i32.div_u
    i32.const 6
    i32.mul
    )
  
  (func $4 (type $1)
    (param $x i64)
    (result i64)
    local.get $x
    i64.const 6
    i64.div_s
    i64.const 6
    i64.mul
    )
  
  (func $5 (type $1)
    (param $x i64)
    (result i64)
    local.get $x
    i64.const 6
    i64.div_u
    i64.const 6
    i64.mul
    ))