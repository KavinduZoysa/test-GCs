	.text
	.file	"main.c"
	.file	1 "/home/kavindu/ballerina/nBalTest/test-gc/statepoints/main.c"
	.file	2 "/usr/include/stdint.h"
	.globl	foo                             # -- Begin function foo
	.p2align	4, 0x90
	.type	foo,@function
foo:                                    # @foo
.Lfunc_begin0:
	.loc	1 20 0                          # main.c:20:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
.Ltmp0:
	.loc	1 22 25 prologue_end            # main.c:22:25
	movl	$8, %edi
	callq	malloc
	.loc	1 22 14 is_stmt 0               # main.c:22:14
	movq	%rax, -8(%rbp)
	.loc	1 23 6 is_stmt 1                # main.c:23:6
	movq	-8(%rbp), %rax
	.loc	1 23 15 is_stmt 0               # main.c:23:15
	movl	$345, (%rax)                    # imm = 0x159
	.loc	1 24 1 is_stmt 1                # main.c:24:1
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp1:
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo
	.cfi_endproc
                                        # -- End function
	.globl	bar                             # -- Begin function bar
	.p2align	4, 0x90
	.type	bar,@function
bar:                                    # @bar
.Lfunc_begin1:
	.loc	1 26 0                          # main.c:26:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
.Ltmp2:
	.loc	1 27 9 prologue_end             # main.c:27:9
	movl	$34, -4(%rbp)
	.loc	1 28 9                          # main.c:28:9
	movl	$34, -8(%rbp)
	.loc	1 29 10                         # main.c:29:10
	movq	$34, -16(%rbp)
	movl	$8, %edi
	.loc	1 30 26                         # main.c:30:26
	callq	malloc
	.loc	1 30 15 is_stmt 0               # main.c:30:15
	movq	%rax, -24(%rbp)
	.loc	1 31 6 is_stmt 1                # main.c:31:6
	movq	-24(%rbp), %rcx
	.loc	1 31 15 is_stmt 0               # main.c:31:15
	movq	$7, (%rcx)
	movq	%rax, -48(%rbp)
	callq	foo
.Ltmp3:
	.loc	1 34 5 is_stmt 1                # main.c:34:5
	movl	$__LLVM_StackMaps, %edi
	movl	$loc, %esi
	callq	readStackMap
.Ltmp4:
	.loc	1 35 54                         # main.c:35:54
	movq	%rsp, %rax
	.loc	1 35 58 is_stmt 0               # main.c:35:58
	movslq	loc, %rcx
	addq	%rcx, %rax
	.loc	1 35 15                         # main.c:35:15
	movq	%rax, -32(%rbp)
	.loc	1 36 54 is_stmt 1               # main.c:36:54
	movq	%rsp, %rax
	.loc	1 36 58 is_stmt 0               # main.c:36:58
	movslq	loc+4, %rcx
	addq	%rcx, %rax
	.loc	1 36 15                         # main.c:36:15
	movq	%rax, -40(%rbp)
	.loc	1 40 55 is_stmt 1               # main.c:40:55
	movq	-32(%rbp), %rax
	.loc	1 40 54 is_stmt 0               # main.c:40:54
	movq	(%rax), %rax
	.loc	1 40 39                         # main.c:40:39
	movq	(%rax), %rsi
	.loc	1 40 5                          # main.c:40:5
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 41 55 is_stmt 1               # main.c:41:55
	movq	-40(%rbp), %rcx
	.loc	1 41 54 is_stmt 0               # main.c:41:54
	movq	(%rcx), %rcx
	.loc	1 41 39                         # main.c:41:39
	movq	(%rcx), %rsi
	.loc	1 41 5                          # main.c:41:5
	movabsq	$.L.str.1, %rdi
	movl	%eax, -52(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	.loc	1 46 1 is_stmt 1                # main.c:46:1
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp5:
.Lfunc_end1:
	.size	bar, .Lfunc_end1-bar
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin2:
	.loc	1 48 0                          # main.c:48:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	$8, %edi
	movl	%eax, -20(%rbp)                 # 4-byte Spill
.Ltmp6:
	.loc	1 49 26 prologue_end            # main.c:49:26
	callq	malloc
	.loc	1 49 15 is_stmt 0               # main.c:49:15
	movq	%rax, -8(%rbp)
	.loc	1 50 6 is_stmt 1                # main.c:50:6
	movq	-8(%rbp), %rcx
	.loc	1 50 15 is_stmt 0               # main.c:50:15
	movq	$4, (%rcx)
	.loc	1 51 5 is_stmt 1                # main.c:51:5
	movl	$.L.str.2, %edi
	xorl	%edx, %edx
                                        # kill: def $dl killed $dl killed $edx
	leaq	-8(%rbp), %rsi
	movq	%rax, -32(%rbp)                 # 8-byte Spill
	movb	%dl, %al
	callq	printf
	movq	-32(%rbp), %rcx                 # 8-byte Reload
	.loc	1 52 5                          # main.c:52:5
	movq	%rcx, -16(%rbp)
	movl	%eax, -36(%rbp)                 # 4-byte Spill
	callq	bar
.Ltmp7:
	movl	-20(%rbp), %eax                 # 4-byte Reload
	.loc	1 54 1                          # main.c:54:1
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp8:
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	loc,@object                     # @loc
	.bss
	.globl	loc
	.p2align	2
loc:
	.zero	8
	.size	loc, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"value in loc2 : %lu\n\n"
	.size	.L.str, 22

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"value in loc1 : %lu\n\n"
	.size	.L.str.1, 22

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Stack address of heapPtr1 : %p\n\n"
	.size	.L.str.2, 33

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
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
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
	.byte	6                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
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
	.byte	9                               # Abbreviation Code
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
	.byte	10                              # Abbreviation Code
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
	.byte	11                              # Abbreviation Code
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
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x14a DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x15 DW_TAG_variable
	.long	.Linfo_string3                  # DW_AT_name
	.long	63                              # DW_AT_type
                                        # DW_AT_external
	.byte	1                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.byte	9                               # DW_AT_location
	.byte	3
	.quad	loc
	.byte	3                               # Abbrev [3] 0x3f:0xc DW_TAG_array_type
	.long	75                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x44:0x6 DW_TAG_subrange_type
	.long	82                              # DW_AT_type
	.byte	2                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0x4b:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x52:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	7                               # Abbrev [7] 0x59:0x5 DW_TAG_pointer_type
	.long	94                              # DW_AT_type
	.byte	8                               # Abbrev [8] 0x5e:0xb DW_TAG_typedef
	.long	105                             # DW_AT_type
	.long	.Linfo_string7                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x69:0x7 DW_TAG_base_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x70:0x5 DW_TAG_pointer_type
	.long	117                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x75:0xb DW_TAG_typedef
	.long	128                             # DW_AT_type
	.long	.Linfo_string9                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x80:0x7 DW_TAG_base_type
	.long	.Linfo_string8                  # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	9                               # Abbrev [9] 0x87:0x24 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string10                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
                                        # DW_AT_external
	.byte	10                              # Abbrev [10] 0x9c:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
	.long	317                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0xab:0x6a DW_TAG_subprogram
	.quad	.Lfunc_begin1                   # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string11                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	26                              # DW_AT_decl_line
                                        # DW_AT_external
	.byte	10                              # Abbrev [10] 0xc0:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string15                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	27                              # DW_AT_decl_line
	.long	75                              # DW_AT_type
	.byte	10                              # Abbrev [10] 0xce:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string16                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	28                              # DW_AT_decl_line
	.long	75                              # DW_AT_type
	.byte	10                              # Abbrev [10] 0xdc:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string17                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
	.long	333                             # DW_AT_type
	.byte	10                              # Abbrev [10] 0xea:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.long	.Linfo_string19                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	30                              # DW_AT_decl_line
	.long	89                              # DW_AT_type
	.byte	10                              # Abbrev [10] 0xf8:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string20                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	35                              # DW_AT_decl_line
	.long	89                              # DW_AT_type
	.byte	10                              # Abbrev [10] 0x106:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.long	.Linfo_string21                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	36                              # DW_AT_decl_line
	.long	89                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	11                              # Abbrev [11] 0x115:0x28 DW_TAG_subprogram
	.quad	.Lfunc_begin2                   # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string12                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.long	75                              # DW_AT_type
                                        # DW_AT_external
	.byte	10                              # Abbrev [10] 0x12e:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string22                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	49                              # DW_AT_decl_line
	.long	89                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x13d:0x5 DW_TAG_pointer_type
	.long	322                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x142:0xb DW_TAG_typedef
	.long	75                              # DW_AT_type
	.long	.Linfo_string14                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	38                              # DW_AT_decl_line
	.byte	5                               # Abbrev [5] 0x14d:0x7 DW_TAG_base_type
	.long	.Linfo_string18                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
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
	.asciz	"loc"                           # string offset=144
.Linfo_string4:
	.asciz	"int"                           # string offset=148
.Linfo_string5:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=152
.Linfo_string6:
	.asciz	"long unsigned int"             # string offset=172
.Linfo_string7:
	.asciz	"uint64_t"                      # string offset=190
.Linfo_string8:
	.asciz	"unsigned char"                 # string offset=199
.Linfo_string9:
	.asciz	"uint8_t"                       # string offset=213
.Linfo_string10:
	.asciz	"foo"                           # string offset=221
.Linfo_string11:
	.asciz	"bar"                           # string offset=225
.Linfo_string12:
	.asciz	"main"                          # string offset=229
.Linfo_string13:
	.asciz	"heapPtr3"                      # string offset=234
.Linfo_string14:
	.asciz	"int32_t"                       # string offset=243
.Linfo_string15:
	.asciz	"xx"                            # string offset=251
.Linfo_string16:
	.asciz	"yy"                            # string offset=254
.Linfo_string17:
	.asciz	"zz"                            # string offset=257
.Linfo_string18:
	.asciz	"long int"                      # string offset=260
.Linfo_string19:
	.asciz	"heapPtr2"                      # string offset=269
.Linfo_string20:
	.asciz	"locHeapPtr2"                   # string offset=278
.Linfo_string21:
	.asciz	"locHeapPtr1"                   # string offset=290
.Linfo_string22:
	.asciz	"heapPtr1"                      # string offset=302
	.ident	"Ubuntu clang version 11.1.0-++20210204122740+1fdec59bffc1-1~exp1~20210203233413.161"
	.section	".note.GNU-stack","",@progbits
	.section	.llvm_stackmaps,"a",@progbits
__LLVM_StackMaps:
	.byte	3
	.byte	0
	.short	0
	.long	2
	.long	0
	.long	3
	.quad	bar
	.quad	72
	.quad	2
	.quad	main
	.quad	56
	.quad	1
	.quad	2882400000
	.long	.Ltmp3-bar
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
	.quad	2882400000
	.long	.Ltmp4-bar
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
	.long	.Ltmp7-main
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

	.section	.debug_line,"",@progbits
.Lline_table_start0:
