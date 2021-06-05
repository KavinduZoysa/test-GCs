#include "backtrace.h"

#include <inttypes.h>
#include <stdlib.h>

struct backtrace_state *state = NULL;
struct StackFrame {
    uintptr_t addr;
    const char* filename;
    int lineno;
    const char* function;
};

void onError(void *vdata, const char *msg, int errnum) {
    printf("Error Occured\n");
}

void initialize(char *filename) { state = backtrace_create_state(filename, 1, onError, NULL); }

int numOfAllocs = 0;
uint64_t *callLocs;

int onFrame(void *vdata, uintptr_t pc, const char *filename, int lineno, const char *function) {
    if (numOfAllocs == 0) {
        callLocs = (uint64_t *)calloc(2, sizeof(uintptr_t));
    } else {
        callLocs = realloc(callLocs, sizeof(uintptr_t) * (numOfAllocs + 2));
    }
    numOfAllocs = numOfAllocs + 1;
    *(callLocs + numOfAllocs) = pc + 1;
    printf("*****************\n");
    printf("%p\n", pc + 1);
    printf("%s\n", filename);
    printf("%d\n", lineno);
    printf("%s\n\n", function);
    return 0;
}

void getBackTrace() { backtrace_full(state, 3, onFrame, onError, NULL); }

void* getCallers() {
    initialize("Initialize backtrace");
    getBackTrace();
    *callLocs = numOfAllocs - 3;
    for (size_t i = 0; i < numOfAllocs; i++) {
        printf("%p\n", *(callLocs + i));
    }
    return (void*)callLocs;
}
