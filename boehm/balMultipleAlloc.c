#include "gc.h"
#include <assert.h>
#include <stdio.h>

int balMultipleAlloc() {
    int i;
    int count = 1000000;

    int multiple = 1000;
    for (i = 0; i < count; ++i) {
        int *p = (int *)GC_MALLOC(sizeof(int)*multiple);
        for (int j = 0; j<multiple; j++) {
            *(p+j) = 0;   
        }
        if (i % (count / 100) == 0) {
            printf("Heap size(GC_get_heap_size) = %d\n", GC_get_heap_size());
            printf("Heap size(GC_get_free_bytes) = %d\n", GC_get_free_bytes());
        }
    }
    return 0;
}
