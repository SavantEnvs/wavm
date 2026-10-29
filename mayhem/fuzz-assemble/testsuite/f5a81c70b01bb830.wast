(module
  (type $0 (func (param i32 i32 i32 i32) (result i32)))
  (type $1 (func (param i32)))
  (type $2 (func))
  (import "wasi_unstable" "fd_write" (func $wasi_fd_write (param i32 i32 i32 i32) (result i32)))
  (import "wasi_unstable" "proc_exit" (func $wasi_proc_exit (param i32)))
  (memory $3  1)
  (export "memory" (memory $3))
  (export "_start" (func $6))
  
  (func $6 (type $2)
    i32.const 1
    i32.const 8
    i32.const 1
    i32.const 4
    call $wasi_fd_write
    call $wasi_proc_exit
    )
  
  (data $4 (i32.const 8)
    "\10\00\00\00\02\00\00\00")
  
  (data $5 (i32.const 16)
    "A\n"))