#include "gsym.h"

	.text
	.globl GSYM(dummy_func)
	.extern GSYM(call_for_mark_roots)
GSYM(dummy_func):
	mov %rsp, %rdi
	jmp GSYM(call_for_mark_roots)
