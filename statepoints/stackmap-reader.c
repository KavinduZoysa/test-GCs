#include <inttypes.h>
#include <stdio.h>
#include "stackmap-reader.h"

uint32_t numOfRecords = 0;

void readLocations(locationInfo* locations, uint16_t numOfLocations) {
    printf("\t***************** Locations(Marked References)Info *****************\n");
    for (int i = 0; i<numOfLocations; i++) {
        printf("\tKind : %d\n", locations->kind);
        printf("\tFlags : %d\n", locations->flags);
        printf("\tLocation Size : %d\n", locations->locSize);
        printf("\tReg Num : %d\n", locations->regNum);
        printf("\tReserved : %d\n", locations->reserved);
        printf("\tOffset : %d\n\n", locations->offset);
        locations = locations + 1;
    }
}

void readRecords(recordInfo* recordsInfo) {
    printf("***************** Records(Safe Points) Info *****************\n");
    for(int i = 0; i<numOfRecords; i++) {
        printf("%p\n", recordsInfo);
        printf("Patch id : %ld\n", recordsInfo->id);
        printf("Code Offset : %d\n", recordsInfo->codeOffset);
        printf("Flags : %d\n", recordsInfo->flags);
        uint16_t numOfLocations = recordsInfo->numLocations;
        printf("Number of locations (marked references) : %d\n\n", numOfLocations);
        readLocations((locationInfo*) (((uint16_t* ) recordsInfo) + 8), numOfLocations);

        uint8_t* temp = ((uint8_t*) recordsInfo) + numOfLocations*12 + 16;
        printf("Padding : %d\n", *((uint32_t*) temp));
        printf("Padding : %d\n", *((uint16_t*) (temp + 4)));
        int numLiveOuts = *((uint16_t*) (temp + 6));
        printf("Number of LiveOuts : %d\n", numLiveOuts);
        temp = temp + 8 + numLiveOuts*4;
        recordsInfo = (recordInfo*) (temp + 4);
    }
}

void readFuncInfo(functionInfo* functionInfo, uint32_t numOfFunc, uint32_t numOfConsts) {
    printf("***************** Functions (which enable GCs) Info *****************\n");
    for (int i = 0; i<numOfFunc; i++) {
        printf("Function address : %p\n", functionInfo->address);
        printf("Stack size : %ld\n", functionInfo->stackSize);
        printf("Function calls count(safepoints) : %ld\n\n", functionInfo->callsiteCount);
        functionInfo = functionInfo + 1;
    }
    readRecords((recordInfo*) ((uint32_t*) functionInfo + numOfConsts));
}

void readHeader(stackMapHeader* header) {
    printf("Number of function (which enable GCs) : %d\n", header->numFunctions);
    printf("Number of constants : %d\n", header->numConstants);
    numOfRecords = header->numRecords;
    printf("Total number of function calls(safepoints) : %d\n\n", numOfRecords);

    readFuncInfo((functionInfo*)(header + 1), header->numFunctions, header->numConstants);
}

void readStackMap(uint64_t* stackMapPrt) {
    printf("StackMap location : %p\n", stackMapPrt);
    uint8_t* version = (uint8_t*)stackMapPrt;
    printf("StackMap version : %d\n\n", *version);

    readHeader((stackMapHeader*) stackMapPrt);
}
