#include <inttypes.h>
#include <stdio.h>

#include "balrt.h"
#include "gc/include/api.h"

char *_bal_stack_guard;

extern uint8_t* get_stackmap_pointer();
extern void set_statepoint_table(statepoint_table_t *tb);
extern void _B_main();

void gc_init() {
    statepoint_table_t* table = generate_table((void*) get_stackmap_pointer(), 0.5);
    set_statepoint_table(table);
    print_table(stdout, table, true);
    printf("\n\n");
}

int main() {
    _bal_stack_guard = __builtin_frame_address(0) - STACK_SIZE;
    gc_init();
    _B_main();
    return 0;
} 
