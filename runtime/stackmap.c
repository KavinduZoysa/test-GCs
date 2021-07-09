#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>

#include "stackmap.h"

StackMap *stackMap;

// TODO : Dealloc and handle allocation is failed
StackMap *newStackMap() {
    return malloc(sizeof(StackMap));
}

// TODO : Dealloc and handle allocation is failed
ConstantInfo *newConstInfo(uint32_t numOfConsts) {
    return calloc(numOfConsts, sizeof(ConstantInfo));
}

// TODO : Dealloc and handle allocation is failed
FuncInfo *newFuncInfo(uint32_t numOfFuncs) {
    return calloc(numOfFuncs, sizeof(FuncInfo));
}

// TODO : Dealloc and handle allocation is failed
RecordInfo *newRecordInfo(uint64_t numOfRecords) {
    return calloc(numOfRecords, sizeof(RecordInfo));
}

// TODO : Dealloc and handle allocation is failed
LocationInfo *newLocationsInfo(uint32_t numOfLocs) {
    return calloc(numOfLocs, sizeof(LocationInfo));
}

void parseConstantsInfo(uint32_t numOfConstants, ConstantInfo* constantsInfo) {
    ConstantInfo* constants = newConstInfo(numOfConstants);
    for (size_t i = 0; i < numOfConstants; i++) {
        (constants + i)->largeConstant = (constantsInfo + i)->largeConstant;
    }
    stackMap->constants = constants;
}

void parseFuncInfo(uint32_t numOfFuncs, FuncBasicInfo* funcBasicInfoStart, RecordInfo* recordInfoStart) {
    FuncInfo *funcInfo = newFuncInfo(numOfFuncs);
    for (size_t i = 0; i < numOfFuncs; i++) {
        FuncInfo *func = funcInfo + i;
        FuncBasicInfo *funcBasicInfo = funcBasicInfoStart + i;
        uint64_t recordCount = funcBasicInfo->recordCount;
        // TODO : Check whether this is correct
        func->funcBasicInfo = (FuncBasicInfo) {.address = funcBasicInfo->address, .stackSize = funcBasicInfo->stackSize, .recordCount = recordCount};
        
        RecordInfo* records = newRecordInfo(recordCount);
        uint64_t recSize = 0;
        for (size_t j = 0; j < recordCount; j++) {
            RecordInfo* recInfo = (RecordInfo*)((uint8_t*)recordInfoStart + recSize);
            uint32_t numOfLocs = recInfo->numLocations;

            // TODO : Revisit this logic
            RecordInfo* rec = records + j;
            *rec = (RecordInfo) {.id = recInfo->id, .codeOffset = recInfo->codeOffset, .flags = recInfo->flags, .numLocations = numOfLocs};
            recSize = recSize + 16; // id + codeOffset + flags + numLocations
            LocationInfo *locations = newLocationsInfo(numOfLocs);
            LocationInfo* locInfo = (LocationInfo*) ((uint8_t*)recordInfoStart + recSize);
            for (size_t l = 0; l < numOfLocs; l++) {
                locInfo = locInfo + 1;
                LocationInfo *loc = locations + l;
                *loc = (LocationInfo) {.flags = locInfo->flags, .kind = locInfo->kind, .locSize = locInfo->locSize, .offset = locInfo->offset, .regNum = locInfo->regNum, .reserved = locInfo->reserved};
            }
            recSize = recSize + numOfLocs*12; // numLocations*(size of location)
            rec->locations = locations;
            recSize = recSize + 6; // padding + padding
            uint16_t numOfLiveOuts = *(uint16_t*)((uint8_t*)recordInfoStart + recSize);
            recSize = recSize + 2 + numOfLiveOuts*4 + 4; // (num of live outs) + (size of live outs)*(num of live outs) + padding
            // TODO : Add liveouts and paddings
        }
        funcInfo->numOfRecords = recordCount;
        funcInfo->records = records;
    }
    stackMap->numOfFuncs = numOfFuncs;
    stackMap->functions = funcInfo;
}

StackMap *parse_stackmap(uint8_t *llvm_stackmap) {
    stackMap = newStackMap();
    StackMapHeader* stackMapHeader = (StackMapHeader *) llvm_stackmap;

    uint32_t numOfFuncs = stackMapHeader->numFunctions;
    uint32_t numOfConstants = stackMapHeader->numConstants;
    uint32_t numOfRecords = stackMapHeader->numRecords;
    // TODO : check whether this is correct
    stackMap->StackMapHeader = (StackMapHeader) {.version = stackMapHeader->version, .numFunctions = numOfFuncs, .numConstants = numOfConstants, .numRecords = numOfRecords};
    
    FuncBasicInfo* funcBasicInfoStart = (FuncBasicInfo*) (stackMapHeader + 1);
    ConstantInfo* constantsInfo = (ConstantInfo*) (funcBasicInfoStart + numOfFuncs);
    parseConstantsInfo(numOfConstants, constantsInfo);
    RecordInfo* recordInfoStart = (RecordInfo*) (constantsInfo + numOfConstants);
    parseFuncInfo(numOfFuncs, funcBasicInfoStart, recordInfoStart);

    return stackMap;
}