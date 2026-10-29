(module
  (type $0 (func (param i32) (result i32)))
  (type $1 (func (param i32 i32) (result i32)))
  (memory $2  1)
  (export "grow" (func $3))
  (export "check-memory-zero" (func $4))
  
  (func $3 (type $0)
    (param $0 i32)
    (result i32)
    local.get $0
    memory.grow
    )
  
  (func $4 (type $1)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    (local $2 i32)
    i32.const 1
    local.set $2
    block $block
      loop $loop
        local.get $0
        i32.load8_u
        local.set $2
        local.get $2
        i32.const 0
        i32.ne
        br_if $block
        local.get $0
        local.get $1
        i32.ge_u
        br_if $block
        local.get $0
        i32.const 1
        i32.add
        local.set $0
        local.get $0
        local.get $1
        i32.le_u
        br_if $loop
      end ;; $loop
    end ;; $block
    local.get $2
    ))