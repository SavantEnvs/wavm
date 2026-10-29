(module
  (type $0 (func (param i32 i32) (result i32)))
  
  (custom_section "custom"
    (after type)
    "this is the payload")
  
  
  (export "addTwo" (func $1))
  
  (func $1 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    local.get $0
    local.get $1
    i32.add
    )
  
  (custom_section "custom2"
    (after code)
    "this is the payload")
  
  )