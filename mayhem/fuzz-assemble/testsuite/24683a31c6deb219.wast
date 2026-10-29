(module
  (type $0 (func (param i32) (result i32)))
  (type $1 (func))
  (export "recurse" (func $recurse))
  (export "tail_recurse" (func $tail_recurse))
  
  (func $recurse (type $0)
    (param $0 i32)
    (result i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    local.get $0
    i32.const 1
    i32.add
    local.set $1
    local.get $0
    i32.const 2
    i32.add
    local.set $2
    local.get $0
    i32.const 3
    i32.add
    local.set $3
    local.get $0
    i32.const 4
    i32.add
    local.set $4
    local.get $1
    call $recurse
    local.get $2
    i32.add
    local.get $3
    i32.add
    local.get $4
    i32.add
    )
  
  (func $tail_recurse (type $1)
    call $tail_recurse
    ))