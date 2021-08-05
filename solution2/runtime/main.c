#include <inttypes.h>
#include <stdio.h>

#define STACKMAP __LLVM_StackMaps

extern void _B_main();

extern uint8_t STACKMAP[];
extern uint8_t* get_stackmap_pointer();

void read_stackmaps() {
    void* stack_map = (void*)STACKMAP;
    printf("stack map : %p\n", stack_map);
    printf("version : %d\n", *(uint8_t*)stack_map);

    stack_map = (void*)get_stackmap_pointer();
    printf("stack map : %p\n", stack_map);
    printf("version : %d\n", *(uint8_t*)stack_map);
}

int main() {
    _B_main();
    read_stackmaps();
}