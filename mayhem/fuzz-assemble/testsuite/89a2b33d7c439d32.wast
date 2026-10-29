(module
  (type $0 (func))
  (export "meet-bottom" (func $1))
  
  (func $1 (type $0)
    block $block (result f64)
      block $block_0 (result f32)
        unreachable
        i32.const 1
        br_table
          $block_0 $block
          $block ;; default
      end ;; $block_0
      drop
      f64.const 0x0.0000000000000p-1023
    end ;; $block
    drop
    ))