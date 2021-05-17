	.text
	.file	"main.c"
	.globl	foo                             # -- Begin function foo
	.p2align	4, 0x90
	.type	foo,@function
foo:                                    # @foo
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$8, %edi
	callq	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$345, (%rax)                    # imm = 0x159
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
	.cfi_endproc
                                        # -- End function
	.globl	bar                             # -- Begin function bar
	.p2align	4, 0x90
	.type	bar,@function
bar:                                    # @bar
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	$34, -4(%rbp)
	movl	$8, %edi
	callq	malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	$7, (%rcx)
	movq	%rax, -32(%rbp)
	callq	foo
.Ltmp0:
	movq	%rsp, %rax
	addq	$32, %rax
	addq	$16, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rsi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movq	-24(%rbp), %rcx
	movq	(%rcx), %rsi
	movabsq	$.L.str.1, %rdi
	movl	%eax, -36(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	movq	-24(%rbp), %rcx
	movq	(%rcx), %rsi
	movabsq	$.L.str.2, %rdi
	movl	%eax, -40(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	movq	-24(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	(%rcx), %rsi
	movabsq	$.L.str.3, %rdi
	movl	%eax, -44(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	movabsq	$.L.str.4, %rdi
	leaq	-16(%rbp), %rsi
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	movq	-16(%rbp), %rsi
	movabsq	$.L.str.5, %rdi
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rsi
	movabsq	$.L.str.6, %rdi
	movl	%eax, -56(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	bar, .Lfunc_end1-bar
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$8, %edi
	callq	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$4, (%rax)
	callq	bar
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"loc : %p\n"
	.size	.L.str, 10

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"loc* : %lu\n"
	.size	.L.str.1, 12

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"loc* (uint64_t *) : %p\n"
	.size	.L.str.2, 24

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"value in loc : %lu\n\n"
	.size	.L.str.3, 21

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Stack address of heapPtr2 : %p\n"
	.size	.L.str.4, 32

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Address of heapPtr2 : %p\n"
	.size	.L.str.5, 26

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Value of heapPtr2 : %lu\n"
	.size	.L.str.6, 25

	.ident	"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"
	.section	".note.GNU-stack","",@progbits
	.section	.llvm_stackmaps,"a",@progbits
__LLVM_StackMaps:
	.byte	3
	.byte	0
	.short	0
	.long	1
	.long	0
	.long	1
	.quad	bar
	.quad	72
	.quad	1
	.quad	2882400000
	.long	.Ltmp0-bar
	.short	0
	.short	5
	.byte	4
	.byte	0
	.short	8
	.short	0
	.short	0
	.long	0
	.byte	4
	.byte	0
	.short	8
	.short	0
	.short	0
	.long	0
	.byte	4
	.byte	0
	.short	8
	.short	0
	.short	0
	.long	0
	.byte	3
	.byte	0
	.short	8
	.short	7
	.short	0
	.long	32
	.byte	3
	.byte	0
	.short	8
	.short	7
	.short	0
	.long	32
	.p2align	3
	.short	0
	.short	0
	.p2align	3

