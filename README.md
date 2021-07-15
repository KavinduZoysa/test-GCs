### How to build libbacktrace

Follow the README in `third-party-lib/libbacktrace`

### How to Get backtrace

Run Following commands.

        export LD_LIBRARY_PATH=<PATH>/third-party-lib/libbacktrace/.libs

        cd runtime 
        make
        cd ..
        clang-11 test_withaddrspace_opt.ll /home/kavindu/ballerina/nBalTest/test-gc/runtime/balrt.a -I third-party/libbacktrace -L third-party/libbacktrace/.libs -lbacktrace && ./a.out


