## Instructions

1. Run
    
       clang-11 -g -S -emit-llvm main.c -o main-dup.ll
	   opt-11 --rewrite-statepoints-for-gc main-dup.ll -S -o main-statepoints.ll
	   llc-11 -O0 main-statepoints.ll -o main-statepoints.s && clang-11 -c main-statepoints.s -o main-statepoints.o    && clang-11 -c stackmap-reader.c -o stackmap-reader.o && clang-11 stackmap-reader.o main-statepoints.o
