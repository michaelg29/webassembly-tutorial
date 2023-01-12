(module
    (import "console" "logNum" (func $logNum (param i32)))
    (memory $mem 1)
    (export "memory" (memory $mem))

    (func $accumulate (export "accumulate")
        (param $addr i32)   ;; 0: address of array
        (param $n i32)      ;; 1: number of ints in the array
        (result i32)        ;; sum of elements

        (local $sum i32)    ;; 2: sum to store
        i32.const 0         ;; initial value
        local.set $sum

        (block
            (loop $inc
                local.get $n
                call $logNum

                ;; get element
                local.get $addr ;; S: addr
                i32.load        ;; S: elem
                local.get $sum  ;; S: elem, sum
                i32.add         ;; S: sum'
                local.set $sum  ;; S: -

                ;; increment step

                ;; increment address
                local.get $addr ;; S: addr
                i32.const 4     ;; S: addr, 4
                i32.add         ;; S: addr'
                local.set $addr ;; S: -

                ;; decrement counter
                local.get $n    ;; S: n
                i32.const 1     ;; S: n, 1
                i32.sub         ;; S: n'
                local.set $n    ;; S: -

                ;; loop or break
                local.get $n    ;; S: n'
                i32.const 0     ;; S: n', 0
                i32.gt_s        ;; S: true
                br_if $inc
            )
        )

        ;; return
        local.get $sum
        return
    )

    (func $average (export "average") (param i32 i32) (result i32)
        local.get 0         ;; S: addr
        local.get 1         ;; S: addr, n
        call $accumulate    ;; S: sum
        local.get 1         ;; S: sum, n
        i32.div_s           ;; S: sum/n
    )
)
