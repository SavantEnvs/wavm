(module
  (type $t (func (param i32)))
  (type $0 (func (result f64)))
  (type $1 (func))
  
  (func $f (type $0)
    (result f64)
    f64.const 0x0.0000000000000p-1023
    )
  
  (func $g (type $t)
    (param $0 i32)
    )
  
  (func $i32->void (type $t)
    (param $0 i32)
    )
  
  (func $void->f64 (type $0)
    (result f64)
    f64.const 0x0.0000000000000p-1023
    )
  
  (func $check (type $1)
    i32.const 0
    call $i32->void
    call $void->f64
    drop
    ))