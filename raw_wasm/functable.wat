(module
    (type $OPERATION (func (param i32) (param i32) (result i32)))

    (import "console" "logNum" (func $logNum (param i32)))
    (import "console" "logThree" (func $logThree (param i32 i32 i32)))

    (func $set (type $OPERATION)
        local.get 1
    )
    (func $add (type $OPERATION)
        local.get 0
        local.get 1
        i32.add
    )
    (func $sub (type $OPERATION)
        local.get 0
        local.get 1
        i32.sub
    )
    (func $mul (type $OPERATION)
        local.get 0
        local.get 1
        i32.mul
    )
    (func $div (type $OPERATION)
        local.get 0
        local.get 1
        i32.div_s
    )

    (memory $key_memory 10 100)
    (data 0
        (i32.const 0) ;; address
        "=+-/*"
    )

    (table $tbl (export "tbl") 5 funcref)
    (elem (i32.const 0) $set)
    (elem (i32.const 1) $add)
    (elem (i32.const 2) $sub)
    (elem (i32.const 3) $div)
    (elem (i32.const 4) $mul)

    (func $eval (export "eval")
        (param $op i32) (param $res i32) (param $num i32)
        (result i32)

        (local $idx i32)
        i32.const 0
        local.set $idx

        ;; find operator index
        (block $scanBlock
            (loop $scanLoop
                ;; condition
                local.get $idx
                i32.const 5
                i32.ge_s
                br_if $scanBlock

                ;; test character
                local.get $idx
                i32.load8_u
                local.get $op
                i32.eq
                br_if $scanBlock

                ;; increment
                local.get $idx
                i32.const 1
                i32.add
                local.set $idx

                br $scanLoop
            )
        )

        ;; index into the function table
        (call_indirect
            (type $OPERATION)
            (local.get $res) (local.get $num)
            (local.get $idx)
        )
    )
)