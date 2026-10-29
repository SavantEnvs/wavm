(module
  (type $0 (func (param v128) (result v128)))
  (type $1 (func (param v128 v128) (result v128)))
  (type $2 (func (param v128 v128 v128) (result v128)))
  (export "not" (func $3))
  (export "and" (func $4))
  (export "or" (func $5))
  (export "xor" (func $6))
  (export "bitselect" (func $7))
  (export "andnot" (func $8))
  
  (func $3 (type $0)
    (param $0 v128)
    (result v128)
    local.get $0
    v128.not
    )
  
  (func $4 (type $1)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    v128.and
    )
  
  (func $5 (type $1)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    v128.or
    )
  
  (func $6 (type $1)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    v128.xor
    )
  
  (func $7 (type $2)
    (param $0 v128)
    (param $1 v128)
    (param $2 v128)
    (result v128)
    local.get $0
    local.get $1
    local.get $2
    v128.bitselect
    )
  
  (func $8 (type $1)
    (param $0 v128)
    (param $1 v128)
    (result v128)
    local.get $0
    local.get $1
    v128.andnot
    ))