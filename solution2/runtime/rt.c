#include <inttypes.h>

extern void dummy_func_to_gen_statepoints();

uint8_t __attribute__((address_space(1))) *rt_func(uint8_t __attribute__((address_space(1))) *val) {
    dummy_func_to_gen_statepoints();
    return val + 1;
}
