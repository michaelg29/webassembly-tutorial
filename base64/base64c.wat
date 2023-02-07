(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i64 i32) (result i64)))
  (func (;0;) (type 2)
    call 5)
  (func (;1;) (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    local.get 0
    i32.store offset=44
    local.get 5
    local.get 1
    i32.store offset=40
    local.get 5
    local.get 2
    i32.store offset=36
    local.get 5
    i32.load offset=40
    local.set 6
    i32.const 2
    local.set 7
    local.get 6
    local.get 7
    i32.add
    local.set 8
    i32.const 3
    local.set 9
    local.get 8
    local.get 9
    i32.div_s
    local.set 10
    i32.const 2
    local.set 11
    local.get 10
    local.get 11
    i32.shl
    local.set 12
    local.get 5
    local.get 12
    i32.store offset=32
    i32.const 0
    local.set 13
    local.get 5
    local.get 13
    i32.store offset=28
    i32.const 0
    local.set 14
    local.get 5
    local.get 14
    i32.store offset=24
    block  ;; label = @1
      loop  ;; label = @2
        local.get 5
        i32.load offset=28
        local.set 15
        local.get 5
        i32.load offset=40
        local.set 16
        local.get 15
        local.set 17
        local.get 16
        local.set 18
        local.get 17
        local.get 18
        i32.lt_s
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.and
        local.set 21
        local.get 21
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        i32.load offset=28
        local.set 22
        local.get 5
        i32.load offset=40
        local.set 23
        local.get 22
        local.set 24
        local.get 23
        local.set 25
        local.get 24
        local.get 25
        i32.lt_s
        local.set 26
        i32.const 1
        local.set 27
        local.get 26
        local.get 27
        i32.and
        local.set 28
        block  ;; label = @3
          block  ;; label = @4
            local.get 28
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=44
            local.set 29
            local.get 5
            i32.load offset=28
            local.set 30
            i32.const 1
            local.set 31
            local.get 30
            local.get 31
            i32.add
            local.set 32
            local.get 5
            local.get 32
            i32.store offset=28
            local.get 29
            local.get 30
            i32.add
            local.set 33
            local.get 33
            i32.load8_u
            local.set 34
            i32.const 255
            local.set 35
            local.get 34
            local.get 35
            i32.and
            local.set 36
            local.get 36
            local.set 37
            br 1 (;@3;)
          end
          i32.const 0
          local.set 38
          local.get 38
          local.set 37
        end
        local.get 37
        local.set 39
        local.get 5
        local.get 39
        i32.store offset=20
        local.get 5
        i32.load offset=28
        local.set 40
        local.get 5
        i32.load offset=40
        local.set 41
        local.get 40
        local.set 42
        local.get 41
        local.set 43
        local.get 42
        local.get 43
        i32.lt_s
        local.set 44
        i32.const 1
        local.set 45
        local.get 44
        local.get 45
        i32.and
        local.set 46
        block  ;; label = @3
          block  ;; label = @4
            local.get 46
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=44
            local.set 47
            local.get 5
            i32.load offset=28
            local.set 48
            i32.const 1
            local.set 49
            local.get 48
            local.get 49
            i32.add
            local.set 50
            local.get 5
            local.get 50
            i32.store offset=28
            local.get 47
            local.get 48
            i32.add
            local.set 51
            local.get 51
            i32.load8_u
            local.set 52
            i32.const 255
            local.set 53
            local.get 52
            local.get 53
            i32.and
            local.set 54
            local.get 54
            local.set 55
            br 1 (;@3;)
          end
          i32.const 0
          local.set 56
          local.get 56
          local.set 55
        end
        local.get 55
        local.set 57
        local.get 5
        local.get 57
        i32.store offset=16
        local.get 5
        i32.load offset=28
        local.set 58
        local.get 5
        i32.load offset=40
        local.set 59
        local.get 58
        local.set 60
        local.get 59
        local.set 61
        local.get 60
        local.get 61
        i32.lt_s
        local.set 62
        i32.const 1
        local.set 63
        local.get 62
        local.get 63
        i32.and
        local.set 64
        block  ;; label = @3
          block  ;; label = @4
            local.get 64
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=44
            local.set 65
            local.get 5
            i32.load offset=28
            local.set 66
            i32.const 1
            local.set 67
            local.get 66
            local.get 67
            i32.add
            local.set 68
            local.get 5
            local.get 68
            i32.store offset=28
            local.get 65
            local.get 66
            i32.add
            local.set 69
            local.get 69
            i32.load8_u
            local.set 70
            i32.const 255
            local.set 71
            local.get 70
            local.get 71
            i32.and
            local.set 72
            local.get 72
            local.set 73
            br 1 (;@3;)
          end
          i32.const 0
          local.set 74
          local.get 74
          local.set 73
        end
        local.get 73
        local.set 75
        local.get 5
        local.get 75
        i32.store offset=12
        local.get 5
        i32.load offset=20
        local.set 76
        i32.const 16
        local.set 77
        local.get 76
        local.get 77
        i32.shl
        local.set 78
        local.get 5
        i32.load offset=16
        local.set 79
        i32.const 8
        local.set 80
        local.get 79
        local.get 80
        i32.shl
        local.set 81
        local.get 78
        local.get 81
        i32.or
        local.set 82
        local.get 5
        i32.load offset=12
        local.set 83
        local.get 82
        local.get 83
        i32.or
        local.set 84
        local.get 5
        local.get 84
        i32.store offset=8
        local.get 5
        i32.load offset=8
        local.set 85
        i32.const 18
        local.set 86
        local.get 85
        local.get 86
        i32.shr_u
        local.set 87
        i32.const 63
        local.set 88
        local.get 87
        local.get 88
        i32.and
        local.set 89
        local.get 89
        i32.load8_u offset=1024
        local.set 90
        local.get 5
        i32.load offset=36
        local.set 91
        local.get 5
        i32.load offset=24
        local.set 92
        i32.const 1
        local.set 93
        local.get 92
        local.get 93
        i32.add
        local.set 94
        local.get 5
        local.get 94
        i32.store offset=24
        local.get 91
        local.get 92
        i32.add
        local.set 95
        local.get 95
        local.get 90
        i32.store8
        local.get 5
        i32.load offset=8
        local.set 96
        i32.const 12
        local.set 97
        local.get 96
        local.get 97
        i32.shr_u
        local.set 98
        i32.const 63
        local.set 99
        local.get 98
        local.get 99
        i32.and
        local.set 100
        local.get 100
        i32.load8_u offset=1024
        local.set 101
        local.get 5
        i32.load offset=36
        local.set 102
        local.get 5
        i32.load offset=24
        local.set 103
        i32.const 1
        local.set 104
        local.get 103
        local.get 104
        i32.add
        local.set 105
        local.get 5
        local.get 105
        i32.store offset=24
        local.get 102
        local.get 103
        i32.add
        local.set 106
        local.get 106
        local.get 101
        i32.store8
        local.get 5
        i32.load offset=8
        local.set 107
        i32.const 6
        local.set 108
        local.get 107
        local.get 108
        i32.shr_u
        local.set 109
        i32.const 63
        local.set 110
        local.get 109
        local.get 110
        i32.and
        local.set 111
        local.get 111
        i32.load8_u offset=1024
        local.set 112
        local.get 5
        i32.load offset=36
        local.set 113
        local.get 5
        i32.load offset=24
        local.set 114
        i32.const 1
        local.set 115
        local.get 114
        local.get 115
        i32.add
        local.set 116
        local.get 5
        local.get 116
        i32.store offset=24
        local.get 113
        local.get 114
        i32.add
        local.set 117
        local.get 117
        local.get 112
        i32.store8
        local.get 5
        i32.load offset=8
        local.set 118
        i32.const 0
        local.set 119
        local.get 118
        local.get 119
        i32.shr_u
        local.set 120
        i32.const 63
        local.set 121
        local.get 120
        local.get 121
        i32.and
        local.set 122
        local.get 122
        i32.load8_u offset=1024
        local.set 123
        local.get 5
        i32.load offset=36
        local.set 124
        local.get 5
        i32.load offset=24
        local.set 125
        i32.const 1
        local.set 126
        local.get 125
        local.get 126
        i32.add
        local.set 127
        local.get 5
        local.get 127
        i32.store offset=24
        local.get 124
        local.get 125
        i32.add
        local.set 128
        local.get 128
        local.get 123
        i32.store8
        br 0 (;@2;)
      end
      unreachable
    end
    local.get 5
    i32.load offset=40
    local.set 129
    i32.const 3
    local.set 130
    local.get 129
    local.get 130
    i32.rem_s
    local.set 131
    i32.const 2
    local.set 132
    local.get 131
    local.get 132
    i32.gt_u
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 131
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 3 (;@1;)
          end
          i32.const 0
          local.set 133
          local.get 5
          local.get 133
          i32.store offset=4
          br 2 (;@1;)
        end
        i32.const 2
        local.set 134
        local.get 5
        local.get 134
        i32.store offset=4
        br 1 (;@1;)
      end
      i32.const 1
      local.set 135
      local.get 5
      local.get 135
      i32.store offset=4
    end
    i32.const 0
    local.set 136
    local.get 5
    local.get 136
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        local.get 5
        i32.load
        local.set 137
        local.get 5
        i32.load offset=4
        local.set 138
        local.get 137
        local.set 139
        local.get 138
        local.set 140
        local.get 139
        local.get 140
        i32.lt_s
        local.set 141
        i32.const 1
        local.set 142
        local.get 141
        local.get 142
        i32.and
        local.set 143
        local.get 143
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        i32.load offset=36
        local.set 144
        local.get 5
        i32.load offset=32
        local.set 145
        i32.const 1
        local.set 146
        local.get 145
        local.get 146
        i32.sub
        local.set 147
        local.get 5
        i32.load
        local.set 148
        local.get 147
        local.get 148
        i32.sub
        local.set 149
        local.get 144
        local.get 149
        i32.add
        local.set 150
        i32.const 61
        local.set 151
        local.get 150
        local.get 151
        i32.store8
        local.get 5
        i32.load
        local.set 152
        i32.const 1
        local.set 153
        local.get 152
        local.get 153
        i32.add
        local.set 154
        local.get 5
        local.get 154
        i32.store
        br 0 (;@2;)
      end
      unreachable
    end
    local.get 5
    i32.load offset=32
    local.set 155
    local.get 155
    return)
  (func (;2;) (type 0) (result i32)
    global.get 0)
  (func (;3;) (type 1) (param i32)
    local.get 0
    global.set 0)
  (func (;4;) (type 3) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set 0
    local.get 1)
  (func (;5;) (type 2)
    i32.const 5244000
    global.set 2
    i32.const 1108
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 1)
  (func (;6;) (type 0) (result i32)
    global.get 0
    global.get 1
    i32.sub)
  (func (;7;) (type 0) (result i32)
    global.get 2)
  (func (;8;) (type 0) (result i32)
    global.get 1)
  (func (;9;) (type 1) (param i32))
  (func (;10;) (type 1) (param i32))
  (func (;11;) (type 0) (result i32)
    i32.const 1092
    call 9
    i32.const 1096)
  (func (;12;) (type 2)
    i32.const 1092
    call 10)
  (func (;13;) (type 3) (param i32) (result i32)
    i32.const 1)
  (func (;14;) (type 1) (param i32))
  (func (;15;) (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      block  ;; label = @2
        i32.const 0
        i32.load offset=1100
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=1100
        call 15
        local.set 1
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=1100
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=1100
        call 15
        local.get 1
        i32.or
        local.set 1
      end
      block  ;; label = @2
        call 11
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 0
            i32.load offset=76
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 0
            call 13
            local.set 2
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.get 0
            i32.load offset=28
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            call 15
            local.get 1
            i32.or
            local.set 1
          end
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            call 14
          end
          local.get 0
          i32.load offset=56
          local.tee 0
          br_if 0 (;@3;)
        end
      end
      call 12
      local.get 1
      return
    end
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load offset=76
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      call 13
      local.set 2
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=28
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=36
          call_indirect (type 4)
          drop
          local.get 0
          i32.load offset=20
          br_if 0 (;@3;)
          i32.const -1
          local.set 1
          local.get 2
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 3
          i32.sub
          i64.extend_i32_s
          i32.const 1
          local.get 0
          i32.load offset=40
          call_indirect (type 5)
          drop
        end
        i32.const 0
        local.set 1
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 0
        i64.const 0
        i64.store offset=4 align=4
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      call 14
    end
    local.get 1)
  (func (;16;) (type 0) (result i32)
    i32.const 1104)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 256 256)
  (global (;0;) (mut i32) (i32.const 5244000))
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 0))
  (export "b64encode" (func 1))
  (export "__indirect_function_table" (table 0))
  (export "__errno_location" (func 16))
  (export "fflush" (func 15))
  (export "emscripten_stack_init" (func 5))
  (export "emscripten_stack_get_free" (func 6))
  (export "emscripten_stack_get_base" (func 7))
  (export "emscripten_stack_get_end" (func 8))
  (export "stackSave" (func 2))
  (export "stackRestore" (func 3))
  (export "stackAlloc" (func 4))
  (data (;0;) (i32.const 1024) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00"))
