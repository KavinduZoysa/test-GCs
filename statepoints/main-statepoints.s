	.text
	.file	"main.c"
	.file	1 "/usr/include/stdint.h"
	.globl	baz                             # -- Begin function baz
	.p2align	4, 0x90
	.type	baz,@function
baz:                                    # @baz
.Lfunc_begin0:
	.file	2 "/home/kavindu/ballerina/nBalTest/test-gc/statepoints/main.c"
	.loc	2 20 0                          # main.c:20:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
.Ltmp0:
	.loc	2 20 13 prologue_end            # main.c:20:13
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp1:
.Lfunc_end0:
	.size	baz, .Lfunc_end0-baz
	.cfi_endproc
                                        # -- End function
	.globl	foo                             # -- Begin function foo
	.p2align	4, 0x90
	.type	foo,@function
foo:                                    # @foo
.Lfunc_begin1:
	.loc	2 22 0                          # main.c:22:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	$8, %edi
.Ltmp2:
	.loc	2 23 25 prologue_end            # main.c:23:25
	callq	malloc
	.loc	2 23 14 is_stmt 0               # main.c:23:14
	movq	%rax, -8(%rbp)
	.loc	2 24 6 is_stmt 1                # main.c:24:6
	movq	-8(%rbp), %rcx
	.loc	2 24 15 is_stmt 0               # main.c:24:15
	movl	$5, (%rcx)
	.loc	2 26 5 is_stmt 1                # main.c:26:5
	movq	%rax, -32(%rbp)
	callq	baz
.Ltmp3:
	movl	$3, %edi
	.loc	2 27 27                         # main.c:27:27
	callq	getCallers
.Ltmp4:
	.loc	2 27 11 is_stmt 0               # main.c:27:11
	movq	%rax, -16(%rbp)
	.loc	2 28 44 is_stmt 1               # main.c:28:44
	movq	-16(%rbp), %rax
	.loc	2 28 31 is_stmt 0               # main.c:28:31
	movq	(%rax), %rsi
	.loc	2 28 5                          # main.c:28:5
	movl	$.L.str, %eax
	xorl	%edx, %edx
                                        # kill: def $dl killed $dl killed $edx
	movq	%rax, %rdi
	movq	%rax, -40(%rbp)                 # 8-byte Spill
	movb	%dl, %al
	movb	%dl, -41(%rbp)                  # 1-byte Spill
	callq	printf
	.loc	2 29 44 is_stmt 1               # main.c:29:44
	movq	-16(%rbp), %rcx
	.loc	2 29 31 is_stmt 0               # main.c:29:31
	movq	8(%rcx), %rsi
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movb	-41(%rbp), %dl                  # 1-byte Reload
	movl	%eax, -48(%rbp)                 # 4-byte Spill
	.loc	2 29 5                          # main.c:29:5
	movb	%dl, %al
	callq	printf
	.loc	2 30 44 is_stmt 1               # main.c:30:44
	movq	-16(%rbp), %rcx
	.loc	2 30 31 is_stmt 0               # main.c:30:31
	movq	16(%rcx), %rsi
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movb	-41(%rbp), %dl                  # 1-byte Reload
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	.loc	2 30 5                          # main.c:30:5
	movb	%dl, %al
	callq	printf
	.loc	2 31 44 is_stmt 1               # main.c:31:44
	movq	-16(%rbp), %rcx
	.loc	2 31 31 is_stmt 0               # main.c:31:31
	movq	24(%rcx), %rsi
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movb	-41(%rbp), %dl                  # 1-byte Reload
	movl	%eax, -56(%rbp)                 # 4-byte Spill
	.loc	2 31 5                          # main.c:31:5
	movb	%dl, %al
	callq	printf
	.loc	2 32 43 is_stmt 1               # main.c:32:43
	movq	-16(%rbp), %rcx
	.loc	2 32 58 is_stmt 0               # main.c:32:58
	movl	(%rcx), %esi
	.loc	2 32 20                         # main.c:32:20
	movq	%rcx, %rdi
	movl	%eax, -60(%rbp)                 # 4-byte Spill
	callq	getHeapRefs
.Ltmp5:
	.loc	2 32 10                         # main.c:32:10
	movq	%rax, -24(%rbp)
	.loc	2 33 21 is_stmt 1               # main.c:33:21
	movq	-24(%rbp), %rax
	.loc	2 33 20 is_stmt 0               # main.c:33:20
	movl	(%rax), %esi
	.loc	2 33 5                          # main.c:33:5
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	.loc	2 34 22 is_stmt 1               # main.c:34:22
	movq	-24(%rbp), %rcx
	.loc	2 34 20 is_stmt 0               # main.c:34:20
	movl	4(%rcx), %esi
	.loc	2 34 5                          # main.c:34:5
	movabsq	$.L.str.1, %rdi
	movl	%eax, -64(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 35 22 is_stmt 1               # main.c:35:22
	movq	-24(%rbp), %rcx
	.loc	2 35 20 is_stmt 0               # main.c:35:20
	movl	8(%rcx), %esi
	.loc	2 35 5                          # main.c:35:5
	movabsq	$.L.str.1, %rdi
	movl	%eax, -68(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 36 22 is_stmt 1               # main.c:36:22
	movq	-24(%rbp), %rcx
	.loc	2 36 20 is_stmt 0               # main.c:36:20
	movl	12(%rcx), %esi
	.loc	2 36 5                          # main.c:36:5
	movabsq	$.L.str.1, %rdi
	movl	%eax, -72(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 38 46 is_stmt 1               # main.c:38:46
	movq	%rsp, %rcx
	.loc	2 38 5 is_stmt 0                # main.c:38:5
	movabsq	$.L.str.2, %rdi
	movq	%rcx, %rsi
	movl	%eax, -76(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 39 63 is_stmt 1               # main.c:39:63
	movq	%rsp, %rcx
	.loc	2 39 71 is_stmt 0               # main.c:39:71
	movq	-24(%rbp), %rsi
	.loc	2 39 67                         # main.c:39:67
	movslq	4(%rsi), %rsi
	.loc	2 39 38                         # main.c:39:38
	movq	(%rcx,%rsi), %rcx
	.loc	2 39 25                         # main.c:39:25
	movq	(%rcx), %rsi
	.loc	2 39 5                          # main.c:39:5
	movabsq	$.L.str.3, %rdi
	movl	%eax, -80(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 40 63 is_stmt 1               # main.c:40:63
	movq	%rsp, %rcx
	.loc	2 40 75 is_stmt 0               # main.c:40:75
	movq	-24(%rbp), %rsi
	.loc	2 40 71                         # main.c:40:71
	movslq	8(%rsi), %rsi
	.loc	2 40 38                         # main.c:40:38
	movq	8(%rcx,%rsi), %rcx
	.loc	2 40 25                         # main.c:40:25
	movq	(%rcx), %rsi
	.loc	2 40 5                          # main.c:40:5
	movabsq	$.L.str.4, %rdi
	movl	%eax, -84(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 41 63 is_stmt 1               # main.c:41:63
	movq	%rsp, %rcx
	.loc	2 41 76 is_stmt 0               # main.c:41:76
	movq	-24(%rbp), %rsi
	.loc	2 41 72                         # main.c:41:72
	movslq	12(%rsi), %rsi
	.loc	2 41 38                         # main.c:41:38
	movq	16(%rcx,%rsi), %rcx
	.loc	2 41 25                         # main.c:41:25
	movq	(%rcx), %rsi
	.loc	2 41 5                          # main.c:41:5
	movabsq	$.L.str.4, %rdi
	movl	%eax, -88(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	2 42 1 is_stmt 1                # main.c:42:1
	addq	$96, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp6:
.Lfunc_end1:
	.size	foo, .Lfunc_end1-foo
	.cfi_endproc
                                        # -- End function
	.globl	bar                             # -- Begin function bar
	.p2align	4, 0x90
	.type	bar,@function
bar:                                    # @bar
.Lfunc_begin2:
	.loc	2 44 0                          # main.c:44:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$8, %edi
.Ltmp7:
	.loc	2 45 26 prologue_end            # main.c:45:26
	callq	malloc
	.loc	2 45 15 is_stmt 0               # main.c:45:15
	movq	%rax, -8(%rbp)
	.loc	2 46 9 is_stmt 1                # main.c:46:9
	movl	$23, -12(%rbp)
	.loc	2 47 6                          # main.c:47:6
	movq	-8(%rbp), %rcx
	.loc	2 47 15 is_stmt 0               # main.c:47:15
	movq	$7, (%rcx)
	.loc	2 48 5 is_stmt 1                # main.c:48:5
	movq	%rax, -24(%rbp)
	callq	foo
.Ltmp8:
	.loc	2 49 1                          # main.c:49:1
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp9:
.Lfunc_end2:
	.size	bar, .Lfunc_end2-bar
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin3:
	.loc	2 51 0                          # main.c:51:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%eax, %eax
.Ltmp10:
	.loc	2 52 5 prologue_end             # main.c:52:5
	movl	$__LLVM_StackMaps, %edi
	movl	%eax, -20(%rbp)                 # 4-byte Spill
	callq	readStackMap
.Ltmp11:
	movl	$8, %edi
	.loc	2 53 26                         # main.c:53:26
	callq	malloc
	.loc	2 53 15 is_stmt 0               # main.c:53:15
	movq	%rax, -8(%rbp)
	.loc	2 54 6 is_stmt 1                # main.c:54:6
	movq	-8(%rbp), %rcx
	.loc	2 54 15 is_stmt 0               # main.c:54:15
	movq	$9, (%rcx)
	.loc	2 55 5 is_stmt 1                # main.c:55:5
	movq	%rax, -16(%rbp)
	callq	bar
.Ltmp12:
	movl	-20(%rbp), %eax                 # 4-byte Reload
	.loc	2 56 1                          # main.c:56:1
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp13:
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"call loc : %p\n"
	.size	.L.str, 15

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%d\n"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"(uint8_t*)rsp : %p\n"
	.size	.L.str.2, 20

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"1 : %lu\n"
	.size	.L.str.3, 9

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"2 : %lu\n"
	.size	.L.str.4, 9

	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x11a DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x5 DW_TAG_pointer_type
	.long	47                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x2f:0xb DW_TAG_typedef
	.long	58                              # DW_AT_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.byte	4                               # Abbrev [4] 0x3a:0x7 DW_TAG_base_type
	.long	.Linfo_string3                  # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	2                               # Abbrev [2] 0x41:0x5 DW_TAG_pointer_type
	.long	70                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x46:0xb DW_TAG_typedef
	.long	81                              # DW_AT_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.byte	4                               # Abbrev [4] 0x51:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x58:0x15 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string7                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
                                        # DW_AT_external
	.byte	6                               # Abbrev [6] 0x6d:0x40 DW_TAG_subprogram
	.quad	.Lfunc_begin1                   # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string8                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x82:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string12                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	23                              # DW_AT_decl_line
	.long	270                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x90:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string14                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.long	286                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x9e:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string15                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	32                              # DW_AT_decl_line
	.long	287                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0xad:0x32 DW_TAG_subprogram
	.quad	.Lfunc_begin2                   # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string9                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	44                              # DW_AT_decl_line
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0xc2:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string16                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	45                              # DW_AT_decl_line
	.long	42                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0xd0:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	116
	.long	.Linfo_string17                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.long	263                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0xdf:0x28 DW_TAG_subprogram
	.quad	.Lfunc_begin3                   # DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	51                              # DW_AT_decl_line
	.long	263                             # DW_AT_type
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0xf8:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string18                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	53                              # DW_AT_decl_line
	.long	42                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x107:0x7 DW_TAG_base_type
	.long	.Linfo_string11                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	2                               # Abbrev [2] 0x10e:0x5 DW_TAG_pointer_type
	.long	275                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x113:0xb DW_TAG_typedef
	.long	263                             # DW_AT_type
	.long	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	38                              # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x11e:0x1 DW_TAG_pointer_type
	.byte	2                               # Abbrev [2] 0x11f:0x5 DW_TAG_pointer_type
	.long	263                             # DW_AT_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161" # string offset=0
.Linfo_string1:
	.asciz	"main.c"                        # string offset=84
.Linfo_string2:
	.asciz	"/home/kavindu/ballerina/nBalTest/test-gc/statepoints" # string offset=91
.Linfo_string3:
	.asciz	"long unsigned int"             # string offset=144
.Linfo_string4:
	.asciz	"uint64_t"                      # string offset=162
.Linfo_string5:
	.asciz	"unsigned char"                 # string offset=171
.Linfo_string6:
	.asciz	"uint8_t"                       # string offset=185
.Linfo_string7:
	.asciz	"baz"                           # string offset=193
.Linfo_string8:
	.asciz	"foo"                           # string offset=197
.Linfo_string9:
	.asciz	"bar"                           # string offset=201
.Linfo_string10:
	.asciz	"main"                          # string offset=205
.Linfo_string11:
	.asciz	"int"                           # string offset=210
.Linfo_string12:
	.asciz	"heapPtr3"                      # string offset=214
.Linfo_string13:
	.asciz	"int32_t"                       # string offset=223
.Linfo_string14:
	.asciz	"callLocations"                 # string offset=231
.Linfo_string15:
	.asciz	"offsets"                       # string offset=245
.Linfo_string16:
	.asciz	"heapPtr2"                      # string offset=253
.Linfo_string17:
	.asciz	"i"                             # string offset=262
.Linfo_string18:
	.asciz	"heapPtr1"                      # string offset=264
	.ident	"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"
	.section	".note.GNU-stack","",@progbits
	.section	.llvm_stackmaps,"a",@progbits
__LLVM_StackMaps:
	.byte	3
	.byte	0
	.short	0
	.long	3
	.long	0
	.long	6
	.quad	foo
	.quad	104
	.quad	3
	.quad	bar
	.quad	40
	.quad	1
	.quad	main
	.quad	40
	.quad	2
	.quad	2882400000
	.long	.Ltmp3-foo
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
	.long	64
	.byte	3
	.byte	0
	.short	8
	.short	7
	.short	0
	.long	64
	.p2align	3
	.short	0
	.short	0
	.p2align	3
	.quad	2882400000
	.long	.Ltmp4-foo
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
	.long	.Ltmp5-foo
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
	.long	.Ltmp8-bar
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
	.long	8
	.byte	3
	.byte	0
	.short	8
	.short	7
	.short	0
	.long	8
	.p2align	3
	.short	0
	.short	0
	.p2align	3
	.quad	2882400000
	.long	.Ltmp11-main
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
	.long	.Ltmp12-main
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
	.long	16
	.byte	3
	.byte	0
	.short	8
	.short	7
	.short	0
	.long	16
	.p2align	3
	.short	0
	.short	0
	.p2align	3

	.section	.debug_line,"",@progbits
.Lline_table_start0:
