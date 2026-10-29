(func (local i32)
      unreachable
      local.tee 0  ;; pops unknown, must push i32 (not none)
      f32.neg      ;; expects f32, should find i32
      drop)