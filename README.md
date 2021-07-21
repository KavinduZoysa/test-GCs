### How to build libbacktrace

Follow the README in `third-party-lib/libbacktrace`

### How to Get backtrace

Run Following commands.

        cd runtime
        make
        cd ..

        clang-11 panic-example/Plist00.ll runtime/balrt_inline.bc   runtime/balrt.a -I third-party/libbacktrace -L third-party/libbacktrace/.libs -lbacktrace && ./a.out

You will get following output

        panic: index out of bounds
	        at _B_main(PATH_TO_BAL_SOURCE/Plist00.bal:5)
        Aborted (core dumped)

