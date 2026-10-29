(memory 0)
    (func $type-size-empty-in-then
      (i32.const 0) (i32.const 0)
      (if (then (memory.grow) (drop)))
    )
  