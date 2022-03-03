	.file	"interp.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.p2align 4,,15
.globl conserve_interp
	.type	conserve_interp, @function
conserve_interp:
.LFB11:
	.file 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/interp.c"
	.loc 1 147 0
	.cfi_startproc
.LVL0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.loc 1 147 0
	movq	216(%rsp), %r11
	movl	%edi, 124(%rsp)
	.loc 1 153 0
	movl	$40000000, %edi
.LVL1:
	.loc 1 147 0
	movl	%esi, 120(%rsp)
	movl	%edx, 116(%rsp)
	movl	%ecx, 112(%rsp)
	.loc 1 153 0
	movq	%r8, 88(%rsp)
	movq	%r11, 72(%rsp)
	movq	%r9, 80(%rsp)
	.loc 1 147 0
	movq	224(%rsp), %r12
	.loc 1 153 0
	call	malloc
.LVL2:
	.loc 1 154 0
	movl	$40000000, %edi
	.loc 1 153 0
	movq	%rax, %r13
.LVL3:
	.loc 1 154 0
	call	malloc
.LVL4:
	.loc 1 155 0
	movl	$40000000, %edi
	.loc 1 154 0
	movq	%rax, %r14
.LVL5:
	.loc 1 155 0
	call	malloc
.LVL6:
	.loc 1 156 0
	movl	$40000000, %edi
	.loc 1 155 0
	movq	%rax, %rbx
.LVL7:
	.loc 1 156 0
	call	malloc
.LVL8:
	.loc 1 157 0
	movl	$80000000, %edi
	.loc 1 156 0
	movq	%rax, %rbp
.LVL9:
	.loc 1 157 0
	call	malloc
.LVL10:
	movq	%rax, %r15
.LVL11:
	.loc 1 158 0
	movl	112(%rsp), %eax
.LVL12:
	imull	116(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, %r10
.LVL13:
	.loc 1 159 0
	movq	208(%rsp), %rax
.LVL14:
	movq	192(%rsp), %rcx
	movq	80(%rsp), %r9
	movq	88(%rsp), %r8
	leaq	120(%rsp), %rsi
	leaq	124(%rsp), %rdi
	leaq	116(%rsp), %rdx
	movq	%r10, 80(%rsp)
	movq	%rax, 16(%rsp)
	movq	200(%rsp), %rax
	movq	%rcx, (%rsp)
	leaq	112(%rsp), %rcx
	movq	%r15, 56(%rsp)
	movq	%rbp, 48(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%r14, 32(%rsp)
	movq	%r13, 24(%rsp)
	movq	%rax, 8(%rsp)
	call	create_xgrid_2dx2d_order1
.LVL15:
	.loc 1 161 0
	movq	80(%rsp), %r10
	movq	200(%rsp), %rcx
	leaq	112(%rsp), %rsi
	movq	192(%rsp), %rdx
	leaq	116(%rsp), %rdi
	.loc 1 159 0
	movl	%eax, 100(%rsp)
.LVL16:
	.loc 1 161 0
	movq	%r10, %r8
	call	get_grid_area
.LVL17:
	.loc 1 162 0
	movslq	100(%rsp), %rdi
	salq	$3, %rdi
	call	malloc
.LVL18:
	.loc 1 163 0
	movl	100(%rsp), %ecx
	movq	80(%rsp), %r10
	movq	72(%rsp), %r11
	testl	%ecx, %ecx
	jle	.L19
	.loc 1 144 0
	movl	100(%rsp), %edx
	.loc 1 163 0
	movl	116(%rsp), %edi
	.loc 1 144 0
	subl	$1, %edx
	leaq	4(,%rdx,4), %rsi
	xorl	%edx, %edx
.LVL19:
	.p2align 4,,10
	.p2align 3
.L4:
	.loc 1 163 0
	movl	0(%rbp,%rdx), %ecx
	movsd	(%r15,%rdx,2), %xmm0
	imull	%edi, %ecx
	addl	(%rbx,%rdx), %ecx
	movslq	%ecx, %rcx
	divsd	(%r10,%rcx,8), %xmm0
	movsd	%xmm0, (%rax,%rdx,2)
	addq	$4, %rdx
	cmpq	%rsi, %rdx
	jne	.L4
.L3:
.LVL20:
	.loc 1 165 0
	movl	112(%rsp), %r8d
	imull	%edi, %r8d
	testl	%r8d, %r8d
	jle	.L5
	movq	%r12, %rcx
	andl	$15, %ecx
	shrq	$3, %rcx
	cmpl	%ecx, %r8d
	cmovbe	%r8d, %ecx
	testl	%ecx, %ecx
	je	.L20
	.loc 1 166 0
	cmpl	%ecx, %r8d
	movq	$0, (%r12)
.LVL21:
	je	.L5
	movl	$1, %edx
.LVL22:
.L7:
	movl	%r8d, %esi
	subl	%ecx, %esi
	movl	%esi, %r9d
	movl	%esi, 108(%rsp)
	shrl	%r9d
	movl	%r9d, %esi
	addl	%esi, %esi
	movl	%esi, 104(%rsp)
	je	.L8
	xorpd	%xmm0, %xmm0
	mov	%ecx, %ecx
	leaq	(%r12,%rcx,8), %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L9:
	addl	$1, %ecx
	movapd	%xmm0, (%rsi)
	addq	$16, %rsi
	cmpl	%r9d, %ecx
	jb	.L9
	addl	104(%rsp), %edx
	movl	104(%rsp), %ecx
	cmpl	%ecx, 108(%rsp)
	je	.L5
.L8:
	movslq	%edx, %rcx
	leaq	(%r12,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L10:
	.loc 1 165 0
	addl	$1, %edx
.LVL23:
	.loc 1 166 0
	movq	$0, (%rcx)
	.loc 1 165 0
	addq	$8, %rcx
	cmpl	%edx, %r8d
	jg	.L10
.LVL24:
.L5:
	.loc 1 168 0
	movl	100(%rsp), %edx
	testl	%edx, %edx
	jle	.L11
	.loc 1 144 0
	movl	100(%rsp), %edx
	.loc 1 168 0
	movl	124(%rsp), %esi
	.loc 1 144 0
	subl	$1, %edx
	leaq	4(,%rdx,4), %r8
	xorl	%edx, %edx
.LVL25:
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 169 0
	movl	0(%rbp,%rdx), %ecx
	imull	%edi, %ecx
	addl	(%rbx,%rdx), %ecx
	movslq	%ecx, %rcx
	leaq	(%r12,%rcx,8), %r9
	movl	(%r14,%rdx), %ecx
	imull	%esi, %ecx
	addl	0(%r13,%rdx), %ecx
	movslq	%ecx, %rcx
	movsd	(%r11,%rcx,8), %xmm0
	mulsd	(%rax,%rdx,2), %xmm0
	addq	$4, %rdx
	.loc 1 168 0
	cmpq	%r8, %rdx
	.loc 1 169 0
	addsd	(%r9), %xmm0
	movsd	%xmm0, (%r9)
	.loc 1 168 0
	jne	.L12
.L11:
	.loc 1 172 0
	movq	%r13, %rdi
	movq	%rax, 88(%rsp)
	movq	%r10, 80(%rsp)
	call	free
.LVL26:
	.loc 1 173 0
	movq	%r14, %rdi
	call	free
	.loc 1 174 0
	movq	%rbx, %rdi
	call	free
	.loc 1 175 0
	movq	%rbp, %rdi
	call	free
	.loc 1 176 0
	movq	%r15, %rdi
	call	free
	.loc 1 177 0
	movq	80(%rsp), %r10
	movq	%r10, %rdi
	call	free
	.loc 1 178 0
	movq	88(%rsp), %rax
	movq	%rax, %rdi
	call	free
	.loc 1 180 0
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL27:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL28:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL29:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL30:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL31:
	ret
.LVL32:
.L19:
	.cfi_restore_state
	.loc 1 163 0
	movl	116(%rsp), %edi
	jmp	.L3
.L20:
	.loc 1 165 0
	xorl	%edx, %edx
	jmp	.L7
	.cfi_endproc
.LFE11:
	.size	conserve_interp, .-conserve_interp
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"cubic_spline: grid1 is not monotonic increasing"
	.align 8
.LC2:
	.string	"cubic_spline: grid2 lies outside grid1"
	.align 8
.LC3:
	.string	"cubic_spline: the size of input grid should be at least 2"
	.text
	.p2align 4,,15
.globl cubic_spline
	.type	cubic_spline, @function
cubic_spline:
.LFB10:
	.loc 1 60 0
	.cfi_startproc
.LVL33:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.loc 1 65 0
	cmpl	$1, %edi
	.loc 1 60 0
	movq	%r9, 128(%rsp)
	movsd	%xmm0, 104(%rsp)
	movsd	%xmm1, 136(%rsp)
	.loc 1 65 0
	jle	.L22
.LVL34:
	movq	%rdx, %r15
	movl	$1, %eax
	jmp	.L25
.LVL35:
	.p2align 4,,10
	.p2align 3
.L23:
	addl	$1, %eax
.LVL36:
	addq	$8, %r15
	cmpl	%eax, %ebx
	jle	.L22
.LVL37:
.L25:
	.loc 1 66 0
	movsd	(%r15), %xmm0
	ucomisd	8(%r15), %xmm0
	jb	.L23
	movl	$.LC1, %edi
	movl	%eax, 88(%rsp)
	.loc 1 65 0
	addq	$8, %r15
	.loc 1 66 0
	call	error_handler
	movl	88(%rsp), %eax
	.loc 1 65 0
	addl	$1, %eax
.LVL38:
	cmpl	%eax, %ebx
	jg	.L25
.LVL39:
.L22:
	.loc 1 69 0
	testl	%ebp, %ebp
	jle	.L26
	.loc 1 70 0
	movslq	%ebx, %rax
	xorl	%r15d, %r15d
	leaq	-8(%r12,%rax,8), %rax
	movq	%rax, 96(%rsp)
	movq	%r13, %rax
.LVL40:
	.p2align 4,,10
	.p2align 3
.L30:
	movsd	(%rax), %xmm0
	movsd	(%r12), %xmm2
	ucomisd	%xmm0, %xmm2
	ja	.L27
	movq	96(%rsp), %rdx
	ucomisd	(%rdx), %xmm0
	jbe	.L28
.L27:
	movl	$.LC2, %edi
	movq	%rax, 88(%rsp)
	call	error_handler
	movq	88(%rsp), %rax
.L28:
	.loc 1 69 0
	addl	$1, %r15d
.LVL41:
	addq	$8, %rax
	cmpl	%r15d, %ebp
	jg	.L30
.LVL42:
.L26:
	.loc 1 73 0
	cmpl	$1, %ebx
	jle	.L66
	.loc 1 74 0
	cmpl	$2, %ebx
	jne	.L32
	.loc 1 75 0
	movsd	(%r14), %xmm2
	.loc 1 76 0
	testl	%ebp, %ebp
	.loc 1 75 0
	movsd	(%r12), %xmm1
	movsd	8(%r14), %xmm3
	movsd	8(%r12), %xmm0
	subsd	%xmm2, %xmm3
	subsd	%xmm1, %xmm0
	divsd	%xmm0, %xmm3
.LVL43:
	.loc 1 76 0
	jle	.L51
	.loc 1 58 0
	subl	$1, %ebp
.LVL44:
	xorl	%eax, %eax
	leaq	8(,%rbp,8), %rdx
	jmp	.L34
.LVL45:
	.p2align 4,,10
	.p2align 3
.L67:
	.loc 1 76 0
	movsd	(%r12), %xmm1
	movsd	(%r14), %xmm2
.L34:
	movsd	0(%r13,%rax), %xmm0
	movq	128(%rsp), %rcx
	subsd	%xmm1, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rcx,%rax)
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L67
.L51:
	.loc 1 136 0
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL46:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL47:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL48:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL49:
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL50:
	.p2align 4,,10
	.p2align 3
.L66:
	.cfi_restore_state
	.loc 1 73 0
	movl	$.LC3, %edi
	call	error_handler
.L32:
	.loc 1 79 0
	movslq	%ebx, %r15
	leaq	0(,%r15,8), %rdx
	movq	%rdx, %rdi
	movq	%rdx, 8(%rsp)
	call	malloc
	.loc 1 80 0
	movq	8(%rsp), %rdx
	.loc 1 79 0
	movq	%rax, 96(%rsp)
.LVL51:
	.loc 1 80 0
	movq	%rdx, %rdi
	call	malloc
.LVL52:
	.loc 1 81 0
	movsd	.LC4(%rip), %xmm8
	.loc 1 80 0
	movq	%rax, 112(%rsp)
.LVL53:
	.loc 1 81 0
	movsd	104(%rsp), %xmm0
	ucomisd	%xmm8, %xmm0
	ja	.L68
	.loc 1 86 0
	movq	96(%rsp), %rcx
	movabsq	$-4620693217682128896, %rsi
	.loc 1 87 0
	movsd	.LC6(%rip), %xmm1
	.loc 1 86 0
	movq	%rsi, (%rcx)
	.loc 1 87 0
	movsd	8(%r12), %xmm2
	movsd	8(%r14), %xmm0
	subsd	(%r12), %xmm2
	subsd	(%r14), %xmm0
	divsd	%xmm2, %xmm1
	divsd	%xmm2, %xmm0
	subsd	104(%rsp), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%rax)
.LVL54:
.L37:
	.loc 1 90 0
	cmpl	$2, %ebx
	jle	.L69
	movsd	.LC9(%rip), %xmm0
	.loc 1 58 0
	leal	-3(%rbx), %eax
	movsd	.LC7(%rip), %xmm9
	movsd	.LC8(%rip), %xmm1
	leaq	8(,%rax,8), %rdx
	xorl	%eax, %eax
	movsd	%xmm0, 120(%rsp)
.LVL55:
	.p2align 4,,10
	.p2align 3
.L39:
	.loc 1 91 0
	movsd	(%r12,%rax), %xmm4
	.loc 1 92 0
	movq	96(%rsp), %rcx
	.loc 1 91 0
	movsd	8(%r12,%rax), %xmm2
	movsd	16(%r12,%rax), %xmm0
	subsd	%xmm4, %xmm2
	subsd	%xmm4, %xmm0
	divsd	%xmm0, %xmm2
.LVL56:
	.loc 1 92 0
	movapd	%xmm2, %xmm3
	.loc 1 93 0
	movapd	%xmm2, %xmm0
	.loc 1 92 0
	mulsd	(%rcx,%rax), %xmm3
	.loc 1 93 0
	subsd	%xmm1, %xmm0
	.loc 1 92 0
	addsd	%xmm9, %xmm3
.LVL57:
	.loc 1 93 0
	divsd	%xmm3, %xmm0
	movsd	%xmm0, 8(%rcx,%rax)
	.loc 1 94 0
	movq	112(%rsp), %rcx
	movsd	8(%r14,%rax), %xmm5
	movsd	16(%r12,%rax), %xmm6
	movsd	16(%r14,%rax), %xmm0
	movsd	8(%r12,%rax), %xmm7
	movapd	%xmm6, %xmm10
	subsd	%xmm5, %xmm0
	mulsd	(%rcx,%rax), %xmm2
.LVL58:
	subsd	(%r14,%rax), %xmm5
	subsd	%xmm7, %xmm10
	subsd	%xmm4, %xmm7
	subsd	%xmm4, %xmm6
	divsd	%xmm10, %xmm0
	divsd	%xmm7, %xmm5
	subsd	%xmm5, %xmm0
	mulsd	120(%rsp), %xmm0
	divsd	%xmm6, %xmm0
	subsd	%xmm2, %xmm0
	divsd	%xmm3, %xmm0
	movsd	%xmm0, 8(%rcx,%rax)
	addq	$8, %rax
	.loc 1 90 0
	cmpq	%rdx, %rax
	jne	.L39
.LVL59:
.L38:
	.loc 1 99 0
	movsd	136(%rsp), %xmm0
	ucomisd	%xmm8, %xmm0
	jbe	.L64
	xorpd	%xmm0, %xmm0
	leaq	-8(,%r15,8), %rdx
	leaq	-16(,%r15,8), %rax
	movapd	%xmm0, %xmm2
.L42:
.LVL60:
	.loc 1 108 0
	movq	112(%rsp), %rcx
	movapd	%xmm2, %xmm3
	.loc 1 110 0
	movl	%ebx, %esi
	subl	$2, %esi
	.loc 1 108 0
	mulsd	(%rcx,%rax), %xmm3
	movq	96(%rsp), %rcx
	mulsd	(%rcx,%rax), %xmm2
.LVL61:
	subsd	%xmm3, %xmm0
.LVL62:
	addsd	%xmm1, %xmm2
	divsd	%xmm2, %xmm0
	movsd	%xmm0, (%rcx,%rdx)
	.loc 1 110 0
	js	.L43
	.loc 1 58 0
	movq	112(%rsp), %rdx
	movq	%rcx, %rax
	movslq	%esi, %rcx
	salq	$3, %rcx
	mov	%esi, %esi
	addq	%rcx, %rax
	salq	$3, %rsi
	addq	%rcx, %rdx
	subq	$8, %rcx
	subq	%rsi, %rcx
	addq	96(%rsp), %rcx
.LVL63:
	.p2align 4,,10
	.p2align 3
.L44:
	.loc 1 110 0
	movsd	(%rax), %xmm0
	mulsd	8(%rax), %xmm0
	addsd	(%rdx), %xmm0
	subq	$8, %rdx
	movsd	%xmm0, (%rax)
	subq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L44
.L43:
.LVL64:
	.loc 1 113 0
	testl	%ebp, %ebp
	jle	.L45
	movsd	.LC9(%rip), %xmm0
	xorl	%r15d, %r15d
	movl	$0, 104(%rsp)
	movsd	%xmm0, 120(%rsp)
	jmp	.L50
.LVL65:
	.p2align 4,,10
	.p2align 3
.L70:
	.loc 1 115 0
	leal	1(%rax), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
.LVL66:
.L48:
	.loc 1 127 0
	movsd	(%r12,%rdx), %xmm4
	.loc 1 130 0
	movq	%rdx, 8(%rsp)
	movsd	(%r14,%rcx), %xmm6
	movq	%rcx, 88(%rsp)
	.loc 1 127 0
	movapd	%xmm4, %xmm5
	.loc 1 128 0
	subsd	%xmm3, %xmm4
	.loc 1 130 0
	movsd	.LC6(%rip), %xmm1
	.loc 1 127 0
	subsd	%xmm0, %xmm5
.LVL67:
	.loc 1 129 0
	subsd	%xmm0, %xmm3
	.loc 1 130 0
	movsd	(%r14,%rdx), %xmm0
	.loc 1 128 0
	divsd	%xmm5, %xmm4
.LVL68:
	.loc 1 130 0
	movsd	%xmm5, 32(%rsp)
	.loc 1 129 0
	divsd	%xmm5, %xmm3
.LVL69:
	.loc 1 130 0
	movsd	%xmm4, 64(%rsp)
	mulsd	%xmm4, %xmm6
	mulsd	%xmm3, %xmm0
	movsd	%xmm3, 48(%rsp)
	addsd	%xmm0, %xmm6
	movapd	%xmm4, %xmm0
	movsd	%xmm6, 16(%rsp)
	call	pow
.LVL70:
	movsd	64(%rsp), %xmm4
	movapd	%xmm0, %xmm2
	movq	88(%rsp), %rcx
	movq	96(%rsp), %rax
	movsd	48(%rsp), %xmm3
	subsd	%xmm4, %xmm2
	movsd	.LC6(%rip), %xmm1
	movapd	%xmm3, %xmm0
	mulsd	(%rax,%rcx), %xmm2
	movsd	%xmm2, 64(%rsp)
	call	pow
	movsd	48(%rsp), %xmm3
	movq	8(%rsp), %rdx
	movq	96(%rsp), %rcx
	subsd	%xmm3, %xmm0
	movsd	64(%rsp), %xmm2
	movsd	32(%rsp), %xmm5
	movq	128(%rsp), %rax
	movsd	16(%rsp), %xmm6
	.loc 1 113 0
	addl	$1, 104(%rsp)
.LVL71:
	.loc 1 130 0
	mulsd	%xmm5, %xmm5
	mulsd	(%rcx,%rdx), %xmm0
	addsd	%xmm2, %xmm0
	mulsd	%xmm5, %xmm0
	divsd	120(%rsp), %xmm0
	addsd	%xmm6, %xmm0
	movsd	%xmm0, (%rax,%r15)
	.loc 1 113 0
	addq	$8, %r15
	cmpl	104(%rsp), %ebp
	jle	.L45
.LVL72:
.L50:
	.loc 1 114 0
	movsd	0(%r13,%r15), %xmm0
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	nearest_index
.LVL73:
	.loc 1 115 0
	movslq	%eax, %rdx
	movsd	0(%r13,%r15), %xmm3
	movsd	(%r12,%rdx,8), %xmm0
	leaq	0(,%rdx,8), %rcx
	ucomisd	%xmm0, %xmm3
	ja	.L70
	.loc 1 119 0
	testl	%eax, %eax
	jne	.L49
	movsd	(%r12), %xmm0
	xorl	%ecx, %ecx
	movl	$8, %edx
	jmp	.L48
.LVL74:
	.p2align 4,,10
	.p2align 3
.L68:
	movq	%rax, %rdx
	.loc 1 82 0
	movq	96(%rsp), %rax
	movq	$0, (%rax)
	.loc 1 83 0
	movq	$0, (%rdx)
	jmp	.L37
.LVL75:
	.p2align 4,,10
	.p2align 3
.L49:
	.loc 1 123 0
	subl	$1, %eax
.LVL76:
	movq	%rcx, %rdx
	cltq
	leaq	0(,%rax,8), %rcx
	movsd	(%r12,%rax,8), %xmm0
	jmp	.L48
.LVL77:
	.p2align 4,,10
	.p2align 3
.L45:
	.loc 1 133 0
	movq	96(%rsp), %rdi
	call	free
	.loc 1 134 0
	movq	112(%rsp), %rdi
	.loc 1 136 0
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL78:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL79:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL80:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL81:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL82:
	popq	%r15
	.cfi_def_cfa_offset 8
	.loc 1 134 0
	jmp	free
.LVL83:
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
	.loc 1 105 0
	leaq	-1(%r15), %rcx
	subq	$2, %r15
	movsd	.LC6(%rip), %xmm0
	leaq	0(,%r15,8), %rax
	movsd	(%r12,%rcx,8), %xmm3
	leaq	0(,%rcx,8), %rdx
	movsd	(%r14,%rcx,8), %xmm2
	subsd	(%r12,%r15,8), %xmm3
	subsd	(%r14,%r15,8), %xmm2
	divsd	%xmm3, %xmm0
	divsd	%xmm3, %xmm2
	movsd	136(%rsp), %xmm3
	subsd	%xmm2, %xmm3
	movsd	.LC10(%rip), %xmm2
	mulsd	%xmm3, %xmm0
.LVL84:
	jmp	.L42
.LVL85:
.L69:
	movsd	.LC8(%rip), %xmm1
	jmp	.L38
	.cfi_endproc
.LFE10:
	.size	cubic_spline, .-cubic_spline
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	2632192160
	.long	1177091513
	.align 8
.LC6:
	.long	0
	.long	1074266112
	.align 8
.LC7:
	.long	0
	.long	1073741824
	.align 8
.LC8:
	.long	0
	.long	1072693248
	.align 8
.LC9:
	.long	0
	.long	1075314688
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL1-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -68
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -76
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL2-1-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LVL18-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL20-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL21-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL23-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LVL16-.Ltext0
	.quad	.LVL17-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL17-1-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -92
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LVL3-.Ltext0
	.quad	.LVL4-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL4-1-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LVL5-.Ltext0
	.quad	.LVL6-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL6-1-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LVL7-.Ltext0
	.quad	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL8-1-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL10-1-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LVL13-.Ltext0
	.quad	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL14-.Ltext0
	.quad	.LVL15-1-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LVL18-.Ltext0
	.quad	.LVL26-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL32-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL34-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL50-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL83-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL35-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL50-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL83-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL35-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL50-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL83-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL35-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL50-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL83-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST19:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL35-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL50-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL83-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST20:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL35-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0x0
	.quad	0x0
.LLST21:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL35-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0x0
	.quad	0x0
.LLST22:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL35-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST23:
	.quad	.LVL33-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL52-1-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LVL33-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL54-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0x0
	.quad	0x0
.LLST25:
	.quad	.LVL43-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL57-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST26:
	.quad	.LVL56-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST27:
	.quad	.LVL60-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL83-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x3fe00000
	.quad	0x0
	.quad	0x0
.LLST28:
	.quad	.LVL60-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL84-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL68-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LVL69-.Ltext0
	.quad	.LVL70-1-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL43-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL54-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL85-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL60-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -2
	.byte	0x9f
	.quad	.LVL64-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL71-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL75-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL76-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
	.section	.debug_info
	.long	0x32c
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF37
	.byte	0x1
	.long	.LASF38
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.long	0x30
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF11
	.uleb128 0x5
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.byte	0x90
	.byte	0x1
	.quad	.LFB11
	.quad	.LFE11
	.byte	0x1
	.byte	0x9c
	.long	0x1cf
	.uleb128 0x6
	.long	.LASF12
	.byte	0x1
	.byte	0x90
	.long	0x30
	.long	.LLST0
	.uleb128 0x6
	.long	.LASF13
	.byte	0x1
	.byte	0x90
	.long	0x30
	.long	.LLST1
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.byte	0x90
	.long	0x30
	.long	.LLST2
	.uleb128 0x6
	.long	.LASF15
	.byte	0x1
	.byte	0x90
	.long	0x30
	.long	.LLST3
	.uleb128 0x6
	.long	.LASF16
	.byte	0x1
	.byte	0x90
	.long	0x1cf
	.long	.LLST4
	.uleb128 0x6
	.long	.LASF17
	.byte	0x1
	.byte	0x91
	.long	0x1cf
	.long	.LLST5
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.byte	0x91
	.long	0x1cf
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.long	.LASF19
	.byte	0x1
	.byte	0x91
	.long	0x1cf
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x7
	.long	.LASF20
	.byte	0x1
	.byte	0x92
	.long	0x1cf
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x7
	.long	.LASF21
	.byte	0x1
	.byte	0x92
	.long	0x1cf
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x7
	.long	.LASF22
	.byte	0x1
	.byte	0x92
	.long	0x1da
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x8
	.string	"n"
	.byte	0x1
	.byte	0x94
	.long	0x30
	.long	.LLST6
	.uleb128 0x9
	.long	.LASF23
	.byte	0x1
	.byte	0x94
	.long	0x30
	.long	.LLST7
	.uleb128 0x9
	.long	.LASF24
	.byte	0x1
	.byte	0x95
	.long	0x3e
	.long	.LLST8
	.uleb128 0x9
	.long	.LASF25
	.byte	0x1
	.byte	0x95
	.long	0x3e
	.long	.LLST9
	.uleb128 0x9
	.long	.LASF26
	.byte	0x1
	.byte	0x95
	.long	0x3e
	.long	.LLST10
	.uleb128 0x9
	.long	.LASF27
	.byte	0x1
	.byte	0x95
	.long	0x3e
	.long	.LLST11
	.uleb128 0x9
	.long	.LASF28
	.byte	0x1
	.byte	0x96
	.long	0x1da
	.long	.LLST12
	.uleb128 0x9
	.long	.LASF29
	.byte	0x1
	.byte	0x96
	.long	0x1da
	.long	.LLST13
	.uleb128 0x9
	.long	.LASF30
	.byte	0x1
	.byte	0x96
	.long	0x1da
	.long	.LLST14
	.byte	0x0
	.uleb128 0x4
	.byte	0x8
	.long	0x1d5
	.uleb128 0xa
	.long	0x83
	.uleb128 0x4
	.byte	0x8
	.long	0x83
	.uleb128 0xb
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.quad	.LFB10
	.quad	.LFE10
	.byte	0x1
	.byte	0x9c
	.uleb128 0x6
	.long	.LASF31
	.byte	0x1
	.byte	0x3a
	.long	0x30
	.long	.LLST15
	.uleb128 0x6
	.long	.LASF32
	.byte	0x1
	.byte	0x3a
	.long	0x30
	.long	.LLST16
	.uleb128 0x6
	.long	.LASF33
	.byte	0x1
	.byte	0x3a
	.long	0x1cf
	.long	.LLST17
	.uleb128 0x6
	.long	.LASF34
	.byte	0x1
	.byte	0x3a
	.long	0x1cf
	.long	.LLST18
	.uleb128 0x6
	.long	.LASF35
	.byte	0x1
	.byte	0x3a
	.long	0x1cf
	.long	.LLST19
	.uleb128 0x6
	.long	.LASF36
	.byte	0x1
	.byte	0x3b
	.long	0x1da
	.long	.LLST20
	.uleb128 0xc
	.string	"yp1"
	.byte	0x1
	.byte	0x3b
	.long	0x83
	.long	.LLST21
	.uleb128 0xc
	.string	"ypn"
	.byte	0x1
	.byte	0x3b
	.long	0x83
	.long	.LLST22
	.uleb128 0x8
	.string	"y2"
	.byte	0x1
	.byte	0x3d
	.long	0x1da
	.long	.LLST23
	.uleb128 0x8
	.string	"u"
	.byte	0x1
	.byte	0x3d
	.long	0x1da
	.long	.LLST24
	.uleb128 0x8
	.string	"p"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST25
	.uleb128 0x8
	.string	"sig"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST26
	.uleb128 0x8
	.string	"qn"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST27
	.uleb128 0x8
	.string	"un"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST28
	.uleb128 0x8
	.string	"h"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST29
	.uleb128 0x8
	.string	"a"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST30
	.uleb128 0x8
	.string	"b"
	.byte	0x1
	.byte	0x3e
	.long	0x83
	.long	.LLST31
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x3f
	.long	0x30
	.long	.LLST32
	.uleb128 0x8
	.string	"k"
	.byte	0x1
	.byte	0x3f
	.long	0x30
	.long	.LLST33
	.uleb128 0x8
	.string	"n"
	.byte	0x1
	.byte	0x3f
	.long	0x30
	.long	.LLST34
	.uleb128 0x8
	.string	"klo"
	.byte	0x1
	.byte	0x3f
	.long	0x30
	.long	.LLST35
	.uleb128 0xd
	.string	"khi"
	.byte	0x1
	.byte	0x3f
	.long	0x30
	.byte	0x0
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x33
	.value	0x2
	.long	.Ldebug_info0
	.long	0x330
	.long	0x8a
	.string	"conserve_interp"
	.long	0x1e0
	.string	"cubic_spline"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0xe
	.value	0x2
	.long	.Ldebug_info0
	.long	0x330
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0x0
	.value	0x0
	.value	0x0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF25:
	.string	"xgrid_j1"
.LASF12:
	.string	"nx_src"
.LASF31:
	.string	"size1"
.LASF20:
	.string	"mask_src"
.LASF11:
	.string	"double"
.LASF27:
	.string	"xgrid_j2"
.LASF10:
	.string	"float"
.LASF13:
	.string	"ny_src"
.LASF4:
	.string	"unsigned char"
.LASF14:
	.string	"nx_dst"
.LASF38:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/interp.c"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"y_src"
.LASF5:
	.string	"short unsigned int"
.LASF28:
	.string	"xgrid_area"
.LASF21:
	.string	"data_src"
.LASF18:
	.string	"x_dst"
.LASF24:
	.string	"xgrid_i1"
.LASF26:
	.string	"xgrid_i2"
.LASF40:
	.string	"cubic_spline"
.LASF1:
	.string	"unsigned int"
.LASF15:
	.string	"ny_dst"
.LASF30:
	.string	"area_frac"
.LASF9:
	.string	"long long unsigned int"
.LASF35:
	.string	"data1"
.LASF36:
	.string	"data2"
.LASF23:
	.string	"nxgrid"
.LASF39:
	.string	"conserve_interp"
.LASF19:
	.string	"y_dst"
.LASF3:
	.string	"long long int"
.LASF29:
	.string	"dst_area"
.LASF33:
	.string	"grid1"
.LASF34:
	.string	"grid2"
.LASF7:
	.string	"short int"
.LASF32:
	.string	"size2"
.LASF2:
	.string	"long int"
.LASF8:
	.string	"char"
.LASF22:
	.string	"data_dst"
.LASF6:
	.string	"signed char"
.LASF37:
	.string	"GNU C 4.4.7 20120313 (Red Hat 4.4.7-16)"
.LASF16:
	.string	"x_src"
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
