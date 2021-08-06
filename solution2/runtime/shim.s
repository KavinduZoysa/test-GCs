	.text
	.globl dummy_func_to_gen_statepoints
	.extern call_for_mark_roots
dummy_func_to_gen_statepoints:
	mov %rsp, %rdi
	jmp call_for_mark_roots
