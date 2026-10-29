(module
  (table $t1  1 funcref)
  (table $t2  1 externref)
  (export "t-func" (table $t1))
  (export "t-extern" (table $t2)))