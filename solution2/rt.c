#include <inttypes.h>

void dummy_func() {

}

uint8_t __attribute__((address_space(1))) *foo(uint8_t __attribute__((address_space(1))) *val) {
    dummy_func();
    return val + 1;
}