(module
  (type $0 (func (result v128)))
  (memory $1  1)
  (export "as-i32x4.trunc_sat_f32x4_s-operand" (func $3))
  
  (func $3 (type $0)
    (result v128)
    i32.const 0
    v128.load
    i32x4.trunc_sat_f32x4_s
    )
  
  (data $2 (i32.const 0)
    "\00\00\00C\00\00\80?ff\e6?\00\00\80\bf"))