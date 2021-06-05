#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#include "third-party-lib/libbacktrace/backtrace.h"

#define FRAME_MIN_SIZE 5
#define SKIP_FROM_BEGINING 4
#define SKIP_FROM_END 3
#define THREAD 0

struct backtrace_state *state = NULL;

typedef struct {
    const char *filename;
    const char *function;
    int lineno;
} Frame;

typedef struct {
    int numOfFrames;
    Frame *frames;
} FrameInfo;

void onError(void *vdata, const char *msg, int errnum) { printf("Error : %s\n", msg); }

void initialize() { state = backtrace_create_state(NULL, THREAD, onError, NULL); }

Frame *reallocateFrames(Frame *frame, int numOfFrames) { return realloc(frame, FRAME_MIN_SIZE + numOfFrames); }

int onFrame(void *data, uintptr_t pc, const char *filename, int lineno, const char *function) {
    FrameInfo *frameInfo = (FrameInfo *)data;
    int numOfFrames = frameInfo->numOfFrames;
    Frame *frame = frameInfo->frames;
    if (numOfFrames != 0 && numOfFrames % FRAME_MIN_SIZE == 0) {
        frame = reallocateFrames(frame, numOfFrames);
    }

    frame = frame + numOfFrames;
    frame->filename = filename;
    frame->lineno = lineno;
    frame->function = function;
    frameInfo->numOfFrames = numOfFrames + 1;
    return 0;
}

void getBacktrace(FrameInfo *frameInfo) { backtrace_full(state, SKIP_FROM_END, onFrame, onError, frameInfo); }

FrameInfo *initFrameInfo() {
    FrameInfo *frameInfo = malloc(sizeof(FrameInfo));
    frameInfo->numOfFrames = 0;
    frameInfo->frames = calloc(FRAME_MIN_SIZE, sizeof(Frame));
    return frameInfo;
}

void destroy(FrameInfo *frameInfo) {
    Frame *frame = frameInfo->frames;
    Frame *lastFrame = frame + frameInfo->numOfFrames - SKIP_FROM_BEGINING;
    for (; frame < lastFrame; frame++) {
        free(frame);
    }
    free(frameInfo);
}

void printBacktrace() {
    initialize();
    FrameInfo *frameInfo = initFrameInfo();
    getBacktrace(frameInfo);

    printf("Abort \n");
    Frame *frame = frameInfo->frames;
    Frame *lastFrame = frame + frameInfo->numOfFrames - SKIP_FROM_BEGINING;
    for (; frame < lastFrame; frame++) {
        printf("\tat %s(%s:%d)\n", frame->function, frame->filename, frame->lineno);
    }
    destroy(frameInfo);
}

void panic() { printBacktrace(); }
