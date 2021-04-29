#include "gc.h"

int* balAllocWithReturn(int size, int val) {
    int *p = (int *)GC_MALLOC(sizeof(int)*size);
    for (int i = 0; i < size; i++) {
        *(p+i) = val;
    }
    return p;
}
