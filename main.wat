(module
    (import "wasi_unstable" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))

    (memory 1)
    (export "memory" (memory 0))

    (data (i32.const 0) "hello world\n")

    (func $main (export "_start")
        (i32.store (i32.const 64) (i32.const 0))  ;; iov.iov_base
        (i32.store (i32.const 68) (i32.const 12))  ;; iov.iov_len
        (call $fd_write
            (i32.const 1) ;; fd (stdout)
            (i32.const 64) ;; *iovs
            (i32.const 1) ;; iovs length
            (i32.const 0) ;; *nwritten
        )
        drop
    )
)
