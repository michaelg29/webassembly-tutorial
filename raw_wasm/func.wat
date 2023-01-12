(module
    (import "console" "logNum" (func $logNum (param i32)))

    (func $someFunc (param i32) (result i32)
        local.get 0
        i32.const 20
        i32.add
    )
    (func $getVal (export "getVal") (result i32 i32)
        i32.const 42        ;; 42
        i32.const 50        ;; 42, 50
        call $someFunc      ;; 42, 70
    )

    (func $compute (export "compute") (result i32)
        i32.const 13        ;; 13
        call $logNum           ;; -

        call $getVal        ;; 42, 70
        i32.add             ;; 112
    )
)