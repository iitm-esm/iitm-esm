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
.LVL2:
	.loc 1 149 0
	subl	$2, %edi
.LVL3:
	xorl	%eax, %eax
	leaq	8(,%rdi,8), %rdx
.LVL4:
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
.LVL5:
	.loc 1 174 0
	cmpl	$1, %edi
	.loc 1 173 0
	movsd	(%rsi), %xmm0
.LVL6:
	.loc 1 174 0
	jle	.L10
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
	.loc 1 52 0
	movl	$-1, %esi
	movl	$1140850688, %edi
	.loc 1 56 0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	.loc 1 52 0
	jmp	MPI_Abort
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
	movl	%edx, %r8d
	xorl	%r9d, %r9d
	movsd	.LC6(%rip), %xmm3
	movsd	.LC12(%rip), %xmm2
	jmp	.L157
.LVL151:
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
.LVL152:
.L137:
.LBE19:
.LBE17:
.LBE15:
	.loc 1 371 0
	cmpl	%r10d, %ecx
	jle	.L156
	movl	%ecx, %r8d
	movl	%r10d, %r9d
.LVL153:
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
.LVL154:
.LBB30:
	.loc 1 372 0
	leal	1(%r9), %r10d
	movl	%r10d, %edx
	movl	%r10d, %eax
	sarl	$31, %edx
	idivl	%r8d
	movl	%edx, %ecx
.LVL155:
	.loc 1 374 0
	leal	-1(%r8,%r9), %edx
.LVL156:
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
.LVL157:
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
.LVL158:
	.p2align 4,,10
	.p2align 3
.L164:
	movsd	(%rsi,%r9), %xmm1
	movl	%r8d, %r11d
	movapd	%xmm1, %xmm4
	andpd	%xmm3, %xmm4
	ucomisd	%xmm2, %xmm4
	jb	.L160
.LVL159:
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
.LVL160:
.L160:
	addq	$8, %r9
	addl	$1, %r8d
.LVL161:
	addl	$1, %r10d
.LBE31:
	.loc 1 384 0
	cmpl	%r11d, %ecx
	jg	.L164
	.loc 1 392 0
	cmpl	$1, %ecx
	.loc 1 391 0
	movsd	(%rdi), %xmm2
.LVL162:
	.loc 1 392 0
	jle	.L220
.LVL163:
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
.LVL164:
	.p2align 4,,10
	.p2align 3
.L222:
	addsd	%xmm5, %xmm1
.LVL165:
.L170:
	.loc 1 397 0
	addsd	%xmm2, %xmm1
.LVL166:
	movapd	%xmm3, %xmm2
	movsd	%xmm1, 8(%rdi,%rax)
	addq	$8, %rax
	addsd	%xmm1, %xmm2
.LVL167:
.LBE33:
	.loc 1 392 0
	cmpq	%rdx, %rax
	je	.L172
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
.LVL168:
.L173:
.LBB34:
	.loc 1 393 0
	movsd	8(%rdi,%rax), %xmm1
	subsd	%xmm2, %xmm1
.LVL169:
	.loc 1 395 0
	ucomisd	%xmm1, %xmm4
	ja	.L222
	.loc 1 396 0
	ucomisd	%xmm6, %xmm1
	jbe	.L170
	subsd	%xmm7, %xmm1
.LVL170:
	jmp	.L170
.LVL171:
	.p2align 4,,10
	.p2align 3
.L221:
.LBE34:
.LBB35:
	.loc 1 374 0
	jp	.L209
.LVL172:
.LBB22:
.LBB24:
	.loc 1 329 0
	leal	-1(%r8), %ecx
.LVL173:
	cmpl	%ecx, %r9d
	jge	.L141
	.loc 1 358 0
	movl	%r9d, %r12d
	leaq	(%rdi,%rbx), %rbx
	leaq	8(%r11), %rdx
.LVL174:
	notl	%r12d
	leaq	16(%r11), %r15
	addl	%r8d, %r12d
	leaq	8(%rbx), %r14
	leaq	16(%rbx), %rax
.LVL175:
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
.LVL176:
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
.LVL177:
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
.LVL178:
.L141:
	movl	%r9d, %r10d
.LBE24:
.LBE22:
	.loc 1 374 0
	jmp	.L137
.LVL179:
	.p2align 4,,10
	.p2align 3
.L217:
.LBB26:
.LBB20:
	.loc 1 341 0
	leal	-1(%r8), %ecx
.LVL180:
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
.LVL181:
.LBB28:
.LBB21:
	.loc 1 341 0
	jg	.L154
	.loc 1 358 0
	movslq	%ecx, %rax
.LVL182:
	salq	$3, %rax
	leaq	(%rdi,%rax), %rdx
	leaq	(%rsi,%rax), %rax
	.p2align 4,,10
	.p2align 3
.L155:
	.loc 1 342 0
	movq	(%rdx), %rbp
	.loc 1 341 0
	subl	$1, %ecx
.LVL183:
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
.LVL184:
	.loc 1 347 0
	movsd	%xmm1, (%r11)
	.loc 1 348 0
	addl	$1, %r10d
.LVL185:
	jmp	.L137
.LVL186:
.L135:
.LBE21:
.LBE28:
.LBE35:
	.loc 1 384 0
	movl	%edx, %ecx
.LVL187:
.L158:
	.loc 1 391 0
	testl	%ecx, %ecx
	je	.L167
	movsd	(%rdi), %xmm2
.LVL188:
.L220:
	movsd	.LC3(%rip), %xmm4
.LVL189:
	.p2align 4,,10
	.p2align 3
.L172:
	.loc 1 400 0
	cvtsi2sd	%ecx, %xmm1
	divsd	%xmm1, %xmm2
.LVL190:
	subsd	%xmm0, %xmm2
.LVL191:
	.loc 1 401 0
	ucomisd	%xmm2, %xmm4
	jbe	.L212
.LVL192:
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
.LVL193:
	cmpl	%ecx, %eax
	addsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rdi)
.LVL194:
	je	.L167
	movl	$1, %edx
.LVL195:
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
.LVL196:
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
.LVL197:
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$8, %rax
	cmpl	%ecx, %edx
	jl	.L180
.LVL198:
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
.LVL199:
	.p2align 4,,10
	.p2align 3
.L212:
	.cfi_restore_state
	.loc 1 402 0
	ucomisd	.LC1(%rip), %xmm2
	jbe	.L167
.LVL200:
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
.LVL201:
	cmpl	%eax, %ecx
	subsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rdi)
.LVL202:
	je	.L167
	movl	$1, %edx
.LVL203:
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
.LVL204:
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
.LVL205:
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
.LVL206:
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
.LVL207:
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
.LVL208:
	movl	%r9d, %r10d
	jmp	.L137
.LVL209:
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
.LVL210:
.L228:
.LBE23:
.LBE16:
.LBE36:
	.loc 1 402 0
	xorl	%edx, %edx
	.p2align 4,,6
	jmp	.L183
.LVL211:
.L226:
.LBB37:
.LBB29:
.LBB25:
	.loc 1 358 0
	movl	%r9d, %ebx
	.p2align 4,,6
	jmp	.L147
.LVL212:
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
.LVL213:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 78 0
	cmpl	$1, %esi
	jle	.L230
	movq	%rdi, %rbx
	movl	$1, %ebp
	jmp	.L233
.LVL214:
	.p2align 4,,10
	.p2align 3
.L231:
	addl	$1, %ebp
.LVL215:
	addq	$8, %rbx
	cmpl	%ebp, %r12d
	jle	.L230
.LVL216:
.L233:
	.loc 1 79 0
	movsd	(%rbx), %xmm1
	ucomisd	8(%rbx), %xmm1
	jbe	.L231
.LVL217:
.LBB40:
.LBB42:
	.loc 1 50 0
	movq	stderr(%rip), %rdi
	movl	$.LC14, %edx
	movl	$.LC11, %esi
	xorl	%eax, %eax
	movsd	%xmm0, (%rsp)
.LBE42:
.LBE40:
	.loc 1 78 0
	addl	$1, %ebp
	addq	$8, %rbx
.LBB44:
.LBB41:
	.loc 1 50 0
	call	fprintf
	.loc 1 52 0
	movl	$-1, %esi
	movl	$1140850688, %edi
	call	MPI_Abort
.LVL218:
.LBE41:
.LBE44:
	.loc 1 78 0
	cmpl	%ebp, %r12d
.LBB45:
.LBB43:
	.loc 1 52 0
	movsd	(%rsp), %xmm0
.LBE43:
.LBE45:
	.loc 1 78 0
	jg	.L233
.LVL219:
.L230:
	.loc 1 82 0
	movsd	0(%r13), %xmm1
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm1
	ja	.L236
	.loc 1 84 0
	movslq	%r12d, %rdx
	ucomisd	-8(%r13,%rdx,8), %xmm0
	ja	.L237
	movl	$1, %ecx
	xorl	%edx, %edx
	jmp	.L238
.LVL220:
	.p2align 4,,10
	.p2align 3
.L250:
	.loc 1 90 0
	cmpl	%r12d, %edx
	jge	.L236
	.loc 1 92 0
	movsd	8(%r13), %xmm1
	.loc 1 91 0
	leal	1(%rdx), %ebx
.LVL221:
	.loc 1 92 0
	movl	$1, %ecx
.LVL222:
	ucomisd	%xmm0, %xmm1
	jb	.L240
.LVL223:
	.loc 1 94 0
	movapd	%xmm0, %xmm2
	movl	%ebx, %eax
	subsd	%xmm0, %xmm1
	subsd	0(%r13), %xmm2
	ucomisd	%xmm2, %xmm1
	cmova	%edx, %eax
	xorb	%cl, %cl
.LVL224:
.L240:
	addq	$8, %r13
	movl	%ebx, %edx
.LVL225:
.L238:
	.loc 1 90 0
	testl	%ecx, %ecx
	jne	.L250
.LVL226:
.L236:
	.loc 1 101 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL227:
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.LVL228:
	.p2align 4,,10
	.p2align 3
.L237:
	.cfi_restore_state
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	.loc 1 85 0
	leal	-1(%r12), %eax
.LVL229:
	.loc 1 101 0
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL230:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL231:
	ret
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
.LVL232:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 107 0
	movl	%ecx, 32(%rsp)
	movq	%r9, 40(%rsp)
	.loc 1 112 0
	movq	%r8, (%rsp)
	call	strlen
.LVL233:
	.loc 1 113 0
	movq	%rbx, %rdi
	.loc 1 112 0
	movq	%rax, %r15
.LVL234:
	.loc 1 113 0
	call	strlen
.LVL235:
	.loc 1 115 0
	cmpb	$0, 0(%rbp)
	.loc 1 113 0
	movq	%rax, %r12
	.loc 1 115 0
	movq	(%rsp), %r10
.LVL236:
	je	.L267
.LVL237:
.L252:
	.loc 1 117 0
	xorl	%r14d, %r14d
	testq	%r15, %r15
	movl	$1, %ecx
	je	.L254
	.loc 1 130 0
	mov	32(%rsp), %eax
	.loc 1 121 0
	leaq	1(%rbx), %r9
	.loc 1 117 0
	mov	%r13d, %r8d
	xorl	%ecx, %ecx
	xorl	%r13d, %r13d
.LVL238:
	.loc 1 130 0
	movq	%rax, 32(%rsp)
.LVL239:
	.p2align 4,,10
	.p2align 3
.L261:
	.loc 1 118 0
	movzbl	0(%rbp,%r13), %esi
	cmpb	$9, %sil
	je	.L255
	cmpb	$32, %sil
	je	.L255
.LVL240:
	.loc 1 120 0
	testq	%r12, %r12
	je	.L256
	.loc 1 121 0
	cmpb	(%rbx), %sil
	movq	%r9, %rax
	jne	.L258
	.p2align 4,,2
	jmp	.L257
.LVL241:
	.p2align 4,,10
	.p2align 3
.L259:
	movzbl	(%rax), %edx
	addq	$1, %rax
	cmpb	%dl, %sil
	je	.L257
.L258:
	.loc 1 120 0
	movq	%rax, %rdx
	subq	%rbx, %rdx
	cmpq	%rdx, %r12
	ja	.L259
.L256:
.LVL242:
	.loc 1 134 0
	movq	%rcx, %rax
	leaq	(%r10,%r14), %rdx
	addq	$1, %r14
.LVL243:
	imulq	%r8, %rax
	.loc 1 135 0
	cmpq	%r8, %r14
	.loc 1 134 0
	movb	%sil, (%rdx,%rax)
	.loc 1 135 0
	jae	.L268
.LVL244:
	.p2align 4,,10
	.p2align 3
.L255:
	.loc 1 117 0
	addq	$1, %r13
.LVL245:
	cmpq	%r13, %r15
	ja	.L261
	imulq	%rcx, %r8
	addl	$1, %ecx
.LVL246:
	leaq	(%r8,%r14), %r14
.LVL247:
.L254:
	.loc 1 139 0
	movb	$0, (%r10,%r14)
	.loc 1 141 0
	movq	40(%rsp), %rax
	movl	%ecx, (%rax)
	.loc 1 143 0
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL248:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL249:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL250:
	ret
.LVL251:
	.p2align 4,,10
	.p2align 3
.L257:
	.cfi_restore_state
	.loc 1 127 0
	testq	%r14, %r14
	je	.L255
	.loc 1 128 0
	movq	%rcx, %rax
	leaq	(%r10,%r14), %r14
	addq	$1, %rcx
.LVL252:
	imulq	%r8, %rax
	movb	$0, (%r14,%rax)
	.loc 1 130 0
	xorl	%r14d, %r14d
	cmpq	32(%rsp), %rcx
	jb	.L255
.LVL253:
.LBB52:
.LBB53:
	.loc 1 50 0
	movq	stderr(%rip), %rdi
	movl	$.LC16, %edx
	movl	$.LC11, %esi
	xorl	%eax, %eax
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r10, (%rsp)
	call	fprintf
.LVL254:
	.loc 1 52 0
	movl	$-1, %esi
	movl	$1140850688, %edi
	call	MPI_Abort
	movq	16(%rsp), %rcx
	movq	24(%rsp), %r8
	movq	8(%rsp), %r9
	movq	(%rsp), %r10
	jmp	.L255
.LVL255:
	.p2align 4,,10
	.p2align 3
.L268:
.LBE53:
.LBE52:
.LBB54:
.LBB55:
	.loc 1 50 0
	movq	stderr(%rip), %rdi
	movl	$.LC17, %edx
	movl	$.LC11, %esi
	xorl	%eax, %eax
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r10, (%rsp)
	call	fprintf
	.loc 1 52 0
	movl	$-1, %esi
	movl	$1140850688, %edi
	call	MPI_Abort
	movq	(%rsp), %r10
	movq	8(%rsp), %r9
	movq	24(%rsp), %r8
	movq	16(%rsp), %rcx
	jmp	.L255
.LVL256:
.L267:
.LBE55:
.LBE54:
.LBB56:
.LBB57:
	.loc 1 50 0
	movq	stderr(%rip), %rdi
	movl	$.LC15, %edx
	movl	$.LC11, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL257:
	.loc 1 52 0
	movl	$-1, %esi
	movl	$1140850688, %edi
	call	MPI_Abort
	movq	(%rsp), %r10
	jmp	.L252
.LBE57:
.LBE56:
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
.LVL258:
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
.LBB90:
.LBB91:
	.loc 1 209 0
	movsd	8(%rdi), %xmm0
.LVL259:
	movsd	%xmm0, 160(%rsp)
	call	cos
.LVL260:
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
.LVL261:
.LBE91:
.LBE90:
.LBB92:
.LBB93:
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
.LBE93:
.LBE92:
.LBB95:
.LBB96:
	.loc 1 209 0
	movsd	8(%rbp), %xmm9
.LBE96:
.LBE95:
.LBB98:
.LBB94:
	.loc 1 211 0
	movapd	%xmm0, %xmm8
.LVL262:
.LBE94:
.LBE98:
.LBB99:
.LBB97:
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
.LVL263:
.LBE97:
.LBE99:
.LBB100:
.LBB101:
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
.LVL264:
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
.LVL265:
	.loc 1 455 0
	movapd	%xmm5, %xmm8
	.loc 1 453 0
	subsd	%xmm6, %xmm7
.LVL266:
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
.LVL267:
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
.LVL268:
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L271
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm5
.LVL269:
	mulsd	%xmm2, %xmm7
.LVL270:
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm7, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL271:
	movsd	%xmm0, 216(%rsp)
.LVL272:
	movsd	8(%rbx), %xmm0
.LVL273:
	movsd	%xmm0, 160(%rsp)
	movsd	(%rbx), %xmm0
	movsd	%xmm0, 176(%rsp)
	movsd	8(%r12), %xmm0
	movsd	%xmm0, 144(%rsp)
	movsd	(%r12), %xmm0
	movsd	%xmm0, 184(%rsp)
.LVL274:
.L271:
.LBE101:
.LBE100:
.LBB102:
.LBB103:
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
.LVL275:
.LBE103:
.LBE102:
.LBB104:
.LBB105:
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
.LVL276:
.LBE105:
.LBE104:
.LBB106:
.LBB107:
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
.LVL277:
.LBE107:
.LBE106:
.LBB108:
.LBB109:
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
.LVL278:
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
.LVL279:
	.loc 1 455 0
	movapd	%xmm4, %xmm7
	.loc 1 453 0
	subsd	%xmm5, %xmm6
.LVL280:
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
.LVL281:
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
.LVL282:
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L273
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm4
.LVL283:
	mulsd	%xmm2, %xmm6
.LVL284:
	mulsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm6, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL285:
	movsd	%xmm0, 208(%rsp)
.LVL286:
	movsd	8(%r12), %xmm0
.LVL287:
	movsd	%xmm0, 144(%rsp)
	movsd	(%r12), %xmm0
	movsd	%xmm0, 184(%rsp)
	movsd	8(%r13), %xmm0
	movsd	%xmm0, 152(%rsp)
	movsd	0(%r13), %xmm0
	movsd	%xmm0, 192(%rsp)
.LVL288:
.L273:
.LBE109:
.LBE108:
.LBB110:
.LBB111:
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
.LVL289:
.LBE111:
.LBE110:
.LBB112:
.LBB113:
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
.LVL290:
.LBE113:
.LBE112:
.LBB114:
.LBB115:
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
.LVL291:
.LBE115:
.LBE114:
.LBB116:
.LBB117:
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
.LVL292:
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
.LVL293:
	.loc 1 455 0
	movapd	%xmm5, %xmm8
	.loc 1 453 0
	subsd	%xmm6, %xmm7
.LVL294:
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
.LVL295:
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
.LVL296:
	.loc 1 461 0
	xorpd	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L275
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm5
.LVL297:
	mulsd	%xmm2, %xmm7
.LVL298:
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm7, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL299:
	movsd	%xmm0, 184(%rsp)
.LVL300:
	movsd	8(%rbp), %xmm0
.LVL301:
	movsd	%xmm0, 160(%rsp)
	movsd	0(%rbp), %xmm0
	movsd	%xmm0, 176(%rsp)
	movsd	8(%r13), %xmm0
	movsd	%xmm0, 152(%rsp)
	movsd	0(%r13), %xmm0
	movsd	%xmm0, 192(%rsp)
.LVL302:
.L275:
.LBE117:
.LBE116:
.LBB118:
.LBB119:
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
.LVL303:
.LBE119:
.LBE118:
.LBB120:
.LBB121:
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
.LBE121:
.LBE120:
.LBB123:
.LBB124:
	.loc 1 209 0
	movsd	8(%rbx), %xmm9
.LBE124:
.LBE123:
.LBB126:
.LBB122:
	.loc 1 211 0
	movapd	%xmm0, %xmm8
.LVL304:
.LBE122:
.LBE126:
.LBB127:
.LBB125:
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
.LVL305:
.LBE125:
.LBE127:
.LBB128:
.LBB129:
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
.LVL306:
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
.LVL307:
	.loc 1 455 0
	movapd	%xmm5, %xmm8
	.loc 1 453 0
	subsd	%xmm6, %xmm7
.LVL308:
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
.LVL309:
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
.LVL310:
	.loc 1 461 0
	ucomisd	%xmm3, %xmm1
	jbe	.L277
	.loc 1 462 0
	movapd	%xmm10, %xmm0
	mulsd	%xmm9, %xmm5
.LVL311:
	mulsd	%xmm2, %xmm7
.LVL312:
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm7, %xmm0
	divsd	%xmm1, %xmm0
	call	acos
.LVL313:
	movapd	%xmm0, %xmm3
.LVL314:
.L277:
	movsd	216(%rsp), %xmm0
	addsd	208(%rsp), %xmm0
	addsd	184(%rsp), %xmm0
	addsd	%xmm3, %xmm0
	subsd	.LC2(%rip), %xmm0
	mulsd	200(%rsp), %xmm0
	mulsd	200(%rsp), %xmm0
.LVL315:
.LBE129:
.LBE128:
	.loc 1 510 0
	addq	$232, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL316:
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL317:
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL318:
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL319:
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
	.quad	.LVL3-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL2-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL4-.Ltext0
	.quad	.LFE36-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LVL1-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LVL1-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LVL5-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LVL6-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LVL6-.Ltext0
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
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL164-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL150-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL199-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL206-.Ltext0
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
	.quad	.LVL186-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST75:
	.quad	.LVL150-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL199-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL206-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST76:
	.quad	.LVL162-.Ltext0
	.quad	.LVL164-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL164-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL167-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL168-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL188-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST77:
	.quad	.LVL191-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL199-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL210-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL212-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST78:
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL157-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL161-.Ltext0
	.quad	.LVL162-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL162-.Ltext0
	.quad	.LVL164-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL178-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x3
	.byte	0x79
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x3
	.byte	0x7a
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL186-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL188-.Ltext0
	.quad	.LVL189-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL192-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL194-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL200-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL202-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL205-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x3
	.byte	0x79
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL210-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL212-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST79:
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL152-.Ltext0
	.quad	.LVL153-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL153-.Ltext0
	.quad	.LVL154-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL155-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL157-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL171-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL176-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x3
	.byte	0x72
	.sleb128 1
	.byte	0x9f
	.quad	.LVL179-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL186-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL187-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL206-.Ltext0
	.quad	.LVL208-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL209-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL210-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL212-.Ltext0
	.quad	.LFE47-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST80:
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL154-.Ltext0
	.quad	.LVL155-.Ltext0
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
	.quad	.LVL155-.Ltext0
	.quad	.LVL157-.Ltext0
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
	.quad	.LVL171-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL174-.Ltext0
	.quad	.LVL176-.Ltext0
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
	.quad	.LVL176-.Ltext0
	.quad	.LVL179-.Ltext0
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
	.quad	.LVL179-.Ltext0
	.quad	.LVL186-.Ltext0
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
	.quad	.LVL206-.Ltext0
	.quad	.LVL210-.Ltext0
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
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
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
	.quad	.LVL151-.Ltext0
	.quad	.LVL152-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL156-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL171-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL173-.Ltext0
	.quad	.LVL175-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL179-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL180-.Ltext0
	.quad	.LVL182-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST82:
	.quad	.LVL181-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST83:
	.quad	.LVL181-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST84:
	.quad	.LVL181-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST85:
	.quad	.LVL181-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0x0
	.quad	0x0
.LLST86:
	.quad	.LVL181-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST87:
	.quad	.LVL181-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST88:
	.quad	.LVL181-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST89:
	.quad	.LVL172-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL209-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST90:
	.quad	.LVL159-.Ltext0
	.quad	.LVL160-.Ltext0
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
	.quad	.LVL159-.Ltext0
	.quad	.LVL160-.Ltext0
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
	.quad	.LVL164-.Ltext0
	.quad	.LVL166-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL169-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST93:
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST94:
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL214-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL228-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST95:
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL214-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL228-.Ltext0
	.quad	.LVL230-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL230-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST96:
	.quad	.LVL220-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL223-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL225-.Ltext0
	.quad	.LVL228-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL229-.Ltext0
	.quad	.LFE34-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST97:
	.quad	.LVL213-.Ltext0
	.quad	.LVL214-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL215-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL221-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST98:
	.quad	.LVL220-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST99:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC14
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST100:
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL233-1-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL251-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST101:
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL233-1-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL251-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST102:
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL233-1-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL256-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST103:
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL233-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0x0
	.quad	0x0
.LLST104:
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL236-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-1-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST105:
	.quad	.LVL232-.Ltext0
	.quad	.LVL233-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL233-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST106:
	.quad	.LVL237-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL245-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST107:
	.quad	.LVL232-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL243-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL252-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL256-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST108:
	.quad	.LVL232-.Ltext0
	.quad	.LVL239-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL244-.Ltext0
	.quad	.LVL246-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL252-.Ltext0
	.quad	.LVL254-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL256-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST109:
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL235-1-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL251-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST110:
	.quad	.LVL242-.Ltext0
	.quad	.LVL244-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL251-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST111:
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST112:
	.quad	.LVL253-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC16
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST113:
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0xa
	.byte	0x3
	.quad	.LC17
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST114:
	.quad	.LVL258-.Ltext0
	.quad	.LVL260-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL274-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST115:
	.quad	.LVL258-.Ltext0
	.quad	.LVL260-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL260-1-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST116:
	.quad	.LVL258-.Ltext0
	.quad	.LVL260-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL260-1-.Ltext0
	.quad	.LVL318-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST117:
	.quad	.LVL258-.Ltext0
	.quad	.LVL260-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL260-1-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST118:
	.quad	.LVL258-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL259-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST119:
	.quad	.LVL258-.Ltext0
	.quad	.LVL260-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL260-1-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST120:
	.quad	.LVL258-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL261-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST121:
	.quad	.LVL261-.Ltext0
	.quad	.LVL318-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST122:
	.quad	.LVL261-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL262-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST123:
	.quad	.LVL262-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST124:
	.quad	.LVL262-.Ltext0
	.quad	.LVL263-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL263-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST125:
	.quad	.LVL272-.Ltext0
	.quad	.LVL273-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL273-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
	.quad	0x0
	.quad	0x0
.LLST126:
	.quad	.LVL264-.Ltext0
	.quad	.LVL271-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST127:
	.quad	.LVL265-.Ltext0
	.quad	.LVL271-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST128:
	.quad	.LVL266-.Ltext0
	.quad	.LVL270-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST129:
	.quad	.LVL267-.Ltext0
	.quad	.LVL271-1-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST130:
	.quad	.LVL267-.Ltext0
	.quad	.LVL269-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST131:
	.quad	.LVL267-.Ltext0
	.quad	.LVL271-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST132:
	.quad	.LVL268-.Ltext0
	.quad	.LVL271-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST133:
	.quad	.LVL274-.Ltext0
	.quad	.LVL318-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST134:
	.quad	.LVL274-.Ltext0
	.quad	.LVL275-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL275-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST135:
	.quad	.LVL275-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST136:
	.quad	.LVL275-.Ltext0
	.quad	.LVL276-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL276-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST137:
	.quad	.LVL276-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST138:
	.quad	.LVL276-.Ltext0
	.quad	.LVL277-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL277-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST139:
	.quad	.LVL286-.Ltext0
	.quad	.LVL287-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL287-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -64
	.quad	0x0
	.quad	0x0
.LLST140:
	.quad	.LVL278-.Ltext0
	.quad	.LVL285-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST141:
	.quad	.LVL279-.Ltext0
	.quad	.LVL285-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST142:
	.quad	.LVL280-.Ltext0
	.quad	.LVL284-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST143:
	.quad	.LVL281-.Ltext0
	.quad	.LVL285-1-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST144:
	.quad	.LVL281-.Ltext0
	.quad	.LVL283-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST145:
	.quad	.LVL281-.Ltext0
	.quad	.LVL285-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST146:
	.quad	.LVL282-.Ltext0
	.quad	.LVL285-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST147:
	.quad	.LVL288-.Ltext0
	.quad	.LVL319-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST148:
	.quad	.LVL288-.Ltext0
	.quad	.LVL289-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL289-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST149:
	.quad	.LVL289-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST150:
	.quad	.LVL289-.Ltext0
	.quad	.LVL290-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL290-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST151:
	.quad	.LVL290-.Ltext0
	.quad	.LVL291-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL291-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST152:
	.quad	.LVL300-.Ltext0
	.quad	.LVL301-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL301-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0x0
	.quad	0x0
.LLST153:
	.quad	.LVL292-.Ltext0
	.quad	.LVL299-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST154:
	.quad	.LVL293-.Ltext0
	.quad	.LVL299-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST155:
	.quad	.LVL294-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST156:
	.quad	.LVL295-.Ltext0
	.quad	.LVL299-1-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST157:
	.quad	.LVL295-.Ltext0
	.quad	.LVL297-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST158:
	.quad	.LVL295-.Ltext0
	.quad	.LVL299-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST159:
	.quad	.LVL296-.Ltext0
	.quad	.LVL299-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST160:
	.quad	.LVL302-.Ltext0
	.quad	.LVL303-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL303-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST161:
	.quad	.LVL303-.Ltext0
	.quad	.LVL304-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL304-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST162:
	.quad	.LVL304-.Ltext0
	.quad	.LVL316-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST163:
	.quad	.LVL304-.Ltext0
	.quad	.LVL305-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL305-.Ltext0
	.quad	.LFE50-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST164:
	.quad	.LVL306-.Ltext0
	.quad	.LVL313-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST165:
	.quad	.LVL307-.Ltext0
	.quad	.LVL313-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST166:
	.quad	.LVL308-.Ltext0
	.quad	.LVL312-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST167:
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-1-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	0x0
	.quad	0x0
.LLST168:
	.quad	.LVL309-.Ltext0
	.quad	.LVL311-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST169:
	.quad	.LVL309-.Ltext0
	.quad	.LVL313-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST170:
	.quad	.LVL310-.Ltext0
	.quad	.LVL313-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info
	.long	0x18c8
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF164
	.byte	0x1
	.long	.LASF165
	.long	.LASF166
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
	.long	.LASF167
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
	.uleb128 0x2
	.long	.LASF49
	.byte	0x5
	.byte	0x53
	.long	0x3f
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF50
	.uleb128 0x2
	.long	.LASF51
	.byte	0x5
	.byte	0xe5
	.long	0x3f
	.uleb128 0xf
	.byte	0x1
	.long	.LASF94
	.byte	0x1
	.byte	0xcc
	.byte	0x1
	.byte	0x1
	.long	0x333
	.uleb128 0x10
	.long	.LASF52
	.byte	0x1
	.byte	0xcc
	.long	0x3f
	.uleb128 0x11
	.string	"lon"
	.byte	0x1
	.byte	0xcc
	.long	0x333
	.uleb128 0x11
	.string	"lat"
	.byte	0x1
	.byte	0xcc
	.long	0x333
	.uleb128 0x11
	.string	"x"
	.byte	0x1
	.byte	0xcc
	.long	0x33e
	.uleb128 0x11
	.string	"y"
	.byte	0x1
	.byte	0xcc
	.long	0x33e
	.uleb128 0x11
	.string	"z"
	.byte	0x1
	.byte	0xcc
	.long	0x33e
	.uleb128 0x12
	.string	"n"
	.byte	0x1
	.byte	0xce
	.long	0x3f
	.byte	0x0
	.uleb128 0x6
	.byte	0x8
	.long	0x339
	.uleb128 0xe
	.long	0x2bb
	.uleb128 0x6
	.byte	0x8
	.long	0x2bb
	.uleb128 0x13
	.byte	0x1
	.long	.LASF55
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.long	0x2bb
	.quad	.LFB36
	.quad	.LFE36
	.byte	0x1
	.byte	0x9c
	.long	0x3a2
	.uleb128 0x14
	.long	.LASF52
	.byte	0x1
	.byte	0x95
	.long	0x3f
	.long	.LLST0
	.uleb128 0x14
	.long	.LASF53
	.byte	0x1
	.byte	0x95
	.long	0x333
	.long	.LLST1
	.uleb128 0x15
	.string	"n"
	.byte	0x1
	.byte	0x97
	.long	0x3f
	.long	.LLST2
	.uleb128 0x16
	.long	.LASF54
	.byte	0x1
	.byte	0x98
	.long	0x2bb
	.long	.LLST3
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF56
	.byte	0x1
	.byte	0xa8
	.byte	0x1
	.long	0x2bb
	.quad	.LFB37
	.quad	.LFE37
	.byte	0x1
	.byte	0x9c
	.long	0x3fe
	.uleb128 0x14
	.long	.LASF52
	.byte	0x1
	.byte	0xa8
	.long	0x3f
	.long	.LLST4
	.uleb128 0x17
	.long	.LASF53
	.byte	0x1
	.byte	0xa8
	.long	0x333
	.byte	0x1
	.byte	0x54
	.uleb128 0x15
	.string	"n"
	.byte	0x1
	.byte	0xaa
	.long	0x3f
	.long	.LLST5
	.uleb128 0x16
	.long	.LASF57
	.byte	0x1
	.byte	0xab
	.long	0x2bb
	.long	.LLST6
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF58
	.byte	0x1
	.byte	0xba
	.byte	0x1
	.long	0x2bb
	.quad	.LFB38
	.quad	.LFE38
	.byte	0x1
	.byte	0x9c
	.long	0x458
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.byte	0xba
	.long	0x3f
	.byte	0x1
	.byte	0x55
	.uleb128 0x17
	.long	.LASF53
	.byte	0x1
	.byte	0xba
	.long	0x333
	.byte	0x1
	.byte	0x54
	.uleb128 0x15
	.string	"n"
	.byte	0x1
	.byte	0xbc
	.long	0x3f
	.long	.LLST7
	.uleb128 0x16
	.long	.LASF59
	.byte	0x1
	.byte	0xbd
	.long	0x2bb
	.long	.LLST8
	.byte	0x0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF61
	.byte	0x1
	.value	0x147
	.byte	0x1
	.long	0x3f
	.byte	0x1
	.long	0x496
	.uleb128 0x19
	.string	"x"
	.byte	0x1
	.value	0x147
	.long	0x33e
	.uleb128 0x19
	.string	"y"
	.byte	0x1
	.value	0x147
	.long	0x33e
	.uleb128 0x19
	.string	"n"
	.byte	0x1
	.value	0x147
	.long	0x3f
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.value	0x147
	.long	0x3f
	.byte	0x0
	.uleb128 0x1b
	.long	0x458
	.quad	.LFB44
	.quad	.LFE44
	.byte	0x1
	.byte	0x9c
	.long	0x4d6
	.uleb128 0x1c
	.long	0x46b
	.long	.LLST9
	.uleb128 0x1c
	.long	0x475
	.long	.LLST10
	.uleb128 0x1c
	.long	0x47f
	.long	.LLST11
	.uleb128 0x1c
	.long	0x489
	.long	.LLST12
	.byte	0x0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF62
	.byte	0x1
	.value	0x151
	.byte	0x1
	.long	0x3f
	.byte	0x1
	.long	0x536
	.uleb128 0x19
	.string	"x"
	.byte	0x1
	.value	0x151
	.long	0x33e
	.uleb128 0x19
	.string	"y"
	.byte	0x1
	.value	0x151
	.long	0x33e
	.uleb128 0x19
	.string	"n"
	.byte	0x1
	.value	0x151
	.long	0x3f
	.uleb128 0x1a
	.long	.LASF63
	.byte	0x1
	.value	0x151
	.long	0x3f
	.uleb128 0x1a
	.long	.LASF64
	.byte	0x1
	.value	0x151
	.long	0x2bb
	.uleb128 0x1a
	.long	.LASF65
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
	.long	0x4d6
	.quad	.LFB45
	.quad	.LFE45
	.byte	0x1
	.byte	0x9c
	.long	0x583
	.uleb128 0x1e
	.long	0x4e9
	.byte	0x1
	.byte	0x55
	.uleb128 0x1e
	.long	0x4f3
	.byte	0x1
	.byte	0x54
	.uleb128 0x1e
	.long	0x4fd
	.byte	0x1
	.byte	0x51
	.uleb128 0x1e
	.long	0x507
	.byte	0x1
	.byte	0x52
	.uleb128 0x1e
	.long	0x513
	.byte	0x1
	.byte	0x61
	.uleb128 0x1e
	.long	0x51f
	.byte	0x1
	.byte	0x62
	.uleb128 0x1f
	.long	0x52b
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF72
	.byte	0x1
	.value	0x206
	.byte	0x1
	.quad	.LFB51
	.quad	.LFE51
	.byte	0x1
	.byte	0x9c
	.long	0x5ca
	.uleb128 0x21
	.string	"p1"
	.byte	0x1
	.value	0x206
	.long	0x333
	.byte	0x1
	.byte	0x55
	.uleb128 0x21
	.string	"p2"
	.byte	0x1
	.value	0x206
	.long	0x333
	.byte	0x1
	.byte	0x54
	.uleb128 0x21
	.string	"e"
	.byte	0x1
	.value	0x206
	.long	0x33e
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF66
	.byte	0x1
	.byte	0xfb
	.byte	0x1
	.long	0x2bb
	.quad	.LFB41
	.quad	.LFE41
	.byte	0x1
	.byte	0x9c
	.long	0x643
	.uleb128 0x14
	.long	.LASF67
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST13
	.uleb128 0x14
	.long	.LASF68
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST14
	.uleb128 0x14
	.long	.LASF69
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST15
	.uleb128 0x14
	.long	.LASF70
	.byte	0x1
	.byte	0xfb
	.long	0x2bb
	.long	.LLST16
	.uleb128 0x15
	.string	"dx"
	.byte	0x1
	.byte	0xfd
	.long	0x2bb
	.long	.LLST17
	.uleb128 0x22
	.long	.LASF71
	.byte	0x1
	.byte	0xfe
	.long	0x2bb
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF73
	.byte	0x1
	.value	0x224
	.byte	0x1
	.quad	.LFB53
	.quad	.LFE53
	.byte	0x1
	.byte	0x9c
	.long	0x6f2
	.uleb128 0x23
	.long	.LASF52
	.byte	0x1
	.value	0x224
	.long	0x3f
	.long	.LLST18
	.uleb128 0x24
	.string	"lon"
	.byte	0x1
	.value	0x224
	.long	0x333
	.long	.LLST19
	.uleb128 0x24
	.string	"lat"
	.byte	0x1
	.value	0x224
	.long	0x333
	.long	.LLST20
	.uleb128 0x23
	.long	.LASF74
	.byte	0x1
	.value	0x224
	.long	0x33e
	.long	.LLST21
	.uleb128 0x23
	.long	.LASF75
	.byte	0x1
	.value	0x224
	.long	0x33e
	.long	.LLST22
	.uleb128 0x25
	.long	.LASF76
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF77
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF78
	.byte	0x1
	.value	0x226
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF79
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
	.long	.LASF80
	.byte	0x1
	.value	0x130
	.byte	0x1
	.long	0x2bb
	.quad	.LFB43
	.quad	.LFE43
	.byte	0x1
	.byte	0x9c
	.long	0x7a3
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x130
	.long	0x333
	.long	.LLST24
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x130
	.long	0x333
	.long	.LLST25
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x130
	.long	0x3f
	.long	.LLST26
	.uleb128 0x28
	.long	.LASF71
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
	.long	.LASF81
	.byte	0x1
	.value	0x138
	.long	0x2bb
	.long	.LLST31
	.uleb128 0x28
	.long	.LASF82
	.byte	0x1
	.value	0x138
	.long	0x2bb
	.long	.LLST32
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF83
	.byte	0x1
	.value	0x10f
	.byte	0x1
	.long	0x2bb
	.quad	.LFB42
	.quad	.LFE42
	.byte	0x1
	.byte	0x9c
	.long	0x86b
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x10f
	.long	0x333
	.long	.LLST33
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x10f
	.long	0x333
	.long	.LLST34
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x10f
	.long	0x3f
	.long	.LLST35
	.uleb128 0x28
	.long	.LASF71
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
	.long	.LASF81
	.byte	0x1
	.value	0x117
	.long	0x2bb
	.long	.LLST40
	.uleb128 0x28
	.long	.LASF82
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
	.long	0x2df
	.quad	.LFB39
	.quad	.LFE39
	.byte	0x1
	.byte	0x9c
	.long	0x8c6
	.uleb128 0x1c
	.long	0x2ed
	.long	.LLST42
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST43
	.uleb128 0x1c
	.long	0x303
	.long	.LLST44
	.uleb128 0x1c
	.long	0x30e
	.long	.LLST45
	.uleb128 0x1c
	.long	0x317
	.long	.LLST46
	.uleb128 0x1c
	.long	0x320
	.long	.LLST47
	.uleb128 0x2a
	.long	0x329
	.long	.LLST48
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF84
	.byte	0x1
	.value	0x212
	.byte	0x1
	.quad	.LFB52
	.quad	.LFE52
	.byte	0x1
	.byte	0x9c
	.long	0x913
	.uleb128 0x24
	.string	"e"
	.byte	0x1
	.value	0x212
	.long	0x33e
	.long	.LLST49
	.uleb128 0x28
	.long	.LASF85
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
	.long	.LASF86
	.byte	0x1
	.value	0x1bd
	.byte	0x1
	.long	0x2bb
	.byte	0x1
	.long	0x9a2
	.uleb128 0x19
	.string	"v1"
	.byte	0x1
	.value	0x1bd
	.long	0x333
	.uleb128 0x19
	.string	"v2"
	.byte	0x1
	.value	0x1bd
	.long	0x333
	.uleb128 0x19
	.string	"v3"
	.byte	0x1
	.value	0x1bd
	.long	0x333
	.uleb128 0x25
	.long	.LASF87
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
	.long	0x913
	.quad	.LFB49
	.quad	.LFE49
	.byte	0x1
	.byte	0x9c
	.long	0xa0d
	.uleb128 0x1e
	.long	0x926
	.byte	0x1
	.byte	0x55
	.uleb128 0x1e
	.long	0x931
	.byte	0x1
	.byte	0x54
	.uleb128 0x1e
	.long	0x93c
	.byte	0x1
	.byte	0x51
	.uleb128 0x2b
	.long	0x947
	.uleb128 0x1f
	.long	0x953
	.byte	0x1
	.byte	0x69
	.uleb128 0x1f
	.long	0x95e
	.byte	0x1
	.byte	0x67
	.uleb128 0x1f
	.long	0x969
	.byte	0x1
	.byte	0x65
	.uleb128 0x1f
	.long	0x974
	.byte	0x1
	.byte	0x68
	.uleb128 0x2a
	.long	0x97f
	.long	.LLST52
	.uleb128 0x2a
	.long	0x98a
	.long	.LLST53
	.uleb128 0x1f
	.long	0x995
	.byte	0x1
	.byte	0x62
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF88
	.byte	0x1
	.value	0x1a4
	.byte	0x1
	.long	0x2bb
	.quad	.LFB48
	.quad	.LFE48
	.byte	0x1
	.byte	0x9c
	.long	0xa68
	.uleb128 0x24
	.string	"p1"
	.byte	0x1
	.value	0x1a4
	.long	0x33e
	.long	.LLST54
	.uleb128 0x24
	.string	"p2"
	.byte	0x1
	.value	0x1a4
	.long	0x33e
	.long	.LLST55
	.uleb128 0x25
	.long	.LASF89
	.byte	0x1
	.value	0x1a6
	.long	0x2bb
	.uleb128 0x25
	.long	.LASF90
	.byte	0x1
	.value	0x1a6
	.long	0x2bb
	.byte	0x0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF91
	.byte	0x1
	.value	0x15f
	.byte	0x1
	.quad	.LFB46
	.quad	.LFE46
	.byte	0x1
	.byte	0x9c
	.long	0xac1
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x15f
	.long	0x33e
	.long	.LLST56
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x15f
	.long	0x33e
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
	.long	.LASF92
	.byte	0x1
	.byte	0xdc
	.byte	0x1
	.quad	.LFB40
	.quad	.LFE40
	.byte	0x1
	.byte	0x9c
	.long	0xb85
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
	.long	0x333
	.long	.LLST61
	.uleb128 0x2d
	.string	"y"
	.byte	0x1
	.byte	0xdc
	.long	0x333
	.long	.LLST62
	.uleb128 0x2d
	.string	"z"
	.byte	0x1
	.byte	0xdc
	.long	0x333
	.long	.LLST63
	.uleb128 0x2d
	.string	"lon"
	.byte	0x1
	.byte	0xdc
	.long	0x33e
	.long	.LLST64
	.uleb128 0x2d
	.string	"lat"
	.byte	0x1
	.byte	0xdc
	.long	0x33e
	.long	.LLST65
	.uleb128 0x15
	.string	"xx"
	.byte	0x1
	.byte	0xdf
	.long	0x2bb
	.long	.LLST66
	.uleb128 0x15
	.string	"yy"
	.byte	0x1
	.byte	0xdf
	.long	0x2bb
	.long	.LLST67
	.uleb128 0x15
	.string	"zz"
	.byte	0x1
	.byte	0xdf
	.long	0x2bb
	.long	.LLST68
	.uleb128 0x16
	.long	.LASF89
	.byte	0x1
	.byte	0xe0
	.long	0x2bb
	.long	.LLST69
	.uleb128 0x22
	.long	.LASF93
	.byte	0x1
	.byte	0xe0
	.long	0x2bb
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0xe1
	.long	0x3f
	.long	.LLST70
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF95
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.byte	0x1
	.long	0xb9f
	.uleb128 0x11
	.string	"msg"
	.byte	0x1
	.byte	0x30
	.long	0x2a9
	.byte	0x0
	.uleb128 0x1b
	.long	0xb85
	.quad	.LFB33
	.quad	.LFE33
	.byte	0x1
	.byte	0x9c
	.long	0xbc4
	.uleb128 0x1c
	.long	0xb93
	.long	.LLST71
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF96
	.byte	0x1
	.value	0x166
	.byte	0x1
	.long	0x3f
	.quad	.LFB47
	.quad	.LFE47
	.byte	0x1
	.byte	0x9c
	.long	0xd68
	.uleb128 0x24
	.string	"x"
	.byte	0x1
	.value	0x166
	.long	0x33e
	.long	.LLST72
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.value	0x166
	.long	0x33e
	.long	.LLST73
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x166
	.long	0x3f
	.long	.LLST74
	.uleb128 0x23
	.long	.LASF97
	.byte	0x1
	.value	0x166
	.long	0x2bb
	.long	.LLST75
	.uleb128 0x28
	.long	.LASF98
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
	.long	.LASF99
	.byte	0x1
	.value	0x169
	.long	0x3f
	.byte	0x0
	.uleb128 0x2f
	.long	.Ldebug_ranges0+0x80
	.long	0xd1e
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
	.long	0x4d6
	.quad	.LBB17
	.long	.Ldebug_ranges0+0xe0
	.byte	0x1
	.value	0x17a
	.long	0xcf0
	.uleb128 0x1c
	.long	0x51f
	.long	.LLST82
	.uleb128 0x1c
	.long	0x513
	.long	.LLST83
	.uleb128 0x1c
	.long	0x507
	.long	.LLST84
	.uleb128 0x1c
	.long	0x4fd
	.long	.LLST85
	.uleb128 0x1c
	.long	0x4f3
	.long	.LLST86
	.uleb128 0x1c
	.long	0x4e9
	.long	.LLST87
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x130
	.uleb128 0x2a
	.long	0x52b
	.long	.LLST88
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	0x458
	.quad	.LBB22
	.long	.Ldebug_ranges0+0x180
	.byte	0x1
	.value	0x177
	.uleb128 0x1c
	.long	0x489
	.long	.LLST89
	.uleb128 0x32
	.long	0x47f
	.uleb128 0x32
	.long	0x475
	.uleb128 0x32
	.long	0x46b
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.quad	.LBB31
	.quad	.LBE31
	.long	0xd52
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
	.long	.LASF100
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.long	0x3f
	.quad	.LFB34
	.quad	.LFE34
	.byte	0x1
	.byte	0x9c
	.long	0xe00
	.uleb128 0x14
	.long	.LASF101
	.byte	0x1
	.byte	0x49
	.long	0x2bb
	.long	.LLST93
	.uleb128 0x14
	.long	.LASF102
	.byte	0x1
	.byte	0x49
	.long	0x333
	.long	.LLST94
	.uleb128 0x2d
	.string	"ia"
	.byte	0x1
	.byte	0x49
	.long	0x3f
	.long	.LLST95
	.uleb128 0x16
	.long	.LASF103
	.byte	0x1
	.byte	0x4b
	.long	0x3f
	.long	.LLST96
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.long	0x3f
	.long	.LLST97
	.uleb128 0x16
	.long	.LASF104
	.byte	0x1
	.byte	0x4c
	.long	0x3f
	.long	.LLST98
	.uleb128 0x34
	.long	0xb85
	.quad	.LBB40
	.long	.Ldebug_ranges0+0x200
	.byte	0x1
	.byte	0x50
	.uleb128 0x1c
	.long	0xb93
	.long	.LLST99
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF105
	.byte	0x1
	.byte	0x69
	.byte	0x1
	.quad	.LFB35
	.quad	.LFE35
	.byte	0x1
	.byte	0x9c
	.long	0xf4b
	.uleb128 0x14
	.long	.LASF106
	.byte	0x1
	.byte	0x69
	.long	0xf4b
	.long	.LLST100
	.uleb128 0x14
	.long	.LASF107
	.byte	0x1
	.byte	0x69
	.long	0x2a9
	.long	.LLST101
	.uleb128 0x14
	.long	.LASF108
	.byte	0x1
	.byte	0x69
	.long	0x46
	.long	.LLST102
	.uleb128 0x14
	.long	.LASF109
	.byte	0x1
	.byte	0x6a
	.long	0x46
	.long	.LLST103
	.uleb128 0x14
	.long	.LASF110
	.byte	0x1
	.byte	0x6a
	.long	0x8f
	.long	.LLST104
	.uleb128 0x14
	.long	.LASF111
	.byte	0x1
	.byte	0x6a
	.long	0xf50
	.long	.LLST105
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST106
	.uleb128 0x15
	.string	"j"
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST107
	.uleb128 0x16
	.long	.LASF112
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST108
	.uleb128 0x15
	.string	"len"
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.long	.LLST109
	.uleb128 0x22
	.long	.LASF113
	.byte	0x1
	.byte	0x6c
	.long	0x2d
	.uleb128 0x16
	.long	.LASF114
	.byte	0x1
	.byte	0x6d
	.long	0x3f
	.long	.LLST110
	.uleb128 0x15
	.string	"n"
	.byte	0x1
	.byte	0x6d
	.long	0x3f
	.long	.LLST111
	.uleb128 0x35
	.long	0xb85
	.quad	.LBB52
	.quad	.LBE52
	.byte	0x1
	.byte	0x82
	.long	0xefd
	.uleb128 0x1c
	.long	0xb93
	.long	.LLST112
	.byte	0x0
	.uleb128 0x35
	.long	0xb85
	.quad	.LBB54
	.quad	.LBE54
	.byte	0x1
	.byte	0x87
	.long	0xf22
	.uleb128 0x1c
	.long	0xb93
	.long	.LLST113
	.byte	0x0
	.uleb128 0x36
	.long	0xb85
	.quad	.LBB56
	.quad	.LBE56
	.byte	0x1
	.byte	0x73
	.uleb128 0x1e
	.long	0xb93
	.byte	0xa
	.byte	0x3
	.quad	.LC15
	.byte	0x9f
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.long	0x2a9
	.uleb128 0xe
	.long	0xf55
	.uleb128 0x6
	.byte	0x8
	.long	0x46
	.uleb128 0x27
	.byte	0x1
	.long	.LASF115
	.byte	0x1
	.value	0x1dc
	.byte	0x1
	.long	0x2bb
	.quad	.LFB50
	.quad	.LFE50
	.byte	0x1
	.byte	0x9c
	.long	0x1644
	.uleb128 0x23
	.long	.LASF116
	.byte	0x1
	.value	0x1dc
	.long	0x333
	.long	.LLST114
	.uleb128 0x23
	.long	.LASF117
	.byte	0x1
	.value	0x1dc
	.long	0x333
	.long	.LLST115
	.uleb128 0x23
	.long	.LASF118
	.byte	0x1
	.value	0x1dd
	.long	0x333
	.long	.LLST116
	.uleb128 0x23
	.long	.LASF119
	.byte	0x1
	.value	0x1dd
	.long	0x333
	.long	.LLST117
	.uleb128 0x23
	.long	.LASF120
	.byte	0x1
	.value	0x1dd
	.long	0x2bb
	.long	.LLST118
	.uleb128 0x37
	.long	.LASF71
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x1
	.byte	0x61
	.uleb128 0x37
	.long	.LASF121
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x3
	.byte	0x77
	.sleb128 216
	.uleb128 0x37
	.long	.LASF122
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x3
	.byte	0x77
	.sleb128 208
	.uleb128 0x37
	.long	.LASF123
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x3
	.byte	0x77
	.sleb128 184
	.uleb128 0x37
	.long	.LASF124
	.byte	0x1
	.value	0x1df
	.long	0x2bb
	.byte	0x1
	.byte	0x64
	.uleb128 0x1d
	.string	"v1"
	.byte	0x1
	.value	0x1e0
	.long	0x1644
	.uleb128 0x1d
	.string	"v2"
	.byte	0x1
	.value	0x1e0
	.long	0x1644
	.uleb128 0x1d
	.string	"v3"
	.byte	0x1
	.value	0x1e0
	.long	0x1644
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB90
	.quad	.LBE90
	.byte	0x1
	.value	0x1e3
	.long	0x1097
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST119
	.uleb128 0x39
	.quad	.LBB91
	.quad	.LBE91
	.uleb128 0x2a
	.long	0x329
	.long	.LLST120
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2df
	.quad	.LBB92
	.long	.Ldebug_ranges0+0x240
	.byte	0x1
	.value	0x1e4
	.long	0x10e2
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST121
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x270
	.uleb128 0x2a
	.long	0x329
	.long	.LLST122
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2df
	.quad	.LBB95
	.long	.Ldebug_ranges0+0x2a0
	.byte	0x1
	.value	0x1e5
	.long	0x112d
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST123
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x2d0
	.uleb128 0x2a
	.long	0x329
	.long	.LLST124
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x913
	.quad	.LBB100
	.quad	.LBE100
	.byte	0x1
	.value	0x1e6
	.long	0x11b3
	.uleb128 0x32
	.long	0x93c
	.uleb128 0x32
	.long	0x931
	.uleb128 0x32
	.long	0x926
	.uleb128 0x39
	.quad	.LBB101
	.quad	.LBE101
	.uleb128 0x2a
	.long	0x947
	.long	.LLST125
	.uleb128 0x2a
	.long	0x953
	.long	.LLST126
	.uleb128 0x2a
	.long	0x95e
	.long	.LLST127
	.uleb128 0x2a
	.long	0x969
	.long	.LLST128
	.uleb128 0x2a
	.long	0x974
	.long	.LLST129
	.uleb128 0x2a
	.long	0x97f
	.long	.LLST130
	.uleb128 0x2a
	.long	0x98a
	.long	.LLST131
	.uleb128 0x2a
	.long	0x995
	.long	.LLST132
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB102
	.quad	.LBE102
	.byte	0x1
	.value	0x1e9
	.long	0x120d
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST133
	.uleb128 0x39
	.quad	.LBB103
	.quad	.LBE103
	.uleb128 0x2a
	.long	0x329
	.long	.LLST134
	.uleb128 0x32
	.long	0x2ed
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB104
	.quad	.LBE104
	.byte	0x1
	.value	0x1ea
	.long	0x1268
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST135
	.uleb128 0x39
	.quad	.LBB105
	.quad	.LBE105
	.uleb128 0x2a
	.long	0x329
	.long	.LLST136
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB106
	.quad	.LBE106
	.byte	0x1
	.value	0x1eb
	.long	0x12c3
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST137
	.uleb128 0x39
	.quad	.LBB107
	.quad	.LBE107
	.uleb128 0x2a
	.long	0x329
	.long	.LLST138
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x913
	.quad	.LBB108
	.quad	.LBE108
	.byte	0x1
	.value	0x1ec
	.long	0x1349
	.uleb128 0x32
	.long	0x93c
	.uleb128 0x32
	.long	0x931
	.uleb128 0x32
	.long	0x926
	.uleb128 0x39
	.quad	.LBB109
	.quad	.LBE109
	.uleb128 0x2a
	.long	0x947
	.long	.LLST139
	.uleb128 0x2a
	.long	0x953
	.long	.LLST140
	.uleb128 0x2a
	.long	0x95e
	.long	.LLST141
	.uleb128 0x2a
	.long	0x969
	.long	.LLST142
	.uleb128 0x2a
	.long	0x974
	.long	.LLST143
	.uleb128 0x2a
	.long	0x97f
	.long	.LLST144
	.uleb128 0x2a
	.long	0x98a
	.long	.LLST145
	.uleb128 0x2a
	.long	0x995
	.long	.LLST146
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB110
	.quad	.LBE110
	.byte	0x1
	.value	0x1ef
	.long	0x13a3
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST147
	.uleb128 0x39
	.quad	.LBB111
	.quad	.LBE111
	.uleb128 0x2a
	.long	0x329
	.long	.LLST148
	.uleb128 0x32
	.long	0x2ed
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB112
	.quad	.LBE112
	.byte	0x1
	.value	0x1f0
	.long	0x13fe
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST149
	.uleb128 0x39
	.quad	.LBB113
	.quad	.LBE113
	.uleb128 0x2a
	.long	0x329
	.long	.LLST150
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB114
	.quad	.LBE114
	.byte	0x1
	.value	0x1f1
	.long	0x1455
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2f8
	.uleb128 0x39
	.quad	.LBB115
	.quad	.LBE115
	.uleb128 0x2a
	.long	0x329
	.long	.LLST151
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x913
	.quad	.LBB116
	.quad	.LBE116
	.byte	0x1
	.value	0x1f2
	.long	0x14db
	.uleb128 0x32
	.long	0x93c
	.uleb128 0x32
	.long	0x931
	.uleb128 0x32
	.long	0x926
	.uleb128 0x39
	.quad	.LBB117
	.quad	.LBE117
	.uleb128 0x2a
	.long	0x947
	.long	.LLST152
	.uleb128 0x2a
	.long	0x953
	.long	.LLST153
	.uleb128 0x2a
	.long	0x95e
	.long	.LLST154
	.uleb128 0x2a
	.long	0x969
	.long	.LLST155
	.uleb128 0x2a
	.long	0x974
	.long	.LLST156
	.uleb128 0x2a
	.long	0x97f
	.long	.LLST157
	.uleb128 0x2a
	.long	0x98a
	.long	.LLST158
	.uleb128 0x2a
	.long	0x995
	.long	.LLST159
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.long	0x2df
	.quad	.LBB118
	.quad	.LBE118
	.byte	0x1
	.value	0x1f5
	.long	0x1531
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2f8
	.uleb128 0x39
	.quad	.LBB119
	.quad	.LBE119
	.uleb128 0x2a
	.long	0x329
	.long	.LLST160
	.uleb128 0x32
	.long	0x2ed
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2df
	.quad	.LBB120
	.long	.Ldebug_ranges0+0x300
	.byte	0x1
	.value	0x1f6
	.long	0x1578
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x32
	.long	0x2f8
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x330
	.uleb128 0x2a
	.long	0x329
	.long	.LLST161
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x2df
	.quad	.LBB123
	.long	.Ldebug_ranges0+0x360
	.byte	0x1
	.value	0x1f7
	.long	0x15c3
	.uleb128 0x32
	.long	0x320
	.uleb128 0x32
	.long	0x317
	.uleb128 0x32
	.long	0x30e
	.uleb128 0x32
	.long	0x303
	.uleb128 0x1c
	.long	0x2f8
	.long	.LLST162
	.uleb128 0x29
	.long	.Ldebug_ranges0+0x390
	.uleb128 0x2a
	.long	0x329
	.long	.LLST163
	.uleb128 0x3a
	.long	0x2ed
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.long	0x913
	.quad	.LBB128
	.quad	.LBE128
	.byte	0x1
	.value	0x1f8
	.uleb128 0x32
	.long	0x93c
	.uleb128 0x32
	.long	0x931
	.uleb128 0x32
	.long	0x926
	.uleb128 0x39
	.quad	.LBB129
	.quad	.LBE129
	.uleb128 0x1f
	.long	0x947
	.byte	0x1
	.byte	0x64
	.uleb128 0x2a
	.long	0x953
	.long	.LLST164
	.uleb128 0x2a
	.long	0x95e
	.long	.LLST165
	.uleb128 0x2a
	.long	0x969
	.long	.LLST166
	.uleb128 0x2a
	.long	0x974
	.long	.LLST167
	.uleb128 0x2a
	.long	0x97f
	.long	.LLST168
	.uleb128 0x2a
	.long	0x98a
	.long	.LLST169
	.uleb128 0x2a
	.long	0x995
	.long	.LLST170
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x2bb
	.long	0x1654
	.uleb128 0xd
	.long	0x38
	.byte	0x2
	.byte	0x0
	.uleb128 0x3c
	.long	.LASF125
	.byte	0x6
	.byte	0xa5
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3c
	.long	.LASF126
	.byte	0x6
	.byte	0xa6
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3c
	.long	.LASF127
	.byte	0x6
	.byte	0xa7
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3d
	.long	.LASF128
	.byte	0x5
	.byte	0x66
	.long	0x168a
	.long	0x4c000101
	.uleb128 0xe
	.long	0x2c2
	.uleb128 0x3d
	.long	.LASF129
	.byte	0x5
	.byte	0x67
	.long	0x168a
	.long	0x4c000118
	.uleb128 0x3d
	.long	.LASF130
	.byte	0x5
	.byte	0x68
	.long	0x168a
	.long	0x4c000102
	.uleb128 0x3d
	.long	.LASF131
	.byte	0x5
	.byte	0x6a
	.long	0x168a
	.long	0x4c00040e
	.uleb128 0x3d
	.long	.LASF132
	.byte	0x5
	.byte	0x6b
	.long	0x168a
	.long	0x4c000203
	.uleb128 0x3d
	.long	.LASF133
	.byte	0x5
	.byte	0x6c
	.long	0x168a
	.long	0x4c000204
	.uleb128 0x3d
	.long	.LASF134
	.byte	0x5
	.byte	0x6d
	.long	0x168a
	.long	0x4c000405
	.uleb128 0x3d
	.long	.LASF135
	.byte	0x5
	.byte	0x6e
	.long	0x168a
	.long	0x4c000406
	.uleb128 0x3d
	.long	.LASF136
	.byte	0x5
	.byte	0x6f
	.long	0x168a
	.long	0x4c000807
	.uleb128 0x3d
	.long	.LASF137
	.byte	0x5
	.byte	0x70
	.long	0x168a
	.long	0x4c000808
	.uleb128 0x3d
	.long	.LASF138
	.byte	0x5
	.byte	0x71
	.long	0x168a
	.long	0x4c00040a
	.uleb128 0x3d
	.long	.LASF139
	.byte	0x5
	.byte	0x72
	.long	0x168a
	.long	0x4c00080b
	.uleb128 0x3d
	.long	.LASF140
	.byte	0x5
	.byte	0x73
	.long	0x168a
	.long	0x4c00100c
	.uleb128 0x3d
	.long	.LASF141
	.byte	0x5
	.byte	0x74
	.long	0x168a
	.long	0x4c000809
	.uleb128 0x3d
	.long	.LASF142
	.byte	0x5
	.byte	0x75
	.long	0x168a
	.long	0x4c000819
	.uleb128 0x3e
	.long	.LASF143
	.byte	0x5
	.byte	0x91
	.long	0x168a
	.sleb128 -1946157056
	.uleb128 0x3e
	.long	.LASF144
	.byte	0x5
	.byte	0x92
	.long	0x168a
	.sleb128 -1946157055
	.uleb128 0x3e
	.long	.LASF145
	.byte	0x5
	.byte	0x93
	.long	0x168a
	.sleb128 -1946157054
	.uleb128 0x3e
	.long	.LASF146
	.byte	0x5
	.byte	0x94
	.long	0x168a
	.sleb128 -1946157053
	.uleb128 0x3d
	.long	.LASF147
	.byte	0x5
	.byte	0x95
	.long	0x168a
	.long	0x4c000816
	.uleb128 0x3e
	.long	.LASF148
	.byte	0x5
	.byte	0x96
	.long	0x168a
	.sleb128 -1946157052
	.uleb128 0x3d
	.long	.LASF149
	.byte	0x5
	.byte	0xc6
	.long	0x168a
	.long	0x4c000137
	.uleb128 0x3d
	.long	.LASF150
	.byte	0x5
	.byte	0xc7
	.long	0x168a
	.long	0x4c000238
	.uleb128 0x3d
	.long	.LASF151
	.byte	0x5
	.byte	0xc8
	.long	0x168a
	.long	0x4c000439
	.uleb128 0x3d
	.long	.LASF152
	.byte	0x5
	.byte	0xc9
	.long	0x168a
	.long	0x4c00083a
	.uleb128 0x3d
	.long	.LASF153
	.byte	0x5
	.byte	0xca
	.long	0x168a
	.long	0x4c00013b
	.uleb128 0x3d
	.long	.LASF154
	.byte	0x5
	.byte	0xcb
	.long	0x168a
	.long	0x4c00023c
	.uleb128 0x3d
	.long	.LASF155
	.byte	0x5
	.byte	0xcc
	.long	0x168a
	.long	0x4c00043d
	.uleb128 0x3d
	.long	.LASF156
	.byte	0x5
	.byte	0xcd
	.long	0x168a
	.long	0x4c00083e
	.uleb128 0x3d
	.long	.LASF157
	.byte	0x5
	.byte	0xd6
	.long	0x168a
	.long	0x4c00013f
	.uleb128 0x3d
	.long	.LASF158
	.byte	0x5
	.byte	0xd7
	.long	0x168a
	.long	0x4c000840
	.uleb128 0x3d
	.long	.LASF159
	.byte	0x5
	.byte	0xd8
	.long	0x168a
	.long	0x4c001041
	.uleb128 0x3d
	.long	.LASF160
	.byte	0x5
	.byte	0xd9
	.long	0x168a
	.long	0x4c002042
	.uleb128 0x3f
	.long	.LASF161
	.byte	0x5
	.value	0x130
	.long	0x168a
	.long	0xc000000
	.uleb128 0x3f
	.long	.LASF162
	.byte	0x5
	.value	0x1fc
	.long	0x168a
	.long	0x4c000843
	.uleb128 0x3f
	.long	.LASF163
	.byte	0x5
	.value	0x20b
	.long	0x168a
	.long	0x4c000844
	.uleb128 0x3c
	.long	.LASF125
	.byte	0x6
	.byte	0xa5
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3c
	.long	.LASF126
	.byte	0x6
	.byte	0xa6
	.long	0x27d
	.byte	0x1
	.byte	0x1
	.uleb128 0x3c
	.long	.LASF127
	.byte	0x6
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
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
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
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
	.uleb128 0x38
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
	.uleb128 0x39
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
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
	.uleb128 0x3c
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
	.uleb128 0x3d
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
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x17b
	.value	0x2
	.long	.Ldebug_info0
	.long	0x18cc
	.long	0x344
	.string	"maxval_double"
	.long	0x3a2
	.string	"minval_double"
	.long	0x3fe
	.string	"avgval_double"
	.long	0x496
	.string	"delete_vtx"
	.long	0x536
	.string	"insert_vtx"
	.long	0x583
	.string	"vect_cross"
	.long	0x5ca
	.string	"box_area"
	.long	0x643
	.string	"unit_vect_latlon"
	.long	0x6f2
	.string	"poly_area_no_adjust"
	.long	0x7a3
	.string	"poly_area"
	.long	0x86b
	.string	"latlon2xyz"
	.long	0x8c6
	.string	"normalize_vect"
	.long	0x9a2
	.string	"spherical_angle"
	.long	0xa0d
	.string	"great_circle_distance"
	.long	0xa68
	.string	"v_print"
	.long	0xac1
	.string	"xyz2latlon"
	.long	0xb9f
	.string	"error_handler"
	.long	0xbc4
	.string	"fix_lon"
	.long	0xd68
	.string	"nearest_index"
	.long	0xe00
	.string	"tokenize"
	.long	0xf5b
	.string	"spherical_excess_area"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x7c
	.value	0x2
	.long	.Ldebug_info0
	.long	0x18cc
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
	.long	0x2c2
	.string	"MPI_Datatype"
	.long	0x2d4
	.string	"MPI_Comm"
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
	.quad	.LBB45-.Ltext0
	.quad	.LBE45-.Ltext0
	.quad	.LBB44-.Ltext0
	.quad	.LBE44-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB92-.Ltext0
	.quad	.LBE92-.Ltext0
	.quad	.LBB98-.Ltext0
	.quad	.LBE98-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB93-.Ltext0
	.quad	.LBE93-.Ltext0
	.quad	.LBB94-.Ltext0
	.quad	.LBE94-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB95-.Ltext0
	.quad	.LBE95-.Ltext0
	.quad	.LBB99-.Ltext0
	.quad	.LBE99-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB96-.Ltext0
	.quad	.LBE96-.Ltext0
	.quad	.LBB97-.Ltext0
	.quad	.LBE97-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB120-.Ltext0
	.quad	.LBE120-.Ltext0
	.quad	.LBB126-.Ltext0
	.quad	.LBE126-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB121-.Ltext0
	.quad	.LBE121-.Ltext0
	.quad	.LBB122-.Ltext0
	.quad	.LBE122-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB123-.Ltext0
	.quad	.LBE123-.Ltext0
	.quad	.LBB127-.Ltext0
	.quad	.LBE127-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB124-.Ltext0
	.quad	.LBE124-.Ltext0
	.quad	.LBB125-.Ltext0
	.quad	.LBE125-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF141:
	.string	"mpich_mpi_long_long_int"
.LASF82:
	.string	"lat2"
.LASF32:
	.string	"_shortbuf"
.LASF51:
	.string	"MPI_Comm"
.LASF167:
	.string	"_IO_lock_t"
.LASF127:
	.string	"stderr"
.LASF21:
	.string	"_IO_buf_end"
.LASF123:
	.string	"ang3"
.LASF131:
	.string	"mpich_mpi_wchar"
.LASF116:
	.string	"p_ll"
.LASF138:
	.string	"mpich_mpi_float"
.LASF139:
	.string	"mpich_mpi_double"
.LASF118:
	.string	"p_lr"
.LASF19:
	.string	"_IO_write_end"
.LASF1:
	.string	"unsigned int"
.LASF155:
	.string	"mpich_mpi_uint32_t"
.LASF13:
	.string	"_flags"
.LASF103:
	.string	"index"
.LASF108:
	.string	"varlen"
.LASF25:
	.string	"_markers"
.LASF156:
	.string	"mpich_mpi_uint64_t"
.LASF114:
	.string	"found"
.LASF96:
	.string	"fix_lon"
.LASF140:
	.string	"mpich_mpi_long_double"
.LASF85:
	.string	"pdot"
.LASF129:
	.string	"mpich_mpi_signed_char"
.LASF46:
	.string	"_pos"
.LASF88:
	.string	"great_circle_distance"
.LASF165:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/mosaic_util.c"
.LASF54:
	.string	"maxval"
.LASF126:
	.string	"stdout"
.LASF24:
	.string	"_IO_save_end"
.LASF47:
	.string	"float"
.LASF98:
	.string	"x_sum"
.LASF132:
	.string	"mpich_mpi_short"
.LASF105:
	.string	"tokenize"
.LASF12:
	.string	"long long unsigned int"
.LASF80:
	.string	"poly_area_no_adjust"
.LASF67:
	.string	"ll_lon"
.LASF23:
	.string	"_IO_backup_base"
.LASF34:
	.string	"_offset"
.LASF86:
	.string	"spherical_angle"
.LASF72:
	.string	"vect_cross"
.LASF101:
	.string	"value"
.LASF27:
	.string	"_fileno"
.LASF84:
	.string	"normalize_vect"
.LASF58:
	.string	"avgval_double"
.LASF112:
	.string	"nvar"
.LASF149:
	.string	"mpich_mpi_int8_t"
.LASF64:
	.string	"lon_in"
.LASF8:
	.string	"size_t"
.LASF104:
	.string	"keep_going"
.LASF16:
	.string	"_IO_read_base"
.LASF56:
	.string	"minval_double"
.LASF68:
	.string	"ll_lat"
.LASF125:
	.string	"stdin"
.LASF44:
	.string	"_next"
.LASF66:
	.string	"box_area"
.LASF111:
	.string	"nstr"
.LASF106:
	.string	"string"
.LASF81:
	.string	"lat1"
.LASF144:
	.string	"mpich_mpi_double_int"
.LASF99:
	.string	"pole"
.LASF63:
	.string	"n_ins"
.LASF11:
	.string	"char"
.LASF40:
	.string	"_mode"
.LASF94:
	.string	"latlon2xyz"
.LASF43:
	.string	"_IO_marker"
.LASF14:
	.string	"_IO_read_ptr"
.LASF135:
	.string	"mpich_mpi_unsigned"
.LASF53:
	.string	"data"
.LASF163:
	.string	"mpich_mpi_offset"
.LASF145:
	.string	"mpich_mpi_long_int"
.LASF143:
	.string	"mpich_mpi_float_int"
.LASF71:
	.string	"area"
.LASF17:
	.string	"_IO_write_base"
.LASF164:
	.string	"GNU C 4.4.7 20120313 (Red Hat 4.4.7-16)"
.LASF3:
	.string	"long long int"
.LASF49:
	.string	"MPI_Datatype"
.LASF136:
	.string	"mpich_mpi_long"
.LASF22:
	.string	"_IO_save_base"
.LASF157:
	.string	"mpich_mpi_c_bool"
.LASF146:
	.string	"mpich_mpi_short_int"
.LASF91:
	.string	"v_print"
.LASF100:
	.string	"nearest_index"
.LASF150:
	.string	"mpich_mpi_int16_t"
.LASF159:
	.string	"mpich_mpi_c_double_complex"
.LASF115:
	.string	"spherical_excess_area"
.LASF52:
	.string	"size"
.LASF89:
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
.LASF69:
	.string	"ur_lon"
.LASF31:
	.string	"_vtable_offset"
.LASF97:
	.string	"tlon"
.LASF102:
	.string	"array"
.LASF162:
	.string	"mpich_mpi_aint"
.LASF161:
	.string	"mpich_mpi_datatype_null"
.LASF152:
	.string	"mpich_mpi_int64_t"
.LASF50:
	.string	"long double"
.LASF133:
	.string	"mpich_mpi_unsigned_short"
.LASF57:
	.string	"minval"
.LASF117:
	.string	"p_ul"
.LASF87:
	.string	"angle"
.LASF142:
	.string	"mpich_mpi_unsigned_long_long"
.LASF119:
	.string	"p_ur"
.LASF65:
	.string	"lat_in"
.LASF95:
	.string	"error_handler"
.LASF15:
	.string	"_IO_read_end"
.LASF147:
	.string	"mpich_mpi_2int"
.LASF7:
	.string	"short int"
.LASF2:
	.string	"long int"
.LASF70:
	.string	"ur_lat"
.LASF128:
	.string	"mpich_mpi_char"
.LASF62:
	.string	"insert_vtx"
.LASF166:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/preprocessing/regrid/exec"
.LASF92:
	.string	"xyz2latlon"
.LASF148:
	.string	"mpich_mpi_long_double_int"
.LASF153:
	.string	"mpich_mpi_uint8_t"
.LASF137:
	.string	"mpich_mpi_unsigned_long"
.LASF74:
	.string	"vlon"
.LASF33:
	.string	"_lock"
.LASF93:
	.string	"sinp"
.LASF83:
	.string	"poly_area"
.LASF0:
	.string	"long unsigned int"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF120:
	.string	"radius"
.LASF60:
	.string	"n_del"
.LASF113:
	.string	"ntoken"
.LASF154:
	.string	"mpich_mpi_uint16_t"
.LASF4:
	.string	"unsigned char"
.LASF59:
	.string	"avgval"
.LASF45:
	.string	"_sbuf"
.LASF18:
	.string	"_IO_write_ptr"
.LASF77:
	.string	"cos_lon"
.LASF75:
	.string	"vlat"
.LASF61:
	.string	"delete_vtx"
.LASF110:
	.string	"pstring"
.LASF55:
	.string	"maxval_double"
.LASF90:
	.string	"beta"
.LASF76:
	.string	"sin_lon"
.LASF109:
	.string	"maxvar"
.LASF107:
	.string	"tokens"
.LASF9:
	.string	"__off_t"
.LASF6:
	.string	"signed char"
.LASF5:
	.string	"short unsigned int"
.LASF79:
	.string	"cos_lat"
.LASF151:
	.string	"mpich_mpi_int32_t"
.LASF134:
	.string	"mpich_mpi_int"
.LASF48:
	.string	"double"
.LASF73:
	.string	"unit_vect_latlon"
.LASF130:
	.string	"mpich_mpi_unsigned_char"
.LASF160:
	.string	"mpich_mpi_c_long_double_complex"
.LASF26:
	.string	"_chain"
.LASF28:
	.string	"_flags2"
.LASF121:
	.string	"ang1"
.LASF122:
	.string	"ang2"
.LASF78:
	.string	"sin_lat"
.LASF124:
	.string	"ang4"
.LASF30:
	.string	"_cur_column"
.LASF158:
	.string	"mpich_mpi_c_float_complex"
.LASF10:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
