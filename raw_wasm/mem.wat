(module
    (import "console" "logStrLen" (func $logStrLen (param i32 i32)))
    (import "console" "logStr" (func $logStr (param i32)))

    (memory $exported_memory 10 100)
    (export "memory" (memory $exported_memory))
    (data 0
        (i32.const 0) ;; address
        "wasd"
        "2345"
        "\00\00\00\00"
    )

    (data 0
        (i32.const 48) ;; address
        "asd\00"
    )

    (func $print (export "print") (result i32)
        i32.const 0 ;; offset
        i32.const 8 ;; length
        call $logStrLen

        i32.const 48 ;; offset
        call $logStr

        i32.const 51 ;; offset
        i32.const 102 ;; utf-8 char code
        i32.store8

        i32.const 52 ;; offset
        i32.const 0 ;; terminator character
        i32.store

        i32.const 48 ;; offset
        call $logStr

        i32.const 0 ;; return
    )
)
