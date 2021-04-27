#include "gc.h"
#include <assert.h>
#include <stdio.h>
#include <stdint.h>

int balAlloc(int size) {
  GC_INIT();
  int *p = (int *) GC_MALLOC(sizeof(size));
  printf("The value of p is: %p\n", p);
  printf("pos = %d", (uintptr_t)p);
  return  (uintptr_t)p;
}

// int main() {
//   int pos = balAlloc(64);
//   printf("pos = %d", pos); 
//   return 0;
// }

