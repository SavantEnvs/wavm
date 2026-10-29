(module
  (type $0 (func (param i32) (result i32)))
  (type $1 (func (param i64) (result i64)))
  (export "i32.div_s_5" (func $2))
  (export "i32.div_u_5" (func $3))
  (export "i64.div_s_5" (func $4))
  (export "i64.div_u_5" (func $5))
  
  (func $2 (type $0)
    (param $x i32)
    (result i32)
    local.get $x
    i32.const 5
    i32.div_s
    )
  
  (func $3 (type $0)
    (param $x i32)
    (result i32)
    local.get $x
    i32.const 5
    i32.div_u
    )
  
  (func $4 (type $1)
    (param $x i64)
    (result i64)
    local.get $x
    i64.const 5
    i64.div_s
    )
  
  (func $5 (type $1)
    (param $x i64)
    (result i64)
    local.get $x
    i64.const 5
    i64.div_u
    ))