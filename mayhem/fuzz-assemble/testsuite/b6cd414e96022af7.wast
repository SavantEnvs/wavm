(module
  (type $0 (func (result v128)))
  (export "return_v128" (func $1))
  
  (func $1 (type $0)
    (result v128)
    v128.const i32x4 0x00000000 0x00000001 0x00000002 0x00000003
    ))