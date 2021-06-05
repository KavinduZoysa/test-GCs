#include <stdio.h>

extern void printBacktrace();

void panic() {
    printBacktrace();
}
