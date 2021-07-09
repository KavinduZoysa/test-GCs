#include <inttypes.h>
#include <stdio.h>

#include "balrt.h"
#include "stackmap.h"

char *_bal_stack_guard;

extern uint8_t* get_stackmap_pointer();
extern StackMap* parse_stackmap(uint8_t *);
extern void _B_main();
extern void set_stack_map(StackMap *);

void dump(StackMap* stackMap) {
    StackMapHeader stackMapHeader = stackMap->StackMapHeader;
    printf("version : %d\n", stackMapHeader.version);
    printf("functions : %d\n", stackMapHeader.numFunctions);
    printf("constants : %d\n", stackMapHeader.numConstants);
    printf("records : %d\n", stackMapHeader.numRecords);

    printf("Num of funcs : %d\n", stackMap->numOfFuncs);
    printf("*********** Function Information ***********\n");
    for (size_t f = 0; f < stackMap->numOfFuncs; f++) {
        FuncInfo* funcInfo = stackMap->functions + f;
        FuncBasicInfo funcBasicInfo = funcInfo->funcBasicInfo;
        printf("func addr : %p\n", funcBasicInfo.address);
        printf("rec count : %d\n", funcBasicInfo.recordCount);
        printf("stack size : %d\n", funcBasicInfo.stackSize);
        printf("\t*********** Record Information ***********\n");
        for (size_t r = 0; r < funcInfo->numOfRecords; r++) {
            RecordInfo* recInfo = funcInfo->records + r;
            printf("\tid : %lu\n", recInfo->id);
            printf("\tcodeOffset : %d\n", recInfo->codeOffset);
            printf("\tflags : %d\n", recInfo->flags);
            printf("\tnum of locations : %d\n", recInfo->numLocations);
            printf("\t\t*********** Location Information ***********\n");
            for (size_t l = 0; l < recInfo->numLocations; l++) {
                LocationInfo* loc = recInfo->locations + l;
                printf("\t\tkind : %d\n", loc->kind);
                printf("\t\tflags : %d\n", loc->flags);
                printf("\t\tlocSize : %d\n", loc->locSize);
                printf("\t\tregNum : %d\n", loc->regNum);
                printf("\t\treserved : %d\n", loc->reserved);
                printf("\t\toffset : %d\n", loc->offset);
            }  
        }
    }
}

void gc_init() {
    StackMap* stackMap = parse_stackmap(get_stackmap_pointer());
    // dump(stackMap);
    set_stack_map(stackMap);
}

int main() {
    _bal_stack_guard = __builtin_frame_address(0) - STACK_SIZE;
    gc_init();
    _B_main();
    return 0;
} 
