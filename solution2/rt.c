#include <inttypes.h>
#include <stdio.h>

extern uint8_t* get_stackmap_pointer();

void dummy_func() {
    void *stack_map = (void *)get_stackmap_pointer();
    printf("stack map : %p\n", stack_map);
    printf("version : %d\n", *(uint8_t*)stack_map);
    stack_map = stack_map + 128;
    printf("stack map : %p\n", stack_map);
    printf("version : %d\n", *(uint8_t*)stack_map);
}

uint8_t __attribute__((address_space(1))) *foo(uint8_t __attribute__((address_space(1))) *val) {
    dummy_func();
    return val + 1;
}