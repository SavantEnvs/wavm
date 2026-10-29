(module
  (type $0 (func (result i32)))
  (type $1 (func (param i32)))
  (memory $2  3 8)
  (export "size" (func $3))
  (export "grow" (func $4))
  
  (func $3 (type $0)
    (result i32)
    memory.size
    )
  
  (func $4 (type $1)
    (param $sz i32)
    local.get $sz
    memory.grow
    drop
    ))