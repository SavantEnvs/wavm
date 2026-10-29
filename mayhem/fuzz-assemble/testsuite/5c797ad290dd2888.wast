(module
  (type $0 (func (param i32)))
  (type $1 (func (param i32 i32)))
  (import "spectest" "print_i32" (func $2 (param i32)))
  (import "spectest" "print_i32" (func $3 (param i32)))
  (export "print32" (func $4))
  
  (func $4 (type $1)
    (param $0 i32)
    (param $1 i32)
    local.get $0
    call $2
    local.get $1
    call $3
    ))