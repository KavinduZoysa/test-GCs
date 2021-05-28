## Instructions to get roots using libunwind

1. Install `libunwind-dev`

		sudo apt-get update && sudo apt-get install libunwind-dev
2. Run

		llc-11 -O0 main-statepoints.ll -o main-statepoints.s && clang-11 -c main-statepoints.s -o main-statepoints.o && clang-11 -c getCallersLibUnwind.c -o getCallers.o && clang-11 -c stackmap-reader.c -o stackmap-reader.o && clang-11 stackmap-reader.o main-statepoints.o getCallers.o -lunwind


## Instructions to get roots using backtrace

1. Run

		llc-11 -O0 main-statepoints.ll -o main-statepoints.s && clang-11 -c main-statepoints.s -o main-statepoints.o && clang-11 -c getCallersBackTrace.c -o getCallers.o && clang-11 -c stackmap-reader.c -o stackmap-reader.o && clang-11 stackmap-reader.o main-statepoints.o getCallers.o
