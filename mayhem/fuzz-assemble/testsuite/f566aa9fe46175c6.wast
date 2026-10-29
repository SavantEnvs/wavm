(module
  (type $T (func (result i32)))
  (type $0 (func (param i32) (result i32)))
  (table $1  2 2 funcref)
  (export "callt" (func $3))
  (elem $2 (i32.const 0)
    $t1 $t2)
  
  (func $t1 (type $T)
    (result i32)
    i32.const 1
    )
  
  (func $t2 (type $T)
    (result i32)
    i32.const 2
    )
  
  (func $3 (type $0)
    (param $i i32)
    (result i32)
    local.get $i
    call_indirect $1 (type $T)
    ))