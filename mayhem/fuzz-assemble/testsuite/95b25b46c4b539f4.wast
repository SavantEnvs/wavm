(module
  (type $0 (func (result i32)))
  (type $1 (func))
  (type $2 (func (param i64) (result i64)))
  (type $3 (func (result i64)))
  (memory $4  i64 0)
  (export "load_at_zero" (func $5))
  (export "store_at_zero" (func $6))
  (export "load_at_page_size" (func $7))
  (export "store_at_page_size" (func $8))
  (export "grow" (func $9))
  (export "size" (func $10))
  
  (func $5 (type $0)
    (result i32)
    i64.const 0
    i32.load
    )
  
  (func $6 (type $1)
    i64.const 0
    i32.const 2
    i32.store
    )
  
  (func $7 (type $0)
    (result i32)
    i64.const 65536
    i32.load
    )
  
  (func $8 (type $1)
    i64.const 65536
    i32.const 3
    i32.store
    )
  
  (func $9 (type $2)
    (param $sz i64)
    (result i64)
    local.get $sz
    memory.grow
    )
  
  (func $10 (type $3)
    (result i64)
    memory.size
    ))