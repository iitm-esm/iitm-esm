	.file	"mosaic_util.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.p2align 4,,15
.globl maxval_double
	.type	maxval_double, @function
maxval_double:
.LFB36:
	.file 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/mosaic_util.c"
	.loc 1 150 0
	.cfi_startproc
.LVL0:
	.loc 1 155 0
	cmpl	$1, %edi
	.loc 1 154 0
	movsd	(%rsi), %xmm0
.LVL1:
	.loc 1 155 0
	jle	.L2
	.loc 1 149 0
	subl	$2, %edi
.LVL2:
	xorl	%eax, %eax
	leaq	8(,%rdi,8), %rdx
.LVL3:
	.p2align 4,,10
	.p2align 3
.L5:
	.loc 1 156 0
	movsd	8(%rsi,%rax), %xmm1
	addq	$8, %rax
	.loc 1 155 0
	cmpq	%rdx, %rax
	.loc 1 156 0
	maxsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	.loc 1 155 0
	jne	.L5
.L2:
	.loc 1 161 0
	rep
	ret
	.cfi_endproc
.LFE36:
	.size	maxval_double, .-maxval_double
	.p2align 4,,15
.globl minval_double
	.type	minval_double, @function
minval_double:
.LFB37:
	.loc 1 169 0
	.cfi_startproc
.LVL4:
	.loc 1 174 0
	cmpl	$1, %edi
	.loc 1 173 0
	movsd	(%rsi), %xmm0
.LVL5:
	.loc 1 174 0
	jle	.L10
.LVL6:
	.loc 1 168 0
	subl	$2, %edi
.LVL7:
	xorl	%eax, %eax
	leaq	8(,%rdi,8), %rdx
.LVL8:
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 1 175 0
	movsd	8(%rsi,%rax), %xmm1
	addq	$8, %rax
	.loc 1 174 0
	cmpq	%rdx, %rax
	.loc 1 175 0
	minsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	.loc 1 174 0
	jne	.L13
.L10:
	.loc 1 180 0
	rep
	ret
	.cfi_endproc
.LFE37:
	.size	minval_double, .-minval_double
	.p2align 4,,15
.globl avgval_double
	.type	avgval_double, @function
avgval_double:
.LFB38:
	.loc 1 187 0
	.cfi_startproc
.LVL9:
	.loc 1 192 0
	testl	%edi, %edi
	xorpd	%xmm0, %xmm0
	jle	.L18
	.loc 1 186 0
	leal	-1(%rdi), %eax
	xorpd	%xmm0, %xmm0
	leaq	8(,%rax,8), %rdx
	xorl	%eax, %eax
.LVL10:
	.p2align 4,,10
	.p2align 3
.L19:
	.loc 1 192 0
	addsd	(%rsi,%rax), %xmm0
.LVL11:
	addq	$8, %rax
	cmpq	%rdx, %rax
	jne	.L19
.LVL12:
.L18:
	cvtsi2sd	%edi, %xmm1
	divsd	%xmm1, %xmm0
.LVL13:
	.loc 1 197 0
	ret
	.cfi_endproc
.LFE38:
	.size	avgval_double, .-avgval_double
	.p2align 4,,15
.globl delete_vtx
	.type	delete_vtx, @function
delete_vtx:
.LFB44:
	.loc 1 328 0
	.cfi_startproc
.LVL14:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 329 0
	leal	-1(%rdx), %eax
	.loc 1 328 0
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	.loc 1 329 0
	cmpl	%eax, %ecx
	.loc 1 328 0
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.loc 1 329 0
	jge	.L23
	.loc 1 327 0
	movslq	%ecx, %r10
	movl	%ecx, %r12d
	leaq	0(,%r10,8), %r11
	notl	%r12d
	addl	%edx, %r12d
	leaq	(%rdi,%r11), %rbx
	leaq	(%rsi,%r11), %r11
	cmpl	$14, %r12d
	leaq	8(%rbx), %r9
	leaq	8(%r11), %r8
	leaq	16(%r11), %r14
	leaq	16(%rbx), %rbp
	jbe	.L24
	movq	%r11, %r13
	orq	%rbx, %r13
	andl	$15, %r13d
	jne	.L24
	leaq	24(%rbx), %r13
	cmpq	%r13, %r11
	jbe	.L37
.L25:
	cmpq	%r8, %rbp
	jae	.L38
.L26:
	cmpq	%rbp, %r11
	jbe	.L39
.L33:
	movl	%r12d, %ebp
	shrl	%ebp
	movl	%ebp, %r13d
	addl	%r13d, %r13d
	je	.L28
	xorl	%edx, %edx
.LVL15:
	xorl	%r10d, %r10d
.LVL16:
	.p2align 4,,10
	.p2align 3
.L29:
	.loc 1 330 0
	movsd	(%r9), %xmm1
	.loc 1 331 0
	addl	$1, %r10d
	.loc 1 330 0
	movhpd	8(%r9), %xmm1
	.loc 1 331 0
	addq	$16, %r9
	.loc 1 330 0
	movapd	%xmm1, (%rbx,%rdx)
	.loc 1 331 0
	movsd	(%r8), %xmm1
	movhpd	8(%r8), %xmm1
	addq	$16, %r8
	movapd	%xmm1, (%r11,%rdx)
	addq	$16, %rdx
	cmpl	%ebp, %r10d
	jb	.L29
	addl	%r13d, %ecx
	cmpl	%r13d, %r12d
	je	.L23
	movslq	%ecx, %r10
.L28:
	.loc 1 327 0
	leaq	8(,%r10,8), %rdx
	addq	%rdx, %rdi
.LVL17:
	addq	%rdx, %rsi
.LVL18:
	.p2align 4,,10
	.p2align 3
.L30:
	.loc 1 330 0
	movq	(%rdi), %rdx
	.loc 1 329 0
	addl	$1, %ecx
.LVL19:
	.loc 1 330 0
	movq	%rdx, -8(%rdi)
	.loc 1 331 0
	movq	(%rsi), %rdx
	.loc 1 329 0
	addq	$8, %rdi
	.loc 1 331 0
	movq	%rdx, -8(%rsi)
	.loc 1 329 0
	addq	$8, %rsi
	cmpl	%ecx, %eax
	jg	.L30
.LVL20:
.L23:
	.loc 1 335 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL21:
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	.loc 1 327 0
	cmpq	%r9, %r14
	jb	.L25
	.p2align 4,,10
	.p2align 3
.L24:
	leaq	8(,%r10,8), %rbx
	.loc 1 329 0
	addl	$1, %ecx
.LVL22:
	.loc 1 327 0
	addq	%rbx, %rdi
.LVL23:
	addq	%rbx, %rsi
.LVL24:
	.p2align 4,,10
	.p2align 3
.L31:
	.loc 1 330 0
	movq	(%rdi), %rbx
	.loc 1 331 0
	addl	$1, %ecx
	.loc 1 330 0
	movq	%rbx, -8(%rdi)
	.loc 1 331 0
	movq	(%rsi), %rbx
	addq	$8, %rdi
	movq	%rbx, -8(%rsi)
	addq	$8, %rsi
	.loc 1 329 0
	cmpl	%ecx, %edx
	jne	.L31
	.loc 1 335 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.LVL25:
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore_state
	.loc 1 327 0
	leaq	16(%r8), %r13
	cmpq	%r13, %rbx
	ja	.L26
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L39:
	cmpq	%r14, %rbx
	ja	.L33
	.p2align 4,,8
	jmp	.L24
	.cfi_endproc
.LFE44:
	.size	delete_vtx, .-delete_vtx
	.p2align 4,,15
.globl insert_vtx
	.type	insert_vtx, @function
insert_vtx:
.LFB45:
	.loc 1 338 0
	.cfi_startproc
.LVL26:
	.loc 1 341 0
	leal	-1(%rdx), %r9d
.LVL27:
	cmpl	%ecx, %r9d
	jl	.L41
	.loc 1 337 0
	movslq	%r9d, %rax
	salq	$3, %rax
	leaq	(%rdi,%rax), %r8
	leaq	(%rsi,%rax), %rax
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 342 0
	movq	(%r8), %r10
	.loc 1 341 0
	subl	$1, %r9d
.LVL28:
	.loc 1 342 0
	movq	%r10, 8(%r8)
	.loc 1 343 0
	movq	(%rax), %r10
	.loc 1 341 0
	subq	$8, %r8
	.loc 1 343 0
	movq	%r10, 8(%rax)
	.loc 1 341 0
	subq	$8, %rax
	cmpl	%r9d, %ecx
	jle	.L42
.L41:
	.loc 1 346 0
	movslq	%ecx, %rcx
	.loc 1 347 0
	leal	1(%rdx), %eax
	.loc 1 346 0
	movsd	%xmm0, (%rdi,%rcx,8)
	.loc 1 347 0
	movsd	%xmm1, (%rsi,%rcx,8)
	.loc 1 349 0
	ret
	.cfi_endproc
.LFE45:
	.size	insert_vtx, .-insert_vtx
	.p2align 4,,15
.globl vect_cross
	.type	vect_cross, @function
vect_cross:
.LFB51:
	.loc 1 519 0
	.cfi_startproc
.LVL29:
	.loc 1 521 0
	movsd	8(%rdi), %xmm0
	movsd	16(%rdi), %xmm1
	mulsd	16(%rsi), %xmm0
	mulsd	8(%rsi), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	.loc 1 522 0
	movsd	16(%rdi), %xmm0
	movsd	(%rdi), %xmm1
	mulsd	(%rsi), %xmm0
	mulsd	16(%rsi), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rdx)
	.loc 1 523 0
	movsd	(%rdi), %xmm0
	movsd	8(%rdi), %xmm1
	mulsd	8(%rsi), %xmm0
	mulsd	(%rsi), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rdx)
	.loc 1 525 0
	ret
	.cfi_endproc
.LFE51:
	.size	vect_cross, .-vect_cross
	.p2align 4,,15
.globl box_area
	.type	box_area, @function
box_area:
.LFB41:
	.loc 1 252 0
	.cfi_startproc
.LVL30:
	.loc 1 253 0
	subsd	%xmm0, %xmm2
.LVL31:
	.loc 1 252 0
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 256 0
	ucomisd	.LC1(%rip), %xmm2
	jbe	.L48
	subsd	.LC2(%rip), %xmm2
.LVL32:
.L48:
	.loc 1 257 0
	ucomisd	.LC3(%rip), %xmm2
	jae	.L50
	jp	.L50
	addsd	.LC2(%rip), %xmm2
.LVL33:
.L50:
	.loc 1 259 0
	movapd	%xmm3, %xmm0
.LVL34:
	movsd	%xmm2, (%rsp)
	movsd	%xmm1, 16(%rsp)
	call	sin
.LVL35:
	movsd	16(%rsp), %xmm1
.LVL36:
	movapd	%xmm0, %xmm3
	movapd	%xmm1, %xmm0
	movsd	%xmm3, 16(%rsp)
	call	sin
.LVL37:
	movsd	16(%rsp), %xmm3
	movsd	(%rsp), %xmm2
.LVL38:
	subsd	%xmm0, %xmm3
	movsd	.LC4(%rip), %xmm1
	.loc 1 261 0
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	.loc 1 259 0
	movapd	%xmm3, %xmm0
	mulsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 261 0
	ret
	.cfi_endproc
.LFE41:
	.size	box_area, .-box_area
	.p2align 4,,15
.globl unit_vect_latlon
	.type	unit_vect_latlon, @function
unit_vect_latlon:
.LFB53:
	.loc 1 549 0
	.cfi_startproc
.LVL39:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r8, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.loc 1 553 0
	testl	%edi, %edi
	jle	.L58
.LVL40:
	.loc 1 548 0
	subl	$1, %edi
.LVL41:
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	leaq	8(,%rdi,8), %rdi
	movq	%rdi, 40(%rsp)
.LVL42:
	.p2align 4,,10
	.p2align 3
.L57:
	movsd	(%rbx,%r14), %xmm0
	leaq	48(%rsp), %rsi
	leaq	56(%rsp), %rdi
	call	sincos
	movsd	48(%rsp), %xmm2
	leaq	48(%rsp), %rsi
	movsd	56(%rsp), %xmm1
	leaq	56(%rsp), %rdi
	movsd	0(%rbp,%r14), %xmm0
	.loc 1 565 0
	addq	$8, %r14
	.loc 1 548 0
	movsd	%xmm1, (%rsp)
	movsd	%xmm2, 16(%rsp)
	call	sincos
	movsd	56(%rsp), %xmm0
	.loc 1 559 0
	movsd	(%rsp), %xmm1
	.loc 1 548 0
	movq	48(%rsp), %rax
	.loc 1 563 0
	xorpd	.LC5(%rip), %xmm0
	.loc 1 559 0
	movapd	%xmm1, %xmm3
	.loc 1 561 0
	movq	$0, 16(%r12,%r13)
	.loc 1 560 0
	movsd	16(%rsp), %xmm2
	.loc 1 559 0
	xorpd	.LC5(%rip), %xmm3
	.loc 1 560 0
	movsd	%xmm2, 8(%r12,%r13)
	.loc 1 564 0
	mulsd	%xmm0, %xmm1
	.loc 1 563 0
	mulsd	%xmm0, %xmm2
	.loc 1 559 0
	movsd	%xmm3, (%r12,%r13)
	.loc 1 565 0
	movq	%rax, 16(%r15,%r13)
	.loc 1 564 0
	movsd	%xmm1, 8(%r15,%r13)
	.loc 1 563 0
	movsd	%xmm2, (%r15,%r13)
	.loc 1 565 0
	addq	$24, %r13
	.loc 1 553 0
	cmpq	40(%rsp), %r14
	jne	.L57
.L58:
	.loc 1 567 0
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL43:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL44:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL45:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL46:
	ret
	.cfi_endproc
.LFE53:
	.size	unit_vect_latlon, .-unit_vect_latlon
	.p2align 4,,15
.globl poly_area_no_adjust
	.type	poly_area_no_adjust, @function
poly_area_no_adjust:
.LFB43:
	.loc 1 305 0
	.cfi_startproc
.LVL47:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 309 0
	xorpd	%xmm4, %xmm4
	.loc 1 305 0
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	.loc 1 309 0
	testl	%edx, %edx
	jle	.L62
.LVL48:
	xorpd	%xmm5, %xmm5
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	movapd	%xmm5, %xmm4
	jmp	.L66
.LVL49:
	.p2align 4,,10
	.p2align 3
.L73:
.LBB2:
	.loc 1 319 0
	addsd	%xmm2, %xmm0
.LVL50:
	movsd	%xmm1, 32(%rsp)
	movsd	%xmm4, 16(%rsp)
	movsd	%xmm5, (%rsp)
	mulsd	.LC8(%rip), %xmm0
	call	sin
.LVL51:
	movsd	32(%rsp), %xmm1
.LVL52:
	movsd	16(%rsp), %xmm4
	mulsd	%xmm1, %xmm0
	movsd	(%rsp), %xmm5
	addsd	%xmm0, %xmm4
.LVL53:
.L63:
	.loc 1 321 0
	addq	$8, %r12
.LBE2:
	.loc 1 309 0
	cmpl	%r13d, %ebp
	je	.L62
.LVL54:
.L66:
.LBB3:
	.loc 1 310 0
	addl	$1, %ebp
.LVL55:
	.loc 1 315 0
	movsd	(%r14,%r12), %xmm2
	.loc 1 311 0
	movl	%ebp, %edx
	movl	%ebp, %eax
	sarl	$31, %edx
	idivl	%r13d
	movslq	%edx, %rdx
	movsd	(%rbx,%rdx,8), %xmm1
	.loc 1 314 0
	movsd	(%r14,%rdx,8), %xmm0
	.loc 1 311 0
	subsd	(%rbx,%r12), %xmm1
.LVL56:
	.loc 1 316 0
	ucomisd	%xmm5, %xmm1
	jp	.L72
	je	.L63
.L72:
	.loc 1 318 0
	movapd	%xmm0, %xmm3
	movsd	.LC7(%rip), %xmm7
	subsd	%xmm2, %xmm3
	movapd	%xmm3, %xmm6
	andpd	.LC6(%rip), %xmm6
	ucomisd	%xmm6, %xmm7
	ja	.L73
	.loc 1 321 0
	movsd	%xmm1, 32(%rsp)
	addq	$8, %r12
.LVL57:
	movsd	%xmm3, 48(%rsp)
	movsd	%xmm4, 16(%rsp)
	movsd	%xmm5, (%rsp)
	movsd	%xmm2, 64(%rsp)
	call	cos
.LVL58:
	movsd	64(%rsp), %xmm2
.LVL59:
	movapd	%xmm0, %xmm6
	movapd	%xmm2, %xmm0
	movsd	%xmm6, 64(%rsp)
	call	cos
.LVL60:
	movsd	64(%rsp), %xmm6
.LBE3:
	.loc 1 309 0
	cmpl	%r13d, %ebp
.LBB4:
	.loc 1 321 0
	movsd	32(%rsp), %xmm1
.LVL61:
	subsd	%xmm0, %xmm6
	movsd	48(%rsp), %xmm3
	movsd	16(%rsp), %xmm4
	movsd	(%rsp), %xmm5
	mulsd	%xmm1, %xmm6
	divsd	%xmm3, %xmm6
	addsd	%xmm6, %xmm4
.LVL62:
.LBE4:
	.loc 1 309 0
	jne	.L66
.LVL63:
.L62:
	movsd	.LC4(%rip), %xmm1
	.loc 1 325 0
	addq	$80, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 309 0
	movapd	%xmm4, %xmm0
	.loc 1 325 0
	popq	%rbx
	.cfi_def_cfa_offset 40
.LVL64:
	.loc 1 309 0
	mulsd	%xmm1, %xmm0
	.loc 1 325 0
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL65:
	.loc 1 309 0
	mulsd	%xmm1, %xmm0
	.loc 1 325 0
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL66:
	ret
	.cfi_endproc
.LFE43:
	.size	poly_area_no_adjust, .-poly_area_no_adjust
	.p2align 4,,15
.globl poly_area
	.type	poly_area, @function
poly_area:
.LFB42:
	.loc 1 272 0
	.cfi_startproc
.LVL67:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 276 0
	xorpd	%xmm4, %xmm4
	.loc 1 272 0
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	.loc 1 276 0
	testl	%edx, %edx
	jle	.L76
.LVL68:
	xorpd	%xmm5, %xmm5
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	movsd	.LC3(%rip), %xmm6
	movapd	%xmm5, %xmm4
	jmp	.L84
.LVL69:
	.p2align 4,,10
	.p2align 3
.L93:
.LBB5:
	.loc 1 289 0
	addsd	%xmm2, %xmm0
.LVL70:
	movsd	%xmm1, 48(%rsp)
	movsd	%xmm4, 32(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm6, (%rsp)
	mulsd	.LC8(%rip), %xmm0
	call	sin
.LVL71:
	movsd	48(%rsp), %xmm1
.LVL72:
	movsd	32(%rsp), %xmm4
	mulsd	%xmm1, %xmm0
	movsd	16(%rsp), %xmm5
	movsd	(%rsp), %xmm6
	addsd	%xmm0, %xmm4
.LVL73:
.L81:
	.loc 1 296 0
	addq	$8, %r12
.LBE5:
	.loc 1 276 0
	cmpl	%r13d, %ebp
	je	.L76
.LVL74:
.L84:
.LBB6:
	.loc 1 277 0
	addl	$1, %ebp
.LVL75:
	.loc 1 283 0
	movsd	(%r14,%r12), %xmm2
	.loc 1 278 0
	movl	%ebp, %edx
	movl	%ebp, %eax
	sarl	$31, %edx
	idivl	%r13d
	movslq	%edx, %rdx
	movsd	(%rbx,%rdx,8), %xmm1
	.loc 1 282 0
	movsd	(%r14,%rdx,8), %xmm0
	.loc 1 278 0
	subsd	(%rbx,%r12), %xmm1
.LVL76:
	.loc 1 284 0
	ucomisd	.LC1(%rip), %xmm1
	jbe	.L77
	subsd	.LC2(%rip), %xmm1
.LVL77:
.L77:
	.loc 1 285 0
	ucomisd	%xmm1, %xmm6
	jbe	.L79
	addsd	.LC2(%rip), %xmm1
.LVL78:
.L79:
	.loc 1 286 0
	ucomisd	%xmm5, %xmm1
	jp	.L92
	je	.L81
.L92:
	.loc 1 288 0
	movapd	%xmm0, %xmm3
	movsd	.LC7(%rip), %xmm8
	subsd	%xmm2, %xmm3
	movapd	%xmm3, %xmm7
	andpd	.LC6(%rip), %xmm7
	ucomisd	%xmm7, %xmm8
	ja	.L93
	.loc 1 296 0
	movsd	%xmm1, 48(%rsp)
	addq	$8, %r12
.LVL79:
	movsd	%xmm3, 64(%rsp)
	movsd	%xmm4, 32(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm6, (%rsp)
	movsd	%xmm2, 80(%rsp)
	call	cos
.LVL80:
	movsd	80(%rsp), %xmm2
.LVL81:
	movapd	%xmm0, %xmm7
	movapd	%xmm2, %xmm0
	movsd	%xmm7, 80(%rsp)
	call	cos
.LVL82:
	movsd	80(%rsp), %xmm7
.LBE6:
	.loc 1 276 0
	cmpl	%r13d, %ebp
.LBB7:
	.loc 1 296 0
	movsd	48(%rsp), %xmm1
.LVL83:
	subsd	%xmm0, %xmm7
	movsd	64(%rsp), %xmm3
	movsd	32(%rsp), %xmm4
	movsd	(%rsp), %xmm6
	movsd	16(%rsp), %xmm5
	mulsd	%xmm1, %xmm7
	divsd	%xmm3, %xmm7
	addsd	%xmm7, %xmm4
.LVL84:
.LBE7:
	.loc 1 276 0
	jne	.L84
.LVL85:
.L76:
	movsd	.LC4(%rip), %xmm1
	.loc 1 302 0
	addq	$96, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 276 0
	movapd	%xmm4, %xmm0
	.loc 1 302 0
	popq	%rbx
	.cfi_def_cfa_offset 40
.LVL86:
	.loc 1 276 0
	mulsd	%xmm1, %xmm0
	.loc 1 302 0
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
.LVL87:
	.loc 1 276 0
	mulsd	%xmm1, %xmm0
	.loc 1 302 0
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL88:
	ret
	.cfi_endproc
.LFE42:
	.size	poly_area, .-poly_area
	.p2align 4,,15
.globl latlon2xyz
	.type	latlon2xyz, @function
latlon2xyz:
.LFB39:
	.loc 1 205 0
	.cfi_startproc
.LVL89:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r9, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 208 0
	testl	%edi, %edi
	jle	.L97
.LVL90:
	.loc 1 204 0
	subl	$1, %edi
.LVL91:
	xorl	%r14d, %r14d
	leaq	8(,%rdi,8), %rdi
	movq	%rdi, 8(%rsp)
.LVL92:
	.p2align 4,,10
	.p2align 3
.L96:
	.loc 1 209 0
	movsd	0(%rbp,%r14), %xmm0
	call	cos
	movsd	%xmm0, (%rsp)
	movsd	(%rbx,%r14), %xmm0
	call	cos
	mulsd	(%rsp), %xmm0
	movsd	%xmm0, (%r12,%r14)
	.loc 1 210 0
	movsd	0(%rbp,%r14), %xmm0
	call	cos
	movsd	%xmm0, (%rsp)
	movsd	(%rbx,%r14), %xmm0
	call	sin
	mulsd	(%rsp), %xmm0
	movsd	%xmm0, 0(%r13,%r14)
	.loc 1 211 0
	movsd	0(%rbp,%r14), %xmm0
	call	sin
	movsd	%xmm0, (%r15,%r14)
	addq	$8, %r14
	.loc 1 208 0
	cmpq	8(%rsp), %r14
	jne	.L96
.L97:
	.loc 1 214 0
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL93:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL94:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL95:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL96:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL97:
	ret
	.cfi_endproc
.LFE39:
	.size	latlon2xyz, .-latlon2xyz
	.p2align 4,,15
.globl normalize_vect
	.type	normalize_vect, @function
normalize_vect:
.LFB52:
	.loc 1 531 0
	.cfi_startproc
.LVL98:
	.loc 1 535 0
	movsd	(%rdi), %xmm4
	.loc 1 531 0
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 535 0
	movsd	8(%rdi), %xmm3
	.loc 1 531 0
	movq	%rdi, %rbx
	.loc 1 535 0
	movapd	%xmm4, %xmm1
	movapd	%xmm3, %xmm0
	movsd	16(%rdi), %xmm2
	mulsd	%xmm4, %xmm1
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm1
	movapd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
.LVL99:
	.loc 1 536 0
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L103
.LVL100:
	je	.L100
.L103:
	movapd	%xmm1, %xmm0
	call	sqrt
.LVL101:
	movsd	(%rbx), %xmm4
	movsd	8(%rbx), %xmm3
	movsd	16(%rbx), %xmm2
.L100:
.LVL102:
	.loc 1 538 0
	divsd	%xmm0, %xmm4
	divsd	%xmm0, %xmm3
	movsd	%xmm4, (%rbx)
.LVL103:
	divsd	%xmm0, %xmm2
	movsd	%xmm3, 8(%rbx)
.LVL104:
	movsd	%xmm2, 16(%rbx)
.LVL105:
	.loc 1 539 0
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL106:
	ret
	.cfi_endproc
.LFE52:
	.size	normalize_vect, .-normalize_vect
	.p2align 4,,15
.globl spherical_angle
	.type	spherical_angle, @function
spherical_angle:
.LFB49:
	.loc 1 446 0
	.cfi_startproc
.LVL107:
	.loc 1 451 0
	movsd	8(%rdi), %xmm0
	movsd	16(%rdi), %xmm5
	movsd	16(%rsi), %xmm3
	movapd	%xmm0, %xmm8
	movsd	8(%rsi), %xmm4
	movapd	%xmm5, %xmm1
	mulsd	%xmm3, %xmm8
	.loc 1 452 0
	movsd	(%rsi), %xmm2
	movapd	%xmm5, %xmm6
	.loc 1 451 0
	mulsd	%xmm4, %xmm1
	.loc 1 455 0
	movapd	%xmm0, %xmm7
	.loc 1 452 0
	mulsd	%xmm2, %xmm6
	.loc 1 453 0
	mulsd	%xmm0, %xmm2
	.loc 1 455 0
	movsd	16(%rdx), %xmm9
	.loc 1 451 0
	subsd	%xmm1, %xmm8
.LVL108:
	.loc 1 452 0
	movsd	(%rdi), %xmm1
	.loc 1 455 0
	mulsd	%xmm9, %xmm7
	.loc 1 452 0
	mulsd	%xmm1, %xmm3
	.loc 1 453 0
	mulsd	%xmm1, %xmm4
	.loc 1 456 0
	mulsd	%xmm1, %xmm9
	.loc 1 452 0
	subsd	%xmm3, %xmm6
.LVL109:
	.loc 1 455 0
	movsd	8(%rdx), %xmm3
	.loc 1 453 0
	subsd	%xmm2, %xmm4
.LVL110:
	.loc 1 455 0
	movapd	%xmm5, %xmm2
	mulsd	%xmm3, %xmm2
	.loc 1 457 0
	mulsd	%xmm1, %xmm3
	.loc 1 460 0
	movapd	%xmm8, %xmm1
	mulsd	%xmm8, %xmm1
	.loc 1 455 0
	subsd	%xmm2, %xmm7
.LVL111:
	.loc 1 456 0
	movsd	(%rdx), %xmm2
	.loc 1 457 0
	mulsd	%xmm2, %xmm0
	.loc 1 456 0
	mulsd	%xmm2, %xmm5
	.loc 1 460 0
	movapd	%xmm7, %xmm2
	.loc 1 457 0
	subsd	%xmm0, %xmm3
	.loc 1 460 0
	movapd	%xmm6, %xmm0
	.loc 1 456 0
	subsd	%xmm9, %xmm5
.LVL112:
	.loc 1 460 0
	mulsd	%xmm7, %xmm2
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm1
	movapd	%xmm4, %xmm0
	mulsd	%xmm4, %xmm0
	addsd	%xmm0, %xmm1
	movapd	%xmm5, %xmm0
	mulsd	%xmm5, %xmm0
	addsd	%xmm0, %xmm2
	movapd	%xmm3, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	.loc 1 460 0
	mulsd	%xmm2, %xmm1
	sqrtsd	%xmm1, %xmm1
.LVL113:
	.loc 1 461 0
	ucomisd	%xmm0, %xmm1
	ja	.L105
	.loc 1 468 0
	rep
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	.loc 1 462 0
	movapd	%xmm8, %xmm0
	mulsd	%xmm6, %xmm5
.LVL114:
	mulsd	%xmm4, %xmm3
.LVL115:
	mulsd	%xmm7, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm3, %xmm0
	divsd	%xmm1, %xmm0
	jmp	acos
	.cfi_endproc
.LFE49:
	.size	spherical_angle, .-spherical_angle
	.p2align 4,,15
.globl great_circle_distance
	.type	great_circle_distance, @function
great_circle_distance:
.LFB48:
	.loc 1 421 0
	.cfi_startproc
.LVL116:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 427 0
	movsd	8(%rdi), %xmm3
	movsd	.LC9(%rip), %xmm2
	movapd	%xmm3, %xmm0
	movsd	%xmm3, 16(%rsp)
	movsd	%xmm2, (%rsp)
	subsd	8(%rsi), %xmm0
	mulsd	%xmm2, %xmm0
	call	sin
.LVL117:
	.loc 1 428 0
	movsd	16(%rsp), %xmm3
	.loc 1 427 0
	movapd	%xmm0, %xmm1
	.loc 1 428 0
	movapd	%xmm3, %xmm0
	movsd	%xmm1, 16(%rsp)
	call	cos
	movsd	%xmm0, 40(%rsp)
	movsd	8(%rbp), %xmm0
	call	cos
	movsd	%xmm0, 32(%rsp)
	movsd	(%rbx), %xmm0
	movsd	(%rsp), %xmm2
	subsd	0(%rbp), %xmm0
	mulsd	%xmm2, %xmm0
	call	sin
	.loc 1 427 0
	movsd	40(%rsp), %xmm2
	mulsd	%xmm0, %xmm0
	mulsd	32(%rsp), %xmm2
	movsd	16(%rsp), %xmm1
	mulsd	%xmm1, %xmm1
	mulsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm1
	sqrtsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L112
	je	.L109
.L112:
	movapd	%xmm1, %xmm0
	call	sqrt
.L109:
	call	asin
.LVL118:
	addsd	%xmm0, %xmm0
.LVL119:
	mulsd	.LC4(%rip), %xmm0
	.loc 1 432 0
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL120:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL121:
	ret
	.cfi_endproc
.LFE48:
	.size	great_circle_distance, .-great_circle_distance
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC10:
	.string	" %20g   %20g\n"
	.text
	.p2align 4,,15
.globl v_print
	.type	v_print, @function
v_print:
.LFB46:
	.loc 1 352 0
	.cfi_startproc
.LVL122:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	.loc 1 355 0
	testl	%edx, %edx
	.loc 1 352 0
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.loc 1 352 0
	movq	%rdi, %rbx
	.loc 1 355 0
	jle	.L116
.LVL123:
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
.LVL124:
	.p2align 4,,10
	.p2align 3
.L115:
	movsd	(%rbx,%r12), %xmm0
	movl	$.LC10, %edi
	movsd	0(%rbp,%r12), %xmm1
	movl	$2, %eax
	addl	$1, %r13d
	addq	$8, %r12
	call	printf
.LVL125:
	cmpl	%r13d, %r14d
	jg	.L115
.LVL126:
.L116:
	.loc 1 356 0
	popq	%rbx
	.cfi_def_cfa_offset 40
.LVL127:
	popq	%rbp
	.cfi_def_cfa_offset 32
.LVL128:
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
.LVL129:
	ret
	.cfi_endproc
.LFE46:
	.size	v_print, .-v_print
	.p2align 4,,15
.globl xyz2latlon
	.type	xyz2latlon, @function
xyz2latlon:
.LFB40:
	.loc 1 221 0
	.cfi_startproc
.LVL130:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 227 0
	testl	%edi, %edi
	.loc 1 221 0
	movq	%r9, 40(%rsp)
	.loc 1 227 0
	jle	.L126
.LVL131:
	movq	%r8, %r15
	xorl	%r14d, %r14d
	movl	$0, 36(%rsp)
	jmp	.L125
.LVL132:
	.p2align 4,,10
	.p2align 3
.L131:
	.loc 1 237 0
	movq	$0, (%r15)
.LVL133:
.L122:
	.loc 1 240 0
	movapd	%xmm3, %xmm0
	divsd	%xmm2, %xmm0
	call	asin
	movq	40(%rsp), %rax
	.loc 1 242 0
	xorpd	%xmm1, %xmm1
	.loc 1 240 0
	movsd	%xmm0, (%rax,%r14)
	.loc 1 242 0
	movsd	(%r15), %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L123
	addsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%r15)
.L123:
	.loc 1 227 0
	addl	$1, 36(%rsp)
.LVL134:
	addq	$8, %r14
	addq	$8, %r15
	cmpl	36(%rsp), %ebx
	jle	.L126
.LVL135:
.L125:
	.loc 1 228 0
	movsd	0(%rbp,%r14), %xmm1
.LVL136:
	.loc 1 229 0
	movsd	(%r12,%r14), %xmm0
.LVL137:
	.loc 1 231 0
	movapd	%xmm1, %xmm2
	.loc 1 230 0
	movsd	0(%r13,%r14), %xmm3
.LVL138:
	.loc 1 231 0
	movapd	%xmm0, %xmm4
	mulsd	%xmm1, %xmm2
	mulsd	%xmm0, %xmm4
	addsd	%xmm4, %xmm2
	movapd	%xmm3, %xmm4
	mulsd	%xmm3, %xmm4
	addsd	%xmm4, %xmm2
	sqrtsd	%xmm2, %xmm2
.LVL139:
	.loc 1 232 0
	divsd	%xmm2, %xmm1
.LVL140:
	.loc 1 233 0
	divsd	%xmm2, %xmm0
.LVL141:
	.loc 1 236 0
	movapd	%xmm1, %xmm4
	andpd	.LC6(%rip), %xmm4
	movapd	%xmm0, %xmm5
	andpd	.LC6(%rip), %xmm5
	addsd	%xmm5, %xmm4
	movsd	.LC7(%rip), %xmm5
	ucomisd	%xmm4, %xmm5
	ja	.L131
	.loc 1 239 0
	movsd	%xmm2, 16(%rsp)
	movsd	%xmm3, (%rsp)
	call	atan2
.LVL142:
	movsd	(%rsp), %xmm3
	movsd	%xmm0, (%r15)
	movsd	16(%rsp), %xmm2
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L126:
	.loc 1 245 0
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL143:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL144:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL145:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL146:
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	xyz2latlon, .-xyz2latlon
	.section	.rodata.str1.1
.LC11:
	.string	"FATAL Error: %s\n"
	.text
	.p2align 4,,15
.globl error_handler
	.type	error_handler, @function
error_handler:
.LFB33:
	.loc 1 49 0
	.cfi_startproc
.LVL147:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 49 0
	movq	%rdi, %rdx
	.loc 1 50 0
	movq	stderr(%rip), %rdi
.LVL148:
	movl	$.LC11, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL149:
	.loc 1 54 0
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE33:
	.size	error_handler, .-error_handler
	.p2align 4,,15
.globl fix_lon
	.type	fix_lon, @function
fix_lon:
.LFB47:
	.loc 1 359 0
	.cfi_startproc
.LVL150:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	.loc 1 363 0
	testl	%edx, %edx
	.loc 1 359 0
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
	.loc 1 363 0
	jle	.L135
.LVL151:
	movl	%edx, %r8d
	xorl	%r9d, %r9d
	movsd	.LC6(%rip), %xmm3
	movsd	.LC12(%rip), %xmm2
	jmp	.L157
.LVL152:
	.p2align 4,,10
	.p2align 3
.L192:
.LBB15:
	.loc 1 377 0
	ucomisd	(%rsi,%rax,8), %xmm1
	jp	.L217
	jne	.L217
.L151:
.LBB17:
.LBB19:
	.loc 1 348 0
	movl	%r8d, %ecx
.LVL153:
.L137:
.LBE19:
.LBE17:
.LBE15:
	.loc 1 371 0
	cmpl	%r10d, %ecx
	jle	.L156
	movl	%ecx, %r8d
	movl	%r10d, %r9d
.LVL154:
.L157:
	movslq	%r9d, %rbp
	leal	1(%r9), %r10d
	movl	%r8d, %ecx
	leaq	0(,%rbp,8), %rbx
	leaq	(%rsi,%rbx), %r11
	movsd	(%r11), %xmm1
	movapd	%xmm1, %xmm4
	andpd	%xmm3, %xmm4
	ucomisd	%xmm2, %xmm4
	jb	.L137
.LVL155:
.LBB30:
	.loc 1 372 0
	leal	1(%r9), %r10d
	movl	%r10d, %edx
	movl	%r10d, %eax
	sarl	$31, %edx
	idivl	%r8d
	movl	%edx, %ecx
.LVL156:
	.loc 1 374 0
	leal	-1(%r8,%r9), %edx
.LVL157:
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%r8d
	movslq	%ecx, %rax
	movslq	%edx, %rdx
	movsd	(%rsi,%rdx,8), %xmm4
	ucomisd	%xmm4, %xmm1
	jne	.L192
	jp	.L192
	ucomisd	(%rsi,%rax,8), %xmm1
	je	.L221
.L209:
	.loc 1 377 0
	ucomisd	%xmm4, %xmm1
	.p2align 4,,2
	jp	.L192
	.p2align 4,,2
	je	.L151
	.p2align 4,,7
	jmp	.L192
.LVL158:
	.p2align 4,,10
	.p2align 3
.L156:
.LBE30:
	.loc 1 384 0
	testl	%ecx, %ecx
	.p2align 4,,9
	jle	.L158
	leal	-1(%rcx), %r10d
	movl	$1, %r8d
	xorl	%r9d, %r9d
.LVL159:
	.p2align 4,,10
	.p2align 3
.L164:
	movsd	(%rsi,%r9), %xmm1
	movl	%r8d, %r11d
	movapd	%xmm1, %xmm4
	andpd	%xmm3, %xmm4
	ucomisd	%xmm2, %xmm4
	jb	.L160
.LVL160:
.LBB31:
	.loc 1 387 0
	movl	%r10d, %edx
	movl	%r10d, %eax
	sarl	$31, %edx
	idivl	%ecx
	movslq	%edx, %rdx
	ucomisd	(%rsi,%rdx,8), %xmm1
	jp	.L218
	je	.L161
.L218:
	movq	(%rdi,%rdx,8), %rax
	movq	%rax, (%rdi,%r9)
	movsd	(%rsi,%r9), %xmm1
.L161:
	.loc 1 388 0
	movl	%r8d, %edx
	movl	%r8d, %eax
	sarl	$31, %edx
	idivl	%ecx
	movslq	%edx, %rdx
	ucomisd	(%rsi,%rdx,8), %xmm1
	jp	.L219
	je	.L160
.L219:
	movq	(%rdi,%rdx,8), %rax
	movq	%rax, (%rdi,%r9)
.LVL161:
.L160:
	addq	$8, %r9
	addl	$1, %r8d
.LVL162:
	addl	$1, %r10d
.LBE31:
	.loc 1 384 0
	cmpl	%r11d, %ecx
	jg	.L164
	.loc 1 392 0
	cmpl	$1, %ecx
	.loc 1 391 0
	movsd	(%rdi), %xmm2
.LVL163:
	.loc 1 392 0
	jle	.L220
.LVL164:
	.loc 1 358 0
	leal	-2(%rcx), %eax
.LBB32:
	.loc 1 396 0
	movsd	.LC2(%rip), %xmm7
.LBE32:
	.loc 1 358 0
	movapd	%xmm2, %xmm3
	leaq	8(,%rax,8), %rdx
	movsd	.LC3(%rip), %xmm4
	xorl	%eax, %eax
.LBB33:
	.loc 1 396 0
	movsd	.LC1(%rip), %xmm6
	.loc 1 395 0
	movapd	%xmm7, %xmm5
	jmp	.L173
.LVL165:
	.p2align 4,,10
	.p2align 3
.L222:
	addsd	%xmm5, %xmm1
.LVL166:
.L170:
	.loc 1 397 0
	addsd	%xmm2, %xmm1
.LVL167:
	movapd	%xmm3, %xmm2
	movsd	%xmm1, 8(%rdi,%rax)
	addq	$8, %rax
	addsd	%xmm1, %xmm2
.LVL168:
.LBE33:
	.loc 1 392 0
	cmpq	%rdx, %rax
	je	.L172
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
.LVL169:
.L173:
.LBB34:
	.loc 1 393 0
	movsd	8(%rdi,%rax), %xmm1
	subsd	%xmm2, %xmm1
.LVL170:
	.loc 1 395 0
	ucomisd	%xmm1, %xmm4
	ja	.L222
	.loc 1 396 0
	ucomisd	%xmm6, %xmm1
	jbe	.L170
	subsd	%xmm7, %xmm1
.LVL171:
	jmp	.L170
.LVL172:
	.p2align 4,,10
	.p2align 3
.L221:
.LBE34:
.LBB35:
	.loc 1 374 0
	jp	.L209
.LVL173:
.LBB22:
.LBB24:
	.loc 1 329 0
	leal	-1(%r8), %ecx
.LVL174:
	cmpl	%ecx, %r9d
	jge	.L141
	.loc 1 358 0
	movl	%r9d, %r12d
	leaq	(%rdi,%rbx), %rbx
	leaq	8(%r11), %rdx
.LVL175:
	notl	%r12d
	leaq	16(%r11), %r15
	addl	%r8d, %r12d
	leaq	8(%rbx), %r14
	leaq	16(%rbx), %rax
.LVL176:
	cmpl	$14, %r12d
	jbe	.L142
	movq	%r11, %r13
	orq	%rbx, %r13
	andl	$15, %r13d
	jne	.L142
	leaq	24(%rbx), %r13
	cmpq	%r13, %r11
	jbe	.L223
.L143:
	cmpq	%rdx, %rax
	jae	.L224
.L144:
	cmpq	%rax, %r11
	jbe	.L225
.L191:
	movl	%r12d, %r10d
	shrl	%r10d
	movl	%r10d, %r13d
	addl	%r13d, %r13d
	je	.L226
	movq	%r14, %rbp
	xorl	%eax, %eax
	xorl	%r8d, %r8d
.LVL177:
	.p2align 4,,10
	.p2align 3
.L148:
	.loc 1 330 0
	movsd	0(%rbp), %xmm4
	.loc 1 331 0
	addl	$1, %r8d
	.loc 1 330 0
	movhpd	8(%rbp), %xmm4
	.loc 1 331 0
	addq	$16, %rbp
	.loc 1 330 0
	movapd	%xmm4, (%rbx,%rax)
	.loc 1 331 0
	movsd	(%rdx), %xmm4
	movhpd	8(%rdx), %xmm4
	addq	$16, %rdx
	movapd	%xmm4, (%r11,%rax)
	addq	$16, %rax
	cmpl	%r10d, %r8d
	jb	.L148
	cmpl	%r13d, %r12d
	leal	0(%r13,%r9), %ebx
	je	.L141
.L147:
	.loc 1 358 0
	movslq	%ebx, %rax
	leaq	8(,%rax,8), %rax
	leaq	(%rdi,%rax), %rdx
	leaq	(%rsi,%rax), %rax
	.p2align 4,,10
	.p2align 3
.L149:
	.loc 1 330 0
	movq	(%rdx), %rbp
	.loc 1 329 0
	addl	$1, %ebx
.LVL178:
	.loc 1 330 0
	movq	%rbp, -8(%rdx)
	.loc 1 331 0
	movq	(%rax), %rbp
	.loc 1 329 0
	addq	$8, %rdx
	.loc 1 331 0
	movq	%rbp, -8(%rax)
	.loc 1 329 0
	addq	$8, %rax
	cmpl	%ebx, %ecx
	jg	.L149
.LVL179:
.L141:
	movl	%r9d, %r10d
.LBE24:
.LBE22:
	.loc 1 374 0
	jmp	.L137
.LVL180:
	.p2align 4,,10
	.p2align 3
.L217:
.LBB26:
.LBB20:
	.loc 1 341 0
	leal	-1(%r8), %ecx
.LVL181:
.LBE20:
.LBE26:
	.loc 1 378 0
	leaq	(%rdi,%rbx), %rbx
.LBB27:
.LBB18:
	.loc 1 341 0
	cmpl	%ecx, %r9d
.LBE18:
.LBE27:
	.loc 1 378 0
	movq	(%rbx), %r12
.LVL182:
.LBB28:
.LBB21:
	.loc 1 341 0
	jg	.L154
.LVL183:
	.loc 1 358 0
	movslq	%ecx, %rax
.LVL184:
	salq	$3, %rax
	leaq	(%rdi,%rax), %rdx
	leaq	(%rsi,%rax), %rax
.LVL185:
	.p2align 4,,10
	.p2align 3
.L155:
	.loc 1 342 0
	movq	(%rdx), %rbp
	.loc 1 341 0
	subl	$1, %ecx
.LVL186:
	.loc 1 342 0
	movq	%rbp, 8(%rdx)
	.loc 1 343 0
	movq	(%rax), %rbp
	.loc 1 341 0
	subq	$8, %rdx
	.loc 1 343 0
	movq	%rbp, 8(%rax)
	.loc 1 341 0
	subq	$8, %rax
	cmpl	%ecx, %r9d
	jle	.L155
.L154:
	.loc 1 346 0
	movq	%r12, (%rbx)
	.loc 1 348 0
	leal	1(%r8), %ecx
.LVL187:
	.loc 1 347 0
	movsd	%xmm1, (%r11)
	.loc 1 348 0
	addl	$1, %r10d
.LVL188:
	jmp	.L137
.LVL189:
.L135:
.LBE21:
.LBE28:
.LBE35:
	.loc 1 384 0
	movl	%edx, %ecx
.LVL190:
.L158:
	.loc 1 391 0
	testl	%ecx, %ecx
	je	.L167
	movsd	(%rdi), %xmm2
.LVL191:
.L220:
	movsd	.LC3(%rip), %xmm4
.LVL192:
	.p2align 4,,10
	.p2align 3
.L172:
	.loc 1 400 0
	cvtsi2sd	%ecx, %xmm1
	divsd	%xmm1, %xmm2
.LVL193:
	subsd	%xmm0, %xmm2
.LVL194:
	.loc 1 401 0
	ucomisd	%xmm2, %xmm4
	jbe	.L212
.LVL195:
	testl	%ecx, %ecx
	jle	.L167
	movq	%rdi, %rax
	andl	$15, %eax
	shrq	$3, %rax
	cmpl	%eax, %ecx
	cmovbe	%ecx, %eax
	testl	%eax, %eax
	je	.L227
	movsd	(%rdi), %xmm0
.LVL196:
	cmpl	%ecx, %eax
	addsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rdi)
.LVL197:
	je	.L167
	movl	$1, %edx
.LVL198:
.L177:
	movl	%ecx, %r9d
	subl	%eax, %r9d
	movl	%r9d, %ebp
	shrl	%ebp
	movl	%ebp, %r8d
	addl	%r8d, %r8d
	je	.L178
	.loc 1 358 0
	mov	%eax, %eax
	movapd	.LC13(%rip), %xmm1
	leaq	(%rdi,%rax,8), %rsi
.LVL199:
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L179:
	.loc 1 401 0
	movapd	(%rsi,%rax), %xmm0
	addl	$1, %ebx
	addpd	%xmm1, %xmm0
	movapd	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%ebp, %ebx
	jb	.L179
	addl	%r8d, %edx
	cmpl	%r8d, %r9d
	je	.L167
.L178:
	movslq	%edx, %rax
	movsd	.LC2(%rip), %xmm1
	leaq	(%rdi,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L180:
	movsd	(%rax), %xmm0
	addl	$1, %edx
.LVL200:
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$8, %rax
	cmpl	%ecx, %edx
	jl	.L180
.LVL201:
.L167:
	.loc 1 411 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	movl	%ecx, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL202:
	.p2align 4,,10
	.p2align 3
.L212:
	.cfi_restore_state
	.loc 1 402 0
	ucomisd	.LC1(%rip), %xmm2
	jbe	.L167
.LVL203:
	testl	%ecx, %ecx
	jle	.L167
	movq	%rdi, %rax
	andl	$15, %eax
	shrq	$3, %rax
	cmpl	%eax, %ecx
	cmovbe	%ecx, %eax
	testl	%eax, %eax
	je	.L228
	movsd	(%rdi), %xmm0
.LVL204:
	cmpl	%eax, %ecx
	subsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rdi)
.LVL205:
	je	.L167
	movl	$1, %edx
.LVL206:
.L183:
	movl	%ecx, %r9d
	subl	%eax, %r9d
	movl	%r9d, %ebp
	shrl	%ebp
	movl	%ebp, %r8d
	addl	%r8d, %r8d
	je	.L184
	.loc 1 358 0
	mov	%eax, %eax
	movapd	.LC13(%rip), %xmm1
	leaq	(%rdi,%rax,8), %rsi
.LVL207:
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L185:
	.loc 1 402 0
	movapd	(%rsi,%rax), %xmm0
	addl	$1, %ebx
	subpd	%xmm1, %xmm0
	movapd	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%ebp, %ebx
	jb	.L185
	addl	%r8d, %edx
	cmpl	%r8d, %r9d
	je	.L167
.L184:
	movslq	%edx, %rax
	movsd	.LC2(%rip), %xmm1
	leaq	(%rdi,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L186:
	movsd	(%rax), %xmm0
	addl	$1, %edx
.LVL208:
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$8, %rax
	cmpl	%ecx, %edx
	jl	.L186
	.loc 1 411 0
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	movl	%ecx, %eax
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL209:
.L223:
	.cfi_restore_state
.LBB36:
.LBB16:
.LBB23:
	.loc 1 358 0
	cmpq	%r14, %r15
	jb	.L143
	.p2align 4,,10
	.p2align 3
.L142:
	leaq	8(,%rbp,8), %rax
	leaq	(%rdi,%rax), %rdx
	leaq	(%rsi,%rax), %rax
.LVL210:
	.p2align 4,,10
	.p2align 3
.L150:
	.loc 1 330 0
	movq	(%rdx), %rbx
	.loc 1 331 0
	addl	$1, %r10d
	.loc 1 330 0
	movq	%rbx, -8(%rdx)
	.loc 1 331 0
	movq	(%rax), %rbx
	addq	$8, %rdx
	movq	%rbx, -8(%rax)
	addq	$8, %rax
	.loc 1 329 0
	cmpl	%r10d, %r8d
	jne	.L150
.LVL211:
	movl	%r9d, %r10d
	jmp	.L137
.LVL212:
.L224:
	.loc 1 358 0
	leaq	16(%rdx), %r13
	cmpq	%r13, %rbx
	ja	.L144
	jmp	.L142
.L225:
	cmpq	%r15, %rbx
	ja	.L191
	.p2align 4,,8
	jmp	.L142
.LVL213:
.L228:
.LBE23:
.LBE16:
.LBE36:
	.loc 1 402 0
	xorl	%edx, %edx
	.p2align 4,,6
	jmp	.L183
.LVL214:
.L226:
.LBB37:
.LBB29:
.LBB25:
	.loc 1 358 0
	movl	%r9d, %ebx
	.p2align 4,,6
	jmp	.L147
.LVL215:
.L227:
.LBE25:
.LBE29:
.LBE37:
	.loc 1 401 0
	xorl	%edx, %edx
	.p2align 4,,4
	jmp	.L177
	.cfi_endproc
.LFE47:
	.size	fix_lon, .-fix_lon
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC14:
	.string	"nearest_index: array must be monotonically increasing"
	.text
	.p2align 4,,15
.globl nearest_index
	.type	nearest_index, @function
nearest_index:
.LFB34:
	.loc 1 74 0
	.cfi_startproc
.LVL216:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 78 0
	cmpl	$1, %esi
	jle	.L252
	.loc 1 79 0
	movsd	(%rdi), %xmm2
.LBB40:
.LBB41:
	.loc 1 54 0
	movq	%rdi, %rax
	movl	$1, %edx
.LBE41:
.LBE40:
	.loc 1 79 0
	ucomisd	8(%rdi), %xmm2
	ja	.L232
.LVL217:
.L234:
	.loc 1 78 0
	addl	$1, %edx
.LVL218:
	cmpl	%edx, %esi
	jle	.L231
	.loc 1 79 0
	movsd	8(%rax), %xmm1
	ucomisd	16(%rax), %xmm1
	seta	%cl
	addq	$8, %rax
	testb	%cl, %cl
	je	.L234
.LVL219:
.L232:
.LBB43:
.LBB42:
	.loc 1 50 0
	movq	stderr(%rip), %rdi
.LVL220:
	movl	$.LC14, %edx
	movl	$.LC11, %esi
.LVL221:
	xorl	%eax, %eax
	call	fprintf
.LVL222:
	.loc 1 54 0
	movl	$1, %edi
	call	exit
.LVL223:
	.p2align 4,,10
	.p2align 3
.L252:
.LBE42:
.LBE43:
	.loc 1 78 0
	movsd	(%rdi), %xmm2
.LVL224:
.L231:
	.loc 1 82 0
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm2
	ja	.L238
	.loc 1 84 0
	movslq	%esi, %rdx
	ucomisd	-8(%rdi,%rdx,8), %xmm0
	ja	.L239
	movl	$1, %ecx
	xorl	%edx, %edx
	jmp	.L240
.LVL225:
	.p2align 4,,10
	.p2align 3
.L253:
	.loc 1 90 0
	cmpl	%esi, %edx
	jge	.L238
	.loc 1 92 0
	movsd	8(%rdi), %xmm1
	.loc 1 91 0
	leal	1(%rdx), %r8d
.LVL226:
	.loc 1 92 0
	movl	$1, %ecx
.LVL227:
	ucomisd	%xmm0, %xmm1
	jb	.L242
.LVL228:
	.loc 1 94 0
	movapd	%xmm0, %xmm2
	movl	%r8d, %eax
	subsd	%xmm0, %xmm1
	subsd	(%rdi), %xmm2
	ucomisd	%xmm2, %xmm1
	cmova	%edx, %eax
	xorb	%cl, %cl
.LVL229:
.L242:
	addq	$8, %rdi
	movl	%r8d, %edx
.LVL230:
.L240:
	.loc 1 90 0
	testl	%ecx, %ecx
	jne	.L253
.LVL231:
.L238:
	.loc 1 101 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.LVL232:
	.p2align 4,,10
	.p2align 3
.L239:
	.cfi_restore_state
	.loc 1 85 0
	leal	-1(%rsi), %eax
.LVL233:
	jmp	.L238
	.cfi_endproc
.LFE34:
	.size	nearest_index, .-nearest_index
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Error from tokenize: to-be-parsed string is empty"
	.align 8
.LC16:
	.string	"Error from tokenize: number of variables exceeds limit"
	.align 8
.LC17:
	.string	"error from tokenize: variable name length exceeds limit during tokenization"
	.text
	.p2align 4,,15
.globl tokenize
	.type	tokenize, @function
tokenize:
.LFB35:
	.loc 1 107 0
	.cfi_startproc
.LVL234:
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
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.loc 1 112 0
	movq	%r9, 8(%rsp)
	call	strlen
.LVL235:
	.loc 1 113 0
	movq	%rbp, %rdi
	.loc 1 112 0
	movq	%rax, %r15
.LVL236:
	.loc 1 113 0
	call	strlen
.LVL237:
	.loc 1 115 0
	cmpb	$0, (%rbx)
	movq	8(%rsp), %r9
.LVL238:
	je	.L255
.LVL239:
	.loc 1 117 0
	xorl	%r8d, %r8d
	testq	%r15, %r15
	movl	$1, %r10d
	je	.L257
	.loc 1 121 0
	leaq	1(%rbp), %r11
.LBB50:
.LBB51:
	.loc 1 54 0
	mov	%r12d, %r12d
	xorl	%r10d, %r10d
	xorl	%r8d, %r8d
	xorl	%edi, %edi
.LBE51:
.LBE50:
	.loc 1 130 0
	mov	%r13d, %r13d
.LVL240:
	.p2align 4,,10
	.p2align 3
.L264:
	.loc 1 118 0
	movzbl	(%rbx,%rdi), %esi
	cmpb	$9, %sil
	je	.L258
	cmpb	$32, %sil
	je	.L258
.LVL241:
	.loc 1 120 0
	testq	%rax, %rax
	je	.L259
	.loc 1 121 0
	cmpb	0(%rbp), %sil
	movq	%r11, %rdx
	jne	.L261
	jmp	.L260
.LVL242:
	.p2align 4,,10
	.p2align 3
.L262:
	movzbl	(%rdx), %ecx
	addq	$1, %rdx
	cmpb	%cl, %sil
	je	.L260
.L261:
	.loc 1 120 0
	movq	%rdx, %rcx
	subq	%rbp, %rcx
	cmpq	%rcx, %rax
	ja	.L262
.L259:
.LVL243:
	.loc 1 134 0
	movq	%r10, %rdx
	leaq	(%r14,%r8), %rcx
	addq	$1, %r8
.LVL244:
	imulq	%r12, %rdx
	.loc 1 135 0
	cmpq	%r12, %r8
	.loc 1 134 0
	movb	%sil, (%rcx,%rdx)
	.loc 1 135 0
	jae	.L269
.LVL245:
	.p2align 4,,10
	.p2align 3
.L258:
	.loc 1 117 0
	addq	$1, %rdi
.LVL246:
	cmpq	%rdi, %r15
	ja	.L264
	imulq	%r10, %r12
.LVL247:
	addl	$1, %r10d
.LVL248:
	leaq	(%r12,%r8), %r8
.LVL249:
.L257:
	.loc 1 139 0
	movb	$0, (%r14,%r8)
	.loc 1 141 0
	movl	%r10d, (%r9)
	.loc 1 143 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL250:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL251:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL252:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL253:
	ret
.LVL254:
	.p2align 4,,10
	.p2align 3
.L260:
	.cfi_restore_state
	.loc 1 127 0
	testq	%r8, %r8
	je	.L258
	.loc 1 128 0
	movq	%r10, %rdx
	leaq	(%r14,%r8), %r8
	addq	$1, %r10
.LVL255:
	imulq	%r12, %rdx
	.loc 1 130 0
	cmpq	%r13, %r10
	.loc 1 128 0
	movb	$0, (%r8,%rdx)
	.loc 1 130 0
	jae	.L270
.LBB53:
.LBB54:
	.loc 1 54 0
	xorl	%r8d, %r8d
	jmp	.L258
.LVL256:
	.p2align 4,,10
	.p2align 3
.L255:
.LBE54:
.LBE53:
.LBB56:
.LBB52:
	.loc 1 50 0
	movl	$.LC15, %edx
.LVL257:
.L268:
.LBE52:
.LBE56:
.LBB57:
.LBB58:
	movq	stderr(%rip), %rdi
	movl	$.LC11, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL258:
	.loc 1 54 0
	movl	$1, %edi
	call	exit
.LVL259:
	.p2align 4,,10
	.p2align 3
.L269:
.LBE58:
.LBE57:
.LBB60:
.LBB55:
	.loc 1 50 0
	movl	$.LC17, %edx
	jmp	.L268
.LVL260:
.L270:
.LBE55:
.LBE60:
.LBB61:
.LBB59:
	movl	$.LC16, %edx
	jmp	.L268
.LBE59:
.LBE61:
	.cfi_endproc
.LFE35:
	.size	tokenize, .-tokenize
	.p2align 4,,15
.globl spherical_excess_area
	.type	spherical_excess_area, @function
spherical_excess_area:
.LFB50:
	.loc 1 478 0
	.cfi_startproc
.LVL261:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$232, %rsp
	.cfi_def_cfa_offset 272
	.loc 1 478 0
	movsd	%xmm0, 200(%rsp)
.LBB94:
.LBB95:
	.loc 1 209 0
	movsd	8(%rdi), %xmm0
.LVL262:
	movsd	%xmm0, 160(%rsp)
	call	cos
.LVL263:
	movsd	%xmm0, 144(%rsp)
	movsd	(%rbx), %xmm0
	movsd	%xmm0, 176(%rsp)
	call	cos
	movsd	144(%rsp), %xmm2
	mulsd	%xmm0, %xmm2
	.loc 1 210 0
	movsd	176(%rsp), %xmm0
	movsd	%xmm2, (%rsp)
	call	sin
	movsd	144(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	.loc 1 211 0
	movsd	160(%rsp), %xmm0
	movsd	%xmm1, 16(%rsp)
	call	sin
	movapd	%xmm0, %xmm5
.LVL264:
.LBE95:
.LBE94:
.LBB96:
.LBB97:
	.loc 1 209 0
	movsd	8(%r12), %xmm0
	movsd	%xmm5, 32(%rsp)
	movsd	%xmm0, 144(%rsp)
	call	cos
	movsd	%xmm0, 152(%rsp)
	movsd	(%r12), %xmm0
	movsd	%xmm0, 184(%rsp)
	call	cos
	movsd	152(%rsp), %xmm6
	mulsd	%xmm0, %xmm6
	.loc 1 210 0
	movsd	184(%rsp), %xmm0
	movsd	%xmm6, 48(%rsp)
	call	sin
	movsd	152(%rsp), %xmm7
	mulsd	%xmm0, %xmm7
	.loc 1 211 0
	movsd	144(%rsp), %xmm0
	movsd	%xmm7, 64(%rsp)
	call	sin
.LBE97:
.LBE96:
.LBB99:
.LBB100:
	.loc 1 209 0
	movsd	8(%rbp), %xmm9
.LBE100:
.LBE99:
.LBB102:
.LBB98:
	.loc 1 211 0
	movapd	%xmm0, %xmm8
.LVL265:
.LBE98:
.LBE102:
.LBB103:
.LBB101:
	.loc 1 209 0
	movapd	%xmm9, %xmm0
	movsd	%xmm9, 128(%rsp)
	movsd	%xmm8, 96(%rsp)
	call	cos
	movsd	0(%rbp), %xmm4
	movsd	%xmm0, 152(%rsp)
	movapd	%xmm4, %xmm0
	movsd	%xmm4, 80(%rsp)
	call	cos
	movsd	152(%rsp), %xmm3
	.loc 1 210 0
	movsd	80(%rsp), %xmm4
	.loc 1 209 0
	mulsd	%xmm0, %xmm3
	.loc 1 210 0
	movapd	%xmm4, %xmm0
	movsd	%xmm3, 112(%rsp)
	call	sin
	movsd	152(%rsp), %xmm4
	.loc 1 211 0
	movsd	128(%rsp), %xmm9
	.loc 1 210 0
	mulsd	%xmm0, %xmm4
	.loc 1 211 0
	movapd	%xmm9, %xmm0
	movsd	%xmm4, 80(%rsp)
	call	sin
.LVL266:
.LBE101:
.LBE103:
.LBB104:
.LBB105:
	.loc 1 451 0
	movsd	16(%rsp), %xmm1
	movsd	32(%rsp), %xmm5
	movsd	96(%rsp), %xmm8
	movapd	%xmm1, %xmm10
	movsd	64(%rsp), %xmm7
	movapd	%xmm5, %xmm9
	mulsd	%xmm8, %xmm10
	.loc 1 452 0
	movsd	(%rsp), %xmm2
	.loc 1 451 0
	mulsd	%xmm7, %xmm9
	.loc 1 452 0
	movsd	48(%rsp), %xmm6
	.loc 1 453 0
	mulsd	%xmm2, %xmm7
	.loc 1 452 0
	mulsd	%xmm2, %xmm8
	.loc 1 451 0
	subsd	%xmm9, %xmm10
.LVL267:
	.loc 1 452 0
	movapd	%xmm5, %xmm9
	.loc 1 456 0
	movsd	112(%rsp), %xmm3
	.loc 1 452 0
	mulsd	%xmm6, %xmm9
	.loc 1 453 0
	mulsd	%xmm1, %xmm6
	.loc 1 455 0
	movsd	80(%rsp), %xmm4
	.loc 1 461 0
	movq	$0, 216(%rsp)
	.loc 1 452 0
	subsd	%xmm8, %xmm9
.LVL268:
	.loc 1 455 0
	movapd	%xmm5, %xmm8
	.loc 1 453 0
	subsd	%xmm6, %xmm7
.LVL269:
	.loc 1 455 0
	movapd	%xmm1, %xmm6
	.loc 1 456 0
	mulsd	%xmm3, %xmm5
	.loc 1 457 0
	mulsd	%xmm3, %xmm1
	.loc 1 455 0
	mulsd	%xmm0, %xmm6
	.loc 1 456 0
	mulsd	%xmm2, %xmm0
	.loc 1 457 0
	mulsd	%xmm4, %xmm2
	.loc 1 455 0
	mulsd	%xmm4, %xmm8
	.loc 1 456 0
	subsd	%xmm0, %xmm5
	.loc 1 460 0
	movapd	%xmm10, %xmm0
	.loc 1 457 0
	subsd	%xmm1, %xmm2
	.loc 1 460 0
	movapd	%xmm9, %xmm1
	mulsd	%xmm10, %xmm0
	.loc 1 455 0
	subsd	%xmm8, %xmm6
.LVL270:
	.loc 1 460 0
	mulsd	%xmm9, %xmm1
	movapd	%xmm5, %xmm3
	mulsd	%xmm5, %xmm3
	addsd	%xmm1, %xmm0
	movapd	%xmm7, %xmm1
	mulsd	%xmm7, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm1
	mulsd	%xmm6, %xmm1
	addsd	%xmm3, %xmm1
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	sqrtsd	%xmm0, %xmm1
.LVL271:
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L273
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm5
.LVL272:
	mulsd	%xmm2, %xmm7
.LVL273:
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm7, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL274:
	movsd	%xmm0, 216(%rsp)
.LVL275:
	movsd	8(%rbx), %xmm0
.LVL276:
	movsd	%xmm0, 160(%rsp)
	movsd	(%rbx), %xmm0
	movsd	%xmm0, 176(%rsp)
	movsd	8(%r12), %xmm0
	movsd	%xmm0, 144(%rsp)
	movsd	(%r12), %xmm0
	movsd	%xmm0, 184(%rsp)
.LVL277:
.L273:
.LBE105:
.LBE104:
.LBB106:
.LBB107:
	.loc 1 209 0
	movsd	144(%rsp), %xmm0
	call	cos
	movsd	%xmm0, 152(%rsp)
	movsd	184(%rsp), %xmm0
	call	cos
	movsd	152(%rsp), %xmm2
	mulsd	%xmm0, %xmm2
	.loc 1 210 0
	movsd	184(%rsp), %xmm0
	movsd	%xmm2, (%rsp)
	call	sin
	movsd	152(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	.loc 1 211 0
	movsd	144(%rsp), %xmm0
	movsd	%xmm1, 16(%rsp)
	call	sin
	movapd	%xmm0, %xmm4
.LVL278:
.LBE107:
.LBE106:
.LBB108:
.LBB109:
	.loc 1 209 0
	movsd	8(%r13), %xmm0
	movsd	%xmm4, 80(%rsp)
	movsd	%xmm0, 152(%rsp)
	call	cos
	movsd	%xmm0, 168(%rsp)
	movsd	0(%r13), %xmm0
	movsd	%xmm0, 192(%rsp)
	call	cos
	movsd	168(%rsp), %xmm5
	mulsd	%xmm0, %xmm5
	.loc 1 210 0
	movsd	192(%rsp), %xmm0
	movsd	%xmm5, 32(%rsp)
	call	sin
	movsd	168(%rsp), %xmm6
	mulsd	%xmm0, %xmm6
	.loc 1 211 0
	movsd	152(%rsp), %xmm0
	movsd	%xmm6, 48(%rsp)
	call	sin
	movapd	%xmm0, %xmm7
.LVL279:
.LBE109:
.LBE108:
.LBB110:
.LBB111:
	.loc 1 209 0
	movsd	160(%rsp), %xmm0
	movsd	%xmm7, 64(%rsp)
	call	cos
	movsd	%xmm0, 168(%rsp)
	movsd	176(%rsp), %xmm0
	call	cos
	movsd	168(%rsp), %xmm3
	mulsd	%xmm0, %xmm3
	.loc 1 210 0
	movsd	176(%rsp), %xmm0
	movsd	%xmm3, 112(%rsp)
	call	sin
	movsd	168(%rsp), %xmm8
	mulsd	%xmm0, %xmm8
	.loc 1 211 0
	movsd	160(%rsp), %xmm0
	movsd	%xmm8, 96(%rsp)
	call	sin
.LVL280:
.LBE111:
.LBE110:
.LBB112:
.LBB113:
	.loc 1 451 0
	movsd	16(%rsp), %xmm1
	movsd	80(%rsp), %xmm4
	movsd	64(%rsp), %xmm7
	movapd	%xmm1, %xmm10
	movsd	48(%rsp), %xmm6
	movapd	%xmm4, %xmm9
	mulsd	%xmm7, %xmm10
	.loc 1 452 0
	movsd	(%rsp), %xmm2
	.loc 1 451 0
	mulsd	%xmm6, %xmm9
	.loc 1 452 0
	movsd	32(%rsp), %xmm5
	.loc 1 453 0
	mulsd	%xmm2, %xmm6
	.loc 1 452 0
	mulsd	%xmm2, %xmm7
	.loc 1 451 0
	subsd	%xmm9, %xmm10
.LVL281:
	.loc 1 452 0
	movapd	%xmm4, %xmm9
	.loc 1 456 0
	movsd	112(%rsp), %xmm3
	.loc 1 452 0
	mulsd	%xmm5, %xmm9
	.loc 1 453 0
	mulsd	%xmm1, %xmm5
	.loc 1 455 0
	movsd	96(%rsp), %xmm8
	.loc 1 461 0
	movq	$0, 208(%rsp)
	.loc 1 452 0
	subsd	%xmm7, %xmm9
.LVL282:
	.loc 1 455 0
	movapd	%xmm4, %xmm7
	.loc 1 453 0
	subsd	%xmm5, %xmm6
.LVL283:
	.loc 1 455 0
	movapd	%xmm1, %xmm5
	.loc 1 456 0
	mulsd	%xmm3, %xmm4
	.loc 1 457 0
	mulsd	%xmm3, %xmm1
	.loc 1 455 0
	mulsd	%xmm0, %xmm5
	.loc 1 456 0
	mulsd	%xmm2, %xmm0
	.loc 1 457 0
	mulsd	%xmm8, %xmm2
	.loc 1 455 0
	mulsd	%xmm8, %xmm7
	.loc 1 456 0
	subsd	%xmm0, %xmm4
	.loc 1 460 0
	movapd	%xmm10, %xmm0
	.loc 1 457 0
	subsd	%xmm1, %xmm2
	.loc 1 460 0
	movapd	%xmm9, %xmm1
	mulsd	%xmm10, %xmm0
	.loc 1 455 0
	subsd	%xmm7, %xmm5
.LVL284:
	.loc 1 460 0
	mulsd	%xmm9, %xmm1
	movapd	%xmm4, %xmm3
	mulsd	%xmm4, %xmm3
	addsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm1
	mulsd	%xmm6, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm5, %xmm1
	mulsd	%xmm5, %xmm1
	addsd	%xmm3, %xmm1
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	sqrtsd	%xmm0, %xmm1
.LVL285:
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L275
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm4
.LVL286:
	mulsd	%xmm2, %xmm6
.LVL287:
	mulsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm6, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL288:
	movsd	%xmm0, 208(%rsp)
.LVL289:
	movsd	8(%r12), %xmm0
.LVL290:
	movsd	%xmm0, 144(%rsp)
	movsd	(%r12), %xmm0
	movsd	%xmm0, 184(%rsp)
	movsd	8(%r13), %xmm0
	movsd	%xmm0, 152(%rsp)
	movsd	0(%r13), %xmm0
	movsd	%xmm0, 192(%rsp)
.LVL291:
.L275:
.LBE113:
.LBE112:
.LBB114:
.LBB115:
	.loc 1 209 0
	movsd	152(%rsp), %xmm0
	call	cos
	movsd	%xmm0, 160(%rsp)
	movsd	192(%rsp), %xmm0
	call	cos
	movsd	160(%rsp), %xmm2
	mulsd	%xmm0, %xmm2
	.loc 1 210 0
	movsd	192(%rsp), %xmm0
	movsd	%xmm2, (%rsp)
	call	sin
	movsd	160(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	.loc 1 211 0
	movsd	152(%rsp), %xmm0
	movsd	%xmm1, 16(%rsp)
	call	sin
	movapd	%xmm0, %xmm5
.LVL292:
.LBE115:
.LBE114:
.LBB116:
.LBB117:
	.loc 1 209 0
	movsd	8(%rbp), %xmm0
	movsd	%xmm5, 32(%rsp)
	movsd	%xmm0, 160(%rsp)
	call	cos
	movsd	%xmm0, 168(%rsp)
	movsd	0(%rbp), %xmm0
	movsd	%xmm0, 176(%rsp)
	call	cos
	movsd	168(%rsp), %xmm6
	mulsd	%xmm0, %xmm6
	.loc 1 210 0
	movsd	176(%rsp), %xmm0
	movsd	%xmm6, 48(%rsp)
	call	sin
	movsd	168(%rsp), %xmm7
	mulsd	%xmm0, %xmm7
	.loc 1 211 0
	movsd	160(%rsp), %xmm0
	movsd	%xmm7, 64(%rsp)
	call	sin
	movapd	%xmm0, %xmm8
.LVL293:
.LBE117:
.LBE116:
.LBB118:
.LBB119:
	.loc 1 209 0
	movsd	144(%rsp), %xmm0
	movsd	%xmm8, 96(%rsp)
	call	cos
	movsd	%xmm0, 168(%rsp)
	movsd	184(%rsp), %xmm0
	call	cos
	movsd	168(%rsp), %xmm3
	mulsd	%xmm0, %xmm3
	.loc 1 210 0
	movsd	184(%rsp), %xmm0
	movsd	%xmm3, 112(%rsp)
	call	sin
	movsd	168(%rsp), %xmm4
	mulsd	%xmm0, %xmm4
	.loc 1 211 0
	movsd	144(%rsp), %xmm0
	movsd	%xmm4, 80(%rsp)
	call	sin
.LVL294:
.LBE119:
.LBE118:
.LBB120:
.LBB121:
	.loc 1 451 0
	movsd	16(%rsp), %xmm1
	movsd	32(%rsp), %xmm5
	movsd	96(%rsp), %xmm8
	movapd	%xmm1, %xmm10
	movsd	64(%rsp), %xmm7
	movapd	%xmm5, %xmm9
	mulsd	%xmm8, %xmm10
	.loc 1 452 0
	movsd	(%rsp), %xmm2
	.loc 1 451 0
	mulsd	%xmm7, %xmm9
	.loc 1 452 0
	movsd	48(%rsp), %xmm6
	.loc 1 453 0
	mulsd	%xmm2, %xmm7
	.loc 1 452 0
	mulsd	%xmm2, %xmm8
	.loc 1 451 0
	subsd	%xmm9, %xmm10
.LVL295:
	.loc 1 452 0
	movapd	%xmm5, %xmm9
	.loc 1 456 0
	movsd	112(%rsp), %xmm3
	.loc 1 452 0
	mulsd	%xmm6, %xmm9
	.loc 1 453 0
	mulsd	%xmm1, %xmm6
	.loc 1 455 0
	movsd	80(%rsp), %xmm4
	.loc 1 461 0
	movq	$0, 184(%rsp)
	.loc 1 452 0
	subsd	%xmm8, %xmm9
.LVL296:
	.loc 1 455 0
	movapd	%xmm5, %xmm8
	.loc 1 453 0
	subsd	%xmm6, %xmm7
.LVL297:
	.loc 1 455 0
	movapd	%xmm1, %xmm6
	.loc 1 456 0
	mulsd	%xmm3, %xmm5
	.loc 1 457 0
	mulsd	%xmm3, %xmm1
	.loc 1 455 0
	mulsd	%xmm0, %xmm6
	.loc 1 456 0
	mulsd	%xmm2, %xmm0
	.loc 1 457 0
	mulsd	%xmm4, %xmm2
	.loc 1 455 0
	mulsd	%xmm4, %xmm8
	.loc 1 456 0
	subsd	%xmm0, %xmm5
	.loc 1 460 0
	movapd	%xmm10, %xmm0
	.loc 1 457 0
	subsd	%xmm1, %xmm2
	.loc 1 460 0
	movapd	%xmm9, %xmm1
	mulsd	%xmm10, %xmm0
	.loc 1 455 0
	subsd	%xmm8, %xmm6
.LVL298:
	.loc 1 460 0
	mulsd	%xmm9, %xmm1
	movapd	%xmm5, %xmm3
	mulsd	%xmm5, %xmm3
	addsd	%xmm1, %xmm0
	movapd	%xmm7, %xmm1
	mulsd	%xmm7, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm1
	mulsd	%xmm6, %xmm1
	addsd	%xmm3, %xmm1
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm1
	mulsd	%xmm1, %xmm0
	sqrtsd	%xmm0, %xmm1
.LVL299:
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L277
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm5
.LVL300:
	mulsd	%xmm2, %xmm7
.LVL301:
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm7, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL302:
	movsd	%xmm0, 184(%rsp)
.LVL303:
	movsd	8(%rbp), %xmm0
.LVL304:
	movsd	%xmm0, 160(%rsp)
	movsd	0(%rbp), %xmm0
	movsd	%xmm0, 176(%rsp)
	movsd	8(%r13), %xmm0
	movsd	%xmm0, 152(%rsp)
	movsd	0(%r13), %xmm0
	movsd	%xmm0, 192(%rsp)
.LVL305:
.L277:
.LBE121:
.LBE120:
.LBB122:
.LBB123:
	.loc 1 209 0
	movsd	160(%rsp), %xmm0
	call	cos
	movsd	%xmm0, 144(%rsp)
	movsd	176(%rsp), %xmm0
	call	cos
	movsd	144(%rsp), %xmm2
	mulsd	%xmm0, %xmm2
	.loc 1 210 0
	movsd	176(%rsp), %xmm0
	movsd	%xmm2, (%rsp)
	call	sin
	movsd	144(%rsp), %xmm1
	mulsd	%xmm0, %xmm1
	.loc 1 211 0
	movsd	160(%rsp), %xmm0
	movsd	%xmm1, 16(%rsp)
	call	sin
	movapd	%xmm0, %xmm5
.LVL306:
.LBE123:
.LBE122:
.LBB124:
.LBB125:
	.loc 1 209 0
	movsd	152(%rsp), %xmm0
	movsd	%xmm5, 32(%rsp)
	call	cos
	movsd	%xmm0, 144(%rsp)
	movsd	192(%rsp), %xmm0
	call	cos
	movsd	144(%rsp), %xmm6
	mulsd	%xmm0, %xmm6
	.loc 1 210 0
	movsd	192(%rsp), %xmm0
	movsd	%xmm6, 48(%rsp)
	call	sin
	movsd	144(%rsp), %xmm7
	mulsd	%xmm0, %xmm7
	.loc 1 211 0
	movsd	152(%rsp), %xmm0
	movsd	%xmm7, 64(%rsp)
	call	sin
.LBE125:
.LBE124:
.LBB127:
.LBB128:
	.loc 1 209 0
	movsd	8(%rbx), %xmm9
.LBE128:
.LBE127:
.LBB130:
.LBB126:
	.loc 1 211 0
	movapd	%xmm0, %xmm8
.LVL307:
.LBE126:
.LBE130:
.LBB131:
.LBB129:
	.loc 1 209 0
	movapd	%xmm9, %xmm0
	movsd	%xmm9, 128(%rsp)
	movsd	%xmm8, 96(%rsp)
	call	cos
	movsd	(%rbx), %xmm4
	movsd	%xmm0, 144(%rsp)
	movapd	%xmm4, %xmm0
	movsd	%xmm4, 80(%rsp)
	call	cos
	movsd	144(%rsp), %xmm3
	.loc 1 210 0
	movsd	80(%rsp), %xmm4
	.loc 1 209 0
	mulsd	%xmm0, %xmm3
	.loc 1 210 0
	movapd	%xmm4, %xmm0
	movsd	%xmm3, 112(%rsp)
	call	sin
	movsd	144(%rsp), %xmm4
	.loc 1 211 0
	movsd	128(%rsp), %xmm9
	.loc 1 210 0
	mulsd	%xmm0, %xmm4
	.loc 1 211 0
	movapd	%xmm9, %xmm0
	movsd	%xmm4, 80(%rsp)
	call	sin
.LVL308:
.LBE129:
.LBE131:
.LBB132:
.LBB133:
	.loc 1 451 0
	movsd	16(%rsp), %xmm1
	movsd	32(%rsp), %xmm5
	movsd	96(%rsp), %xmm8
	movapd	%xmm1, %xmm10
	movsd	64(%rsp), %xmm7
	movapd	%xmm5, %xmm9
	mulsd	%xmm8, %xmm10
	.loc 1 452 0
	movsd	(%rsp), %xmm2
	.loc 1 451 0
	mulsd	%xmm7, %xmm9
	.loc 1 452 0
	movsd	48(%rsp), %xmm6
	.loc 1 453 0
	mulsd	%xmm2, %xmm7
	.loc 1 452 0
	mulsd	%xmm2, %xmm8
	.loc 1 451 0
	subsd	%xmm9, %xmm10
.LVL309:
	.loc 1 452 0
	movapd	%xmm5, %xmm9
	.loc 1 456 0
	movsd	112(%rsp), %xmm3
	.loc 1 452 0
	mulsd	%xmm6, %xmm9
	.loc 1 453 0
	mulsd	%xmm1, %xmm6
	.loc 1 455 0
	movsd	80(%rsp), %xmm4
	.loc 1 452 0
	subsd	%xmm8, %xmm9
.LVL310:
	.loc 1 455 0
	movapd	%xmm5, %xmm8
	.loc 1 453 0
	subsd	%xmm6, %xmm7
.LVL311:
	.loc 1 455 0
	movapd	%xmm1, %xmm6
	.loc 1 456 0
	mulsd	%xmm3, %xmm5
	.loc 1 457 0
	mulsd	%xmm3, %xmm1
	.loc 1 455 0
	mulsd	%xmm0, %xmm6
	.loc 1 456 0
	mulsd	%xmm2, %xmm0
	.loc 1 457 0
	mulsd	%xmm4, %xmm2
	.loc 1 455 0
	mulsd	%xmm4, %xmm8
	.loc 1 456 0
	subsd	%xmm0, %xmm5
	.loc 1 460 0
	movapd	%xmm9, %xmm0
	.loc 1 457 0
	subsd	%xmm1, %xmm2
	.loc 1 460 0
	movapd	%xmm10, %xmm1
	mulsd	%xmm9, %xmm0
	.loc 1 455 0
	subsd	%xmm8, %xmm6
.LVL312:
	.loc 1 460 0
	mulsd	%xmm10, %xmm1
	movapd	%xmm5, %xmm3
	mulsd	%xmm5, %xmm3
	addsd	%xmm0, %xmm1
	movapd	%xmm7, %xmm0
	mulsd	%xmm7, %xmm0
	addsd	%xmm0, %xmm1
	movapd	%xmm6, %xmm0
	mulsd	%xmm6, %xmm0
	addsd	%xmm3, %xmm0
	movapd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm3
	addsd	%xmm3, %xmm0
	.loc 1 461 0
	xorpd	%xmm3, %xmm3
	.loc 1 460 0
	mulsd	%xmm0, %xmm1
	sqrtsd	%xmm1, %xmm1
.LVL313:
	.loc 1 461 0
	ucomisd	%xmm3, %xmm1
	jbe	.L279
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm5
.LVL314:
	mulsd	%xmm2, %xmm7
.LVL315:
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm7, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL316:
	movapd	%xmm0, %xmm3
.LVL317:
.L279:
	movsd	216(%rsp), %xmm0
	addsd	208(%rsp), %xmm0
	addsd	184(%rsp), %xmm0
	addsd	%xmm3, %xmm0
	subsd	.LC2(%rip), %xmm0
	mulsd	200(%rsp), %xmm0
	mulsd	200(%rsp), %xmm0
.LVL318:
.LBE133:
.LBE132:
	.loc 1 510 0
	addq	$232, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL319:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL320:
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL321:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL322:
	ret
	.cfi_endproc
.LFE50:
	.size	spherical_excess_area, .-spherical_excess_area
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1413754136
	.long	1074340347
	.align 8
.LC2:
	.long	1413754136
	.long	1075388923
	.align 8
.LC3:
	.long	1413754136
	.long	-1073143301
	.align 8
.LC4:
	.long	0
	.long	1096306094
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC5:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 16
.LC6:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	3654794683
	.long	1037794527
	.align 8
.LC8:
	.long	0
	.long	-1075838976
	.align 8
.LC9:
	.long	0
	.long	1071644672
	.align 8
.LC12:
	.long	1205121805
	.long	1073291770
	.section	.rodata.cst16
	.align 16
.LC13:
	.long	1413754136
	.long	1075388923
	.long	1413754136
	.long	1075388923
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LVL1-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LVL1-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LVL4-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LVL4-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL8-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LVL5-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LVL5-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL13-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LVL14-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL21-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL25-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LVL14-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL21-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL25-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LVL14-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL15-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LVL14-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL21-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL22-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL25-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LVL30-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LVL30-.Ltext0
	.quad	.LVL35-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL36-.Ltext0
	.quad	.LVL37-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LVL30-.Ltext0
	.quad	.LVL35-1-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LVL31-.Ltext0
	.quad	.LVL35-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL38-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST19:
	.quad	.LVL39-.Ltext0
	.quad	.LVL40-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL40-.Ltext0
	.quad	.LVL43-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST20:
	.quad	.LVL39-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL42-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST21:
	.quad	.LVL39-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL42-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST22:
	.quad	.LVL39-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL42-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST23:
	.quad	.LVL39-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LVL47-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL48-.Ltext0
	.quad	.LVL64-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST25:
	.quad	.LVL47-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL49-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST26:
	.quad	.LVL47-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL49-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST27:
	.quad	.LVL47-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST28:
	.quad	.LVL47-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL62-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL51-1-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0xa
	.byte	0x76
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL55-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0xa
	.byte	0x76
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL52-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL56-.Ltext0
	.quad	.LVL58-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL61-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LVL49-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL56-.Ltext0
	.quad	.LVL58-1-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL49-.Ltext0
	.quad	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL56-.Ltext0
	.quad	.LVL57-.Ltext0
	.value	0x5
	.byte	0x7e
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-1-.Ltext0
	.value	0x7
	.byte	0x7e
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0x38
	.byte	0x1c
	.quad	.LVL59-.Ltext0
	.quad	.LVL60-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL68-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL67-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL69-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL67-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL69-.Ltext0
	.quad	.LVL87-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST36:
	.quad	.LVL67-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL84-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST37:
	.quad	.LVL67-.Ltext0
	.quad	.LVL69-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL73-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL84-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST38:
	.quad	.LVL69-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL71-1-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0xa
	.byte	0x76
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL75-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0xa
	.byte	0x76
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST39:
	.quad	.LVL69-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL72-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL76-.Ltext0
	.quad	.LVL80-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL83-.Ltext0
	.quad	.LVL85-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST40:
	.quad	.LVL69-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL70-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL76-.Ltext0
	.quad	.LVL80-1-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST41:
	.quad	.LVL69-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL76-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x5
	.byte	0x7e
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-1-.Ltext0
	.value	0x7
	.byte	0x7e
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x22
	.byte	0x38
	.byte	0x1c
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST42:
	.quad	.LVL89-.Ltext0
	.quad	.LVL91-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST43:
	.quad	.LVL89-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL90-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST44:
	.quad	.LVL89-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL92-.Ltext0
	.quad	.LVL94-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST45:
	.quad	.LVL89-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL92-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST46:
	.quad	.LVL89-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL92-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST47:
	.quad	.LVL89-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL92-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST48:
	.quad	.LVL89-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST49:
	.quad	.LVL98-.Ltext0
	.quad	.LVL100-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL100-.Ltext0
	.quad	.LVL106-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST50:
	.quad	.LVL99-.Ltext0
	.quad	.LVL101-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL102-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST51:
	.quad	.LVL102-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL103-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL104-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL105-.Ltext0
	.quad	.LFE52-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST52:
	.quad	.LVL112-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST53:
	.quad	.LVL112-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST54:
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL117-1-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST55:
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL117-1-.Ltext0
	.quad	.LVL121-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST56:
	.quad	.LVL122-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL123-.Ltext0
	.quad	.LVL127-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST57:
	.quad	.LVL122-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL124-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST58:
	.quad	.LVL122-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL124-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST59:
	.quad	.LVL122-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL125-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST60:
	.quad	.LVL130-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL131-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST61:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL132-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST62:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL132-.Ltext0
	.quad	.LVL145-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST63:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL132-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST64:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0x0
	.quad	0x0
.LLST65:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL132-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST66:
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL136-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x5
	.byte	0x76
	.sleb128 0
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL140-.Ltext0
	.quad	.LVL142-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST67:
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL137-.Ltext0
	.quad	.LVL141-.Ltext0
	.value	0x5
	.byte	0x7c
	.sleb128 0
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL141-.Ltext0
	.quad	.LVL142-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST68:
	.quad	.LVL138-.Ltext0
	.quad	.LVL141-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST69:
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL139-.Ltext0
	.quad	.LVL142-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST70:
	.quad	.LVL130-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL134-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -76
	.quad	0x0
	.quad	0x0
.LLST71:
	.quad	.LVL147-.Ltext0
	.quad	.LVL148-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL148-.Ltext0
	.quad	.LVL149-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST72:
	.quad	.LVL150-.Ltext0
	.quad	.LVL164-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL165-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL185-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL150-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL202-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL209-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST74:
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST75:
	.quad	.LVL150-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL202-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL209-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST76:
	.quad	.LVL163-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL165-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL168-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL169-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL191-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST77:
	.quad	.LVL194-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL202-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL215-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST78:
	.quad	.LVL150-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL153-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL158-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL161-.Ltext0
	.quad	.LVL162-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL162-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL163-.Ltext0
	.quad	.LVL165-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL179-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x3
	.byte	0x79
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL188-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL189-.Ltext0
	.quad	.LVL191-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL191-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL195-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL200-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL203-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL205-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x3
	.byte	0x79
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL215-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST79:
	.quad	.LVL150-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL153-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL156-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL158-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL172-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL177-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	.LVL180-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL190-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL209-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL215-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST80:
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0xf
	.byte	0x72
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x72
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL156-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0xf
	.byte	0x78
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x78
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL172-.Ltext0
	.quad	.LVL175-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL175-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0xf
	.byte	0x78
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x78
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL177-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0xd
	.byte	0x72
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x72
	.sleb128 1
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL180-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0xf
	.byte	0x78
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x78
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL209-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0xf
	.byte	0x78
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x78
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0xf
	.byte	0x78
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x78
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST81:
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL157-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL172-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL174-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL180-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL181-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST82:
	.quad	.LVL182-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST83:
	.quad	.LVL182-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST84:
	.quad	.LVL182-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST85:
	.quad	.LVL182-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0x0
	.quad	0x0
.LLST86:
	.quad	.LVL182-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST87:
	.quad	.LVL182-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST88:
	.quad	.LVL182-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST89:
	.quad	.LVL173-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL178-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL209-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL214-.Ltext0
	.quad	.LVL215-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST90:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0xa
	.byte	0x7a
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST91:
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0xa
	.byte	0x78
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST92:
	.quad	.LVL165-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL170-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST93:
	.quad	.LVL216-.Ltext0
	.quad	.LVL222-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL223-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST94:
	.quad	.LVL216-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL223-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL232-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST95:
	.quad	.LVL216-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL223-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST96:
	.quad	.LVL225-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL228-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL230-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL233-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST97:
	.quad	.LVL216-.Ltext0
	.quad	.LVL217-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL223-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL226-.Ltext0
	.quad	.LVL230-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL230-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST98:
	.quad	.LVL225-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL230-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST99:
	.quad	.LVL219-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC14
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST100:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL235-1-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL254-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST101:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL235-1-.Ltext0
	.quad	.LVL251-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL254-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST102:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL235-1-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL254-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL259-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST103:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL235-1-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL254-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL259-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST104:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL235-1-.Ltext0
	.quad	.LVL252-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL254-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST105:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL238-.Ltext0
	.quad	.LVL258-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL259-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST106:
	.quad	.LVL239-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL246-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST107:
	.quad	.LVL234-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL244-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL255-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL260-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST108:
	.quad	.LVL234-.Ltext0
	.quad	.LVL240-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL245-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL260-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST109:
	.quad	.LVL236-.Ltext0
	.quad	.LVL237-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL237-1-.Ltext0
	.quad	.LVL253-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL254-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST110:
	.quad	.LVL243-.Ltext0
	.quad	.LVL245-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL254-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL260-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST111:
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST112:
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC15
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST113:
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC17
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST114:
	.quad	.LVL261-.Ltext0
	.quad	.LVL263-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL277-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST115:
	.quad	.LVL261-.Ltext0
	.quad	.LVL263-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL263-1-.Ltext0
	.quad	.LVL320-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST116:
	.quad	.LVL261-.Ltext0
	.quad	.LVL263-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL263-1-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST117:
	.quad	.LVL261-.Ltext0
	.quad	.LVL263-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL263-1-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST118:
	.quad	.LVL261-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL262-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST119:
	.quad	.LVL261-.Ltext0
	.quad	.LVL263-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL263-1-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST120:
	.quad	.LVL261-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL264-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST121:
	.quad	.LVL264-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST122:
	.quad	.LVL264-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL265-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST123:
	.quad	.LVL265-.Ltext0
	.quad	.LVL320-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST124:
	.quad	.LVL265-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL266-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST125:
	.quad	.LVL275-.Ltext0
	.quad	.LVL276-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL276-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
	.quad	0x0
	.quad	0x0
.LLST126:
	.quad	.LVL267-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST127:
	.quad	.LVL268-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST128:
	.quad	.LVL269-.Ltext0
	.quad	.LVL273-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST129:
	.quad	.LVL270-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST130:
	.quad	.LVL270-.Ltext0
	.quad	.LVL272-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST131:
	.quad	.LVL270-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST132:
	.quad	.LVL271-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST133:
	.quad	.LVL277-.Ltext0
	.quad	.LVL321-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST134:
	.quad	.LVL277-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL278-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST135:
	.quad	.LVL278-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST136:
	.quad	.LVL278-.Ltext0
	.quad	.LVL279-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL279-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST137:
	.quad	.LVL279-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST138:
	.quad	.LVL279-.Ltext0
	.quad	.LVL280-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL280-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST139:
	.quad	.LVL289-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL290-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -64
	.quad	0x0
	.quad	0x0
.LLST140:
	.quad	.LVL281-.Ltext0
	.quad	.LVL288-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST141:
	.quad	.LVL282-.Ltext0
	.quad	.LVL288-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST142:
	.quad	.LVL283-.Ltext0
	.quad	.LVL287-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST143:
	.quad	.LVL284-.Ltext0
	.quad	.LVL288-1-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST144:
	.quad	.LVL284-.Ltext0
	.quad	.LVL286-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST145:
	.quad	.LVL284-.Ltext0
	.quad	.LVL288-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST146:
	.quad	.LVL285-.Ltext0
	.quad	.LVL288-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST147:
	.quad	.LVL291-.Ltext0
	.quad	.LVL322-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST148:
	.quad	.LVL291-.Ltext0
	.quad	.LVL292-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL292-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST149:
	.quad	.LVL292-.Ltext0
	.quad	.LVL320-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST150:
	.quad	.LVL292-.Ltext0
	.quad	.LVL293-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL293-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST151:
	.quad	.LVL293-.Ltext0
	.quad	.LVL294-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL294-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST152:
	.quad	.LVL303-.Ltext0
	.quad	.LVL304-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL304-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0x0
	.quad	0x0
.LLST153:
	.quad	.LVL295-.Ltext0
	.quad	.LVL302-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST154:
	.quad	.LVL296-.Ltext0
	.quad	.LVL302-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST155:
	.quad	.LVL297-.Ltext0
	.quad	.LVL301-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST156:
	.quad	.LVL298-.Ltext0
	.quad	.LVL302-1-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST157:
	.quad	.LVL298-.Ltext0
	.quad	.LVL300-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST158:
	.quad	.LVL298-.Ltext0
	.quad	.LVL302-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST159:
	.quad	.LVL299-.Ltext0
	.quad	.LVL302-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST160:
	.quad	.LVL305-.Ltext0
	.quad	.LVL306-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL306-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST161:
	.quad	.LVL306-.Ltext0
	.quad	.LVL307-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL307-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST162:
	.quad	.LVL307-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST163:
	.quad	.LVL307-.Ltext0
	.quad	.LVL308-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL308-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST164:
	.quad	.LVL309-.Ltext0
	.quad	.LVL316-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST165:
	.quad	.LVL310-.Ltext0
	.quad	.LVL316-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST166:
	.quad	.LVL311-.Ltext0
	.quad	.LVL315-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST167:
	.quad	.LVL312-.Ltext0
	.quad	.LVL316-1-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST168:
	.quad	.LVL312-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST169:
	.quad	.LVL312-.Ltext0
	.quad	.LVL316-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST170:
	.quad	.LVL313-.Ltext0
	.quad	.LVL316-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.section	.debug_info
	.long	0x1676
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF125
	.byte	0x1
	.long	.LASF126
	.long	.LASF127
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd3
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8d
	.long	0x4d
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8e
	.long	0x4d
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x4
	.value	0x10f
	.long	0x23f
	.uleb128 0x8
	.long	.LASF13
	.byte	0x4
	.value	0x110
	.long	0x3f
	.sleb128 0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x4
	.value	0x115
	.long	0x8f
	.sleb128 8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.value	0x116
	.long	0x8f
	.sleb128 16
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.value	0x117
	.long	0x8f
	.sleb128 24
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.value	0x118
	.long	0x8f
	.sleb128 32
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.value	0x119
	.long	0x8f
	.sleb128 40
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.value	0x11a
	.long	0x8f
	.sleb128 48
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.value	0x11b
	.long	0x8f
	.sleb128 56
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.value	0x11c
	.long	0x8f
	.sleb128 64
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.value	0x11e
	.long	0x8f
	.sleb128 72
	.uleb128 0x8
	.long	.LASF23
	.byte	0x4
	.value	0x11f
	.long	0x8f
	.sleb128 80
	.uleb128 0x8
	.long	.LASF24
	.byte	0x4
	.value	0x120
	.long	0x8f
	.sleb128 88
	.uleb128 0x8
	.long	.LASF25
	.byte	0x4
	.value	0x122
	.long	0x277
	.sleb128 96
	.uleb128 0x8
	.long	.LASF26
	.byte	0x4
	.value	0x124
	.long	0x27d
	.sleb128 104
	.uleb128 0x8
	.long	.LASF27
	.byte	0x4
	.value	0x126
	.long	0x3f
	.sleb128 112
	.uleb128 0x8
	.long	.LASF28
	.byte	0x4
	.value	0x12a
	.long	0x3f
	.sleb128 116
	.uleb128 0x8
	.long	.LASF29
	.byte	0x4
	.value	0x12c
	.long	0x77
	.sleb128 120
	.uleb128 0x8
	.long	.LASF30
	.byte	0x4
	.value	0x130
	.long	0x62
	.sleb128 128
	.uleb128 0x8
	.long	.LASF31
	.byte	0x4
	.value	0x131
	.long	0x69
	.sleb128 130
	.uleb128 0x8
	.long	.LASF32
	.byte	0x4
	.value	0x132
	.long	0x283
	.sleb128 131
	.uleb128 0x8
	.long	.LASF33
	.byte	0x4
	.value	0x136
	.long	0x293
	.sleb128 136
	.uleb128 0x8
	.long	.LASF34
	.byte	0x4
	.value	0x13f
	.long	0x82
	.sleb128 144
	.uleb128 0x8
	.long	.LASF35
	.byte	0x4
	.value	0x148
	.long	0x8d
	.sleb128 152
	.uleb128 0x8
	.long	.LASF36
	.byte	0x4
	.value	0x149
	.long	0x8d
	.sleb128 160
	.uleb128 0x8
	.long	.LASF37
	.byte	0x4
	.value	0x14a
	.long	0x8d
	.sleb128 168
	.uleb128 0x8
	.long	.LASF38
	.byte	0x4
	.value	0x14b
	.long	0x8d
	.sleb128 176
	.uleb128 0x8
	.long	.LASF39
	.byte	0x4
	.value	0x14c
	.long	0x2d
	.sleb128 184
	.uleb128 0x8
	.long	.LASF40
	.byte	0x4
	.value	0x14e
	.long	0x3f
	.sleb128 192
	.uleb128 0x8
	.long	.LASF41
	.byte	0x4
	.value	0x150
	.long	0x299
	.sleb128 196
	.byte	0x0
	.uleb128 0x9
	.long	.LASF128
	.byte	0x4
	.byte	0xb4
	.uleb128 0xa
	.long	.LASF43
	.byte	0x18
	.byte	0x4
	.byte	0xba
	.long	0x277
	.uleb128 0xb
	.long	.LASF44
	.byte	0x4
	.byte	0xbb
	.long	0x277
	.sleb128 0
	.uleb128 0xb
	.long	.LASF45
	.byte	0x4
	.byte	0xbc
	.long	0x27d
	.sleb128 8
	.uleb128 0xb
	.long	.LASF46
	.byte	0x4
	.byte	0xc0
	.long	0x3f
	.sleb128 16
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x246
	.uleb128 0x6
	.byte	0x8
	.long	0xa3
	.uleb128 0xc
	.long	0x95
	.long	0x293
	.uleb128 0xd
	.long	0x38
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x23f
	.uleb128 0xc
	.long	0x95
	.long	0x2a9
	.uleb128 0xd
	.long	0x38
	.byte	0x13
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x2af
	.uleb128 0xe
	.long	0x95
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF48
	.uleb128 0xf
	.byte	0x1
	.long	.LASF91
	.byte	0x1
	.byte	0xcc
	.byte	0x1
	.byte	0x1
	.long	0x316
	.uleb128 0x10
	.long	.LASF49
	.byte	0x1
	.byte	0xcc
	.long	0x3f
	.uleb128 0x11
	.string	"lon"
	.byte	0x1
	.byte	0xcc
	.long	0x316
	.uleb128 0x11
	.string	"lat"
	.byte	0x1
	.byte	0xcc
	.long	0x316
	.uleb128 0x11
	.string	"x"
	.byte	0x1
	.byte	0xcc
	.long	0x321
	.uleb128 0x11
	.string	"y"
	.byte	0x1
	.byte	0xcc
	.long	0x321
	.uleb128 0x11
	.string	"z"
	.byte	0x1
	.byte	0xcc
	.long	0x321
	.uleb128 0x12
	.string	"n"
	.byte	0x1
	.byte	0xce
	.long	0x3f
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x31c
	.uleb128 0xe
	.long	0x2bb
	.uleb128 0x6
	.byte	0x8
	.long	0x2bb
	.uleb128 0x13
	.byte	0x1
	.long	.LASF52
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.long	0x2bb
	.quad	.LFB36
	.quad	.LFE36
	.byte	0x1
	.byte	0x9c
	.long	0x383
	.uleb128 0x14
	.long	.LASF49
	.byte	0x1
	.byte	0x95
	.long	0x3f
	.long	.LLST0
	.uleb128 0x15
	.long	.LASF50
	.byte	0x1
	.byte	0x95
	.long	0x316
	.byte	0x1
	.byte	0x54
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0x97
	.long	0x3f
	.long	.LLST1
	.uleb128 0x17
	.long	.LASF51
	.byte	0x1
	.byte	0x98
	.long	0x2bb
	.long	.LLST2
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF53
	.byte	0x1
	.byte	0xa8
	.byte	0x1
	.long	0x2bb
	.quad	.LFB37
	.quad	.LFE37
	.byte	0x1
	.byte	0x9c
	.long	0x3e1
	.uleb128 0x14
	.long	.LASF49
	.byte	0x1
	.byte	0xa8
	.long	0x3f
	.long	.LLST3
	.uleb128 0x14
	.long	.LASF50
	.byte	0x1
	.byte	0xa8
	.long	0x316
	.long	.LLST4
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0xaa
	.long	0x3f
	.long	.LLST5
	.uleb128 0x17
	.long	.LASF54
	.byte	0x1
	.byte	0xab
	.long	0x2bb
	.long	.LLST6
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF55
	.byte	0x1
	.byte	0xba
	.byte	0x1
	.long	0x2bb
	.quad	.LFB38
	.quad	.LFE38
	.byte	0x1
	.byte	0x9c
	.long	0x43b
	.uleb128 0x15
	.long	.LASF49
	.byte	0x1
	.byte	0xba
	.long	0x3f
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.long	.LASF50
	.byte	0x1
	.byte	0xba
	.long	0x316
	.byte	0x1
	.byte	0x54
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0xbc
	.long	0x3f
	.long	.LLST7
	.uleb128 0x17
	.long	.LASF56
	.byte	0x1
	.byte	0xbd
	.long	0x2bb
	.long	.LLST8
	.byte	0x0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF58
	.byte	0x1
	.value	0x147
	.byte	0x1
	.long	0x3f
	.byte	0x1
	.long	0x479
	.uleb128 0x19
	.string	"x"
	.byte	0x1
	.value	0x147
	.long	0x321
	.uleb128 0x19
	.string	"y"
	.byte	0x1
	.value	0x147
	.long	0x321
	.uleb128 0x19
	.string	"n"
	.byte	0x1
	.value	0x147
	.long	0x3f
	.uleb128 0x1a
	.long	.LASF57
	.byte	0x1
	.value	0x147
	.long	0x3f
	.byte	0x0
	.uleb128 0x1b
	.long	0x43b
	.quad	.LFB44
	.quad	.LFE44
	.byte	0x1
	.byte	0x9c
	.long	0x4b9
	.uleb128 0x1c
	.long	0x44e
	.long	.LLST9
	.uleb128 0x1c
	.long	0x458
	.long	.LLST10
	.uleb128 0x1c
	.long	0x462
	.long	.LLST11
	.uleb128 0x1c
	.long	0x46c
	.long	.LLST12
	.byte	0x0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF59
	.byte	0x1
	.value	0x151
	.byte	0x1
	.long	0x3f
	.byte	0x1
	.long	0x519
	.uleb128 0x19
	.string	"x"
	.byte	0x1
	.value	0x151
	.long	0x321
	.uleb128 0x19
	.string	"y"
	.byte	0x1
	.value	0x151
	.long	0x321
	.uleb128 0x19
	.string	"n"
	.byte	0x1
	.value	0x151
	.long	0x3f
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.value	0x151
	.long	0x3f
	.uleb128 0x1a
	.long	.LASF61
	.byte	0x1
	.value	0x151
	.long	0x2bb
	.uleb128 0x1a
	.long	.LASF62
	.byte	0x1
	.value	0x151
	.long	0x2bb
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.value	0x153
	.long	0x3f
	.byte	0x0
	.uleb128 0x1b
	.long	0x4b9
	.quad	.LFB45
	.quad	.LFE45
	.byte	0x1
	.byte	0x9c
	.long	0x566
	.uleb128 0x1e
	.long	0x4cc
	.byte	0x1
	.byte	0x55
	.uleb128 0x1e
	.long	0x4d6
	.byte	0x1
	.byte	0x54
	.uleb128 0x1e
	.long	0x4e0
	.byte	0x1
	.byte	0x51
	.uleb128 0x1e
	.long	0x4ea
	.byte	0x1
	.byte	0x52
	.uleb128 0x1e
	.long	0x4f6
	.byte	0x1
	.byte	0x61
	.uleb128 0x1e
	.long	0x502
	.byte	0x1
	.byte	0x62
	.uleb128 0x1f
	.long	0x50e
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF69
	.byte	0x1
	.value	0x206
	.byte	0x1
	.quad	.LFB51
	.quad	.LFE51
	.byte	0x1
	.byte	0x9c
	.long	0x5ad
	.uleb128 0x21
	.string	"p1"
	.byte	0x1
	.value	0x206
	.long	0x316
	.byte	0x1
	.byte	0x55
	.uleb128 0x21
	.string	"p2"
	.byte	0x1
	.value	0x206
	.long	0x316
	.byte	0x1
	.byte	0x54
	.uleb128 0x21
	.string	"e"
	.byte	0x1
	.value	0x206
	.long	0x321
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF63
	.byte	0x1
	.byte	0xfb
	.byte	0x1
	.long	0x2bb
	.quad	.LFB41
	.quad	.LFE41
	.byte	0x1
	.byte	0x9c
	.long	0x626
	.uleb128 0x14
	.long	.LASF64
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST13
	.uleb128 0x14
	.long	.LASF65
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST14
	.uleb128 0x14
	.long	.LASF66
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST15
	.uleb128 0x14
	.long	.LASF67
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST16
	.uleb128 0x16
	.string	"dx"
	.byte	0x1
	.byte	0xfd
	.long	0x2bb
	.long	.LLST17
	.uleb128 0x22
	.long	.LASF68
	.byte	0x1
	.byte	0xfe
	.long	0x2bb
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF70
	.byte	0x1
	.value	0x224
	.byte	0x1
	.quad	.LFB53
	.quad	.LFE53
	.byte	0x1
	.byte	0x9c
	.long	0x6d5
	.uleb128 0x23
	.long	.LASF49
	.byte	0x1
	.value	0x224
	.long	0x3f
	.long	.LLST18
	.uleb128 0x24
	.string	"lon"
	.byte	0x1
	.value	0x224
	.long	0x316
	.long	.LLST19
	.uleb128 0x24
	.string	"lat"
	.byte	0x1
	.value	0x224
	.long	0x316
	.long	.LLST20
	.uleb128 0x23
	.long	.LASF71
	.byte	0x1
	.value	0x224
	.long	0x321
	.long	.LLST21
	.uleb128 0x23
	.long	.LASF72
	.byte	0x1
	.value	0x224
	.long	0x321
	.long	.LLST22
	.uleb128 0x25
	.long	.LASF73
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF74
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF75
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF76
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x26
	.string	"n"
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST23
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF77
	.byte	0x1
	.value	0x130
	.byte	0x1
	.long	0x2bb
	.quad	.LFB43
	.quad	.LFE43
	.byte	0x1
	.byte	0x9c
	.long	0x786
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x130
	.long	0x316
	.long	.LLST24
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x130
	.long	0x316
	.long	.LLST25
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x130
	.long	0x3f
	.long	.LLST26
	.uleb128 0x28
	.long	.LASF68
	.byte	0x1
	.value	0x132
	.long	0x2bb
	.long	.LLST27
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x133
	.long	0x3f
	.long	.LLST28
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x0
	.uleb128 0x26
	.string	"ip"
	.byte	0x1
	.value	0x136
	.long	0x3f
	.long	.LLST29
	.uleb128 0x26
	.string	"dx"
	.byte	0x1
	.value	0x137
	.long	0x2bb
	.long	.LLST30
	.uleb128 0x28
	.long	.LASF78
	.byte	0x1
	.value	0x138
	.long	0x2bb
	.long	.LLST31
	.uleb128 0x28
	.long	.LASF79
	.byte	0x1
	.value	0x138
	.long	0x2bb
	.long	.LLST32
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF80
	.byte	0x1
	.value	0x10f
	.byte	0x1
	.long	0x2bb
	.quad	.LFB42
	.quad	.LFE42
	.byte	0x1
	.byte	0x9c
	.long	0x84e
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x10f
	.long	0x316
	.long	.LLST33
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x10f
	.long	0x316
	.long	.LLST34
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x10f
	.long	0x3f
	.long	.LLST35
	.uleb128 0x28
	.long	.LASF68
	.byte	0x1
	.value	0x111
	.long	0x2bb
	.long	.LLST36
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x112
	.long	0x3f
	.long	.LLST37
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x40
	.uleb128 0x26
	.string	"ip"
	.byte	0x1
	.value	0x115
	.long	0x3f
	.long	.LLST38
	.uleb128 0x26
	.string	"dx"
	.byte	0x1
	.value	0x116
	.long	0x2bb
	.long	.LLST39
	.uleb128 0x28
	.long	.LASF78
	.byte	0x1
	.value	0x117
	.long	0x2bb
	.long	.LLST40
	.uleb128 0x28
	.long	.LASF79
	.byte	0x1
	.value	0x117
	.long	0x2bb
	.long	.LLST41
	.uleb128 0x1d
	.string	"dy"
	.byte	0x1
	.value	0x118
	.long	0x2bb
	.uleb128 0x1d
	.string	"dat"
	.byte	0x1
	.value	0x118
	.long	0x2bb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.long	0x2c2
	.quad	.LFB39
	.quad	.LFE39
	.byte	0x1
	.byte	0x9c
	.long	0x8a9
	.uleb128 0x1c
	.long	0x2d0
	.long	.LLST42
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST43
	.uleb128 0x1c
	.long	0x2e6
	.long	.LLST44
	.uleb128 0x1c
	.long	0x2f1
	.long	.LLST45
	.uleb128 0x1c
	.long	0x2fa
	.long	.LLST46
	.uleb128 0x1c
	.long	0x303
	.long	.LLST47
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST48
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF81
	.byte	0x1
	.value	0x212
	.byte	0x1
	.quad	.LFB52
	.quad	.LFE52
	.byte	0x1
	.byte	0x9c
	.long	0x8f6
	.uleb128 0x24
	.string	"e"
	.byte	0x1
	.value	0x212
	.long	0x321
	.long	.LLST49
	.uleb128 0x28
	.long	.LASF82
	.byte	0x1
	.value	0x214
	.long	0x2bb
	.long	.LLST50
	.uleb128 0x26
	.string	"k"
	.byte	0x1
	.value	0x215
	.long	0x3f
	.long	.LLST51
	.byte	0x0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF83
	.byte	0x1
	.value	0x1bd
	.byte	0x1
	.long	0x2bb
	.byte	0x1
	.long	0x985
	.uleb128 0x19
	.string	"v1"
	.byte	0x1
	.value	0x1bd
	.long	0x316
	.uleb128 0x19
	.string	"v2"
	.byte	0x1
	.value	0x1bd
	.long	0x316
	.uleb128 0x19
	.string	"v3"
	.byte	0x1
	.value	0x1bd
	.long	0x316
	.uleb128 0x25
	.long	.LASF84
	.byte	0x1
	.value	0x1bf
	.long	0x2bb
	.uleb128 0x1d
	.string	"px"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.uleb128 0x1d
	.string	"py"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.uleb128 0x1d
	.string	"pz"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.uleb128 0x1d
	.string	"qx"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.uleb128 0x1d
	.string	"qy"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.uleb128 0x1d
	.string	"qz"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.uleb128 0x1d
	.string	"ddd"
	.byte	0x1
	.value	0x1c0
	.long	0x2bb
	.byte	0x0
	.uleb128 0x1b
	.long	0x8f6
	.quad	.LFB49
	.quad	.LFE49
	.byte	0x1
	.byte	0x9c
	.long	0x9f0
	.uleb128 0x1e
	.long	0x909
	.byte	0x1
	.byte	0x55
	.uleb128 0x1e
	.long	0x914
	.byte	0x1
	.byte	0x54
	.uleb128 0x1e
	.long	0x91f
	.byte	0x1
	.byte	0x51
	.uleb128 0x2b
	.long	0x92a
	.uleb128 0x1f
	.long	0x936
	.byte	0x1
	.byte	0x69
	.uleb128 0x1f
	.long	0x941
	.byte	0x1
	.byte	0x67
	.uleb128 0x1f
	.long	0x94c
	.byte	0x1
	.byte	0x65
	.uleb128 0x1f
	.long	0x957
	.byte	0x1
	.byte	0x68
	.uleb128 0x2a
	.long	0x962
	.long	.LLST52
	.uleb128 0x2a
	.long	0x96d
	.long	.LLST53
	.uleb128 0x1f
	.long	0x978
	.byte	0x1
	.byte	0x62
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF85
	.byte	0x1
	.value	0x1a4
	.byte	0x1
	.long	0x2bb
	.quad	.LFB48
	.quad	.LFE48
	.byte	0x1
	.byte	0x9c
	.long	0xa4b
	.uleb128 0x24
	.string	"p1"
	.byte	0x1
	.value	0x1a4
	.long	0x321
	.long	.LLST54
	.uleb128 0x24
	.string	"p2"
	.byte	0x1
	.value	0x1a4
	.long	0x321
	.long	.LLST55
	.uleb128 0x25
	.long	.LASF86
	.byte	0x1
	.value	0x1a6
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF87
	.byte	0x1
	.value	0x1a6
	.long	0x2bb
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF88
	.byte	0x1
	.value	0x15f
	.byte	0x1
	.quad	.LFB46
	.quad	.LFE46
	.byte	0x1
	.byte	0x9c
	.long	0xaa4
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x15f
	.long	0x321
	.long	.LLST56
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x15f
	.long	0x321
	.long	.LLST57
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x15f
	.long	0x3f
	.long	.LLST58
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x161
	.long	0x3f
	.long	.LLST59
	.byte	0x0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF89
	.byte	0x1
	.byte	0xdc
	.byte	0x1
	.quad	.LFB40
	.quad	.LFE40
	.byte	0x1
	.byte	0x9c
	.long	0xb68
	.uleb128 0x2d
	.string	"np"
	.byte	0x1
	.byte	0xdc
	.long	0x3f
	.long	.LLST60
	.uleb128 0x2d
	.string	"x"
	.byte	0x1
	.byte	0xdc
	.long	0x316
	.long	.LLST61
	.uleb128 0x2d
	.string	"y"
	.byte	0x1
	.byte	0xdc
	.long	0x316
	.long	.LLST62
	.uleb128 0x2d
	.string	"z"
	.byte	0x1
	.byte	0xdc
	.long	0x316
	.long	.LLST63
	.uleb128 0x2d
	.string	"lon"
	.byte	0x1
	.byte	0xdc
	.long	0x321
	.long	.LLST64
	.uleb128 0x2d
	.string	"lat"
	.byte	0x1
	.byte	0xdc
	.long	0x321
	.long	.LLST65
	.uleb128 0x16
	.string	"xx"
	.byte	0x1
	.byte	0xdf
	.long	0x2bb
	.long	.LLST66
	.uleb128 0x16
	.string	"yy"
	.byte	0x1
	.byte	0xdf
	.long	0x2bb
	.long	.LLST67
	.uleb128 0x16
	.string	"zz"
	.byte	0x1
	.byte	0xdf
	.long	0x2bb
	.long	.LLST68
	.uleb128 0x17
	.long	.LASF86
	.byte	0x1
	.byte	0xe0
	.long	0x2bb
	.long	.LLST69
	.uleb128 0x22
	.long	.LASF90
	.byte	0x1
	.byte	0xe0
	.long	0x2bb
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0xe1
	.long	0x3f
	.long	.LLST70
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF92
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.byte	0x1
	.long	0xb82
	.uleb128 0x11
	.string	"msg"
	.byte	0x1
	.byte	0x30
	.long	0x2a9
	.byte	0x0
	.uleb128 0x1b
	.long	0xb68
	.quad	.LFB33
	.quad	.LFE33
	.byte	0x1
	.byte	0x9c
	.long	0xba7
	.uleb128 0x1c
	.long	0xb76
	.long	.LLST71
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF93
	.byte	0x1
	.value	0x166
	.byte	0x1
	.long	0x3f
	.quad	.LFB47
	.quad	.LFE47
	.byte	0x1
	.byte	0x9c
	.long	0xd4b
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x166
	.long	0x321
	.long	.LLST72
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x166
	.long	0x321
	.long	.LLST73
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x166
	.long	0x3f
	.long	.LLST74
	.uleb128 0x23
	.long	.LASF94
	.byte	0x1
	.value	0x166
	.long	0x2bb
	.long	.LLST75
	.uleb128 0x28
	.long	.LASF95
	.byte	0x1
	.value	0x168
	.long	0x2bb
	.long	.LLST76
	.uleb128 0x26
	.string	"dx"
	.byte	0x1
	.value	0x168
	.long	0x2bb
	.long	.LLST77
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.value	0x169
	.long	0x3f
	.long	.LLST78
	.uleb128 0x26
	.string	"nn"
	.byte	0x1
	.value	0x169
	.long	0x3f
	.long	.LLST79
	.uleb128 0x2e
	.long	.LASF96
	.byte	0x1
	.value	0x169
	.long	0x3f
	.byte	0x0
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x80
	.long	0xd01
	.uleb128 0x26
	.string	"im"
	.byte	0x1
	.value	0x174
	.long	0x3f
	.long	.LLST80
	.uleb128 0x26
	.string	"ip"
	.byte	0x1
	.value	0x174
	.long	0x3f
	.long	.LLST81
	.uleb128 0x30
	.long	0x4b9
	.quad	.LBB17
	.long	.Ldebug_ranges0+0xe0
	.byte	0x1
	.value	0x17a
	.long	0xcd3
	.uleb128 0x1c
	.long	0x502
	.long	.LLST82
	.uleb128 0x1c
	.long	0x4f6
	.long	.LLST83
	.uleb128 0x1c
	.long	0x4ea
	.long	.LLST84
	.uleb128 0x1c
	.long	0x4e0
	.long	.LLST85
	.uleb128 0x1c
	.long	0x4d6
	.long	.LLST86
	.uleb128 0x1c
	.long	0x4cc
	.long	.LLST87
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x130
	.uleb128 0x2a
	.long	0x50e
	.long	.LLST88
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	0x43b
	.quad	.LBB22
	.long	.Ldebug_ranges0+0x180
	.byte	0x1
	.value	0x177
	.uleb128 0x1c
	.long	0x46c
	.long	.LLST89
	.uleb128 0x32
	.long	0x462
	.uleb128 0x32
	.long	0x458
	.uleb128 0x32
	.long	0x44e
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.quad	.LBB31
	.quad	.LBE31
	.long	0xd35
	.uleb128 0x26
	.string	"im"
	.byte	0x1
	.value	0x181
	.long	0x3f
	.long	.LLST90
	.uleb128 0x26
	.string	"ip"
	.byte	0x1
	.value	0x181
	.long	0x3f
	.long	.LLST91
	.byte	0x0
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x1c0
	.uleb128 0x26
	.string	"dx"
	.byte	0x1
	.value	0x189
	.long	0x2bb
	.long	.LLST92
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF97
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.long	0x3f
	.quad	.LFB34
	.quad	.LFE34
	.byte	0x1
	.byte	0x9c
	.long	0xde3
	.uleb128 0x14
	.long	.LASF98
	.byte	0x1
	.byte	0x49
	.long	0x2bb
	.long	.LLST93
	.uleb128 0x14
	.long	.LASF99
	.byte	0x1
	.byte	0x49
	.long	0x316
	.long	.LLST94
	.uleb128 0x2d
	.string	"ia"
	.byte	0x1
	.byte	0x49
	.long	0x3f
	.long	.LLST95
	.uleb128 0x17
	.long	.LASF100
	.byte	0x1
	.byte	0x4b
	.long	0x3f
	.long	.LLST96
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.long	0x3f
	.long	.LLST97
	.uleb128 0x17
	.long	.LASF101
	.byte	0x1
	.byte	0x4c
	.long	0x3f
	.long	.LLST98
	.uleb128 0x34
	.long	0xb68
	.quad	.LBB40
	.long	.Ldebug_ranges0+0x200
	.byte	0x1
	.byte	0x50
	.uleb128 0x1c
	.long	0xb76
	.long	.LLST99
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF102
	.byte	0x1
	.byte	0x69
	.byte	0x1
	.quad	.LFB35
	.quad	.LFE35
	.byte	0x1
	.byte	0x9c
	.long	0xf22
	.uleb128 0x14
	.long	.LASF103
	.byte	0x1
	.byte	0x69
	.long	0xf22
	.long	.LLST100
	.uleb128 0x14
	.long	.LASF104
	.byte	0x1
	.byte	0x69
	.long	0x2a9
	.long	.LLST101
	.uleb128 0x14
	.long	.LASF105
	.byte	0x1
	.byte	0x69
	.long	0x46
	.long	.LLST102
	.uleb128 0x14
	.long	.LASF106
	.byte	0x1
	.byte	0x6a
	.long	0x46
	.long	.LLST103
	.uleb128 0x14
	.long	.LASF107
	.byte	0x1
	.byte	0x6a
	.long	0x8f
	.long	.LLST104
	.uleb128 0x14
	.long	.LASF108
	.byte	0x1
	.byte	0x6a
	.long	0xf27
	.long	.LLST105
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST106
	.uleb128 0x16
	.string	"j"
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST107
	.uleb128 0x17
	.long	.LASF109
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST108
	.uleb128 0x16
	.string	"len"
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST109
	.uleb128 0x22
	.long	.LASF110
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.uleb128 0x17
	.long	.LASF111
	.byte	0x1
	.byte	0x6d
	.long	0x3f
	.long	.LLST110
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0x6d
	.long	0x3f
	.long	.LLST111
	.uleb128 0x35
	.long	0xb68
	.quad	.LBB50
	.long	.Ldebug_ranges0+0x230
	.byte	0x1
	.byte	0x73
	.long	0xedc
	.uleb128 0x1c
	.long	0xb76
	.long	.LLST112
	.byte	0x0
	.uleb128 0x35
	.long	0xb68
	.quad	.LBB53
	.long	.Ldebug_ranges0+0x260
	.byte	0x1
	.byte	0x87
	.long	0xefd
	.uleb128 0x1c
	.long	0xb76
	.long	.LLST113
	.byte	0x0
	.uleb128 0x34
	.long	0xb68
	.quad	.LBB57
	.long	.Ldebug_ranges0+0x290
	.byte	0x1
	.byte	0x82
	.uleb128 0x1e
	.long	0xb76
	.byte	0xa
	.byte	0x3
	.quad	.LC16
	.byte	0x9f
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.long	0x2a9
	.uleb128 0xe
	.long	0xf2c
	.uleb128 0x6
	.byte	0x8
	.long	0x46
	.uleb128 0x27
	.byte	0x1
	.long	.LASF112
	.byte	0x1
	.value	0x1dc
	.byte	0x1
	.long	0x2bb
	.quad	.LFB50
	.quad	.LFE50
	.byte	0x1
	.byte	0x9c
	.long	0x161b
	.uleb128 0x23
	.long	.LASF113
	.byte	0x1
	.value	0x1dc
	.long	0x316
	.long	.LLST114
	.uleb128 0x23
	.long	.LASF114
	.byte	0x1
	.value	0x1dc
	.long	0x316
	.long	.LLST115
	.uleb128 0x23
	.long	.LASF115
	.byte	0x1
	.value	0x1dd
	.long	0x316
	.long	.LLST116
	.uleb128 0x23
	.long	.LASF116
	.byte	0x1
	.value	0x1dd
	.long	0x316
	.long	.LLST117
	.uleb128 0x23
	.long	.LASF117
	.byte	0x1
	.value	0x1dd
	.long	0x2bb
	.long	.LLST118
	.uleb128 0x36
	.long	.LASF68
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x1
	.byte	0x61
	.uleb128 0x36
	.long	.LASF118
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x3
	.byte	0x77
	.sleb128 216
	.uleb128 0x36
	.long	.LASF119
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x3
	.byte	0x77
	.sleb128 208
	.uleb128 0x36
	.long	.LASF120
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x3
	.byte	0x77
	.sleb128 184
	.uleb128 0x36
	.long	.LASF121
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x1
	.byte	0x64
	.uleb128 0x1d
	.string	"v1"
	.byte	0x1
	.value	0x1e0
	.long	0x161b
	.uleb128 0x1d
	.string	"v2"
	.byte	0x1
	.value	0x1e0
	.long	0x161b
	.uleb128 0x1d
	.string	"v3"
	.byte	0x1
	.value	0x1e0
	.long	0x161b
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB94
	.quad	.LBE94
	.byte	0x1
	.value	0x1e3
	.long	0x106e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST119
	.uleb128 0x38
	.quad	.LBB95
	.quad	.LBE95
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST120
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2c2
	.quad	.LBB96
	.long	.Ldebug_ranges0+0x2c0
	.byte	0x1
	.value	0x1e4
	.long	0x10b9
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST121
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x2f0
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST122
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2c2
	.quad	.LBB99
	.long	.Ldebug_ranges0+0x320
	.byte	0x1
	.value	0x1e5
	.long	0x1104
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST123
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x350
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST124
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x8f6
	.quad	.LBB104
	.quad	.LBE104
	.byte	0x1
	.value	0x1e6
	.long	0x118a
	.uleb128 0x32
	.long	0x91f
	.uleb128 0x32
	.long	0x914
	.uleb128 0x32
	.long	0x909
	.uleb128 0x38
	.quad	.LBB105
	.quad	.LBE105
	.uleb128 0x2a
	.long	0x92a
	.long	.LLST125
	.uleb128 0x2a
	.long	0x936
	.long	.LLST126
	.uleb128 0x2a
	.long	0x941
	.long	.LLST127
	.uleb128 0x2a
	.long	0x94c
	.long	.LLST128
	.uleb128 0x2a
	.long	0x957
	.long	.LLST129
	.uleb128 0x2a
	.long	0x962
	.long	.LLST130
	.uleb128 0x2a
	.long	0x96d
	.long	.LLST131
	.uleb128 0x2a
	.long	0x978
	.long	.LLST132
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB106
	.quad	.LBE106
	.byte	0x1
	.value	0x1e9
	.long	0x11e4
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST133
	.uleb128 0x38
	.quad	.LBB107
	.quad	.LBE107
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST134
	.uleb128 0x32
	.long	0x2d0
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB108
	.quad	.LBE108
	.byte	0x1
	.value	0x1ea
	.long	0x123f
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST135
	.uleb128 0x38
	.quad	.LBB109
	.quad	.LBE109
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST136
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB110
	.quad	.LBE110
	.byte	0x1
	.value	0x1eb
	.long	0x129a
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST137
	.uleb128 0x38
	.quad	.LBB111
	.quad	.LBE111
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST138
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x8f6
	.quad	.LBB112
	.quad	.LBE112
	.byte	0x1
	.value	0x1ec
	.long	0x1320
	.uleb128 0x32
	.long	0x91f
	.uleb128 0x32
	.long	0x914
	.uleb128 0x32
	.long	0x909
	.uleb128 0x38
	.quad	.LBB113
	.quad	.LBE113
	.uleb128 0x2a
	.long	0x92a
	.long	.LLST139
	.uleb128 0x2a
	.long	0x936
	.long	.LLST140
	.uleb128 0x2a
	.long	0x941
	.long	.LLST141
	.uleb128 0x2a
	.long	0x94c
	.long	.LLST142
	.uleb128 0x2a
	.long	0x957
	.long	.LLST143
	.uleb128 0x2a
	.long	0x962
	.long	.LLST144
	.uleb128 0x2a
	.long	0x96d
	.long	.LLST145
	.uleb128 0x2a
	.long	0x978
	.long	.LLST146
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB114
	.quad	.LBE114
	.byte	0x1
	.value	0x1ef
	.long	0x137a
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST147
	.uleb128 0x38
	.quad	.LBB115
	.quad	.LBE115
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST148
	.uleb128 0x32
	.long	0x2d0
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB116
	.quad	.LBE116
	.byte	0x1
	.value	0x1f0
	.long	0x13d5
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST149
	.uleb128 0x38
	.quad	.LBB117
	.quad	.LBE117
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST150
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB118
	.quad	.LBE118
	.byte	0x1
	.value	0x1f1
	.long	0x142c
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x32
	.long	0x2db
	.uleb128 0x38
	.quad	.LBB119
	.quad	.LBE119
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST151
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x8f6
	.quad	.LBB120
	.quad	.LBE120
	.byte	0x1
	.value	0x1f2
	.long	0x14b2
	.uleb128 0x32
	.long	0x91f
	.uleb128 0x32
	.long	0x914
	.uleb128 0x32
	.long	0x909
	.uleb128 0x38
	.quad	.LBB121
	.quad	.LBE121
	.uleb128 0x2a
	.long	0x92a
	.long	.LLST152
	.uleb128 0x2a
	.long	0x936
	.long	.LLST153
	.uleb128 0x2a
	.long	0x941
	.long	.LLST154
	.uleb128 0x2a
	.long	0x94c
	.long	.LLST155
	.uleb128 0x2a
	.long	0x957
	.long	.LLST156
	.uleb128 0x2a
	.long	0x962
	.long	.LLST157
	.uleb128 0x2a
	.long	0x96d
	.long	.LLST158
	.uleb128 0x2a
	.long	0x978
	.long	.LLST159
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.long	0x2c2
	.quad	.LBB122
	.quad	.LBE122
	.byte	0x1
	.value	0x1f5
	.long	0x1508
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x32
	.long	0x2db
	.uleb128 0x38
	.quad	.LBB123
	.quad	.LBE123
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST160
	.uleb128 0x32
	.long	0x2d0
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2c2
	.quad	.LBB124
	.long	.Ldebug_ranges0+0x380
	.byte	0x1
	.value	0x1f6
	.long	0x154f
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x32
	.long	0x2db
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x3b0
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST161
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2c2
	.quad	.LBB127
	.long	.Ldebug_ranges0+0x3e0
	.byte	0x1
	.value	0x1f7
	.long	0x159a
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2fa
	.uleb128 0x32
	.long	0x2f1
	.uleb128 0x32
	.long	0x2e6
	.uleb128 0x1c
	.long	0x2db
	.long	.LLST162
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x410
	.uleb128 0x2a
	.long	0x30c
	.long	.LLST163
	.uleb128 0x39
	.long	0x2d0
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.long	0x8f6
	.quad	.LBB132
	.quad	.LBE132
	.byte	0x1
	.value	0x1f8
	.uleb128 0x32
	.long	0x91f
	.uleb128 0x32
	.long	0x914
	.uleb128 0x32
	.long	0x909
	.uleb128 0x38
	.quad	.LBB133
	.quad	.LBE133
	.uleb128 0x1f
	.long	0x92a
	.byte	0x1
	.byte	0x64
	.uleb128 0x2a
	.long	0x936
	.long	.LLST164
	.uleb128 0x2a
	.long	0x941
	.long	.LLST165
	.uleb128 0x2a
	.long	0x94c
	.long	.LLST166
	.uleb128 0x2a
	.long	0x957
	.long	.LLST167
	.uleb128 0x2a
	.long	0x962
	.long	.LLST168
	.uleb128 0x2a
	.long	0x96d
	.long	.LLST169
	.uleb128 0x2a
	.long	0x978
	.long	.LLST170
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x2bb
	.long	0x162b
	.uleb128 0xd
	.long	0x38
	.byte	0x2
	.byte	0x0
	.uleb128 0x3b
	.long	.LASF122
	.byte	0x5
	.byte	0xa5
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.long	.LASF123
	.byte	0x5
	.byte	0xa6
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.long	.LASF124
	.byte	0x5
	.byte	0xa7
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.long	.LASF122
	.byte	0x5
	.byte	0xa5
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.long	.LASF123
	.byte	0x5
	.byte	0xa6
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.long	.LASF124
	.byte	0x5
	.byte	0xa7
	.long	0x27d
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x1b
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
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x28
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x17b
	.value	0x2
	.long	.Ldebug_info0
	.long	0x167a
	.long	0x327
	.string	"maxval_double"
	.long	0x383
	.string	"minval_double"
	.long	0x3e1
	.string	"avgval_double"
	.long	0x479
	.string	"delete_vtx"
	.long	0x519
	.string	"insert_vtx"
	.long	0x566
	.string	"vect_cross"
	.long	0x5ad
	.string	"box_area"
	.long	0x626
	.string	"unit_vect_latlon"
	.long	0x6d5
	.string	"poly_area_no_adjust"
	.long	0x786
	.string	"poly_area"
	.long	0x84e
	.string	"latlon2xyz"
	.long	0x8a9
	.string	"normalize_vect"
	.long	0x985
	.string	"spherical_angle"
	.long	0x9f0
	.string	"great_circle_distance"
	.long	0xa4b
	.string	"v_print"
	.long	0xaa4
	.string	"xyz2latlon"
	.long	0xb82
	.string	"error_handler"
	.long	0xba7
	.string	"fix_lon"
	.long	0xd4b
	.string	"nearest_index"
	.long	0xde3
	.string	"tokenize"
	.long	0xf32
	.string	"spherical_excess_area"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x5e
	.value	0x2
	.long	.Ldebug_info0
	.long	0x167a
	.long	0x2d
	.string	"size_t"
	.long	0x77
	.string	"__off_t"
	.long	0x82
	.string	"__off64_t"
	.long	0x23f
	.string	"_IO_lock_t"
	.long	0x246
	.string	"_IO_marker"
	.long	0xa3
	.string	"_IO_FILE"
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB2-.Ltext0
	.quad	.LBE2-.Ltext0
	.quad	.LBB4-.Ltext0
	.quad	.LBE4-.Ltext0
	.quad	.LBB3-.Ltext0
	.quad	.LBE3-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB5-.Ltext0
	.quad	.LBE5-.Ltext0
	.quad	.LBB7-.Ltext0
	.quad	.LBE7-.Ltext0
	.quad	.LBB6-.Ltext0
	.quad	.LBE6-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB15-.Ltext0
	.quad	.LBE15-.Ltext0
	.quad	.LBB37-.Ltext0
	.quad	.LBE37-.Ltext0
	.quad	.LBB36-.Ltext0
	.quad	.LBE36-.Ltext0
	.quad	.LBB35-.Ltext0
	.quad	.LBE35-.Ltext0
	.quad	.LBB30-.Ltext0
	.quad	.LBE30-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB17-.Ltext0
	.quad	.LBE17-.Ltext0
	.quad	.LBB28-.Ltext0
	.quad	.LBE28-.Ltext0
	.quad	.LBB27-.Ltext0
	.quad	.LBE27-.Ltext0
	.quad	.LBB26-.Ltext0
	.quad	.LBE26-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB19-.Ltext0
	.quad	.LBE19-.Ltext0
	.quad	.LBB21-.Ltext0
	.quad	.LBE21-.Ltext0
	.quad	.LBB18-.Ltext0
	.quad	.LBE18-.Ltext0
	.quad	.LBB20-.Ltext0
	.quad	.LBE20-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB22-.Ltext0
	.quad	.LBE22-.Ltext0
	.quad	.LBB29-.Ltext0
	.quad	.LBE29-.Ltext0
	.quad	.LBB16-.Ltext0
	.quad	.LBE16-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB32-.Ltext0
	.quad	.LBE32-.Ltext0
	.quad	.LBB34-.Ltext0
	.quad	.LBE34-.Ltext0
	.quad	.LBB33-.Ltext0
	.quad	.LBE33-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB40-.Ltext0
	.quad	.LBE40-.Ltext0
	.quad	.LBB43-.Ltext0
	.quad	.LBE43-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB50-.Ltext0
	.quad	.LBE50-.Ltext0
	.quad	.LBB56-.Ltext0
	.quad	.LBE56-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB53-.Ltext0
	.quad	.LBE53-.Ltext0
	.quad	.LBB60-.Ltext0
	.quad	.LBE60-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB57-.Ltext0
	.quad	.LBE57-.Ltext0
	.quad	.LBB61-.Ltext0
	.quad	.LBE61-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB96-.Ltext0
	.quad	.LBE96-.Ltext0
	.quad	.LBB102-.Ltext0
	.quad	.LBE102-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB97-.Ltext0
	.quad	.LBE97-.Ltext0
	.quad	.LBB98-.Ltext0
	.quad	.LBE98-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB99-.Ltext0
	.quad	.LBE99-.Ltext0
	.quad	.LBB103-.Ltext0
	.quad	.LBE103-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB100-.Ltext0
	.quad	.LBE100-.Ltext0
	.quad	.LBB101-.Ltext0
	.quad	.LBE101-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB124-.Ltext0
	.quad	.LBE124-.Ltext0
	.quad	.LBB130-.Ltext0
	.quad	.LBE130-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB125-.Ltext0
	.quad	.LBE125-.Ltext0
	.quad	.LBB126-.Ltext0
	.quad	.LBE126-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB127-.Ltext0
	.quad	.LBE127-.Ltext0
	.quad	.LBB131-.Ltext0
	.quad	.LBE131-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB128-.Ltext0
	.quad	.LBE128-.Ltext0
	.quad	.LBB129-.Ltext0
	.quad	.LBE129-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF79:
	.string	"lat2"
.LASF32:
	.string	"_shortbuf"
.LASF128:
	.string	"_IO_lock_t"
.LASF124:
	.string	"stderr"
.LASF21:
	.string	"_IO_buf_end"
.LASF120:
	.string	"ang3"
.LASF113:
	.string	"p_ll"
.LASF115:
	.string	"p_lr"
.LASF19:
	.string	"_IO_write_end"
.LASF1:
	.string	"unsigned int"
.LASF13:
	.string	"_flags"
.LASF100:
	.string	"index"
.LASF105:
	.string	"varlen"
.LASF25:
	.string	"_markers"
.LASF111:
	.string	"found"
.LASF93:
	.string	"fix_lon"
.LASF82:
	.string	"pdot"
.LASF46:
	.string	"_pos"
.LASF85:
	.string	"great_circle_distance"
.LASF126:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/mosaic_util.c"
.LASF51:
	.string	"maxval"
.LASF123:
	.string	"stdout"
.LASF24:
	.string	"_IO_save_end"
.LASF47:
	.string	"float"
.LASF95:
	.string	"x_sum"
.LASF102:
	.string	"tokenize"
.LASF12:
	.string	"long long unsigned int"
.LASF77:
	.string	"poly_area_no_adjust"
.LASF64:
	.string	"ll_lon"
.LASF23:
	.string	"_IO_backup_base"
.LASF34:
	.string	"_offset"
.LASF83:
	.string	"spherical_angle"
.LASF69:
	.string	"vect_cross"
.LASF98:
	.string	"value"
.LASF27:
	.string	"_fileno"
.LASF81:
	.string	"normalize_vect"
.LASF55:
	.string	"avgval_double"
.LASF109:
	.string	"nvar"
.LASF61:
	.string	"lon_in"
.LASF8:
	.string	"size_t"
.LASF101:
	.string	"keep_going"
.LASF16:
	.string	"_IO_read_base"
.LASF53:
	.string	"minval_double"
.LASF65:
	.string	"ll_lat"
.LASF122:
	.string	"stdin"
.LASF44:
	.string	"_next"
.LASF63:
	.string	"box_area"
.LASF108:
	.string	"nstr"
.LASF103:
	.string	"string"
.LASF78:
	.string	"lat1"
.LASF96:
	.string	"pole"
.LASF60:
	.string	"n_ins"
.LASF11:
	.string	"char"
.LASF40:
	.string	"_mode"
.LASF91:
	.string	"latlon2xyz"
.LASF43:
	.string	"_IO_marker"
.LASF14:
	.string	"_IO_read_ptr"
.LASF50:
	.string	"data"
.LASF68:
	.string	"area"
.LASF17:
	.string	"_IO_write_base"
.LASF125:
	.string	"GNU C 4.4.7 20120313 (Red Hat 4.4.7-16)"
.LASF3:
	.string	"long long int"
.LASF22:
	.string	"_IO_save_base"
.LASF88:
	.string	"v_print"
.LASF97:
	.string	"nearest_index"
.LASF112:
	.string	"spherical_excess_area"
.LASF49:
	.string	"size"
.LASF86:
	.string	"dist"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF66:
	.string	"ur_lon"
.LASF31:
	.string	"_vtable_offset"
.LASF94:
	.string	"tlon"
.LASF99:
	.string	"array"
.LASF54:
	.string	"minval"
.LASF114:
	.string	"p_ul"
.LASF84:
	.string	"angle"
.LASF116:
	.string	"p_ur"
.LASF62:
	.string	"lat_in"
.LASF92:
	.string	"error_handler"
.LASF15:
	.string	"_IO_read_end"
.LASF7:
	.string	"short int"
.LASF2:
	.string	"long int"
.LASF67:
	.string	"ur_lat"
.LASF59:
	.string	"insert_vtx"
.LASF89:
	.string	"xyz2latlon"
.LASF71:
	.string	"vlon"
.LASF33:
	.string	"_lock"
.LASF90:
	.string	"sinp"
.LASF80:
	.string	"poly_area"
.LASF0:
	.string	"long unsigned int"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF117:
	.string	"radius"
.LASF57:
	.string	"n_del"
.LASF110:
	.string	"ntoken"
.LASF4:
	.string	"unsigned char"
.LASF56:
	.string	"avgval"
.LASF45:
	.string	"_sbuf"
.LASF18:
	.string	"_IO_write_ptr"
.LASF74:
	.string	"cos_lon"
.LASF72:
	.string	"vlat"
.LASF58:
	.string	"delete_vtx"
.LASF107:
	.string	"pstring"
.LASF52:
	.string	"maxval_double"
.LASF87:
	.string	"beta"
.LASF73:
	.string	"sin_lon"
.LASF106:
	.string	"maxvar"
.LASF104:
	.string	"tokens"
.LASF9:
	.string	"__off_t"
.LASF6:
	.string	"signed char"
.LASF5:
	.string	"short unsigned int"
.LASF76:
	.string	"cos_lat"
.LASF48:
	.string	"double"
.LASF70:
	.string	"unit_vect_latlon"
.LASF26:
	.string	"_chain"
.LASF28:
	.string	"_flags2"
.LASF118:
	.string	"ang1"
.LASF119:
	.string	"ang2"
.LASF75:
	.string	"sin_lat"
.LASF121:
	.string	"ang4"
.LASF30:
	.string	"_cur_column"
.LASF127:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/preprocessing/regrid_2d/exec"
.LASF10:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
