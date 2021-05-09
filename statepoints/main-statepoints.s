	.text
	.file	"main.ll"
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
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movq	heapPtr, %rcx
	movl	%eax, (%rcx)
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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$234, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %edi
	callq	foo
.Ltmp0:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	addq	$16, %rsp
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
	xorl	%eax, %eax
	movl	$4, %edi
	movl	%eax, -8(%rbp)                  # 4-byte Spill
	callq	malloc
	movq	%rax, heapPtr(%rip)
	movq	heapPtr(%rip), %rax
	addq	$4, %rax
	movq	%rax, heapPtr(%rip)
	movq	heapPtr(%rip), %rdi
	callq	bar
.Ltmp1:
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax                  # 4-byte Reload
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	heapPtr,@object                 # @heapPtr
	.bss
	.globl	heapPtr
	.p2align	3
heapPtr:
	.quad	0
	.size	heapPtr, 8

	.ident	"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"
	.section	".note.GNU-stack","",@progbits
	.section	.llvm_stackmaps,"a",@progbits
__LLVM_StackMaps:
	.byte	3
	.byte	0
	.short	0
	.long	2
	.long	0
	.long	2
	.quad	bar
	.quad	24
	.quad	1
	.quad	main
	.quad	24
	.quad	1
	.quad	2882400000
	.long	.Ltmp0-bar
	.short	0
	.short	3
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
	.p2align	3
	.short	0
	.short	0
	.p2align	3
	.quad	2882400000
	.long	.Ltmp1-main
	.short	0
	.short	3
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
	.p2align	3
	.short	0
	.short	0
	.p2align	3

