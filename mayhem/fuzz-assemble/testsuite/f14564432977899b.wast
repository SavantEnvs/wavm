(module
  (type $0 (func (param i32 i32) (result i32)))
  (type $1 (func (param i32)))
  (type $2 (func (param i32 i32 i32 i32) (result i32)))
  (export "args_sizes_get" (func $3))
  (export "args_get" (func $4))
  (export "proc_exit" (func $5))
  (export "fd_write" (func $6))
  
  (func $3 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    i32.const 0
    )
  
  (func $4 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    i32.const 0
    )
  
  (func $5 (type $1)
    (param $0 i32)
    unreachable
    )
  
  (func $6 (type $2)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (param $3 i32)
    (result i32)
    i32.const 0
    ))