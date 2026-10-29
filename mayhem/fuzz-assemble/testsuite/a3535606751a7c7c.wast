(module
  (type $0 (func (param i32) (result i32)))
  (type $1 (func (param i32 i32) (result funcref)))
  (table $t  10 funcref)
  (export "grow" (func $3))
  (export "check-table-null" (func $4))
  (elem $2 declare
    $4)
  
  (func $3 (type $0)
    (param $0 i32)
    (result i32)
    ref.null func
    local.get $0
    table.grow $t
    )
  
  (func $4 (type $1)
    (param $0 i32)
    (param $1 i32)
    (result funcref)
    (local $2 funcref)
    ref.func $4
    local.set $2
    block $block
      loop $loop
        local.get $0
        table.get $t
        local.set $2
        local.get $2
        ref.is_null
        i32.eqz
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