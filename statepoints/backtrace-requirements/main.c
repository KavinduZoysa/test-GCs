#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

extern void* getCallers(int);

int foo() {
    uint64_t* callLocations = (uint64_t*)getCallers(3);
    int numOfCallers = *callLocations;
    for (size_t i = 1; i <= numOfCallers; i++) {
        printf("Loc : %p\n", *(callLocations + i));
    }
}

int main(void) {
    foo();
    return (0);
}
