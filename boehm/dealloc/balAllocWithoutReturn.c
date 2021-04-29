#include "gc.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define GC_MAXIMUM_HEAP_SIZE 160000

void balAllocWithoutReturn(int size, int val) {
    int* pp = (int *)GC_MALLOC(sizeof(int)*size);
    for (int i = 0; i < size; i++) {
        *(pp+i) = val;
    }

    printf("%lu\n",  (uintptr_t)pp);
    FILE *fptr = fopen("pos.txt", "w");
    fprintf(fptr, "%lu\n", (uintptr_t)pp);
    pp = 0;
    fclose(fptr);
}
