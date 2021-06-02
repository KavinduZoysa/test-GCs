## Build libbacktrace

Follow the instructions in libbacktrace/README.md


## Instructions to get roots using backtrace

1. Run

		llc-11 -O0 main-statepoints.ll -o main-statepoints.s && clang-11 -c main-statepoints.s -o main-statepoints.o && clang-11 -c getCallersLibbacktrace.c -o getCallers.o -I ./libbacktrace && clang-11 -c stackmap-reader.c -o stackmap-reader.o && clang-11 stackmap-reader.o main-statepoints.o getCallers.o -I ./libbacktrace  -L ./libbacktrace/.libs -lbacktrace
