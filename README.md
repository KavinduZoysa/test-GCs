### How to build libbacktrace

Follow the README in `third-party-lib/libbacktrace`

### How to Get backtrace

Run Following commands.

        export LD_LIBRARY_PATH=<PATH>/third-party-lib/libbacktrace/.libs

        clang-11 -c expr_binary_add.ll -o expr_binary_add.o && \
        clang-11 -g -c nballerina-rt.c -o nballerina-rt.o && \
        clang-11 -g -c test.c -o test.o && \
        clang-11 nballerina-rt.o expr_binary_add.o test.o -L third-party-lib/libbacktrace/.libs -lbacktrace -o expr_binary_add

        ./expr_binary_add

You will get following output

        Abort 
	        at foo(PATH_TO_BAL_SOURCE/expr_binary_add.bal:2)

