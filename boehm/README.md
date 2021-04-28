# Plug Boehm GC with ballerina

## Prerequisites
1. Follow the topic `Building the collector` on the [link](https://hboehm.info/gc/simple_example.html) to build Boehm collector.
2. Install required version of ballerina.
3. Build `nballerina`.
4. Clone this repository.

## Test single alloc
1. Generate the bir for `single_alloc.bal`

        bal build --dump-bir-file=single_alloc single_alloc.bal
2. Generate the LLVM IR from `nballerinacc`

        ./nballerinacc single_alloc -o single_alloc.ll

3. Generate obj file for GC init.

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balGCInit.c -o balGCInit.o

4. Generate the obj file for single gc alloc C implementation

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balAlloc.c -o balAlloc.o

5. Genearate the executable

        clang-11 single_alloc.ll balAlloc.o balGCInit.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so -o singleBalAlloc

6. Run

        ./singleBalAlloc


## Test multiple alloc
1. Generate the bir for `multiple_alloc.bal`

        bal build --dump-bir-file=multiple_alloc multiple_alloc.bal

2. Generate the LLVM IR from `nballerinacc`

        ./nballerinacc multiple_alloc -o multiple_alloc.ll

3. Generate obj file for GC init.

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balGCInit.c -o balGCInit.o

4. Generate the obj file for single gc alloc C implementation

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balMultipleAlloc.c -o balMultipleAlloc.o

5. Genearate the executable

        clang-11 multiple_alloc.ll balMultipleAlloc.o balGCInit.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so -o multipleBalAlloc

6. Run

        ./multipleBalAlloc

## Test deallocate (negative case)
1. Generate the bir for `test_dealloc.bal`

        bal build --dump-bir-file=test_dealloc test_dealloc.bal

2. Generate the LLVM IR from `nballerinacc`

        ./nballerinacc test_dealloc -o test_dealloc.ll

3. Generate necessary obj files

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balGCInit.c -o balGCInit.o
        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balAlloc.c -o balAlloc.o
        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balMultipleAlloc.c -o balMultipleAlloc.o
        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balInitialize.c -o balInitialize.o
        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balDeInitialize.c -o balDeInitialize.o

4. Generate the executable with geneating the run time

        clang-11 --target=x86_64-unknown-linux-gnu -c -O3 -flto=thin -Wno-override-module -o test_dealloc.o test_dealloc.ll
        clang-11 -flto=thin -fuse-ld=lld-11 -L <PATH_TO_RUNTIME>/target/release/ -lballerina_rt -lpthread -ldl -o main.out test_dealloc.o balMultipleAlloc.o balGCInit.o balAlloc.o balInitialize.o balDeInitialize.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so
