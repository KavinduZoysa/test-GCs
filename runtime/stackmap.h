#include <inttypes.h>

typedef struct {
    uint8_t version;
    uint8_t reserved1;
    uint16_t reserved2;
    uint32_t numFunctions;
    uint32_t numConstants;
    uint32_t numRecords;
} StackMapHeader;

typedef struct {
    uint64_t address;
    uint64_t stackSize;
    uint64_t recordCount;  
} FuncBasicInfo;

typedef struct {
    uint64_t largeConstant;
} ConstantInfo;

typedef struct {
    uint8_t kind;      
    uint8_t flags;      
    uint16_t locSize;
    uint16_t regNum;    
    uint16_t reserved;  
    int32_t offset;     
} LocationInfo;

typedef struct {
    uint16_t dwarfRegNum;
    uint8_t reserved;
    uint8_t size;
} LiveOuts;

typedef struct {
    uint64_t id;
    uint32_t codeOffset;  
    uint16_t flags;
    uint16_t numLocations;
    LocationInfo* locations;
    uint32_t padding1;
    uint16_t padding2;
    uint16_t liveOutsNum;
    LiveOuts* liveOuts;
    uint32_t padding3;
} RecordInfo; 

typedef struct {
    FuncBasicInfo funcBasicInfo; 
    uint64_t numOfRecords;
    RecordInfo* records; 
} FuncInfo;

typedef struct {
    StackMapHeader StackMapHeader;
    ConstantInfo* constants; 
    uint64_t numOfFuncs;
    FuncInfo* functions; 
} StackMap;