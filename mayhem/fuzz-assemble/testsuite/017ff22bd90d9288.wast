(module
  (type $0 (func (result i32)))
  (memory $1  0 0)
  (export "memsize" (func $3))
  
  (func $3 (type $0)
    (result i32)
    memory.size
    )
  
  (data $2 (i32.const 0)))