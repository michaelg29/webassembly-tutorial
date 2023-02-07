(module
    (import "console" "logNum" (func $logNum (param i32)))

    (memory $exported_memory 10 100)
    (export "memory" (memory $exported_memory))

    ;; b64 encoding table
    (data (;0;) (i32.const 0) "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")

    ;; b64 encode function
    (func $b64encode (export "b64encode")
        (param $str i32)
        (param $strlen i32)
        (param $out i32)
        (result i32)

        (local $len i32) ;; output string length
        (local $val i32) ;; temporary value
        (local $shiftAmt i32) ;; amount to shift by
        (local $minShiftAmt i32)

        i32.const 0
        local.set $len

        ;; main loop
        (block $encodeBlock
            ;; set input cursor upper bound
            local.get $str
            local.get $strlen
            i32.add
            local.set $strlen

            ;; iterate through three octets, output four base64 characters
            (loop $encodeLoop
                local.get $str
                local.get $strlen
                i32.ge_s
                br_if $encodeBlock

                i32.const 18
                local.set $minShiftAmt

                ;; load three octets
                (block $readOctetsBlock
                    i32.const 0
                    local.set $val

                    i32.const 16
                    local.set $shiftAmt

                    (loop $readOctetsLoop
                        local.get $str
                        local.get $strlen
                        i32.ge_s
                        br_if $readOctetsBlock

                        local.get $str ;; input cursor
                        i32.load8_u ;; load in byte (stack = byte)
                        local.get $shiftAmt ;; (stack = byte, shiftAmt)
                        i32.shl ;; shift octet into position (stack = byte << shiftAmt)
                        local.get $val ;; (stack = byte', $val)
                        i32.or ;; combine octet with existing concatenation
                        local.set $val

                        ;; increment step ;;

                        ;; decrease shift amount
                        local.get $shiftAmt
                        i32.const 8
                        i32.sub
                        local.set $shiftAmt

                        ;; decrease minimum shift amount for next step
                        local.get $minShiftAmt
                        i32.const 6
                        i32.sub
                        local.set $minShiftAmt

                        ;; advance input cursor
                        local.get $str
                        i32.const 1
                        i32.add
                        local.set $str

                        ;; loop if shift amount is not -8
                        local.get $shiftAmt
                        i32.const -8
                        i32.ne
                        br_if $readOctetsLoop
                    )
                )

                ;; write four base64 characters
                (block $outputBlock
                    i32.const 18
                    local.set $shiftAmt

                    (loop $outputLoop
                        local.get $out ;; output cursor
                        local.get $val ;; (stack = $val)
                        local.get $shiftAmt ;; (stack = $val, $shiftAmt)
                        i32.shr_u ;; shift to position (stack = $val')
                        i32.const 63 ;; bit mask 0x3f (stack = $val', 63)
                        i32.and ;; apply bit mask (stack = $val' & 0x3f)
                        i32.load8_u ;; encode character (stack = $out, $char)
                        i32.store8 ;; store character

                        ;; increment step ;;
                        local.get $shiftAmt
                        i32.const 6
                        i32.sub
                        local.set $shiftAmt

                        ;; increment length
                        local.get $len
                        i32.const 1
                        i32.add
                        local.set $len

                        ;; increment cursor
                        local.get $out
                        i32.const 1
                        i32.add
                        local.set $out

                        ;; loop if shift amount is above the minimum
                        local.get $shiftAmt
                        local.get $minShiftAmt
                        i32.ge_s
                        br_if $outputLoop
                        ;; br $outputBlock
                    )
                )

                br $encodeLoop
            )
        )

        ;; padding
        (block $padBlock
            (loop $padLoop
                ;; break if no more characters to pad
                local.get $len
                i32.const 3 ;; bit mask
                i32.and
                i32.const 0
                i32.eq
                br_if $padBlock ;; break if divisible by 4

                ;; store padding character
                local.get $out ;; cursor
                i32.const 61 ;; padding character '='
                i32.store8

                ;; increment step ;;

                local.get $len
                i32.const 1
                i32.add
                local.set $len

                local.get $out
                i32.const 1
                i32.add
                local.set $out

                br $padLoop
            )
        )

        ;; terminator character
        local.get $out ;; cursor
        i32.const 0
        i32.store8

        ;; return length
        local.get $len
    )
)
