(module
  (type $0 (func (result i32)))
  (type $1 (func (param i32)))
  (global $glob  i32 (i32.const 42))
  (global $mut_glob  (mut i32) (i32.const 142))
  (export "glob" (global $glob))
  (export "get" (func $2))
  (export "mut_glob" (global $mut_glob))
  (export "get_mut" (func $3))
  (export "set_mut" (func $4))
  
  (func $2 (type $0)
    (result i32)
    global.get $glob
    )
  
  (func $3 (type $0)
    (result i32)
    global.get $mut_glob
    )
  
  (func $4 (type $1)
    (param $0 i32)
    local.get $0
    global.set $mut_glob
    ))