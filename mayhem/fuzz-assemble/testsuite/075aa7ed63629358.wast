(module
  (type $func_i32 (func (param i32)))
  (type $func_i64 (func (param i64)))
  (type $func_f32 (func (param f32)))
  (type $func_f64 (func (param f64)))
  (type $forward (func (param i32)))
  (type $0 (func (param i32 f32)))
  (type $1 (func (param f64 f64)))
  (type $2 (func (param i64) (result i64)))
  (import "spectest" "print_i32" (func $5 (param i32)))
  (import "spectest" "print_i32" (func $print_i32 (param i32)))
  (import "spectest" "print_f32" (func $print_f32 (param f32)))
  (import "spectest" "print_f64" (func $print_f64 (param f64)))
  (import "spectest" "print_i32_f32" (func $print_i32_f32 (param i32 f32)))
  (import "spectest" "print_f64_f64" (func $print_f64_f64 (param f64 f64)))
  (import "spectest" "print_i32" (func $print_i32-2 (param i32)))
  (import "spectest" "print_f64" (func $print_f64-2 (param f64)))
  (import "test" "func-i64->i64" (func $i64->i64 (param i64) (result i64)))
  (import "spectest" "print_i32" (func $6 (param i32)))
  (import "spectest" "print_i32" (func $p (param i32)))
  (import "spectest" "print_i32" (func $7 (param i32)))
  (import "spectest" "print_i32" (func $8 (param i32)))
  (import "spectest" "print_i32" (func $9 (param i32)))
  (import "spectest" "print_i32" (func $10 (param i32)))
  (import "spectest" "print_i32" (func $11 (param i32)))
  (table $3  2 2 funcref)
  (export "p1" (func $6))
  (export "p2" (func $p))
  (export "p3" (func $7))
  (export "p4" (func $7))
  (export "p5" (func $8))
  (export "p6" (func $9))
  (export "print32" (func $12))
  (export "print64" (func $13))
  (elem $4 (i32.const 0)
    $print_i32 $print_f64)
  
  (func $12 (type $forward)
    (param $i i32)
    (local $x f32)
    local.get $i
    f32.convert_i32_s
    local.set $x
    local.get $i
    call $5
    local.get $i
    i32.const 1
    i32.add
    f32.const 0x1.500000p+5
    call $print_i32_f32
    local.get $i
    call $print_i32
    local.get $i
    call $print_i32-2
    local.get $x
    call $print_f32
    local.get $i
    i32.const 0
    call_indirect $3 (type $func_i32)
    )
  
  (func $13 (type $func_i64)
    (param $i i64)
    (local $x f64)
    local.get $i
    call $i64->i64
    f64.convert_i64_s
    local.set $x
    local.get $x
    f64.const 0x1.0000000000000p-0
    f64.add
    f64.const 0x1.a800000000000p+5
    call $print_f64_f64
    local.get $x
    call $print_f64
    local.get $x
    call $print_f64-2
    local.get $x
    i32.const 1
    call_indirect $3 (type $func_f64)
    ))