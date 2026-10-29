(module
  (type $0 (func (param i32 i32) (result i32)))
  (type $1 (func (param i32)))
  (type $2 (func (param i32 i32 i32 i32) (result i32)))
  (type $3 (func (param i32 i64 i32 i32) (result i32)))
  (type $4 (func (param i32) (result i32)))
  (export "args_sizes_get" (func $5))
  (export "args_get" (func $6))
  (export "proc_exit" (func $7))
  (export "fd_write" (func $8))
  (export "fd_read" (func $9))
  (export "fd_seek" (func $10))
  (export "fd_close" (func $11))
  (export "environ_sizes_get" (func $12))
  (export "environ_get" (func $13))
  
  (func $5 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    i32.const 0
    )
  
  (func $6 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    i32.const 0
    )
  
  (func $7 (type $1)
    (param $0 i32)
    unreachable
    )
  
  (func $8 (type $2)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (param $3 i32)
    (result i32)
    i32.const 0
    )
  
  (func $9 (type $2)
    (param $0 i32)
    (param $1 i32)
    (param $2 i32)
    (param $3 i32)
    (result i32)
    i32.const 0
    )
  
  (func $10 (type $3)
    (param $0 i32)
    (param $1 i64)
    (param $2 i32)
    (param $3 i32)
    (result i32)
    i32.const 0
    )
  
  (func $11 (type $4)
    (param $0 i32)
    (result i32)
    i32.const 0
    )
  
  (func $12 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    i32.const 0
    )
  
  (func $13 (type $0)
    (param $0 i32)
    (param $1 i32)
    (result i32)
    i32.const 0
    ))