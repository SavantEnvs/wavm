(module
  (type $0 (func))
  (type $1 (func (result i32)))
  (type $2 (func (result f32)))
  (type $3 (func (param i64) (result i64)))
  (memory $4  i64 1 1)
  (export "zero_everything" (func $5))
  (export "test_store_to_load" (func $6))
  (export "test_redundant_load" (func $7))
  (export "test_dead_store" (func $8))
  (export "malloc" (func $malloc))
  (export "malloc_aliasing" (func $9))
  
  (func $5 (type $0)
    i64.const 0
    i32.const 0
    i32.store
    i64.const 4
    i32.const 0
    i32.store
    i64.const 8
    i32.const 0
    i32.store
    i64.const 12
    i32.const 0
    i32.store
    )
  
  (func $6 (type $1)
    (result i32)
    i64.const 8
    i32.const 0
    i32.store
    i64.const 5
    f32.const -0x0.000000p-127
    f32.store
    i64.const 8
    i32.load
    )
  
  (func $7 (type $1)
    (result i32)
    (local $t i32)
    (local $s i32)
    i64.const 8
    i32.load
    local.set $t
    i64.const 5
    i32.const -2147483648
    i32.store
    i64.const 8
    i32.load
    local.set $s
    local.get $t
    local.get $s
    i32.add
    )
  
  (func $8 (type $2)
    (result f32)
    (local $t f32)
    i64.const 8
    i32.const 589505315
    i32.store
    i64.const 11
    f32.load
    local.set $t
    i64.const 8
    i32.const 0
    i32.store
    local.get $t
    )
  
  (func $malloc (type $3)
    (param $size i64)
    (result i64)
    i64.const 16
    )
  
  (func $9 (type $1)
    (result i32)
    (local $x i64)
    (local $y i64)
    i64.const 4
    call $malloc
    local.set $x
    i64.const 4
    call $malloc
    local.set $y
    local.get $x
    i32.const 42
    i32.store
    local.get $y
    i32.const 43
    i32.store
    local.get $x
    i32.load
    ))