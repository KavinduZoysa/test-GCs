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

int loc[2];

const extern struct StackMap __LLVM_StackMaps;

void foo() {
    // readStackMap((uint64_t*) &__LLVM_StackMaps);
    int32_t* heapPtr3 = malloc(sizeof(uint64_t));
    *heapPtr3 = 345;
}

void bar() {
    int xx = 34;
    int yy = 34;
    long zz = 34;
    uint64_t* heapPtr2 = malloc(sizeof(uint64_t));
    *heapPtr2 = 7;

    foo();
    readStackMap((uint64_t*) &__LLVM_StackMaps, loc);
    uint64_t* locHeapPtr2 = (uint64_t *) ((uint8_t *)rsp + loc[0]);
    uint64_t* locHeapPtr1 = (uint64_t *) ((uint8_t *)rsp + loc[1]);
    // printf("loc* : %p\n", (uint8_t *)rsp);
    // printf("loc : %p\n", locHeapPtr2);
    // printf("loc* (uint64_t *) : %p\n", (uint64_t *)(*locHeapPtr2));
    printf("value in loc2 : %lu\n\n", *((uint64_t *)(*locHeapPtr2)));
    printf("value in loc1 : %lu\n\n", *((uint64_t *)(*locHeapPtr1)));

    // printf("Stack address of heapPtr2 : %p\n", &heapPtr2);
    // printf("Address of heapPtr2 : %p\n", heapPtr2);
    // printf("Value of heapPtr2 : %lu\n\n", *heapPtr2);
}

int main() {
    uint64_t* heapPtr1 = malloc(sizeof(uint64_t));
    *heapPtr1 = 4;
    printf("Stack address of heapPtr1 : %p\n\n", &heapPtr1);
    bar();
    // readStackMap((uint64_t*) &__LLVM_StackMaps);
}
