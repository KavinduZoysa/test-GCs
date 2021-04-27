# Plug Boehm GC with ballerina

## Prerequisites
1. Follow the topic `Building the collector` on the [link](https://hboehm.info/gc/simple_example.html).
2. Install required version of ballerina.
3. Build `nballerina`.
4. Clone this repository.

## Test single alloc
1. Generate the bir for `single_alloc.bal`

        bal build --dump-bir-file=single_alloc single_alloc.bal
2. Generate the LLVM IR from `nballerinacc`

        ./nballerinacc single_alloc -o single_alloc.ll

3. Generate the obj file for single gc alloc C implementation

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balAlloc.c -o balAlloc.o

4. Genearate the executable

        clang-11 single_alloc.ll balAlloc.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so -o singleBalAlloc

5. Run

        ./singleBalAlloc


## Test multiple alloc
1. Generate the bir for `multiple_alloc.bal`

        bal build --dump-bir-file=multiple_alloc multiple_alloc.bal
2. Generate the LLVM IR from `nballerinacc`

        ./nballerinacc multiple_alloc -o multiple_alloc.ll

3. Generate the obj file for single gc alloc C implementation

        clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balMultipleAlloc.c -o balMultipleAlloc.o

4. Genearate the executable

        clang-11 multiple_alloc.ll balMultipleAlloc.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so -o multipleBalAlloc

5. Run

        ./multipleBalAlloc
