#include "gc.h"
#include <assert.h>
#include <stdio.h>

int balMultipleAlloc() {
  int i;
  int count = 10000;

  GC_INIT();
  for (i = 0; i < count; ++i) {
     int *p = (int *) GC_MALLOC(sizeof(int)); 
     if (i % (count/100) == 0) {
       printf("Heap size(GC_get_heap_size) = %d\n", GC_get_heap_size());
       printf("Heap size(GC_get_free_bytes) = %d\n", GC_get_free_bytes());
     }
   } 
  return 0;
}

