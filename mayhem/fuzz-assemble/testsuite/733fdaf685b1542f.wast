(module
  (type $0 (func (result v128)))
  (type $1 (func (result i32)))
  (type $2 (func (result i64)))
  (memory $3  1)
  (export "v128.load32_zero-in-block" (func $5))
  (export "v128.load64_zero-in-block" (func $6))
  (export "v128.load32_zero-as-br-value" (func $7))
  (export "v128.load64_zero-as-br-value" (func $8))
  (export "v128.load32_zero-extract_lane_s-operand" (func $9))
  (export "v128.load64_zero-extract_lane_s-operand" (func $10))
  
  (func $5 (type $0)
    (result v128)
    block $block (result v128)
      block $block_0 (result v128)
        i32.const 0
        v128.load32_zero
      end ;; $block_0
    end ;; $block
    )
  
  (func $6 (type $0)
    (result v128)
    block $block (result v128)
      block $block_0 (result v128)
        i32.const 1
        v128.load64_zero
      end ;; $block_0
    end ;; $block
    )
  
  (func $7 (type $0)
    (result v128)
    block $block (result v128)
      i32.const 6
      v128.load32_zero
      br $block
    end ;; $block
    )
  
  (func $8 (type $0)
    (result v128)
    block $block (result v128)
      i32.const 7
      v128.load64_zero
      br $block
    end ;; $block
    )
  
  (func $9 (type $1)
    (result i32)
    i32.const 12
    v128.load32_zero
    i32x4.extract_lane 0
    )
  
  (func $10 (type $2)
    (result i64)
    i32.const 13
    v128.load64_zero
    i64x2.extract_lane 0
    )
  
  (data $4 (i32.const 0)
    "\00\01\02\03\04\05\06\07\08\09\n\0b\0c\0d\0e\0f\80\81\82\83\84\85\86\87\88\89"))