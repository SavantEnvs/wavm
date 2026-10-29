(module
  (type $0 (func (param i32 i32 i32 i32) (result i32)))
  (type $1 (func (param i32)))
  (type $2 (func))
  (type $3 (func (result v128)))
  (memory $4  1)
  (global $5  i32 (i32.const 541))
  (global $6  (mut i32) (i32.const 191))
  (global $7  f32 (f32.const 0x1.0e8000p+9))
  (global $8  (mut f32) (f32.const 0x1.800000p+7))
  (global $9  i64 (i64.const 54))
  (global $10  (mut i64) (i64.const 19))
  (global $11  f64 (f64.const 0x1.b000000000000p+5))
  (global $12  (mut f64) (f64.const 0x1.3000000000000p+4))
  (global $13  (mut i32) (i32.const 0))
  (global $14  (mut f32) (f32.const 0x0.000000p-127))
  (global $15  (mut i64) (i64.const 0))
  (global $16  (mut f64) (f64.const 0x0.0000000000000p-1023))
  (global $17  (mut v128) (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
  (global $18  v128 (v128.const i32x4 0x04030201 0x08070605 0xff000a09 0x0c0df00f))
  (global $19  (mut v128) (v128.const i32x4 0x000000fe 0x000003ff 0x0000000f 0x00000000))
  (export "_start" (func $23))
  (export "to_test" (func $23))
  
  (func $23 (type $3)
    (result v128)
    (local $0 i32)
    (local $1 f32)
    (local $2 i64)
    (local $3 f64)
    (local $4 v128)
    i32.const 305419896
    local.set $0
    f32.const 0x1.8c0000p+6
    local.set $1
    i64.const -72057589709208571
    local.set $2
    f64.const 0x1.5f0b08c960a79p+109
    local.set $3
    v128.const i32x4 0x0e0d0c0b 0x0807060f 0xff000a09 0x0c0df00f
    local.set $4
    v128.const i32x4 0xaa3820d9 0x44b3b0cb 0x5d26e65a 0xe3288c25
    local.get $0
    global.set $13
    local.get $1
    global.set $14
    local.get $2
    global.set $15
    local.get $3
    global.set $16
    local.get $4
    global.set $17
    )
  
  (data $20 (i32.const 8)
    "\10\00\00\00\0d\00\00\00")
  
  (data $21 (i32.const 16)
    "Hello World!\n")
  
  (data $22 (i32.const 32)
    "Hello World!\n"))