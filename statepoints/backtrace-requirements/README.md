#### Run

        clang-11 -c expr_binary_add.ll -o expr_binary_add.o && \
        clang-11 -g -c nballerina-rt.c -o nballerina-rt.o && \
        clang-11 -g -c main.c -o main.o && \
        clang-11 -c ../printBacktrace.c -o printBacktrace.o -I ../libbacktrace && \
        clang-11 nballerina-rt.o expr_binary_add.o main.o printBacktrace.o -L ../libbacktrace/.libs -lbacktrace

#### Output

        Abort 
	        @foo(PATH_TO_SOURCE/expr_binary_add.bal:2)

