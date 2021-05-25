#define UNW_LOCAL_ONLY
#include <libunwind.h>
#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

void* getCallers(int dummyVal) {
    unw_cursor_t cursor;
    unw_context_t context;

    int numOfCallLocs = 0;
    uint64_t* callLocs = (uint64_t*)malloc(sizeof(uint64_t));

    unw_getcontext(&context);
    unw_init_local(&cursor, &context);
    while (unw_step(&cursor) > 0) {
        unw_word_t pc;
        unw_get_reg(&cursor, UNW_REG_IP, &pc);
        if (pc == 0) {
            break;
        }
        numOfCallLocs = numOfCallLocs + 1;
        callLocs = realloc(callLocs, sizeof(uint64_t)*(numOfCallLocs + 1));
        *(callLocs + numOfCallLocs) = pc;
    }
    *callLocs = numOfCallLocs;
    for (size_t i = 0; i < numOfCallLocs + 1; i++) {
        printf("%p\n", *(callLocs + i));
    }
    
    return (void*)callLocs;
}
