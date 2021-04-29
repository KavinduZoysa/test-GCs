## Prerequisites
1. Follow the topic `Building the collector` on the [link](https://hboehm.info/gc/simple_example.html) to build Boehm collector.
2. Install required version of ballerina.
3. Build `nballerina`.
4. Clone this repository.
5. Set the max heap size. (Don't forget to unset it after the following tests are run)
        `export GC_MAXIMUM_HEAP_SIZE=160000`


## Utils
Generate the necessary object files

    clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balGCInit.c -o balGCInit.o
    clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balAllocWithReturn.c -o balAllocWithReturn.o
    clang-11 -I<PATH_TO_BOEHM_INSTALLATION>/include -c balAllocWithoutReturn.c -o balAllocWithoutReturn.o
    clang-11 -c readPos.c -o readPos.o
    clang-11 -c assertVal.c -o assertVal.o

## Test deallocate (positive case)
Run following commands.

    bal build --dump-bir-file=test_dealloc_pos test_dealloc_pos.bal

    <PATH_TO_EXE>/nballerinacc test_dealloc_pos -o test_dealloc_pos.ll

    clang-11 --target=x86_64-unknown-linux-gnu -c -flto=thin -Wno-override-module -o test_dealloc_pos.o test_dealloc_pos.ll -g -O0

    clang-11 -flto=thin -fuse-ld=lld-11 -L <PATH_TO_RUNTIME>/target/release/ -lballerina_rt -lpthread -ldl -o main.out balGCInit.o assertVal.o readPos.o balAllocWithReturn.o balAllocWithoutReturn.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so test_dealloc_pos.o -g -O0

    ./main.out

You should see an output as shown below.

`main.out: assertVal.c:6: void assertVal(int, int, int): Assertion '*(p+i) == val' failed.
[2]    13874 abort (core dumped)  ./main.out`

## Test deallocate (negative case)
Run following commands.

    bal build --dump-bir-file=test_dealloc_neg test_dealloc_neg.bal

    <PATH_TO_EXE>/nballerinacc test_dealloc_neg -o test_dealloc_neg.ll

    clang-11 --target=x86_64-unknown-linux-gnu -c -flto=thin -Wno-override-module -o test_dealloc_neg.o test_dealloc_neg.ll -g -O0

    clang-11 -flto=thin -fuse-ld=lld-11 -L <PATH_TO_RUNTIME>/target/release/ -lballerina_rt -lpthread -ldl -o main.out balGCInit.o assertVal.o readPos.o balAllocWithReturn.o balAllocWithoutReturn.o <PATH_TO_BOEHM_INSTALLATION>/lib/libgc.so test_dealloc_neg.o -g -O0

    ./main.out

The test should be executed successfully.


