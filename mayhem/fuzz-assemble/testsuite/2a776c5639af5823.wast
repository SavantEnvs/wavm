(module
  (type $0 (func (param i32)))
  (type $1 (func (param i32 i32 i32 i32) (result i32)))
  (type $2 (func))
  (import "wasi_unstable" "proc_exit" (func $proc_exit (param i32)))
  (import "wasi_unstable" "fd_read" (func $fd_read (param i32 i32 i32 i32) (result i32)))
  (memory $3  1)
  (export "memory" (memory $3))
  (export "_start" (func $4))
  
  (func $4 (type $2)
    i32.const 0
    i32.const 65536
    i32.const 1
    i32.const 0
    call $fd_read
    i32.const 21
    i32.ne
    if $if
      i32.const 1
      call $proc_exit
    end ;; $if
    i32.const 0
    call $proc_exit
    ))