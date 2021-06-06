#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#include "third-party-lib/libbacktrace/backtrace.h"

#define FRAME_MIN_SIZE 5
#define SKIP_FROM_BEGINING 4
#define SKIP_FROM_END 2
#define THREAD 0

typedef struct {
    const char *filename;
    const char *function;
    int lineno;
} Frame;

typedef struct {
    int length;
    int capacity;
    Frame *frames;
} FrameArray;

void on_error(void *vdata, const char *msg, int errnum) { printf("Error : %s\n", msg); }

int on_frame(void *data, uintptr_t pc, const char *filename, int lineno, const char *function) {
    FrameArray *frameArray = (FrameArray *)data;
    int n_frames = frameArray->length;

    if (n_frames == 0) {
        frameArray->frames = calloc(FRAME_MIN_SIZE, sizeof(Frame));
    } else if (n_frames == frameArray->capacity) {
        int cap = frameArray->capacity;
        cap = cap*cap;
        frameArray->capacity = cap;
        frameArray->frames = realloc(frameArray->frames, cap);
    }

    Frame *frame = frameArray->frames + n_frames;
    frame->filename = filename;
    frame->lineno = lineno;
    frame->function = function;
    frameArray->length = n_frames + 1;
    return 0;
}

void print_backtrace() {
    struct backtrace_state *state = backtrace_create_state(NULL, THREAD, on_error, NULL);

    FrameArray frameArray;
    frameArray.length = 0;
    frameArray.capacity = FRAME_MIN_SIZE;
    backtrace_full(state, SKIP_FROM_END, on_frame, on_error, &frameArray);

    printf("Abort \n");
    Frame *frame = frameArray.frames;
    Frame *lastFrame = frame + frameArray.length - SKIP_FROM_BEGINING;
    for (; frame < lastFrame; frame++) {
        printf("\tat %s(%s:%d)\n", frame->function, frame->filename, frame->lineno);
    }
}

void panic() { print_backtrace(); }
