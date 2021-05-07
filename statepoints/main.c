#include <inttypes.h>
#include <stdlib.h>

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
}
