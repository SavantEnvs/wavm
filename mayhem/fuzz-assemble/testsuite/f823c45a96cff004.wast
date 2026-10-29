(module
  (type $0 (func (param funcref i32) (result i64)))
  (type $1 (func (param i64) (result i64)))
  (type $2 (func (param i32) (result i64)))
  (type $3 (func (result i64)))
  (import "threadTest" "createThread" (func $threadTest.createThread (param funcref i32) (result i64)))
  (import "threadTest" "joinThread" (func $threadTest.joinThread (param i64) (result i64)))
  (memory $4  1 1 shared)
  (export "testWait32Notify" (func $6))
  (export "testWait64Notify" (func $7))
  (elem $5 declare
    $wait32ThreadEntry $wait64ThreadEntry)
  
  (func $wait32ThreadEntry (type $2)
    (param $argument i32)
    (result i64)
    i32.const 16
    i32.const 1
    i32.atomic.store
    i32.const 0
    i32.const 0
    i64.const -1
    memory.atomic.wait32
    i64.extend_i32_u
    )
  
  (func $wait64ThreadEntry (type $2)
    (param $argument i32)
    (result i64)
    i32.const 16
    i32.const 1
    i32.atomic.store
    i32.const 0
    i64.const 0
    i64.const -1
    memory.atomic.wait64
    i64.extend_i32_u
    )
  
  (func $6 (type $3)
    (result i64)
    (local $thread i64)
    i32.const 0
    i32.const 0
    i32.atomic.store
    i32.const 16
    i32.const 0
    i32.atomic.store
    ref.func $wait32ThreadEntry
    i32.const 0
    call $threadTest.createThread
    local.set $thread
    block $break
      loop $spin
        i32.const 16
        i32.atomic.load
        br_if $break
        br $spin
      end ;; $spin
    end ;; $break
    block $done
      loop $notify_loop
        i32.const 0
        i32.const 1
        memory.atomic.notify
        i32.const 0
        i32.gt_u
        br_if $done
        br $notify_loop
      end ;; $notify_loop
    end ;; $done
    local.get $thread
    call $threadTest.joinThread
    )
  
  (func $7 (type $3)
    (result i64)
    (local $thread i64)
    i32.const 0
    i64.const 0
    i64.atomic.store
    i32.const 16
    i32.const 0
    i32.atomic.store
    ref.func $wait64ThreadEntry
    i32.const 0
    call $threadTest.createThread
    local.set $thread
    block $break
      loop $spin
        i32.const 16
        i32.atomic.load
        br_if $break
        br $spin
      end ;; $spin
    end ;; $break
    block $done
      loop $notify_loop
        i32.const 0
        i32.const 1
        memory.atomic.notify
        i32.const 0
        i32.gt_u
        br_if $done
        br $notify_loop
      end ;; $notify_loop
    end ;; $done
    local.get $thread
    call $threadTest.joinThread
    ))