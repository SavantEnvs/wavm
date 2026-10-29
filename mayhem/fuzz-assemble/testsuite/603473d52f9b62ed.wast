(module
  (type $0 (func))
  
  (func $1 (type $0)
    block $block
      i32.const 1
      if $if
        i32.const 1
        br_table
          2 ;; default
      end ;; $if
    end ;; $block
    ))