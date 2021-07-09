#include "../third-party/libbacktrace/backtrace.h"
#include "stackmap.h"

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

#define SKIP_FROM_END 4 // skip : print_backtrace, mark_roots, call_mark_roots, dummy_func
#define SKIP_FROM_BEGINING 4 // skip : main, ...
#define FRAME_MIN_SIZE SKIP_FROM_BEGINING + 5
#define THREAD 0

StackMap *stack_map;

void set_stack_map(StackMap *stack_map_ptr) {
    stack_map = stack_map_ptr;
}

typedef struct {
    uintptr_t pc;
} Frame;

typedef struct {
    int length;
    int capacity;
    Frame *frames;
} FrameArray;

void on_error(void *vdata, const char *msg, int errnum) { printf("Errorr : %s\n", msg); }

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

void find_roots_per_frame(AddRoot addRoot, uintptr_t frame_addr, uint64_t rsp) {
    for (size_t f = 0; f < stack_map->numOfFuncs; f++) {
        FuncInfo *func = stack_map->functions + f;
        FuncBasicInfo funcBasicInfo = func->funcBasicInfo;
        uint64_t func_addr = func->funcBasicInfo.address;
        uint64_t stack_frame_size = func->funcBasicInfo.stackSize;
        int found = 0;
        int record_index = 0;
        for (size_t r = 0; r < func->numOfRecords; r++) {
            RecordInfo *rec = func->records + r;
            if (func_addr + rec->codeOffset == frame_addr) {
                record_index = r;
                printf("matched callsite with frame address for func : %p\n", func_addr);
                break;
            }
        }
        if (!record_index) { // There is not a call site match
            continue;
        }

        for (size_t r = 0; r <= record_index; r++) {
            RecordInfo *rec = func->records + r;
            int loc_count = rec->numLocations;
            if (loc_count <= 3) {
                continue;
            }
            for (size_t l = 0; l < rec->numLocations; l++) {
                LocationInfo* locInfo = rec->locations + l;
                uint8_t kind = locInfo->kind;
                if (kind == 1) { // Register
                } else if (kind == 2) { // Direct
                } else if (kind == 3) { // Indirect
                    uint16_t reg_num = locInfo->regNum;
                    if (reg_num != 7) {
                        printf("Abort : unhandled register number : %d\n", reg_num);
                        abort();
                    }
                    int32_t offset = locInfo->offset;
                    // rdwarf egNum 7 means rsp
                    // root is located at rsp + offset
                    Root *root = (Root*) (rsp + offset);
                    printf("dereference (root from LLVM Stack Map) : %p\n", *root);
                    // call addRoot()
                } else if (kind == 4) { // Constant
                } else if (kind == 5) { // ConstIndex
                } else { // No kind
                }
            }
        }
        break;
    }
}

// Consider first call for now
int i = 0;

void mark_roots(AddRoot add_root, uint64_t rsp) {
    if (i++ != 0) {
        return;
    }
    FrameArray frameArray = {0, 0};
    get_frames(&frameArray);

    Frame *frame = frameArray.frames;
    Frame *lastFrame = frame + frameArray.length - SKIP_FROM_BEGINING;

    // Find roots using stack map
    // 1. Iterate over frames and consider one frame_address here the frame corresponds to one call site
    // 2. Should find the function adrdess from the stackmap to that frame
    // i.e. Iterate over functions record and find the function such that function_address + codeOffset = frame_address
    // 3. If function address was found, get call sites between the begining of function_address and frame_address
    // 4. Get the location of heap reference(root)
    for (; frame < lastFrame; frame++) {
        find_roots_per_frame(add_root, frame->pc, rsp);
    }
    free(frameArray.frames);
}

void call_for_mark_roots(uint64_t rsp) {
    AddRoot add_root = &add_root;
    mark_roots(add_root, rsp);
}