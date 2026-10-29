(module
  (type $0 (func (param i32) (result i32)))
  (import "Mm" "mem" (memory $1 1 8))
  (export "grow" (func $2))
  
  (func $2 (type $0)
    (param $a i32)
    (result i32)
    local.get $a
    memory.grow
    ))