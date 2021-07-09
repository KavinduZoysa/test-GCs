#include "balrt.h"
#include <stdio.h>
#include <stdlib.h>

void *_bal_alloc(int64_t nBytes) {
    void *p = malloc(nBytes);
    printf("Heap allocated loc (root) : %p\n", p);
    if (p != 0)
        return p;
    fprintf(stderr, "out of memory\n");
    abort();
}
