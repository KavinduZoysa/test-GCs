#include "gc.h"
#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define GC_MAXIMUM_HEAP_SIZE 160000 // 160000/8 = 20000 int

// int* pp;
void allocVoid(int size, int val) {
    int* pp = (int *)GC_MALLOC(sizeof(int)*size);
    // pp = (int *)GC_MALLOC(sizeof(int)*18000);
    for (int i = 0; i < size; i++) {
        *(pp+i) = val;
    }

    printf("%lu\n",  (uintptr_t)pp);
    FILE *fptr = fopen("pos.txt", "w");
    fprintf(fptr, "%lu\n", (uintptr_t)pp);
    pp = 0;
    fclose(fptr);
}

int* allocReturn(int size, int val) {
    int *p = (int *)GC_MALLOC(sizeof(int)*size);
    for (int i = 0; i < size; i++) {
        *(p+i) = val;
    }
    return p;
}

int main(int argc, char const *argv[]) {
    int val = 2147483647;
    GC_INIT();
    // int* p = allocReturn(18000, val);
    allocVoid(18000, val);
    // int *x = (int *)GC_MALLOC(sizeof(int)*17000);
    // for (int i = 0; i < 17000; i++) {
    //     *(x+i) = 0;
    // }
    int* x = allocReturn(17000, 0);

    FILE* fptr = fopen("pos.txt", "r");
    int i = 0;
    fscanf (fptr, "%d", &i);    
    while (!feof (fptr)) {
        fscanf (fptr, "%d", &i);      
    }
    printf("%d\n", i);
    int* p = (int*) i;

    for (int i = 0; i < 18000; i++) {
        assert(*(p+i) == val);
    }    
}
