#include <inttypes.h>
#include <stdio.h>
#include "gc/include/api.h"

#define STACKMAP __LLVM_StackMaps

extern void _B_main();

extern uint8_t STACKMAP[];
extern uint8_t* get_stackmap_pointer();

void gc_init() {
    statepoint_table_t* table = generate_table((void*) get_stackmap_pointer(), (void*)STACKMAP, 0.5);
    set_statepoint_table(table);
    print_table(stdout, table, true);
    printf("\n\n");
}

// void read_stackmaps() {
//     void* stack_map = (void*)STACKMAP;
//     printf("stack map : %p\n", stack_map);
//     printf("version : %d\n", *(uint8_t*)stack_map);

//     stack_map = (void*)get_stackmap_pointer();
//     printf("stack map : %p\n", stack_map);
//     printf("version : %d\n", *(uint8_t*)stack_map);
// }

int main() {
    gc_init();
    _B_main();
}