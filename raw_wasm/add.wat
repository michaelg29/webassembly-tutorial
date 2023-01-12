(module
    (func $add (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs ;; put lhs on the stack
        local.get $rhs ;; put rhs on the stack
        i32.add        ;; pop from stack and compute
    )
    (export "add" (func $add))
)
