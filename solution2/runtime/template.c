#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

void dummy_func() {
}

uint8_t *foo(uint8_t *val) { // runtime function
    dummy_func();
    return val + 1;
}

int main() { // main function
    uint8_t *val1 = malloc(8);
    uint8_t *val2 = foo(val1);
}
