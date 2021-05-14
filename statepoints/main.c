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

const extern struct StackMap __LLVM_StackMaps;
int32_t *heapPtr;

void foo(int32_t val) {
    *heapPtr = val;
}

int bar(int32_t *hPtr) {
    *hPtr = 234;
    foo(*hPtr);
    return *hPtr;
}

int main() {
    heapPtr = malloc(sizeof(int32_t));
    heapPtr++;
    int x = bar(heapPtr);
    readStackMap((uint64_t*) &__LLVM_StackMaps);
}
