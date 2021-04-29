#include <assert.h>

void assertVal(int val, int size, int pos) {
    int* p = (int*) pos;
    for (int i = 0; i < size; i++) {
        assert(*(p+i) == val);
    }
}
