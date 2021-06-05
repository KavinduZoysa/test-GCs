#include "backtrace.h"

#include <inttypes.h>
#include <stdlib.h>

#define FRAME_MIN_SIZE 5

struct backtrace_state *state = NULL;
typedef struct
{
    uintptr_t addr;
    const char *filename;
    int lineno;
    const char *function;
} StackFrame;

int numOfStackFrames = 0;
StackFrame *stackFrames;

void onError(void *vdata, const char *msg, int errnum) {
    printf("Error : %s\n", msg);
}

void initialize(char *filename) {
    state = backtrace_create_state(filename, 1, onError, NULL);
    stackFrames = calloc(FRAME_MIN_SIZE, sizeof(StackFrame));
}

void relocateFrames() {
    stackFrames = realloc(stackFrames, FRAME_MIN_SIZE);
}

int onFrame(void *vdata, uintptr_t pc, const char *filename, int lineno, const char *function) {
    if (numOfStackFrames != 0 && numOfStackFrames%FRAME_MIN_SIZE == 0) {
        relocateFrames();
    }
    StackFrame *stackFrame = stackFrames + numOfStackFrames;
    stackFrame->filename = filename;
    stackFrame->lineno = lineno;
    stackFrame->function = function;
    numOfStackFrames = numOfStackFrames + 1;
    return 0;
}

void getBacktrace() { backtrace_full(state, 3, onFrame, onError, NULL); }

void printBacktrace() {
    initialize("Initialize backtrace");
    getBacktrace();
    printf("Abort \n");
    for (size_t i = 0; i < numOfStackFrames - 4; i++) {
        StackFrame *frame = stackFrames + i;
        printf("\t@%s(%s:%d)\n", frame->function, frame->filename, frame->lineno);
    }
    free(stackFrames);
}
