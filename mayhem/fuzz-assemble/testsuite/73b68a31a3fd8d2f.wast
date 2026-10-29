(module
  (type $out-i32 (func (result i32)))
  (table $0  10 funcref)
  (export "call-7" (func $3))
  (export "call-9" (func $4))
  (elem $1 (i32.const 7)
    $const-i32-a)
  (elem $2 (i32.const 9)
    $const-i32-b)
  
  (func $const-i32-a (type $out-i32)
    (result i32)
    i32.const 65
    )
  
  (func $const-i32-b (type $out-i32)
    (result i32)
    i32.const 66
    )
  
  (func $3 (type $out-i32)
    (result i32)
    i32.const 7
    call_indirect $0 (type $out-i32)
    )
  
  (func $4 (type $out-i32)
    (result i32)
    i32.const 9
    call_indirect $0 (type $out-i32)
    ))