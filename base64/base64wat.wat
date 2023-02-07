(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (import "console" "logNum" (func (;0;) (type 0)))
  (func (;1;) (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 0
        local.get 1
        i32.ge_s
        br_if 1 (;@1;)
        i32.const 18
        local.set 6
        block  ;; label = @3
          i32.const 0
          local.set 4
          i32.const 16
          local.set 5
          loop  ;; label = @4
            local.get 0
            local.get 1
            i32.ge_s
            br_if 1 (;@3;)
            local.get 0
            i32.load8_u
            local.get 5
            i32.shl
            local.get 4
            i32.or
            local.set 4
            local.get 5
            i32.const 8
            i32.sub
            local.set 5
            local.get 6
            i32.const 6
            i32.sub
            local.set 6
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 5
            i32.const -8
            i32.ne
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          i32.const 18
          local.set 5
          loop  ;; label = @4
            local.get 2
            local.get 4
            local.get 5
            i32.shr_u
            i32.const 63
            i32.and
            i32.load8_u
            i32.store8
            local.get 5
            i32.const 6
            i32.sub
            local.set 5
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 5
            local.get 6
            i32.ge_s
            br_if 0 (;@4;)
          end
        end
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 3
        i32.and
        i32.const 0
        i32.eq
        br_if 1 (;@1;)
        local.get 2
        i32.const 61
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 0 (;@2;)
      end
    end
    local.get 2
    i32.const 0
    i32.store8
    local.get 3)
  (memory (;0;) 10 100)
  (export "memory" (memory 0))
  (export "b64encode" (func 1))
  (data (;0;) (i32.const 0) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"))
