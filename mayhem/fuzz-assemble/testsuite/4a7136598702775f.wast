(module
  (type $0 (func (result i32)))
  (export "try_with_divide_by_zero" (func $1))
  
  (func $1 (type $0)
    (result i32)
    try $try (result i32)
      i32.const 0
      i32.const 0
      i32.div_s
      drop
      i32.const 7
    catch_all
      i32.const 8
    end ;; $try
    ))