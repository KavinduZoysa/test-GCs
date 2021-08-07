#include "../../third-party/libbacktrace/backtrace.h"
#include "gc/include/api.h"

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#define SKIP_FROM_END 2 // skip : print_backtrace, mark_roots, call_mark_roots, dummy_func
#define SKIP_FROM_BEGINING 4 // skip : main, ...
#define FRAME_MIN_SIZE SKIP_FROM_BEGINING + 5
#define THREAD 0

statepoint_table_t* table;

void set_statepoint_table(statepoint_table_t *tb) {
    table = tb;
}

typedef struct {
    uintptr_t pc;
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
    frame->pc = pc + 1;
    frameArray->length = length + 1;
    return 0;
}

void get_frames(FrameArray *frameArray) {
    // TODO : check whether this can be called outside
    struct backtrace_state *state = backtrace_create_state(NULL, THREAD, on_error, NULL);

    backtrace_full(state, SKIP_FROM_END, on_frame, on_error, frameArray);
}

typedef char *Root;
typedef void (*AddRoot)(Root *root, void *arg);

void add_root(Root *root, void *arg) {
    // printf("Found root : %p\n", *root);
}

void mark_roots(AddRoot add_root, uint8_t* rsp) {
    FrameArray frameArray = {0, 0};
    get_frames(&frameArray);

    Frame *f = frameArray.frames;
    Frame *lastFrame = f + frameArray.length - SKIP_FROM_BEGINING;

    // Find roots using stack map
    // 1. Iterate over frames and consider one frame_address here the frame corresponds to one call site
    // 2. Should find the function adrdess from the stackmap to that frame
    // i.e. Iterate over functions record and find the function such that function_address + codeOffset = frame_address
    // 3. If function address was found, get call sites between the begining of function_address and frame_address
    // 4. Get the location of heap reference(root)
    for (; f < lastFrame; f++) {
        // find_roots_per_frame(add_root, f->pc, rsp);
        frame_info_t* frame = lookup_return_address(table, f->pc);
        for (size_t p = 0; p < frame->numSlots; p++) {
            pointer_slot_t* psl = frame->slots + p;
            uint32_t** ptr = (uint32_t**)(rsp + psl->offset);
            printf("root taken from stack map : %p\n", *ptr);
        }
        rsp = rsp + frame->frameSize + 8;
    }
    free(frameArray.frames);
}

void call_for_mark_roots(uint8_t* stackPtr) {
    printf("%p\n", stackPtr);
    AddRoot add_root = &add_root;
    mark_roots(add_root, stackPtr + 8);
    printf("\n");
}