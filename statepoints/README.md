## Instructions

1. Generate LLVM IR
    
       clang-11 -S -emit-llvm main.c -o main.ll

2. Change the function signature of function `main` and `bar` to attach GC. Both methods should contain ` gc "statepoint-example"`

3. Generate safe points

       opt-11 --rewrite-statepoints-for-gc main.ll -S -o main-statepoints.ll

4. Generate the stack map

       llc-11 -O0 main-statepoints.ll -o main-statepoints.s
