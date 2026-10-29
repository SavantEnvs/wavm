(module
  (type $0 (func (param i32) (result i32)))
  (export "even" (func $even))
  (export "odd" (func $odd))
  
  (func $even (type $0)
    (param $n i32)
    (result i32)
    local.get $n
    i32.const 0
    i32.eq
    if $if (result i32)
      i32.const 1
    else
      local.get $n
      i32.const 1
      i32.sub
      call $odd
    end ;; $if
    )
  
  (func $odd (type $0)
    (param $n i32)
    (result i32)
    local.get $n
    i32.const 0
    i32.eq
    if $if (result i32)
      i32.const 0
    else
      local.get $n
      i32.const 1
      i32.sub
      call $even
    end ;; $if
    ))