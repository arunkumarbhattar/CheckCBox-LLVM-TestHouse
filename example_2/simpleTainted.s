	.text
	.file	"simpleTainted.c"
	.globl	dummy_1                         # -- Begin function dummy_1
	.p2align	4, 0x90
	.type	dummy_1,@function
dummy_1:                                # @dummy_1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rax
	movq	%rax, -8(%rbp)                  # 8-byte Spill
	movabsq	$Spl_Header_var, %rsi
	movl	$48, %edx
	callq	memcpy@PLT
	movq	-8(%rbp), %rax                  # 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	dummy_1, .Lfunc_end0-dummy_1
	.cfi_endproc
                                        # -- End function
	.globl	dummy_2                         # -- Begin function dummy_2
	.p2align	4, 0x90
	.type	dummy_2,@function
dummy_2:                                # @dummy_2
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movq	Spl_nestedHeader_var, %rcx
	movq	%rcx, (%rdi)
	movq	Spl_nestedHeader_var+8, %rcx
	movq	%rcx, 8(%rdi)
	movl	Spl_nestedHeader_var+16, %ecx
	movl	%ecx, 16(%rdi)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	dummy_2, .Lfunc_end1-dummy_2
	.cfi_endproc
                                        # -- End function
	.globl	dummy_3                         # -- Begin function dummy_3
	.p2align	4, 0x90
	.type	dummy_3,@function
dummy_3:                                # @dummy_3
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movups	Spl_SuperNestedHeader_var(%rip), %xmm0
	movaps	%xmm0, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	dummy_3, .Lfunc_end2-dummy_3
	.cfi_endproc
                                        # -- End function
	.globl	dummy_4                         # -- Begin function dummy_4
	.p2align	4, 0x90
	.type	dummy_4,@function
dummy_4:                                # @dummy_4
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	Spl_ExtremelyNestedHeader_var, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	dummy_4, .Lfunc_end3-dummy_4
	.cfi_endproc
                                        # -- End function
	.globl	experiment_1                    # -- Begin function experiment_1
	.p2align	4, 0x90
	.type	experiment_1,@function
experiment_1:                           # @experiment_1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	$0, %al
	callq	c_fetch_sandbox_address
	movq	%rax, %rdi
	movb	$0, %al
	callq	w2c_experiment_1
	cltq
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	experiment_1, .Lfunc_end4-experiment_1
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movl	$0, -4(%rbp)
	callq	experiment_1
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -24(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_1
	jmp	.LBB5_10
.LBB5_1:                                # %_Dynamic_check.succeeded
	movq	-24(%rbp), %rax                 # 8-byte Reload
	movq	36(%rax), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -32(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_2
	jmp	.LBB5_11
.LBB5_2:                                # %_Dynamic_check.succeeded3
	movq	-32(%rbp), %rax                 # 8-byte Reload
	movq	(%rax), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -40(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_3
	jmp	.LBB5_12
.LBB5_3:                                # %_Dynamic_check.succeeded5
	movq	-40(%rbp), %rsi                 # 8-byte Reload
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	t_printf
	movq	-16(%rbp), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -48(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_4
	jmp	.LBB5_13
.LBB5_4:                                # %_Dynamic_check.succeeded8
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	36(%rax), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -56(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_5
	jmp	.LBB5_14
.LBB5_5:                                # %_Dynamic_check.succeeded12
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movq	8(%rax), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -64(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_6
	jmp	.LBB5_15
.LBB5_6:                                # %_Dynamic_check.succeeded15
	movq	-64(%rbp), %rsi                 # 8-byte Reload
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	t_printf
	movq	-16(%rbp), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -72(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_7
	jmp	.LBB5_16
.LBB5_7:                                # %_Dynamic_check.succeeded18
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	36(%rax), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -80(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_8
	jmp	.LBB5_17
.LBB5_8:                                # %_Dynamic_check.succeeded22
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movq	16(%rax), %rax
	movl	%eax, %edi
	callq	c_fetch_pointer_from_offset@PLT
	movq	%rax, %rdi
	movq	%rdi, -88(%rbp)                 # 8-byte Spill
	callq	c_isTaintedPointerToTaintedMem@PLT
	testb	$1, %al
	jne	.LBB5_9
	jmp	.LBB5_18
.LBB5_9:                                # %_Dynamic_check.succeeded25
	movq	-88(%rbp), %rsi                 # 8-byte Reload
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	t_printf
	xorl	%eax, %eax
	addq	$96, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB5_10:                               # %_Dynamic_check.failed
	.cfi_def_cfa %rbp, 16
	ud2
.LBB5_11:                               # %_Dynamic_check.failed2
	ud2
.LBB5_12:                               # %_Dynamic_check.failed4
	ud2
.LBB5_13:                               # %_Dynamic_check.failed7
	ud2
.LBB5_14:                               # %_Dynamic_check.failed11
	ud2
.LBB5_15:                               # %_Dynamic_check.failed14
	ud2
.LBB5_16:                               # %_Dynamic_check.failed17
	ud2
.LBB5_17:                               # %_Dynamic_check.failed21
	ud2
.LBB5_18:                               # %_Dynamic_check.failed24
	ud2
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.type	Spl_Header_var,@object          # @Spl_Header_var
	.bss
	.globl	Spl_Header_var
	.p2align	2
Spl_Header_var:
	.zero	48
	.size	Spl_Header_var, 48

	.type	Spl_nestedHeader_var,@object    # @Spl_nestedHeader_var
	.globl	Spl_nestedHeader_var
	.p2align	2
Spl_nestedHeader_var:
	.zero	20
	.size	Spl_nestedHeader_var, 20

	.type	Spl_SuperNestedHeader_var,@object # @Spl_SuperNestedHeader_var
	.globl	Spl_SuperNestedHeader_var
	.p2align	2
Spl_SuperNestedHeader_var:
	.zero	16
	.size	Spl_SuperNestedHeader_var, 16

	.type	Spl_ExtremelyNestedHeader_var,@object # @Spl_ExtremelyNestedHeader_var
	.globl	Spl_ExtremelyNestedHeader_var
	.p2align	2
Spl_ExtremelyNestedHeader_var:
	.zero	8
	.size	Spl_ExtremelyNestedHeader_var, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Val from c_2->simpledoublepointer[0]  = %s\n"
	.size	.L.str, 44

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Val from c_2->simpledoublepointer[1]  = %s\n"
	.size	.L.str.1, 44

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Val from c_2->simpledoublepointer[2]  = %s\n"
	.size	.L.str.2, 44

	.ident	"clang version 12.0.0 (https://github.com/arunkumarbhattar/CheckCBox_Compiler.git 793bfbd486346acef4555d5163b5f85cc0bef5bd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym experiment_1
	.addrsig_sym w2c_experiment_1
	.addrsig_sym c_fetch_sandbox_address
	.addrsig_sym t_printf
	.addrsig_sym c_fetch_pointer_from_offset
	.addrsig_sym c_isTaintedPointerToTaintedMem
	.addrsig_sym Spl_Header_var
	.addrsig_sym Spl_nestedHeader_var
	.addrsig_sym Spl_SuperNestedHeader_var
	.addrsig_sym Spl_ExtremelyNestedHeader_var
