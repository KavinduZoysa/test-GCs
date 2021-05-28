#include <execinfo.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>

void* getCallers(int dummyVal) {
    void *array[10];
    int numOfCallLocs = backtrace(array, 10);
    // TODO : Increase the array size if it is not enough

    uint64_t* callLocs = (uint64_t*)calloc(numOfCallLocs + 1, sizeof(uint64_t));
    *callLocs = numOfCallLocs - 1;
    for (size_t i = 1; i <= numOfCallLocs; i++) {
        *(callLocs + i) = array[i];
    }

    return (void*)callLocs;
}
