(module
  (type $0 (func (result i32)))
  (type $1 (func))
  (type $2 (func (param i32) (result i32)))
  (memory $3  0)
  (export "load_at_zero" (func $4))
  (export "store_at_zero" (func $5))
  (export "load_at_page_size" (func $6))
  (export "store_at_page_size" (func $7))
  (export "grow" (func $8))
  (export "size" (func $9))
  
  (func $4 (type $0)
    (result i32)
    i32.const 0
    i32.load
    )
  
  (func $5 (type $1)
    i32.const 0
    i32.const 2
    i32.store
    )
  
  (func $6 (type $0)
    (result i32)
    i32.const 65536
    i32.load
    )
  
  (func $7 (type $1)
    i32.const 65536
    i32.const 3
    i32.store
    )
  
  (func $8 (type $2)
    (param $sz i32)
    (result i32)
    local.get $sz
    memory.grow
    )
  
  (func $9 (type $0)
    (result i32)
    memory.size
    ))