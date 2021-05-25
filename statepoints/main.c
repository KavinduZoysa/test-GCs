#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include "stackmap-reader.h"

struct StackMap {
   int32_t a1;
   int32_t a2;
   int32_t a3;
};

register long rsp asm ("rsp");
register long rbp asm ("rbp");

const extern struct StackMap __LLVM_StackMaps;
extern void* getCallers(int);
extern int* getHeapRefs(uint64_t*, int);

void baz() {}

void foo() {
    int32_t* heapPtr3 = malloc(sizeof(uint64_t));
    *heapPtr3 = 5;

    baz();
    void* callLocations = getCallers(3);
    printf("call loc : %p\n", *((uint64_t*)callLocations));
    printf("call loc : %p\n", *((uint64_t*)callLocations + 1));
    printf("call loc : %p\n", *((uint64_t*)callLocations + 2));
    printf("call loc : %p\n", *((uint64_t*)callLocations + 3));
    int* offsets = getHeapRefs((uint64_t*)callLocations, *((uint64_t*)callLocations));
    printf("%d\n", *offsets);
    printf("%d\n", *(offsets + 1));
    printf("%d\n", *(offsets + 2));
    printf("%d\n", *(offsets + 3));

    printf("(uint8_t*)rsp : %p\n", (uint8_t*)rsp);
    printf("1 : %lu\n", *((uint64_t*)*((uint64_t*) ((uint8_t*)rsp + *(offsets + 1)))));
    printf("2 : %lu\n", *((uint64_t*)*((uint64_t*) ((uint8_t*)rsp + 8 + *(offsets + 2)))));
    printf("2 : %lu\n", *((uint64_t*)*((uint64_t*) ((uint8_t*)rsp + 16 + *(offsets + 3)))));
}

void bar() {
    uint64_t* heapPtr2 = malloc(sizeof(uint64_t));
    int i = 23;
    *heapPtr2 = 7;
    foo();
}

int main() {
    readStackMap((uint64_t*) &__LLVM_StackMaps);
    uint64_t* heapPtr1 = malloc(sizeof(uint64_t));
    *heapPtr1 = 9;
    bar();
}
