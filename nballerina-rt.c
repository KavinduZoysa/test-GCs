#include <inttypes.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>

#include "third-party-lib/libbacktrace/backtrace.h"

#define FRAME_MIN_SIZE 5
#define SKIP_FROM_BEGINING 3
#define SKIP_FROM_END 4
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
    int length = frameArray->length;

    if (frameArray->capacity == 0) {
        frameArray->frames = calloc(FRAME_MIN_SIZE, sizeof(Frame));
        frameArray->capacity = FRAME_MIN_SIZE;
    } else if (length == frameArray->capacity) {
        int new_cap = frameArray->capacity * 2;
        frameArray->capacity = new_cap;
        frameArray->frames = realloc(frameArray->frames, new_cap * sizeof(Frame));
    }

    Frame *frame = frameArray->frames + length;
    frame->filename = filename;
    frame->lineno = lineno;
    frame->function = function;
    frameArray->length = length + 1;
    return 0;
}

void print_backtrace() {
    struct backtrace_state *state = backtrace_create_state(NULL, THREAD, on_error, NULL);

    FrameArray frameArray = {0, 0};
    backtrace_full(state, SKIP_FROM_BEGINING, on_frame, on_error, &frameArray);

    printf("Abort \n");
    Frame *frame = frameArray.frames;
    Frame *lastFrame = frame + frameArray.length - SKIP_FROM_END;
    for (; frame < lastFrame; frame++) {
        printf("\tat %s(%s:%d)\n", frame->function, frame->filename, frame->lineno);
    }
    free(frameArray.frames);
}

static void handler(int sig, siginfo_t *info, void *secret) {
    printf("Captured the SIGFPE\n");
    print_backtrace();
    exit(0);
}

void sig_init() {
    struct sigaction sa;
    sa.sa_sigaction = (void *)handler;
    sigaction(SIGFPE, &sa, NULL);
}

void panic() {}
