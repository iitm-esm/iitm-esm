	.file	"gradient_c2l.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.p2align 4,,15
.globl a2b_ord2
	.type	a2b_ord2, @function
a2b_ord2:
.LFB23:
	.file 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/gradient_c2l.c"
	.loc 1 136 0
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
	movq	%rdx, %rbx
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	.loc 1 136 0
	movl	%edi, 96(%rsp)
	.loc 1 144 0
	movl	96(%rsp), %eax
	.loc 1 142 0
	addl	$1, %edi
.LVL1:
	.loc 1 136 0
	movl	%esi, 104(%rsp)
	.loc 1 142 0
	movl	%edi, 88(%rsp)
.LVL2:
	.loc 1 143 0
	addl	$1, %esi
.LVL3:
	.loc 1 136 0
	movq	%rcx, 144(%rsp)
	movq	%r9, 136(%rsp)
	.loc 1 144 0
	addl	$2, %eax
.LVL4:
	.loc 1 143 0
	movl	%esi, 124(%rsp)
.LVL5:
	.loc 1 136 0
	movq	%r8, 152(%rsp)
	.loc 1 144 0
	movslq	%eax, %rdx
.LVL6:
	movl	%eax, 92(%rsp)
	movq	%rdx, %rbp
	movq	%rdx, 32(%rsp)
	salq	$3, %rbp
	movq	%rbp, %rdi
.LVL7:
	call	malloc
.LVL8:
	.loc 1 145 0
	movl	104(%rsp), %edi
	.loc 1 144 0
	movq	%rax, 112(%rsp)
.LVL9:
	.loc 1 145 0
	addl	$2, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
.LVL10:
	.loc 1 133 0
	movl	240(%rsp), %esi
	.loc 1 152 0
	movl	248(%rsp), %ecx
	.loc 1 133 0
	movl	256(%rsp), %edx
	.loc 1 145 0
	movq	%rax, 128(%rsp)
.LVL11:
	.loc 1 160 0
	movl	264(%rsp), %eax
.LVL12:
	.loc 1 152 0
	movl	88(%rsp), %r9d
	.loc 1 133 0
	testl	%esi, %esi
	.loc 1 160 0
	movl	124(%rsp), %esi
	.loc 1 133 0
	setne	111(%rsp)
	.loc 1 152 0
	testl	%ecx, %ecx
	cmovne	96(%rsp), %r9d
	.loc 1 133 0
	testl	%edx, %edx
	movzbl	111(%rsp), %r12d
.LVL13:
	setne	103(%rsp)
	.loc 1 160 0
	testl	%eax, %eax
	.loc 1 133 0
	movzbl	103(%rsp), %ecx
	.loc 1 160 0
	cmovne	104(%rsp), %esi
	.loc 1 133 0
	movl	%ecx, 84(%rsp)
.LVL14:
	.loc 1 166 0
	cmpl	%ecx, %esi
	.loc 1 160 0
	movl	%esi, 56(%rsp)
.LVL15:
	.loc 1 166 0
	jle	.L6
	.loc 1 133 0
	movl	92(%rsp), %r14d
	movl	92(%rsp), %r13d
	movl	%ecx, %r11d
	movzbl	111(%rsp), %eax
	addl	$1, %r11d
	movslq	88(%rsp), %r10
	movq	232(%rsp), %r15
	movsd	.LC0(%rip), %xmm2
	imull	%ecx, %r14d
	movapd	.LC1(%rip), %xmm3
	imull	%r11d, %r13d
	movapd	%xmm2, %xmm4
	movq	%r10, 64(%rsp)
	salq	$3, %r10
	movl	%r12d, 60(%rsp)
	movslq	%r14d, %r14
	movq	%r10, 72(%rsp)
	leaq	(%r14,%rax), %rdx
	movslq	%r13d, %r13
	leaq	(%rbx,%rdx,8), %rsi
.LVL16:
	leaq	(%rax,%r13), %rdx
	leaq	(%rbx,%rdx,8), %rdi
	movl	88(%rsp), %edx
	imull	%ecx, %edx
	movslq	%edx, %rdx
	addq	%rdx, %rax
	leaq	(%r15,%rax,8), %r8
	movl	%r9d, %eax
	subl	%r12d, %eax
	.loc 1 166 0
	movl	%eax, %r10d
	.loc 1 133 0
	movl	%eax, 40(%rsp)
	.loc 1 166 0
	shrl	%r10d
	leal	(%r10,%r10), %ecx
.LVL17:
	movl	%ecx, 52(%rsp)
	.loc 1 167 0
	addl	%r12d, %ecx
	movq	%rdx, %r12
.LVL18:
	movl	%ecx, 80(%rsp)
.LVL19:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 166 0
	cmpl	60(%rsp), %r9d
	movl	%r11d, %eax
	jle	.L15
	.loc 1 133 0
	cmpl	$6, 40(%rsp)
	leaq	8(%rsi), %rdx
	leaq	8(%rdi), %rcx
	leaq	16(%r8), %rax
	jbe	.L21
	testb	$15, %r8b
	jne	.L21
	leaq	16(%rsi), %r15
	cmpq	%r15, %r8
	jbe	.L96
	leaq	24(%rsi), %r15
	cmpq	%r15, %r8
	jbe	.L97
.L19:
	leaq	16(%rdi), %r15
	cmpq	%r15, %r8
	jbe	.L98
.L20:
	leaq	24(%rdi), %r15
	cmpq	%r15, %r8
	jbe	.L99
.L16:
	.loc 1 166 0
	movl	52(%rsp), %r15d
	testl	%r15d, %r15d
	je	.L100
	xorl	%eax, %eax
	xorl	%r15d, %r15d
.LVL20:
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 167 0
	movsd	(%rax,%rsi), %xmm1
	addl	$1, %r15d
	movsd	(%rdx), %xmm5
	movhpd	8(%rsi,%rax), %xmm1
	movhpd	8(%rdx), %xmm5
	addq	$16, %rdx
	movapd	%xmm1, %xmm0
	addpd	%xmm5, %xmm0
	movsd	(%rax,%rdi), %xmm5
	movhpd	8(%rdi,%rax), %xmm5
	addpd	%xmm5, %xmm0
	movsd	(%rcx), %xmm5
	movhpd	8(%rcx), %xmm5
	addq	$16, %rcx
	addpd	%xmm5, %xmm0
	mulpd	%xmm3, %xmm0
	movapd	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpl	%r10d, %r15d
	jb	.L12
	movl	52(%rsp), %r15d
	cmpl	%r15d, 40(%rsp)
	movl	80(%rsp), %ecx
	je	.L9
.L11:
	.loc 1 133 0
	movslq	%ecx, %r15
	movq	232(%rsp), %rdx
	leaq	(%r15,%r14), %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 8(%rsp)
	leaq	(%r15,%r13), %rax
	addq	%r12, %r15
	leaq	(%rdx,%r15,8), %rdx
	leaq	(%rbx,%rax,8), %rax
	movq	%rdx, %r15
	movq	8(%rsp), %rdx
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 1 167 0
	movsd	(%rdx), %xmm0
	.loc 1 166 0
	addl	$1, %ecx
.LVL21:
	.loc 1 167 0
	addsd	8(%rdx), %xmm0
	.loc 1 166 0
	addq	$8, %rdx
	.loc 1 167 0
	addsd	(%rax), %xmm0
	addsd	8(%rax), %xmm0
	.loc 1 166 0
	addq	$8, %rax
	.loc 1 167 0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%r15)
	.loc 1 166 0
	addq	$8, %r15
	cmpl	%ecx, %r9d
	jg	.L13
.LVL22:
.L9:
	movl	%r11d, %eax
.L15:
.LVL23:
	addl	$1, %r11d
.LVL24:
	addq	%rbp, %rsi
	addq	%rbp, %rdi
	addq	72(%rsp), %r8
	addq	32(%rsp), %r14
	addq	32(%rsp), %r13
	addq	64(%rsp), %r12
	cmpl	%eax, 56(%rsp)
	jg	.L7
	movl	60(%rsp), %r12d
.LVL25:
.L6:
	.loc 1 172 0
	cmpb	$0, 103(%rsp)
	je	.L22
	cmpb	$0, 111(%rsp)
	jne	.L101
.L22:
	.loc 1 173 0
	movl	248(%rsp), %edx
	testl	%edx, %edx
	setne	%r8b
	cmpb	$0, 103(%rsp)
	je	.L23
	testb	%r8b, %r8b
	jne	.L102
.L23:
	.loc 1 174 0
	movl	264(%rsp), %eax
	testl	%eax, %eax
	setne	40(%rsp)
	jne	.L103
.L25:
	.loc 1 178 0
	cmpb	$0, 111(%rsp)
	jne	.L26
.L27:
	.loc 1 184 0
	testb	%r8b, %r8b
	je	.L30
.LVL26:
	.loc 1 185 0
	movl	84(%rsp), %r10d
	cmpl	%r10d, 56(%rsp)
	jl	.L30
	.loc 1 133 0
	movl	92(%rsp), %eax
	movslq	96(%rsp), %r11
	movslq	88(%rsp), %r14
	movzbl	103(%rsp), %r8d
	movzbl	103(%rsp), %r15d
	movq	128(%rsp), %r13
	imull	%r10d, %eax
	movsd	.LC3(%rip), %xmm1
	leaq	0(,%r8,8), %r10
	addq	$8, %r13
	cltq
	leaq	(%rax,%r11), %rdx
	addq	%r14, %rax
	leaq	(%rbx,%rax,8), %rcx
	movq	128(%rsp), %rax
	leaq	(%rbx,%rdx,8), %rsi
	movl	56(%rsp), %edx
	addq	%r10, %rax
	subl	%r15d, %edx
	leaq	(%r8,%rdx), %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	%rax, %rdx
.LVL27:
	.p2align 4,,10
	.p2align 3
.L31:
	.loc 1 185 0
	movsd	(%rsi), %xmm0
	addq	%rbp, %rsi
	addsd	(%rcx), %xmm0
	addq	%rbp, %rcx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rdx
	cmpq	%rdi, %rdx
	jne	.L31
.LVL28:
	.loc 1 186 0
	movl	84(%rsp), %edx
	cmpl	%edx, 56(%rsp)
	jle	.L30
	.loc 1 133 0
	movl	88(%rsp), %edx
	movq	232(%rsp), %rsi
	leaq	0(,%r14,8), %rcx
	imull	84(%rsp), %edx
	.loc 1 186 0
	addq	152(%rsp), %r10
	movsd	.LC4(%rip), %xmm0
	.loc 1 133 0
	movslq	%edx, %rdx
	leaq	(%r11,%rdx), %rdx
	leaq	(%rsi,%rdx,8), %rdx
	movl	%r15d, %esi
	notl	%esi
	addl	56(%rsp), %esi
	addq	%r8, %rsi
	leaq	0(%r13,%rsi,8), %rsi
.LVL29:
	.p2align 4,,10
	.p2align 3
.L32:
	.loc 1 186 0
	movsd	(%r10), %xmm2
	addq	$8, %r10
	movapd	%xmm0, %xmm3
	movsd	(%rax), %xmm1
	subsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	8(%rax), %xmm2
	addq	$8, %rax
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx)
	addq	%rcx, %rdx
	cmpq	%rsi, %rax
	jne	.L32
.L30:
	.loc 1 190 0
	cmpb	$0, 103(%rsp)
	je	.L33
.LVL30:
	.loc 1 191 0
	cmpl	%r12d, %r9d
	jl	.L33
	.loc 1 133 0
	movl	%r12d, %r11d
	movslq	%r12d, %rax
	movq	112(%rsp), %rdx
	notl	%r11d
	leaq	0(,%rax,8), %r8
	addq	32(%rsp), %rax
	leal	(%r9,%r11), %r11d
	addq	%r8, %rdx
	leaq	(%rbx,%r8), %rdi
	leal	2(%r11), %r10d
	leaq	16(%rdx), %r14
	leaq	(%rbx,%rax,8), %rsi
	cmpl	$9, %r10d
	jbe	.L34
	testb	$15, %dl
	jne	.L34
	leaq	16(%rdi), %rax
	cmpq	%rax, %rdx
	jbe	.L104
.L35:
	leaq	16(%rsi), %rax
	cmpq	%rax, %rdx
	jbe	.L105
.L71:
	movl	%r10d, %ebp
	shrl	%ebp
	movl	%ebp, %r13d
	addl	%r13d, %r13d
	je	.L106
	movapd	.LC5(%rip), %xmm2
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LVL31:
	.p2align 4,,10
	.p2align 3
.L39:
	.loc 1 191 0
	movsd	(%rdi,%rax), %xmm4
	addl	$1, %ecx
	movsd	(%rsi,%rax), %xmm5
	movhpd	8(%rdi,%rax), %xmm4
	movhpd	8(%rsi,%rax), %xmm5
	movapd	%xmm4, %xmm0
	addpd	%xmm5, %xmm0
	mulpd	%xmm2, %xmm0
	movapd	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%ebp, %ecx
	jb	.L39
	cmpl	%r13d, %r10d
	leal	0(%r13,%r12), %eax
	je	.L40
.L38:
	.loc 1 133 0
	movslq	%eax, %rdi
	movsd	.LC3(%rip), %xmm1
	leaq	0(,%rdi,8), %rsi
	addq	32(%rsp), %rdi
	leaq	(%rbx,%rsi), %rcx
	addq	112(%rsp), %rsi
	leaq	(%rbx,%rdi,8), %rdi
	.p2align 4,,10
	.p2align 3
.L41:
	.loc 1 191 0
	movsd	(%rcx), %xmm0
	addl	$1, %eax
.LVL32:
	addq	$8, %rcx
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsi)
	addq	$8, %rsi
	cmpl	%eax, %r9d
	jge	.L41
.LVL33:
.L40:
	.loc 1 192 0
	cmpl	%r12d, %r9d
	jle	.L33
	.loc 1 133 0
	movq	232(%rsp), %rdi
	addl	$1, %r11d
	leaq	8(%rdx), %rcx
	addq	%r8, %rdi
	addq	136(%rsp), %r8
	cmpl	$6, %r11d
	leaq	16(%rdi), %rax
	jbe	.L43
	testb	$15, %dil
	jne	.L43
	leaq	16(%r8), %rsi
	cmpq	%rsi, %rdi
	jbe	.L107
.L44:
	cmpq	%r14, %rdi
	jbe	.L108
.L45:
	leaq	16(%rcx), %rsi
	cmpq	%rsi, %rdi
	jbe	.L109
.L72:
	movl	%r11d, %ebp
	shrl	%ebp
	movl	%ebp, %r10d
	addl	%r10d, %r10d
	je	.L110
	movapd	.LC6(%rip), %xmm3
	xorl	%eax, %eax
	xorl	%esi, %esi
.LVL34:
	.p2align 4,,10
	.p2align 3
.L49:
	.loc 1 192 0
	movsd	(%r8,%rax), %xmm0
	addl	$1, %esi
	movapd	%xmm3, %xmm4
	movhpd	8(%r8,%rax), %xmm0
	movsd	(%rdx,%rax), %xmm2
	movsd	(%rcx), %xmm5
	movapd	%xmm0, %xmm1
	movhpd	8(%rdx,%rax), %xmm2
	movhpd	8(%rcx), %xmm5
	addq	$16, %rcx
	subpd	%xmm1, %xmm4
	movapd	%xmm2, %xmm0
	mulpd	%xmm1, %xmm0
	movapd	%xmm4, %xmm1
	mulpd	%xmm5, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%ebp, %esi
	jb	.L49
	cmpl	%r10d, %r11d
	leal	(%r10,%r12), %eax
	je	.L33
.L48:
	.loc 1 133 0
	movq	136(%rsp), %rsi
	movq	112(%rsp), %rdx
	movslq	%eax, %rcx
	salq	$3, %rcx
	movsd	.LC4(%rip), %xmm0
	addq	%rcx, %rsi
	addq	%rcx, %rdx
	addq	232(%rsp), %rcx
	.p2align 4,,10
	.p2align 3
.L50:
	.loc 1 192 0
	movsd	(%rsi), %xmm2
	addl	$1, %eax
.LVL35:
	movapd	%xmm0, %xmm3
	addq	$8, %rsi
	movsd	(%rdx), %xmm1
	subsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	8(%rdx), %xmm2
	addq	$8, %rdx
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%rcx)
	addq	$8, %rcx
	cmpl	%eax, %r9d
	jg	.L50
.LVL36:
.L33:
	.loc 1 196 0
	cmpb	$0, 40(%rsp)
	je	.L70
.LVL37:
	.loc 1 197 0
	cmpl	%r12d, %r9d
	jl	.L70
	.loc 1 133 0
	movl	92(%rsp), %r11d
	movl	124(%rsp), %r13d
	movslq	%r12d, %r8
	imull	104(%rsp), %r11d
	imull	92(%rsp), %r13d
	movl	%r12d, %r15d
	movq	112(%rsp), %rdx
	leaq	0(,%r8,8), %r14
	notl	%r15d
	leal	(%r9,%r15), %r15d
	addq	%r14, %rdx
	movslq	%r11d, %r11
	leal	2(%r15), %r10d
	leaq	(%r8,%r11), %rax
	movslq	%r13d, %r13
	cmpl	$9, %r10d
	leaq	(%rbx,%rax,8), %rdi
	leaq	(%r8,%r13), %rax
	leaq	(%rbx,%rax,8), %rsi
	leaq	16(%rdx), %rax
	movq	%rax, 40(%rsp)
	jbe	.L53
	testb	$15, %dl
	jne	.L53
	leaq	16(%rdi), %rax
	cmpq	%rax, %rdx
	jbe	.L111
.L54:
	leaq	16(%rsi), %rax
	cmpq	%rax, %rdx
	jbe	.L112
.L73:
	movl	%r10d, %ebp
	shrl	%ebp
	movl	%ebp, %ecx
	addl	%ecx, %ecx
	movl	%ecx, 32(%rsp)
	je	.L113
	movapd	.LC5(%rip), %xmm2
	xorl	%eax, %eax
	xorl	%ecx, %ecx
.LVL38:
	.p2align 4,,10
	.p2align 3
.L58:
	.loc 1 197 0
	movsd	(%rdi,%rax), %xmm1
	addl	$1, %ecx
	movsd	(%rsi,%rax), %xmm3
	movhpd	8(%rdi,%rax), %xmm1
	movhpd	8(%rsi,%rax), %xmm3
	movapd	%xmm1, %xmm0
	addpd	%xmm3, %xmm0
	mulpd	%xmm2, %xmm0
	movapd	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpl	%ebp, %ecx
	jb	.L58
	movl	32(%rsp), %eax
	addl	%r12d, %eax
	cmpl	32(%rsp), %r10d
	je	.L59
.L57:
	.loc 1 133 0
	movq	112(%rsp), %r10
	movslq	%eax, %rcx
	addq	%rcx, %r11
	addq	%rcx, %r13
	leaq	(%rbx,%r11,8), %rsi
	movsd	.LC3(%rip), %xmm1
	leaq	(%rbx,%r13,8), %rbx
.LVL39:
	leaq	(%r10,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L60:
	.loc 1 197 0
	movsd	(%rsi), %xmm0
	addl	$1, %eax
.LVL40:
	addq	$8, %rsi
	addsd	(%rbx), %xmm0
	addq	$8, %rbx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rcx)
	addq	$8, %rcx
	cmpl	%eax, %r9d
	jge	.L60
.LVL41:
.L59:
	.loc 1 198 0
	cmpl	%r12d, %r9d
	jle	.L70
	.loc 1 133 0
	movl	104(%rsp), %ecx
	movq	232(%rsp), %rbx
	addl	$1, %r15d
	imull	88(%rsp), %ecx
	addq	224(%rsp), %r14
	cmpl	$6, %r15d
	movslq	%ecx, %rcx
	leaq	(%rcx,%r8), %rax
	leaq	(%rbx,%rax,8), %rax
	leaq	8(%rdx), %rbx
	leaq	16(%rax), %rsi
	jbe	.L62
	testb	$15, %al
	jne	.L62
	leaq	16(%r14), %rdi
	cmpq	%rdi, %rax
	jbe	.L114
.L63:
	cmpq	40(%rsp), %rax
	jbe	.L115
.L64:
	leaq	16(%rbx), %rdi
	cmpq	%rdi, %rax
	jbe	.L116
.L74:
	movl	%r15d, %edi
	shrl	%edi
	movl	%edi, %ebp
	addl	%ebp, %ebp
	je	.L66
	movapd	.LC6(%rip), %xmm3
	xorl	%esi, %esi
	xorl	%r8d, %r8d
.LVL42:
	.p2align 4,,10
	.p2align 3
.L67:
	.loc 1 198 0
	movsd	(%r14,%rsi), %xmm0
	addl	$1, %r8d
	movapd	%xmm3, %xmm4
	movhpd	8(%r14,%rsi), %xmm0
	movsd	(%rdx,%rsi), %xmm2
	movsd	(%rbx), %xmm5
	movapd	%xmm0, %xmm1
	movhpd	8(%rdx,%rsi), %xmm2
	movhpd	8(%rbx), %xmm5
	addq	$16, %rbx
	subpd	%xmm1, %xmm4
	movapd	%xmm2, %xmm0
	mulpd	%xmm1, %xmm0
	movapd	%xmm4, %xmm1
	mulpd	%xmm5, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, (%rax,%rsi)
	addq	$16, %rsi
	cmpl	%edi, %r8d
	jb	.L67
	addl	%ebp, %r12d
	cmpl	%ebp, %r15d
	je	.L70
	movslq	%r12d, %r8
.L66:
	.loc 1 133 0
	movq	224(%rsp), %rbx
	leaq	0(,%r8,8), %rax
	movq	232(%rsp), %r10
	addq	%r8, %rcx
	movsd	.LC4(%rip), %xmm0
	addq	%rax, %rbx
	addq	112(%rsp), %rax
	leaq	(%r10,%rcx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L68:
	.loc 1 198 0
	movsd	(%rbx), %xmm2
	addl	$1, %r12d
.LVL43:
	movapd	%xmm0, %xmm3
	addq	$8, %rbx
	movsd	(%rax), %xmm1
	subsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	8(%rax), %xmm2
	addq	$8, %rax
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx)
	addq	$8, %rdx
	cmpl	%r12d, %r9d
	jg	.L68
.LVL44:
.L70:
	.loc 1 201 0
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL45:
.L101:
	.cfi_restore_state
	.loc 1 172 0
	movslq	96(%rsp), %rax
	movq	232(%rsp), %rcx
	movsd	24(%rbx,%rax,8), %xmm0
	addsd	16(%rbx,%rax,8), %xmm0
	addsd	8(%rbx), %xmm0
	mulsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rcx)
	jmp	.L22
.L102:
	.loc 1 173 0
	movl	96(%rsp), %edx
	movslq	96(%rsp), %rax
	movq	232(%rsp), %rsi
	addl	%edx, %edx
	movslq	%edx, %rdx
	movsd	16(%rbx,%rdx,8), %xmm0
	movl	92(%rsp), %edx
	addl	88(%rsp), %edx
	addsd	(%rbx,%rax,8), %xmm0
	movslq	%edx, %rdx
	addsd	(%rbx,%rdx,8), %xmm0
	mulsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rsi,%rax,8)
	.loc 1 174 0
	movl	264(%rsp), %eax
	testl	%eax, %eax
	setne	40(%rsp)
	je	.L25
.L103:
	testb	%r8b, %r8b
	je	.L24
	movl	104(%rsp), %edx
	movl	92(%rsp), %eax
	imull	88(%rsp), %edx
	imull	104(%rsp), %eax
	movq	232(%rsp), %rdi
	addl	96(%rsp), %edx
	movslq	%edx, %rcx
	movl	96(%rsp), %edx
	leal	(%rax,%rdx), %edx
	addl	88(%rsp), %eax
	movslq	%edx, %rdx
	movsd	(%rbx,%rdx,8), %xmm0
	cltq
	addsd	(%rbx,%rax,8), %xmm0
	movl	124(%rsp), %eax
	imull	92(%rsp), %eax
	addl	96(%rsp), %eax
	cltq
	addsd	(%rbx,%rax,8), %xmm0
	mulsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rdi,%rcx,8)
.L24:
	.loc 1 175 0
	cmpb	$0, 40(%rsp)
	je	.L25
	cmpb	$0, 111(%rsp)
	je	.L27
	movl	92(%rsp), %eax
	movl	104(%rsp), %edx
	imull	104(%rsp), %eax
	imull	88(%rsp), %edx
	movq	232(%rsp), %r10
	cltq
	movsd	8(%rbx,%rax,8), %xmm0
	movslq	%edx, %rdx
	addsd	(%rbx,%rax,8), %xmm0
	movl	124(%rsp), %eax
	imull	92(%rsp), %eax
	cltq
	addsd	8(%rbx,%rax,8), %xmm0
	mulsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%r10,%rdx,8)
.L26:
.LVL46:
	.loc 1 179 0
	movl	84(%rsp), %r15d
	cmpl	%r15d, 56(%rsp)
	jl	.L27
	movl	92(%rsp), %eax
	.loc 1 133 0
	movzbl	103(%rsp), %r10d
	movzbl	103(%rsp), %r13d
	movl	56(%rsp), %edx
	movq	128(%rsp), %r11
	movsd	.LC3(%rip), %xmm1
	.loc 1 179 0
	imull	%r15d, %eax
	.loc 1 133 0
	leaq	0(,%r10,8), %rdi
	subl	%r13d, %edx
	addq	$8, %r11
	.loc 1 179 0
	cltq
	.loc 1 133 0
	leaq	(%r10,%rdx), %rdx
	.loc 1 179 0
	leaq	(%rbx,%rax,8), %rcx
	.loc 1 133 0
	movq	128(%rsp), %rax
	leaq	(%r11,%rdx,8), %rsi
	addq	%rdi, %rax
	movq	%rax, %rdx
.LVL47:
	.p2align 4,,10
	.p2align 3
.L28:
	.loc 1 179 0
	movsd	(%rcx), %xmm0
	addsd	8(%rcx), %xmm0
	addq	%rbp, %rcx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rdx
	cmpq	%rsi, %rdx
	jne	.L28
.LVL48:
	.loc 1 180 0
	movl	84(%rsp), %edx
	cmpl	%edx, 56(%rsp)
	jle	.L27
	.loc 1 133 0
	movl	88(%rsp), %edx
	movq	232(%rsp), %rsi
	imull	84(%rsp), %edx
	.loc 1 180 0
	movq	144(%rsp), %rcx
	movsd	.LC4(%rip), %xmm0
	addq	%rdi, %rcx
	.loc 1 133 0
	movslq	88(%rsp), %rdi
	movslq	%edx, %rdx
	leaq	(%rsi,%rdx,8), %rdx
	movl	%r13d, %esi
	notl	%esi
	addl	56(%rsp), %esi
	salq	$3, %rdi
	addq	%r10, %rsi
	leaq	(%r11,%rsi,8), %rsi
.LVL49:
	.p2align 4,,10
	.p2align 3
.L29:
	.loc 1 180 0
	movsd	(%rcx), %xmm2
	addq	$8, %rcx
	movapd	%xmm0, %xmm3
	movsd	(%rax), %xmm1
	subsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	8(%rax), %xmm2
	addq	$8, %rax
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx)
	addq	%rdi, %rdx
	cmpq	%rsi, %rax
	jne	.L29
	jmp	.L27
.LVL50:
	.p2align 4,,10
	.p2align 3
.L98:
	.loc 1 133 0
	cmpq	%rdi, %rax
	jb	.L20
	.p2align 4,,10
	.p2align 3
.L21:
	movl	60(%rsp), %ecx
	movq	%r8, %r15
	movq	%rdi, %rdx
	movq	%rsi, %rax
.LVL51:
	.p2align 4,,10
	.p2align 3
.L8:
	.loc 1 167 0
	movsd	(%rax), %xmm0
	.loc 1 166 0
	addl	$1, %ecx
.LVL52:
	.loc 1 167 0
	addsd	8(%rax), %xmm0
	.loc 1 166 0
	addq	$8, %rax
	.loc 1 167 0
	addsd	(%rdx), %xmm0
	addsd	8(%rdx), %xmm0
	.loc 1 166 0
	addq	$8, %rdx
	.loc 1 167 0
	mulsd	%xmm4, %xmm0
	movsd	%xmm0, (%r15)
	.loc 1 166 0
	addq	$8, %r15
	cmpl	%ecx, %r9d
	jg	.L8
	jmp	.L9
.LVL53:
	.p2align 4,,10
	.p2align 3
.L96:
	.loc 1 133 0
	cmpq	%rsi, %rax
	jae	.L21
	leaq	24(%rsi), %r15
	cmpq	%r15, %r8
	ja	.L19
	.p2align 4,,10
	.p2align 3
.L97:
	cmpq	%rdx, %rax
	jb	.L19
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L99:
	cmpq	%rcx, %rax
	jb	.L16
	.p2align 4,,8
	jmp	.L21
.LVL54:
.L111:
	cmpq	%rdi, 40(%rsp)
	.p2align 4,,3
	jb	.L54
.L53:
	movzbl	111(%rsp), %edi
	movq	112(%rsp), %rsi
	movl	%r9d, %ebp
	movq	112(%rsp), %r10
	movsd	.LC3(%rip), %xmm1
	leaq	(%rsi,%rdi,8), %rax
	movzbl	111(%rsp), %esi
	addq	%rdi, %r11
	addq	%rdi, %r13
	leaq	(%rbx,%r11,8), %rcx
	leaq	(%rbx,%r13,8), %rbx
.LVL55:
	subl	%esi, %ebp
	leaq	(%rdi,%rbp), %rsi
	leaq	8(%r10,%rsi,8), %rsi
.LVL56:
	.p2align 4,,10
	.p2align 3
.L61:
	.loc 1 197 0
	movsd	(%rcx), %xmm0
	addq	$8, %rcx
	addsd	(%rbx), %xmm0
	addq	$8, %rbx
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L61
	jmp	.L59
.LVL57:
.L114:
	.loc 1 133 0
	cmpq	%r14, %rsi
	jb	.L63
.L62:
	movzbl	111(%rsp), %esi
	movq	232(%rsp), %r10
	movq	224(%rsp), %rbx
	movq	112(%rsp), %r15
	movsd	.LC4(%rip), %xmm0
	addq	%rsi, %rcx
	leaq	0(,%rsi,8), %rax
	leaq	(%r10,%rcx,8), %rdx
	movzbl	111(%rsp), %ecx
	addq	%rax, %rbx
	addq	112(%rsp), %rax
	notl	%ecx
	leal	(%r9,%rcx), %ecx
	addq	%rcx, %rsi
	leaq	8(%r15,%rsi,8), %rcx
.LVL58:
	.p2align 4,,10
	.p2align 3
.L69:
	.loc 1 198 0
	movsd	(%rbx), %xmm2
	addq	$8, %rbx
	movapd	%xmm0, %xmm3
	movsd	(%rax), %xmm1
	subsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	8(%rax), %xmm2
	addq	$8, %rax
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx)
	addq	$8, %rdx
	cmpq	%rcx, %rax
	jne	.L69
	jmp	.L70
.LVL59:
.L107:
	.loc 1 133 0
	cmpq	%r8, %rax
	jb	.L44
.L43:
	movzbl	111(%rsp), %edi
	movzbl	111(%rsp), %esi
	movq	136(%rsp), %rcx
	movq	112(%rsp), %rax
	movq	112(%rsp), %r10
	movsd	.LC4(%rip), %xmm0
	leaq	0(,%rdi,8), %rdx
	notl	%esi
	addl	%r9d, %esi
	addq	%rdx, %rcx
	addq	%rdx, %rax
	addq	232(%rsp), %rdx
	addq	%rdi, %rsi
	leaq	8(%r10,%rsi,8), %rsi
.LVL60:
	.p2align 4,,10
	.p2align 3
.L51:
	.loc 1 192 0
	movsd	(%rcx), %xmm2
	addq	$8, %rcx
	movapd	%xmm0, %xmm3
	movsd	(%rax), %xmm1
	subsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	8(%rax), %xmm2
	addq	$8, %rax
	mulsd	%xmm3, %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, (%rdx)
	addq	$8, %rdx
	cmpq	%rsi, %rax
	jne	.L51
	jmp	.L33
.LVL61:
.L104:
	.loc 1 133 0
	cmpq	%rdi, %r14
	jb	.L35
.L34:
	movzbl	111(%rsp), %ebp
	movq	32(%rsp), %rcx
	movl	%r9d, %r10d
	movsd	.LC3(%rip), %xmm1
	addq	%rbp, %rcx
	leaq	0(,%rbp,8), %rdi
	leaq	(%rbx,%rcx,8), %rsi
	movq	112(%rsp), %rcx
	leaq	(%rbx,%rdi), %rax
	addq	%rdi, %rcx
	movzbl	111(%rsp), %edi
	subl	%edi, %r10d
	movq	%r10, %rdi
	addq	%rbp, %rdi
	leaq	8(%rbx,%rdi,8), %rdi
.LVL62:
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 191 0
	movsd	(%rax), %xmm0
	addq	$8, %rax
	addsd	(%rsi), %xmm0
	addq	$8, %rsi
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rcx)
	addq	$8, %rcx
	cmpq	%rdi, %rax
	jne	.L42
	jmp	.L40
.LVL63:
.L116:
	.loc 1 133 0
	cmpq	%rsi, %rbx
	ja	.L74
	.p2align 4,,8
	jmp	.L62
.L115:
	cmpq	%rdx, %rsi
	.p2align 4,,5
	jb	.L64
	.p2align 4,,8
	jmp	.L62
.LVL64:
.L112:
	cmpq	40(%rsp), %rsi
	.p2align 4,,3
	ja	.L73
	.p2align 4,,6
	jmp	.L53
.L109:
	cmpq	%rax, %rcx
	.p2align 4,,3
	ja	.L72
	.p2align 4,,8
	jmp	.L43
.L108:
	cmpq	%rdx, %rax
	.p2align 4,,5
	jb	.L45
	.p2align 4,,8
	jmp	.L43
.L105:
	cmpq	%r14, %rsi
	.p2align 4,,5
	ja	.L71
	.p2align 4,,8
	jmp	.L34
.L110:
	movl	%r12d, %eax
	.p2align 4,,5
	jmp	.L48
.LVL65:
.L100:
	.loc 1 166 0
	movl	60(%rsp), %ecx
	.p2align 4,,4
	jmp	.L11
.LVL66:
.L106:
	.loc 1 133 0
	movl	%r12d, %eax
	jmp	.L38
.L113:
	movl	%r12d, %eax
	jmp	.L57
	.cfi_endproc
.LFE23:
	.size	a2b_ord2, .-a2b_ord2
	.p2align 4,,15
.globl grad_c2l
	.type	grad_c2l, @function
grad_c2l:
.LFB22:
	.loc 1 72 0
	.cfi_startproc
.LVL67:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rcx, %r10
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.loc 1 77 0
	movl	(%rdi), %ebx
.LVL68:
	.loc 1 78 0
	movl	(%rsi), %ebp
.LVL69:
	.loc 1 72 0
	movq	288(%rsp), %rax
	movq	%rdx, 184(%rsp)
	movq	320(%rsp), %rdx
.LVL70:
	movq	312(%rsp), %rcx
.LVL71:
	.loc 1 80 0
	leal	1(%rbp), %r12d
	.loc 1 72 0
	movq	%r8, 128(%rsp)
	movq	%r9, 136(%rsp)
	movq	%rax, 200(%rsp)
	movq	328(%rsp), %rax
	movq	%rdx, 208(%rsp)
	movq	336(%rsp), %rdx
	movq	296(%rsp), %r8
.LVL72:
	movq	304(%rsp), %r9
.LVL73:
	movq	%rax, 144(%rsp)
	movq	344(%rsp), %rax
	movq	%rdx, 152(%rsp)
	movq	352(%rsp), %rdx
	movq	376(%rsp), %r15
	movq	384(%rsp), %r14
	movq	%rax, 160(%rsp)
	movq	360(%rsp), %rax
	movq	%rdx, 168(%rsp)
	movq	368(%rsp), %rdx
	movq	392(%rsp), %r13
	movq	%rax, 216(%rsp)
	.loc 1 79 0
	leal	1(%rbx), %eax
	.loc 1 81 0
	movl	%eax, %edi
.LVL74:
	.loc 1 79 0
	movl	%eax, 180(%rsp)
.LVL75:
	.loc 1 81 0
	movq	%r10, 56(%rsp)
	imull	%r12d, %edi
	movq	%rdx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%r8, 88(%rsp)
	movq	%r9, 80(%rsp)
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
.LVL76:
	movq	%rax, 104(%rsp)
.LVL77:
	.loc 1 82 0
	leal	(%rbx,%rbx,2), %eax
.LVL78:
	movl	%eax, 196(%rsp)
	imull	%r12d, %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 112(%rsp)
.LVL79:
	.loc 1 83 0
	movl	180(%rsp), %eax
.LVL80:
	imull	%ebp, %eax
	leal	(%rax,%rax,2), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 120(%rsp)
.LVL81:
	.loc 1 84 0
	movl	196(%rsp), %eax
.LVL82:
	imull	%ebp, %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 96(%rsp)
.LVL83:
	.loc 1 85 0
	movl	0(%r13), %eax
.LVL84:
	movl	%ebp, %esi
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rcx
	movl	%ebx, %edi
	movq	80(%rsp), %r9
	movq	88(%rsp), %r8
	movl	%eax, 40(%rsp)
	movl	(%r14), %eax
	movl	%eax, 32(%rsp)
	movl	(%r15), %eax
	movl	%eax, 24(%rsp)
	movl	(%rdx), %eax
	movq	104(%rsp), %rdx
	movq	%rcx, (%rsp)
	movq	200(%rsp), %rcx
	movl	%eax, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	184(%rsp), %rdx
	call	a2b_ord2
.LVL85:
	.loc 1 87 0
	testl	%r12d, %r12d
	movq	56(%rsp), %r10
	jle	.L118
	.loc 1 67 0
	movslq	180(%rsp), %r14
	movslq	196(%rsp), %r15
	movslq	%ebx, %r13
	movl	%ebp, 184(%rsp)
	movq	104(%rsp), %r11
	salq	$3, %r13
	movq	208(%rsp), %rbp
.LVL86:
	movsd	.LC3(%rip), %xmm1
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	salq	$3, %r14
	salq	$3, %r15
.LVL87:
	.p2align 4,,10
	.p2align 3
.L119:
	.loc 1 87 0
	testl	%ebx, %ebx
	jle	.L121
	movq	112(%rsp), %rcx
	leaq	0(%rbp,%r8), %rsi
	movq	%r10, %rdx
	movq	%r11, %rax
	xorl	%edi, %edi
	addq	%r8, %rcx
.LVL88:
	.p2align 4,,10
	.p2align 3
.L120:
	.loc 1 91 0
	movsd	(%rax), %xmm0
	.loc 1 87 0
	addl	$1, %edi
.LVL89:
	.loc 1 91 0
	addsd	8(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rdx), %xmm0
	mulsd	(%rsi), %xmm0
	movsd	%xmm0, (%rcx)
.LVL90:
	movsd	(%rax), %xmm0
	addsd	8(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rdx), %xmm0
	mulsd	8(%rsi), %xmm0
	movsd	%xmm0, 8(%rcx)
.LVL91:
	movsd	(%rax), %xmm0
	addsd	8(%rax), %xmm0
	.loc 1 87 0
	addq	$8, %rax
	.loc 1 91 0
	mulsd	%xmm1, %xmm0
	mulsd	(%rdx), %xmm0
	.loc 1 87 0
	addq	$8, %rdx
	.loc 1 91 0
	mulsd	16(%rsi), %xmm0
	.loc 1 87 0
	addq	$24, %rsi
	.loc 1 91 0
	movsd	%xmm0, 16(%rcx)
.LVL92:
	.loc 1 87 0
	addq	$24, %rcx
	cmpl	%ebx, %edi
	jne	.L120
.LVL93:
.L121:
	addl	$1, %r9d
.LVL94:
	addq	%r14, %r11
	addq	%r13, %r10
	addq	%r15, %r8
	cmpl	%r9d, %r12d
	jg	.L119
	movl	184(%rsp), %ebp
.LVL95:
.L118:
	.loc 1 95 0
	testl	%ebp, %ebp
	jle	.L122
	.loc 1 67 0
	movq	104(%rsp), %rdx
	movslq	%ebx, %rax
	movslq	180(%rsp), %r15
	movq	%rax, 184(%rsp)
	leal	2(%rbx), %r9d
	xorl	%r11d, %r11d
	movsd	.LC3(%rip), %xmm1
	xorl	%r10d, %r10d
	leaq	8(%rdx,%rax,8), %r13
	movl	180(%rsp), %eax
	xorl	%r12d, %r12d
.LVL96:
	salq	$3, %r15
	movl	%ebx, 180(%rsp)
	leal	(%rax,%rax,2), %r14d
	movl	%eax, %r8d
	movslq	%r14d, %r14
	salq	$3, %r14
.LVL97:
	.p2align 4,,10
	.p2align 3
.L123:
	.loc 1 95 0
	testl	%r8d, %r8d
	jle	.L126
	movq	104(%rsp), %rsi
	movq	128(%rsp), %rbx
	.loc 1 67 0
	movq	%r13, %rax
	.loc 1 95 0
	movq	144(%rsp), %rcx
	movq	120(%rsp), %rdx
	.loc 1 67 0
	movl	$1, %edi
	.loc 1 95 0
	addq	%r10, %rsi
	addq	%r10, %rbx
	addq	%r11, %rcx
	addq	%r11, %rdx
.LVL98:
	.p2align 4,,10
	.p2align 3
.L124:
	.loc 1 98 0
	movsd	(%rsi), %xmm0
	addl	$1, %edi
	addsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rbx), %xmm0
	mulsd	(%rcx), %xmm0
	movsd	%xmm0, (%rdx)
.LVL99:
	movsd	(%rsi), %xmm0
	addsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	(%rbx), %xmm0
	mulsd	8(%rcx), %xmm0
	movsd	%xmm0, 8(%rdx)
.LVL100:
	movsd	(%rsi), %xmm0
	addq	$8, %rsi
	addsd	(%rax), %xmm0
	addq	$8, %rax
	mulsd	%xmm1, %xmm0
	mulsd	(%rbx), %xmm0
	addq	$8, %rbx
	mulsd	16(%rcx), %xmm0
	addq	$24, %rcx
	movsd	%xmm0, 16(%rdx)
.LVL101:
	addq	$24, %rdx
	.loc 1 95 0
	cmpl	%r9d, %edi
	jne	.L124
.LVL102:
.L126:
	addl	$1, %r12d
.LVL103:
	addq	%r15, %r10
	addq	%r15, %r13
	addq	%r14, %r11
	cmpl	%ebp, %r12d
	jne	.L123
	.loc 1 67 0
	movslq	196(%rsp), %r8
	movq	112(%rsp), %r13
	xorl	%r11d, %r11d
	movq	120(%rsp), %r12
.LVL104:
	movl	180(%rsp), %ebx
.LVL105:
	movl	$1, %r10d
	movq	112(%rsp), %r15
	salq	$3, %r8
	addq	$8, %r12
	addq	%r8, %r13
.LVL106:
	.p2align 4,,10
	.p2align 3
.L127:
	.loc 1 103 0
	testl	%ebx, %ebx
	movl	%r10d, %eax
	jle	.L131
	movq	96(%rsp), %rcx
	leaq	(%r15,%r11), %rdi
	leaq	16(%r12), %rsi
	movq	%r12, %rdx
	movq	%r13, %rax
	xorl	%r9d, %r9d
	addq	%r11, %rcx
.LVL107:
	.p2align 4,,10
	.p2align 3
.L128:
	.loc 1 106 0
	movsd	(%rax), %xmm0
	.loc 1 103 0
	addl	$1, %r9d
	.loc 1 106 0
	subsd	(%rdi), %xmm0
	subsd	-8(%rdx), %xmm0
	addsd	(%rsi), %xmm0
	movsd	%xmm0, (%rcx)
.LVL108:
	movsd	8(%rax), %xmm0
	subsd	8(%rdi), %xmm0
	subsd	(%rdx), %xmm0
	addsd	8(%rsi), %xmm0
	movsd	%xmm0, 8(%rcx)
.LVL109:
	movsd	16(%rax), %xmm0
	.loc 1 103 0
	addq	$24, %rax
	.loc 1 106 0
	subsd	16(%rdi), %xmm0
	.loc 1 103 0
	addq	$24, %rdi
	.loc 1 106 0
	subsd	8(%rdx), %xmm0
	.loc 1 103 0
	addq	$24, %rdx
	.loc 1 106 0
	addsd	16(%rsi), %xmm0
	.loc 1 103 0
	addq	$24, %rsi
	.loc 1 106 0
	movsd	%xmm0, 16(%rcx)
.LVL110:
	.loc 1 103 0
	addq	$24, %rcx
	cmpl	%ebx, %r9d
	jne	.L128
	movl	%r10d, %eax
.LVL111:
.L131:
	addl	$1, %r10d
.LVL112:
	addq	%r8, %r13
	addq	%r8, %r11
	addq	%r14, %r12
	cmpl	%eax, %ebp
	jg	.L127
.LVL113:
	.loc 1 67 0
	movq	184(%rsp), %r14
	movq	216(%rsp), %r15
	xorl	%r12d, %r12d
	movsd	.LC7(%rip), %xmm2
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	salq	$3, %r14
.LVL114:
	.p2align 4,,10
	.p2align 3
.L132:
	.loc 1 111 0
	testl	%ebx, %ebx
	jle	.L134
	movq	152(%rsp), %rcx
	movq	96(%rsp), %rax
	leaq	(%r15,%r12), %r9
	movq	136(%rsp), %rsi
	movq	168(%rsp), %r10
	xorl	%edi, %edi
	movq	160(%rsp), %rdx
	addq	%r11, %rcx
	addq	%r11, %rax
	addq	%r12, %rsi
	addq	%r12, %r10
	addq	%r11, %rdx
.LVL115:
	.p2align 4,,10
	.p2align 3
.L133:
	.loc 1 116 0
	movsd	(%rcx), %xmm0
	.loc 1 111 0
	addl	$1, %edi
.LVL116:
	.loc 1 116 0
	movsd	8(%rcx), %xmm1
	mulsd	(%rax), %xmm0
	mulsd	8(%rax), %xmm1
	addsd	%xmm1, %xmm0
	movsd	16(%rcx), %xmm1
	.loc 1 111 0
	addq	$24, %rcx
	.loc 1 116 0
	mulsd	16(%rax), %xmm1
	addsd	%xmm1, %xmm0
	divsd	(%rsi), %xmm0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%r10)
	.loc 1 111 0
	addq	$8, %r10
	.loc 1 119 0
	movsd	(%rdx), %xmm0
	movsd	8(%rdx), %xmm1
	mulsd	(%rax), %xmm0
	mulsd	8(%rax), %xmm1
	addsd	%xmm1, %xmm0
	movsd	16(%rdx), %xmm1
	.loc 1 111 0
	addq	$24, %rdx
	.loc 1 119 0
	mulsd	16(%rax), %xmm1
	.loc 1 111 0
	addq	$24, %rax
	.loc 1 119 0
	addsd	%xmm1, %xmm0
	divsd	(%rsi), %xmm0
	.loc 1 111 0
	addq	$8, %rsi
	.loc 1 119 0
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%r9)
	.loc 1 111 0
	addq	$8, %r9
	cmpl	%ebx, %edi
	jne	.L133
.LVL117:
.L134:
	addl	$1, %r13d
.LVL118:
	addq	%r8, %r11
	addq	%r14, %r12
	cmpl	%ebp, %r13d
	jne	.L132
.LVL119:
.L122:
	.loc 1 122 0
	movq	104(%rsp), %rdi
	call	free
	.loc 1 123 0
	movq	112(%rsp), %rdi
	call	free
	.loc 1 124 0
	movq	120(%rsp), %rdi
	call	free
	.loc 1 125 0
	movq	96(%rsp), %rdi
	.loc 1 127 0
	addq	$232, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	.loc 1 125 0
	jmp	free
	.cfi_endproc
.LFE22:
	.size	grad_c2l, .-grad_c2l
	.p2align 4,,15
.globl grad_c2l_
	.type	grad_c2l_, @function
grad_c2l_:
.LFB21:
	.loc 1 62 0
	.cfi_startproc
.LVL120:
	.loc 1 63 0
	jmp	grad_c2l
	.cfi_endproc
.LFE21:
	.size	grad_c2l_, .-grad_c2l_
	.p2align 4,,15
.globl mid_pt3_cart
	.type	mid_pt3_cart, @function
mid_pt3_cart:
.LFB26:
	.loc 1 333 0
	.cfi_startproc
.LVL121:
	.loc 1 336 0
	movsd	(%rdi), %xmm1
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rdx)
	.loc 1 339 0
	movapd	%xmm1, %xmm3
	.loc 1 337 0
	movsd	8(%rdi), %xmm0
	.loc 1 339 0
	mulsd	%xmm1, %xmm3
	.loc 1 337 0
	addsd	8(%rsi), %xmm0
	movsd	%xmm0, 8(%rdx)
	.loc 1 339 0
	movapd	%xmm0, %xmm4
	.loc 1 338 0
	movsd	16(%rdi), %xmm2
	.loc 1 339 0
	mulsd	%xmm0, %xmm4
	.loc 1 338 0
	addsd	16(%rsi), %xmm2
	.loc 1 339 0
	addsd	%xmm4, %xmm3
	movapd	%xmm2, %xmm4
	mulsd	%xmm2, %xmm4
	addsd	%xmm4, %xmm3
	sqrtsd	%xmm3, %xmm3
.LVL122:
	.loc 1 340 0
	divsd	%xmm3, %xmm1
	.loc 1 341 0
	divsd	%xmm3, %xmm0
	.loc 1 340 0
	movsd	%xmm1, (%rdx)
	.loc 1 342 0
	divsd	%xmm3, %xmm2
	.loc 1 341 0
	movsd	%xmm0, 8(%rdx)
	.loc 1 342 0
	movsd	%xmm2, 16(%rdx)
	.loc 1 343 0
	ret
	.cfi_endproc
.LFE26:
	.size	mid_pt3_cart, .-mid_pt3_cart
	.p2align 4,,15
.globl mid_pt_sphere
	.type	mid_pt_sphere, @function
mid_pt_sphere:
.LFB25:
	.loc 1 322 0
	.cfi_startproc
.LVL123:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	.loc 1 325 0
	movq	%rdi, %rsi
.LVL124:
	.loc 1 322 0
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdx, %rbx
	.loc 1 325 0
	leaq	8(%rdi), %rdx
.LVL125:
	movl	$1, %edi
.LVL126:
	.loc 1 322 0
	subq	$104, %rsp
	.cfi_def_cfa_offset 128
	.loc 1 325 0
	leaq	64(%rsp), %rcx
	leaq	16(%rcx), %r9
	leaq	8(%rcx), %r8
	call	latlon2xyz
.LVL127:
	.loc 1 326 0
	leaq	32(%rsp), %rcx
	leaq	8(%rbp), %rdx
	movq	%rbp, %rsi
	movl	$1, %edi
	leaq	16(%rcx), %r9
	leaq	8(%rcx), %r8
	call	latlon2xyz
.LVL128:
.LBB4:
.LBB7:
	.loc 1 336 0
	movsd	64(%rsp), %xmm2
.LBE7:
.LBE4:
	.loc 1 328 0
	leaq	16(%rsp), %rcx
.LBB10:
.LBB6:
	.loc 1 337 0
	movsd	72(%rsp), %xmm1
.LBE6:
.LBE10:
	.loc 1 328 0
	leaq	8(%rsp), %rdx
.LBB11:
.LBB8:
	.loc 1 336 0
	addsd	32(%rsp), %xmm2
	.loc 1 338 0
	movsd	80(%rsp), %xmm0
	.loc 1 337 0
	addsd	40(%rsp), %xmm1
.LBE8:
.LBE11:
	.loc 1 328 0
	leaq	8(%rbx), %r9
	movq	%rsp, %rsi
.LBB12:
.LBB5:
	.loc 1 338 0
	addsd	48(%rsp), %xmm0
.LBE5:
.LBE12:
	.loc 1 328 0
	movq	%rbx, %r8
	movl	$1, %edi
.LBB13:
.LBB9:
	.loc 1 339 0
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm4
	mulsd	%xmm2, %xmm3
	mulsd	%xmm1, %xmm4
	addsd	%xmm4, %xmm3
	movapd	%xmm0, %xmm4
	mulsd	%xmm0, %xmm4
	addsd	%xmm4, %xmm3
	sqrtsd	%xmm3, %xmm3
.LVL129:
	.loc 1 340 0
	divsd	%xmm3, %xmm2
	.loc 1 341 0
	divsd	%xmm3, %xmm1
	.loc 1 340 0
	movsd	%xmm2, (%rsp)
	.loc 1 342 0
	divsd	%xmm3, %xmm0
	.loc 1 341 0
	movsd	%xmm1, 8(%rsp)
	.loc 1 342 0
	movsd	%xmm0, 16(%rsp)
.LBE9:
.LBE13:
	.loc 1 328 0
	call	xyz2latlon
.LVL130:
	.loc 1 330 0
	addq	$104, %rsp
	.cfi_def_cfa_offset 24
.LVL131:
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL132:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL133:
	ret
	.cfi_endproc
.LFE25:
	.size	mid_pt_sphere, .-mid_pt_sphere
	.p2align 4,,15
.globl get_edge
	.type	get_edge, @function
get_edge:
.LFB24:
	.loc 1 207 0
	.cfi_startproc
.LVL134:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	.loc 1 214 0
	movl	%edi, %eax
	addl	$1, %eax
	.loc 1 207 0
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	.loc 1 207 0
	movl	%esi, 96(%rsp)
	.loc 1 215 0
	addl	$1, %esi
.LVL135:
	.loc 1 217 0
	testl	%eax, %eax
	.loc 1 207 0
	movq	%r8, 152(%rsp)
	movl	%edi, 72(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%rcx, 128(%rsp)
	movq	%r9, 160(%rsp)
	movq	288(%rsp), %r8
.LVL136:
	.loc 1 214 0
	movl	%eax, 68(%rsp)
.LVL137:
	.loc 1 215 0
	movl	%esi, 100(%rsp)
.LVL138:
	.loc 1 217 0
	jle	.L148
	.loc 1 204 0
	cmpl	$14, %eax
	jbe	.L149
	movq	312(%rsp), %rax
.LVL139:
	orq	304(%rsp), %rax
	testb	$15, %al
	jne	.L149
	movq	304(%rsp), %rax
	addq	$16, %rax
	cmpq	%rax, 312(%rsp)
	jbe	.L197
.L181:
	movl	68(%rsp), %ecx
.LVL140:
	shrl	%ecx
	movl	%ecx, %ebx
	addl	%ebx, %ebx
	je	.L198
	movq	304(%rsp), %rsi
.LVL141:
	movq	312(%rsp), %rdi
.LVL142:
	xorl	%eax, %eax
	movapd	.LC5(%rip), %xmm0
	xorl	%edx, %edx
.LVL143:
	.p2align 4,,10
	.p2align 3
.L153:
	.loc 1 219 0
	addl	$1, %edx
	.loc 1 218 0
	movapd	%xmm0, (%rsi,%rax)
	.loc 1 219 0
	movapd	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%ecx, %edx
	jb	.L153
	cmpl	%ebx, 68(%rsp)
	je	.L148
.L152:
	.loc 1 204 0
	movq	304(%rsp), %rdx
	movslq	%ebx, %rax
	movl	68(%rsp), %ecx
	salq	$3, %rax
	addq	%rax, %rdx
	addq	312(%rsp), %rax
.LVL144:
	.p2align 4,,10
	.p2align 3
.L154:
	.loc 1 218 0
	movabsq	$4602678819172646912, %r10
	.loc 1 219 0
	movabsq	$4602678819172646912, %r9
	.loc 1 217 0
	addl	$1, %ebx
.LVL145:
	.loc 1 218 0
	movq	%r10, (%rdx)
	.loc 1 219 0
	movq	%r9, (%rax)
	.loc 1 217 0
	addq	$8, %rdx
	addq	$8, %rax
	cmpl	%ebx, %ecx
	jg	.L154
.LVL146:
.L148:
	.loc 1 221 0
	movl	100(%rsp), %esi
	testl	%esi, %esi
	jle	.L156
	.loc 1 204 0
	movl	96(%rsp), %ebx
	addl	$1, %ebx
	cmpl	$14, %ebx
	jbe	.L157
	movq	296(%rsp), %rax
	orq	%r8, %rax
	testb	$15, %al
	jne	.L157
	leaq	16(%r8), %rax
	cmpq	%rax, 296(%rsp)
	jbe	.L199
.L182:
	movl	%ebx, %ecx
	shrl	%ecx
	movl	%ecx, %esi
	addl	%esi, %esi
	je	.L200
	movq	296(%rsp), %rdi
	xorl	%eax, %eax
	xorl	%edx, %edx
	movapd	.LC5(%rip), %xmm0
.LVL147:
	.p2align 4,,10
	.p2align 3
.L161:
	.loc 1 223 0
	addl	$1, %edx
	.loc 1 222 0
	movapd	%xmm0, (%r8,%rax)
	.loc 1 223 0
	movapd	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%ecx, %edx
	jb	.L161
	cmpl	%esi, %ebx
	je	.L156
.L160:
	.loc 1 204 0
	movslq	%esi, %rax
	movl	100(%rsp), %ecx
	salq	$3, %rax
	leaq	(%r8,%rax), %rdx
	addq	296(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L162:
	.loc 1 222 0
	movabsq	$4602678819172646912, %rbx
	.loc 1 223 0
	movabsq	$4602678819172646912, %r15
	.loc 1 221 0
	addl	$1, %esi
.LVL148:
	.loc 1 222 0
	movq	%rbx, (%rdx)
	.loc 1 223 0
	movq	%r15, (%rax)
	.loc 1 221 0
	addq	$8, %rdx
	addq	$8, %rax
	cmpl	%esi, %ecx
	jg	.L162
.LVL149:
.L156:
	.loc 1 226 0
	movl	72(%rsp), %edx
	movq	%r8, 24(%rsp)
	addl	$2, %edx
	movl	%edx, %edi
	movl	%edx, 80(%rsp)
	addl	%edi, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	.loc 1 227 0
	movl	96(%rsp), %ecx
	.loc 1 226 0
	movq	%rax, 104(%rsp)
.LVL150:
	.loc 1 227 0
	leal	4(%rcx,%rcx), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
.LVL151:
	.loc 1 204 0
	movl	320(%rsp), %r12d
	.loc 1 233 0
	movl	328(%rsp), %r11d
	.loc 1 204 0
	movl	336(%rsp), %r10d
	.loc 1 241 0
	movl	344(%rsp), %r9d
	.loc 1 233 0
	movl	68(%rsp), %ebx
	.loc 1 227 0
	movq	%rax, 144(%rsp)
.LVL152:
	.loc 1 204 0
	testl	%r12d, %r12d
	.loc 1 241 0
	movl	100(%rsp), %r12d
	.loc 1 247 0
	movq	24(%rsp), %r8
	.loc 1 204 0
	setne	119(%rsp)
	.loc 1 233 0
	testl	%r11d, %r11d
	cmovne	72(%rsp), %ebx
	.loc 1 204 0
	testl	%r10d, %r10d
	movzbl	119(%rsp), %ebp
.LVL153:
	setne	139(%rsp)
	.loc 1 241 0
	testl	%r9d, %r9d
	cmovne	96(%rsp), %r12d
	.loc 1 247 0
	cmpb	$0, 119(%rsp)
	.loc 1 204 0
	movzbl	139(%rsp), %r13d
	.loc 1 233 0
	movl	%ebx, 52(%rsp)
.LVL154:
	.loc 1 247 0
	je	.L168
.LVL155:
	.loc 1 249 0
	cmpl	%r13d, %r12d
	jl	.L168
	.loc 1 204 0
	movl	80(%rsp), %r14d
	movslq	80(%rsp), %rax
.LVL156:
	leaq	192(%rsp), %rbx
.LVL157:
	movq	120(%rsp), %r15
	movq	144(%rsp), %rsi
	movq	%rbx, 32(%rsp)
	leaq	208(%rsp), %rbx
	movl	%r13d, 56(%rsp)
	imull	%r13d, %r14d
	movl	%ebp, 180(%rsp)
	movq	%r8, 184(%rsp)
	leaq	0(,%rax,8), %rdx
	leal	(%r13,%r13), %eax
	movq	%rbx, 40(%rsp)
	movslq	%r14d, %r14
	cltq
	movq	%rdx, %rbp
.LVL158:
	salq	$3, %r14
	leaq	(%rsi,%rax,8), %rax
	addq	%r14, %r15
	addq	128(%rsp), %r14
	movq	%rax, %rcx
	movq	%rax, 168(%rsp)
	movl	%r13d, %eax
	movl	%eax, %ebx
	movq	%rcx, %r13
.LVL159:
	.p2align 4,,10
	.p2align 3
.L169:
	.loc 1 251 0
	movq	(%r15), %rax
	.loc 1 253 0
	movq	32(%rsp), %rsi
	movq	%r13, %rdx
	movq	40(%rsp), %rdi
	.loc 1 249 0
	addl	$1, %ebx
.LVL160:
	addq	$16, %r13
	.loc 1 251 0
	movq	%rax, 208(%rsp)
	movq	(%r14), %rax
	movq	%rax, 216(%rsp)
	.loc 1 252 0
	movq	8(%r15), %rax
	.loc 1 249 0
	addq	%rbp, %r15
	.loc 1 252 0
	movq	%rax, 192(%rsp)
	movq	8(%r14), %rax
	.loc 1 249 0
	addq	%rbp, %r14
	.loc 1 252 0
	movq	%rax, 200(%rsp)
	.loc 1 253 0
	call	mid_pt_sphere
.LVL161:
	.loc 1 249 0
	cmpl	%ebx, %r12d
	jge	.L169
	movl	56(%rsp), %r13d
	movl	180(%rsp), %ebp
	movq	184(%rsp), %r8
.LVL162:
	.loc 1 256 0
	cmpl	%r13d, %r12d
	jle	.L168
	.loc 1 204 0
	movslq	68(%rsp), %rax
	leal	2(%r13,%r13), %ecx
	movq	144(%rsp), %rsi
	movq	152(%rsp), %rdx
	movq	168(%rsp), %rbx
	movl	%r13d, %r14d
	movslq	%ecx, %rcx
	movl	%r13d, 180(%rsp)
	movl	%r12d, 56(%rsp)
	leaq	(%rsi,%rcx,8), %r15
	movzbl	139(%rsp), %ecx
	movl	%ebp, 184(%rsp)
	salq	$3, %rax
	movq	%rax, 32(%rsp)
	movl	68(%rsp), %eax
	movq	%r15, %rbp
	leaq	(%r8,%rcx,8), %rcx
	imull	%r13d, %eax
	movq	%rcx, %r15
	cltq
	salq	$3, %rax
	addq	%rax, %rdx
	addq	160(%rsp), %rax
	movq	%rdx, %r13
	movq	%rax, %r12
.LVL163:
	.p2align 4,,10
	.p2align 3
.L170:
	.loc 1 257 0
	movq	0(%r13), %rax
	.loc 1 259 0
	movq	40(%rsp), %rsi
	movq	%rbx, %rdi
	.loc 1 260 0
	addl	$1, %r14d
.LVL164:
	.loc 1 261 0
	addq	$16, %rbx
	.loc 1 257 0
	movq	%rax, 208(%rsp)
	.loc 1 258 0
	movq	(%r12), %rax
	movq	%rax, 216(%rsp)
	.loc 1 259 0
	call	great_circle_distance
.LVL165:
	.loc 1 260 0
	movq	40(%rsp), %rsi
	movq	%rbp, %rdi
	movsd	%xmm0, (%rsp)
	.loc 1 261 0
	addq	$16, %rbp
	.loc 1 260 0
	call	great_circle_distance
.LVL166:
	.loc 1 261 0
	movsd	(%rsp), %xmm1
	addq	32(%rsp), %r13
	addq	32(%rsp), %r12
	addsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm0
.LVL167:
	movsd	%xmm0, (%r15)
.LVL168:
	addq	$8, %r15
	.loc 1 256 0
	cmpl	%r14d, 56(%rsp)
	jg	.L170
	movl	180(%rsp), %r13d
	movl	56(%rsp), %r12d
	movl	184(%rsp), %ebp
.LVL169:
.L168:
	.loc 1 265 0
	movl	328(%rsp), %r8d
	testl	%r8d, %r8d
	je	.L171
.LVL170:
	.loc 1 267 0
	cmpl	%r13d, %r12d
	jl	.L171
	.loc 1 204 0
	movslq	80(%rsp), %rax
	movl	80(%rsp), %r14d
	leaq	192(%rsp), %rbx
	movq	144(%rsp), %rcx
	movq	120(%rsp), %r15
	movq	%rbx, 32(%rsp)
	leaq	208(%rsp), %rbx
	movl	%r13d, 140(%rsp)
	imull	%r13d, %r14d
	movl	%ebp, 168(%rsp)
	leaq	0(,%rax,8), %rdx
	movslq	72(%rsp), %rax
	movq	%rbx, 40(%rsp)
	movslq	%r14d, %r14
	movq	%rdx, %rbp
	addq	%rax, %r14
	movq	%rax, 56(%rsp)
	leal	(%r13,%r13), %eax
	salq	$3, %r14
	cltq
	addq	%r14, %r15
	addq	128(%rsp), %r14
	leaq	(%rcx,%rax,8), %rax
	movq	%rax, %rcx
	movq	%rax, 72(%rsp)
	movl	%r13d, %eax
	movl	%eax, %ebx
	movq	%rcx, %r13
.LVL171:
	.p2align 4,,10
	.p2align 3
.L172:
	.loc 1 269 0
	movq	(%r15), %rax
	.loc 1 271 0
	movq	32(%rsp), %rsi
	movq	%r13, %rdx
	movq	40(%rsp), %rdi
	.loc 1 267 0
	addl	$1, %ebx
.LVL172:
	addq	$16, %r13
	.loc 1 269 0
	movq	%rax, 208(%rsp)
	movq	(%r14), %rax
	movq	%rax, 216(%rsp)
	.loc 1 270 0
	movq	8(%r15), %rax
	.loc 1 267 0
	addq	%rbp, %r15
	.loc 1 270 0
	movq	%rax, 192(%rsp)
	movq	8(%r14), %rax
	.loc 1 267 0
	addq	%rbp, %r14
	.loc 1 270 0
	movq	%rax, 200(%rsp)
	.loc 1 271 0
	call	mid_pt_sphere
.LVL173:
	.loc 1 267 0
	cmpl	%ebx, %r12d
	jge	.L172
	movl	140(%rsp), %r13d
	movl	168(%rsp), %ebp
.LVL174:
	.loc 1 274 0
	cmpl	%r13d, %r12d
	jle	.L171
	.loc 1 204 0
	movl	68(%rsp), %r15d
	movslq	68(%rsp), %rax
	leal	2(%r13,%r13), %edx
	movq	144(%rsp), %rsi
	movq	296(%rsp), %rcx
	movslq	%edx, %rdx
	movq	72(%rsp), %rbx
	movl	%ebp, 92(%rsp)
	imull	%r13d, %r15d
	salq	$3, %rax
	leaq	(%rsi,%rdx,8), %r14
	movzbl	139(%rsp), %edx
	movq	%rax, 32(%rsp)
	movq	152(%rsp), %rax
	movslq	%r15d, %r15
	addq	56(%rsp), %r15
	movl	%r12d, 56(%rsp)
	leaq	(%rcx,%rdx,8), %rdx
	salq	$3, %r15
	movq	%rdx, %r12
	addq	%r15, %rax
	addq	160(%rsp), %r15
	movq	%rax, %rbp
.LVL175:
	.p2align 4,,10
	.p2align 3
.L173:
	.loc 1 275 0
	movq	0(%rbp), %rax
	.loc 1 277 0
	movq	40(%rsp), %rsi
	movq	%rbx, %rdi
	.loc 1 278 0
	addl	$1, %r13d
.LVL176:
	.loc 1 279 0
	addq	$16, %rbx
	.loc 1 275 0
	movq	%rax, 208(%rsp)
	.loc 1 276 0
	movq	(%r15), %rax
	movq	%rax, 216(%rsp)
	.loc 1 277 0
	call	great_circle_distance
.LVL177:
	.loc 1 278 0
	movq	40(%rsp), %rsi
	movq	%r14, %rdi
	movsd	%xmm0, (%rsp)
	.loc 1 279 0
	addq	$16, %r14
	.loc 1 278 0
	call	great_circle_distance
.LVL178:
	.loc 1 279 0
	movsd	(%rsp), %xmm1
	addq	32(%rsp), %rbp
	addq	32(%rsp), %r15
	addsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm0
.LVL179:
	movsd	%xmm0, (%r12)
.LVL180:
	addq	$8, %r12
	.loc 1 274 0
	cmpl	%r13d, 56(%rsp)
	jg	.L173
	movl	92(%rsp), %ebp
.LVL181:
.L171:
	.loc 1 284 0
	cmpb	$0, 139(%rsp)
	je	.L174
.LVL182:
	.loc 1 286 0
	cmpl	%ebp, 52(%rsp)
	jl	.L174
	.loc 1 204 0
	movzbl	119(%rsp), %eax
	movslq	80(%rsp), %r15
	leal	(%rbp,%rbp), %edx
	movq	120(%rsp), %r8
	movq	128(%rsp), %rcx
	movl	%ebp, %r13d
	movq	104(%rsp), %rsi
	movslq	%edx, %rdx
	movl	%ebp, 92(%rsp)
	leaq	0(,%rax,8), %rbx
	leaq	(%rax,%r15), %r15
	movq	120(%rsp), %rax
	leaq	(%rsi,%rdx,8), %r12
	leaq	192(%rsp), %rdx
	salq	$3, %r15
	addq	%rbx, %r8
	addq	%rbx, %rcx
	addq	%r15, %rax
	addq	128(%rsp), %r15
	movq	%rbx, 56(%rsp)
	leaq	208(%rsp), %rbx
	movq	%r12, %r14
	movq	%r12, 72(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rcx, %r12
	movq	%rax, %rbp
.LVL183:
	movq	%rbx, 40(%rsp)
	movq	%r8, %rbx
	.p2align 4,,10
	.p2align 3
.L175:
	.loc 1 287 0
	movq	(%rbx), %rax
	.loc 1 289 0
	movq	32(%rsp), %rsi
	movq	%r14, %rdx
	movq	40(%rsp), %rdi
	.loc 1 286 0
	addl	$1, %r13d
.LVL184:
	addq	$8, %rbx
	addq	$16, %r14
	.loc 1 287 0
	movq	%rax, 208(%rsp)
	movq	(%r12), %rax
	.loc 1 286 0
	addq	$8, %r12
	.loc 1 287 0
	movq	%rax, 216(%rsp)
	.loc 1 288 0
	movq	0(%rbp), %rax
	.loc 1 286 0
	addq	$8, %rbp
	.loc 1 288 0
	movq	%rax, 192(%rsp)
	movq	(%r15), %rax
	.loc 1 286 0
	addq	$8, %r15
	.loc 1 288 0
	movq	%rax, 200(%rsp)
	.loc 1 289 0
	call	mid_pt_sphere
.LVL185:
	.loc 1 286 0
	cmpl	%r13d, 52(%rsp)
	jge	.L175
	movl	92(%rsp), %ebp
	.loc 1 291 0
	cmpl	%ebp, 52(%rsp)
	movq	72(%rsp), %r12
	movq	40(%rsp), %rbx
.LVL186:
	jle	.L174
	leal	2(%rbp,%rbp), %edx
	movq	104(%rsp), %rcx
	movq	152(%rsp), %rax
	addq	56(%rsp), %rax
	movq	160(%rsp), %r15
	movl	%ebp, %r13d
	movslq	%edx, %rdx
	addq	56(%rsp), %r15
	movl	%ebp, 40(%rsp)
	leaq	(%rcx,%rdx,8), %r14
	movq	304(%rsp), %rdx
	addq	56(%rsp), %rdx
	movq	%rbx, 32(%rsp)
	movq	%rax, %rbp
	movq	%rdx, %rbx
.LVL187:
	.p2align 4,,10
	.p2align 3
.L176:
	.loc 1 292 0
	movq	0(%rbp), %rax
	.loc 1 294 0
	movq	32(%rsp), %rsi
	movq	%r12, %rdi
	.loc 1 295 0
	addl	$1, %r13d
.LVL188:
	.loc 1 296 0
	addq	$8, %rbp
	addq	$16, %r12
	.loc 1 292 0
	movq	%rax, 208(%rsp)
	.loc 1 293 0
	movq	(%r15), %rax
	.loc 1 296 0
	addq	$8, %r15
	.loc 1 293 0
	movq	%rax, 216(%rsp)
	.loc 1 294 0
	call	great_circle_distance
.LVL189:
	.loc 1 295 0
	movq	32(%rsp), %rsi
	movq	%r14, %rdi
	movsd	%xmm0, (%rsp)
	.loc 1 296 0
	addq	$16, %r14
	.loc 1 295 0
	call	great_circle_distance
.LVL190:
	.loc 1 296 0
	movsd	(%rsp), %xmm1
	addsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm0
.LVL191:
	movsd	%xmm0, (%rbx)
.LVL192:
	addq	$8, %rbx
	.loc 1 291 0
	cmpl	%r13d, 52(%rsp)
	jg	.L176
	movl	40(%rsp), %ebp
.LVL193:
.L174:
	.loc 1 300 0
	movl	344(%rsp), %edi
	testl	%edi, %edi
	je	.L177
.LVL194:
	.loc 1 302 0
	cmpl	%ebp, 52(%rsp)
	jl	.L177
	.loc 1 204 0
	movl	80(%rsp), %ecx
	movl	100(%rsp), %r15d
	leal	(%rbp,%rbp), %edx
	imull	96(%rsp), %ecx
	imull	80(%rsp), %r15d
	movzbl	119(%rsp), %ebx
	movq	120(%rsp), %r8
	movslq	%edx, %rdx
	movq	120(%rsp), %rax
	movq	104(%rsp), %rsi
	movl	%ebp, %r13d
	movl	%ebp, 72(%rsp)
	movslq	%ecx, %rcx
	leaq	(%rsi,%rdx,8), %r12
	movq	%rbx, 56(%rsp)
	addq	%rbx, %rcx
	movslq	%r15d, %r15
	leaq	192(%rsp), %rdx
	salq	$3, %rcx
	addq	%rbx, %r15
	leaq	208(%rsp), %rbx
	addq	%rcx, %r8
	salq	$3, %r15
	addq	128(%rsp), %rcx
	addq	%r15, %rax
	addq	128(%rsp), %r15
	movq	%r12, %r14
	movq	%r12, 80(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%rax, %rbp
.LVL195:
	movq	%rdx, 32(%rsp)
	movq	%r8, %rbx
	movq	%rcx, %r12
	.p2align 4,,10
	.p2align 3
.L178:
	.loc 1 303 0
	movq	(%rbx), %rax
	.loc 1 305 0
	movq	32(%rsp), %rsi
	movq	%r14, %rdx
	movq	40(%rsp), %rdi
	.loc 1 302 0
	addl	$1, %r13d
.LVL196:
	addq	$8, %rbx
	addq	$16, %r14
	.loc 1 303 0
	movq	%rax, 208(%rsp)
	movq	(%r12), %rax
	.loc 1 302 0
	addq	$8, %r12
	.loc 1 303 0
	movq	%rax, 216(%rsp)
	.loc 1 304 0
	movq	0(%rbp), %rax
	.loc 1 302 0
	addq	$8, %rbp
	.loc 1 304 0
	movq	%rax, 192(%rsp)
	movq	(%r15), %rax
	.loc 1 302 0
	addq	$8, %r15
	.loc 1 304 0
	movq	%rax, 200(%rsp)
	.loc 1 305 0
	call	mid_pt_sphere
.LVL197:
	.loc 1 302 0
	cmpl	%r13d, 52(%rsp)
	jge	.L178
	movl	72(%rsp), %ebp
	.loc 1 307 0
	cmpl	%ebp, 52(%rsp)
	movq	80(%rsp), %r12
	movq	40(%rsp), %rbx
.LVL198:
	jle	.L177
	.loc 1 204 0
	movl	96(%rsp), %r15d
	movq	152(%rsp), %r14
	leal	2(%rbp,%rbp), %eax
	imull	68(%rsp), %r15d
	movq	104(%rsp), %rcx
	movq	56(%rsp), %rsi
	cltq
	movq	312(%rsp), %rdx
	movq	%rbx, 32(%rsp)
	leaq	(%rcx,%rax,8), %r13
	leaq	(%rdx,%rsi,8), %rax
	movslq	%r15d, %r15
	addq	56(%rsp), %r15
	movq	%rax, %rbx
	salq	$3, %r15
	addq	%r15, %r14
	addq	160(%rsp), %r15
.LVL199:
	.p2align 4,,10
	.p2align 3
.L179:
	.loc 1 308 0
	movq	(%r14), %rax
	.loc 1 310 0
	movq	32(%rsp), %rsi
	movq	%r12, %rdi
	.loc 1 311 0
	addl	$1, %ebp
.LVL200:
	.loc 1 312 0
	addq	$8, %r14
	addq	$16, %r12
	.loc 1 308 0
	movq	%rax, 208(%rsp)
	.loc 1 309 0
	movq	(%r15), %rax
	.loc 1 312 0
	addq	$8, %r15
	.loc 1 309 0
	movq	%rax, 216(%rsp)
	.loc 1 310 0
	call	great_circle_distance
.LVL201:
	.loc 1 311 0
	movq	32(%rsp), %rsi
	movq	%r13, %rdi
	movsd	%xmm0, (%rsp)
	.loc 1 312 0
	addq	$16, %r13
	.loc 1 311 0
	call	great_circle_distance
.LVL202:
	.loc 1 312 0
	movsd	(%rsp), %xmm1
	addsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm0
.LVL203:
	movsd	%xmm0, (%rbx)
.LVL204:
	addq	$8, %rbx
	.loc 1 307 0
	cmpl	%ebp, 52(%rsp)
	jg	.L179
.LVL205:
.L177:
	.loc 1 316 0
	movq	104(%rsp), %rdi
	call	free
	.loc 1 317 0
	movq	144(%rsp), %rdi
	call	free
	.loc 1 319 0
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL206:
	.p2align 4,,10
	.p2align 3
.L199:
	.cfi_restore_state
	.loc 1 204 0
	movq	296(%rsp), %rax
	addq	$16, %rax
	cmpq	%rax, %r8
	ja	.L182
	.p2align 4,,10
	.p2align 3
.L157:
	mov	96(%rsp), %eax
	movq	296(%rsp), %rcx
	leaq	8(,%rax,8), %rdx
	xorl	%eax, %eax
.LVL207:
	.p2align 4,,10
	.p2align 3
.L163:
	.loc 1 222 0
	movabsq	$4602678819172646912, %r14
	.loc 1 223 0
	movabsq	$4602678819172646912, %r13
	.loc 1 222 0
	movq	%r14, (%r8,%rax)
	.loc 1 223 0
	movq	%r13, (%rcx,%rax)
	addq	$8, %rax
	.loc 1 221 0
	cmpq	%rdx, %rax
	jne	.L163
	jmp	.L156
.LVL208:
	.p2align 4,,10
	.p2align 3
.L197:
	.loc 1 204 0
	movq	312(%rsp), %rax
	addq	$16, %rax
	cmpq	%rax, 304(%rsp)
	ja	.L181
	.p2align 4,,10
	.p2align 3
.L149:
	mov	72(%rsp), %eax
	movq	304(%rsp), %rcx
	movq	312(%rsp), %rbx
	leaq	8(,%rax,8), %rdx
	xorl	%eax, %eax
.LVL209:
	.p2align 4,,10
	.p2align 3
.L155:
	.loc 1 218 0
	movabsq	$4602678819172646912, %rbp
	.loc 1 219 0
	movabsq	$4602678819172646912, %rdi
	.loc 1 218 0
	movq	%rbp, (%rcx,%rax)
	.loc 1 219 0
	movq	%rdi, (%rbx,%rax)
	addq	$8, %rax
	.loc 1 217 0
	cmpq	%rdx, %rax
	jne	.L155
	jmp	.L148
.LVL210:
.L198:
	.loc 1 204 0
	xorl	%ebx, %ebx
	jmp	.L152
.LVL211:
.L200:
	xorl	%esi, %esi
	.p2align 4,,7
	jmp	.L160
	.cfi_endproc
.LFE24:
	.size	get_edge, .-get_edge
	.p2align 4,,15
.globl calc_c2l_grid_info
	.type	calc_c2l_grid_info, @function
calc_c2l_grid_info:
.LFB28:
	.loc 1 378 0
	.cfi_startproc
.LVL212:
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
	subq	$376, %rsp
	.cfi_def_cfa_offset 432
	.loc 1 385 0
	movl	(%rsi), %esi
.LVL213:
	.loc 1 384 0
	movl	(%rdi), %ebx
.LVL214:
	.loc 1 378 0
	movq	%rdx, 200(%rsp)
	movq	%rcx, 208(%rsp)
	movq	%r8, 176(%rsp)
	movq	%r9, 184(%rsp)
	.loc 1 385 0
	movl	%esi, 156(%rsp)
.LVL215:
	.loc 1 386 0
	leal	1(%rbx), %eax
	.loc 1 387 0
	addl	$1, %esi
.LVL216:
	.loc 1 389 0
	testl	%esi, %esi
	.loc 1 387 0
	movl	%esi, 160(%rsp)
	.loc 1 386 0
	movl	%eax, 88(%rsp)
.LVL217:
	.loc 1 389 0
	jle	.L202
	.loc 1 374 0
	cltq
.LVL218:
	movq	432(%rsp), %rdx
.LVL219:
	leaq	336(%rsp), %r15
	salq	$3, %rax
	movq	$0, 80(%rsp)
	movl	$0, 104(%rsp)
	movq	%rax, 136(%rsp)
	movslq	%ebx, %rax
	salq	$3, %rax
	movq	%rdx, 96(%rsp)
	movq	%rax, 112(%rsp)
.LVL220:
	.p2align 4,,10
	.p2align 3
.L203:
	.loc 1 389 0
	testl	%ebx, %ebx
	jle	.L205
	movq	176(%rsp), %r12
	movq	184(%rsp), %rbp
	xorl	%r13d, %r13d
	addq	80(%rsp), %r12
	addq	80(%rsp), %rbp
	movq	96(%rsp), %r14
.LVL221:
	.p2align 4,,10
	.p2align 3
.L204:
	.loc 1 390 0
	movq	(%r12), %rax
	.loc 1 394 0
	leaq	304(%rsp), %rsi
	movq	%r15, %rdi
	.loc 1 389 0
	addl	$1, %r13d
	.loc 1 390 0
	movq	%rax, 336(%rsp)
	.loc 1 391 0
	movq	0(%rbp), %rax
	movq	%rax, 344(%rsp)
	.loc 1 392 0
	movq	8(%r12), %rax
	.loc 1 389 0
	addq	$8, %r12
	.loc 1 392 0
	movq	%rax, 304(%rsp)
	.loc 1 393 0
	movq	8(%rbp), %rax
	.loc 1 389 0
	addq	$8, %rbp
	.loc 1 393 0
	movq	%rax, 312(%rsp)
	.loc 1 394 0
	call	great_circle_distance
.LVL222:
	movsd	%xmm0, (%r14)
	.loc 1 389 0
	addq	$8, %r14
	cmpl	%r13d, %ebx
	jg	.L204
.LVL223:
.L205:
	addl	$1, 104(%rsp)
.LVL224:
	movq	136(%rsp), %rsi
	movq	112(%rsp), %rax
	addq	%rsi, 80(%rsp)
	addq	%rax, 96(%rsp)
	movl	104(%rsp), %edx
	cmpl	%edx, 160(%rsp)
	jg	.L203
.LVL225:
.L202:
	.loc 1 397 0
	movl	156(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L206
	.loc 1 374 0
	movslq	88(%rsp), %rax
	movq	176(%rsp), %rsi
	movq	184(%rsp), %rdx
	movq	$0, 80(%rsp)
	movl	$1, 96(%rsp)
	movl	%ebx, 168(%rsp)
	salq	$3, %rax
	addq	%rax, %rsi
	addq	%rax, %rdx
	movq	%rax, 104(%rsp)
	movq	%rsi, 112(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rdx, 120(%rsp)
	movq	%rsi, 128(%rsp)
.LVL226:
	.p2align 4,,10
	.p2align 3
.L207:
	.loc 1 397 0
	movl	88(%rsp), %ebp
	movl	96(%rsp), %eax
	testl	%ebp, %ebp
	jle	.L211
	movq	176(%rsp), %r15
	movq	184(%rsp), %r14
	xorl	%ebx, %ebx
	movq	440(%rsp), %r13
	addq	80(%rsp), %r15
	addq	80(%rsp), %r14
	addq	80(%rsp), %r13
	movq	120(%rsp), %r12
	movq	128(%rsp), %rbp
.LVL227:
	.p2align 4,,10
	.p2align 3
.L208:
	.loc 1 398 0
	movq	(%r15), %rax
	.loc 1 402 0
	leaq	304(%rsp), %rsi
	leaq	336(%rsp), %rdi
	.loc 1 397 0
	addl	$1, %ebx
	addq	$8, %r15
	.loc 1 398 0
	movq	%rax, 336(%rsp)
	.loc 1 399 0
	movq	(%r14), %rax
	.loc 1 397 0
	addq	$8, %r14
	.loc 1 399 0
	movq	%rax, 344(%rsp)
	.loc 1 400 0
	movq	0(%rbp), %rax
	.loc 1 397 0
	addq	$8, %rbp
	.loc 1 400 0
	movq	%rax, 304(%rsp)
	.loc 1 401 0
	movq	(%r12), %rax
	.loc 1 397 0
	addq	$8, %r12
	.loc 1 401 0
	movq	%rax, 312(%rsp)
	.loc 1 402 0
	call	great_circle_distance
.LVL228:
	movsd	%xmm0, 0(%r13)
	.loc 1 397 0
	addq	$8, %r13
	cmpl	%ebx, 88(%rsp)
	jg	.L208
	movl	96(%rsp), %eax
.LVL229:
.L211:
	movq	104(%rsp), %rsi
	addl	$1, 96(%rsp)
	addq	%rsi, 80(%rsp)
	addq	%rsi, 128(%rsp)
	addq	%rsi, 120(%rsp)
	cmpl	%eax, 156(%rsp)
	jg	.L207
	movl	168(%rsp), %ebx
.LVL230:
	movq	184(%rsp), %rax
	movq	176(%rsp), %rdx
	.loc 1 374 0
	movq	448(%rsp), %rsi
	movl	$1, 96(%rsp)
	.loc 1 397 0
	movq	%rax, 144(%rsp)
	.loc 1 374 0
	movslq	%ebx, %rax
	movl	%ebx, 80(%rsp)
	.loc 1 397 0
	addq	$8, %rdx
	.loc 1 374 0
	salq	$3, %rax
	movq	%rsi, 120(%rsp)
	.loc 1 397 0
	movq	%rdx, 128(%rsp)
	.loc 1 374 0
	movq	%rax, 168(%rsp)
.LVL231:
	.p2align 4,,10
	.p2align 3
.L212:
	.loc 1 405 0
	movl	80(%rsp), %edi
	movl	96(%rsp), %eax
	testl	%edi, %edi
	jle	.L215
	.loc 1 374 0
	movq	120(%rsp), %rbx
	movq	128(%rsp), %r14
	xorl	%r15d, %r15d
	movq	136(%rsp), %r13
	movq	112(%rsp), %r12
	movq	144(%rsp), %rbp
.LVL232:
	.p2align 4,,10
	.p2align 3
.L213:
	.loc 1 406 0
	movq	-8(%r14), %rax
	.loc 1 414 0
	movsd	.LC7(%rip), %xmm0
	leaq	240(%rsp), %rcx
	leaq	272(%rsp), %rdx
	leaq	304(%rsp), %rsi
	leaq	336(%rsp), %rdi
	.loc 1 405 0
	addl	$1, %r15d
	.loc 1 406 0
	movq	%rax, 336(%rsp)
	.loc 1 407 0
	movq	0(%rbp), %rax
	movq	%rax, 344(%rsp)
	.loc 1 408 0
	movq	(%r12), %rax
	movq	%rax, 304(%rsp)
	.loc 1 409 0
	movq	0(%r13), %rax
	movq	%rax, 312(%rsp)
	.loc 1 410 0
	movq	(%r14), %rax
	.loc 1 405 0
	addq	$8, %r14
	.loc 1 410 0
	movq	%rax, 272(%rsp)
	.loc 1 411 0
	movq	8(%rbp), %rax
	.loc 1 405 0
	addq	$8, %rbp
	.loc 1 411 0
	movq	%rax, 280(%rsp)
	.loc 1 412 0
	movq	8(%r12), %rax
	.loc 1 405 0
	addq	$8, %r12
	.loc 1 412 0
	movq	%rax, 240(%rsp)
	.loc 1 413 0
	movq	8(%r13), %rax
	.loc 1 405 0
	addq	$8, %r13
	.loc 1 413 0
	movq	%rax, 248(%rsp)
	.loc 1 414 0
	call	spherical_excess_area
.LVL233:
	movsd	%xmm0, (%rbx)
	.loc 1 405 0
	addq	$8, %rbx
	cmpl	%r15d, 80(%rsp)
	jg	.L213
	movl	96(%rsp), %eax
.LVL234:
.L215:
	movq	104(%rsp), %rdx
	addl	$1, 96(%rsp)
	addq	%rdx, 144(%rsp)
	movq	168(%rsp), %rsi
	addq	%rdx, 112(%rsp)
	addq	%rdx, 136(%rsp)
	addq	%rdx, 128(%rsp)
	addq	%rsi, 120(%rsp)
	cmpl	%eax, 156(%rsp)
	jg	.L212
	movl	80(%rsp), %ebx
.LVL235:
.L206:
	.loc 1 417 0
	movl	160(%rsp), %ebp
	imull	88(%rsp), %ebp
	movslq	%ebp, %r12
	salq	$3, %r12
	movq	%r12, %rdi
	call	malloc
	.loc 1 418 0
	movq	%r12, %rdi
	.loc 1 417 0
	movq	%rax, 192(%rsp)
.LVL236:
	.loc 1 418 0
	call	malloc
.LVL237:
	.loc 1 419 0
	movq	%r12, %rdi
	.loc 1 418 0
	movq	%rax, 168(%rsp)
.LVL238:
	.loc 1 419 0
	call	malloc
.LVL239:
	.loc 1 421 0
	movq	176(%rsp), %rsi
	movq	168(%rsp), %r8
	movq	%rax, %r9
	movq	192(%rsp), %rcx
	movq	184(%rsp), %rdx
	movl	%ebp, %edi
	.loc 1 419 0
	movq	%rax, 144(%rsp)
.LVL240:
	.loc 1 421 0
	call	latlon2xyz
.LVL241:
	.loc 1 422 0
	movl	160(%rsp), %esi
	testl	%esi, %esi
	jle	.L216
	.loc 1 374 0
	movslq	88(%rsp), %rax
	movq	$0, 80(%rsp)
	movl	$0, 104(%rsp)
	salq	$3, %rax
	movq	%rax, 136(%rsp)
	leal	(%rbx,%rbx,2), %eax
	cltq
	salq	$3, %rax
	movq	%rax, 112(%rsp)
	movq	488(%rsp), %rax
	movq	%rax, 96(%rsp)
.LVL242:
	.p2align 4,,10
	.p2align 3
.L217:
	.loc 1 422 0
	testl	%ebx, %ebx
	jle	.L219
	movq	192(%rsp), %r14
	movq	168(%rsp), %r13
	xorl	%r15d, %r15d
	movq	144(%rsp), %r12
	addq	80(%rsp), %r14
	addq	80(%rsp), %r13
	addq	80(%rsp), %r12
	movq	96(%rsp), %rbp
.LVL243:
	.p2align 4,,10
	.p2align 3
.L218:
	.loc 1 423 0
	movq	(%r14), %rax
	.loc 1 429 0
	leaq	304(%rsp), %rsi
	leaq	336(%rsp), %rdi
	movq	%rbp, %rdx
	.loc 1 422 0
	addl	$1, %r15d
	.loc 1 423 0
	movq	%rax, 336(%rsp)
	.loc 1 424 0
	movq	0(%r13), %rax
	movq	%rax, 344(%rsp)
	.loc 1 425 0
	movq	(%r12), %rax
	movq	%rax, 352(%rsp)
	.loc 1 426 0
	movq	8(%r14), %rax
	.loc 1 422 0
	addq	$8, %r14
	.loc 1 426 0
	movq	%rax, 304(%rsp)
	.loc 1 427 0
	movq	8(%r13), %rax
	.loc 1 422 0
	addq	$8, %r13
	.loc 1 427 0
	movq	%rax, 312(%rsp)
	.loc 1 428 0
	movq	8(%r12), %rax
	.loc 1 422 0
	addq	$8, %r12
	.loc 1 428 0
	movq	%rax, 320(%rsp)
	.loc 1 429 0
	call	vect_cross
	.loc 1 430 0
	movq	%rbp, %rdi
	.loc 1 422 0
	addq	$24, %rbp
	.loc 1 430 0
	call	normalize_vect
.LVL244:
	.loc 1 422 0
	cmpl	%r15d, %ebx
	jg	.L218
.LVL245:
.L219:
	addl	$1, 104(%rsp)
.LVL246:
	movq	136(%rsp), %rdx
	movq	112(%rsp), %rsi
	addq	%rdx, 80(%rsp)
	addq	%rsi, 96(%rsp)
	movl	104(%rsp), %eax
	cmpl	%eax, 160(%rsp)
	jg	.L217
.LVL247:
.L216:
	.loc 1 433 0
	movl	156(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L220
	.loc 1 374 0
	movslq	88(%rsp), %rax
	movq	192(%rsp), %rdx
	movq	168(%rsp), %rsi
	movq	$0, 80(%rsp)
	movl	$1, 96(%rsp)
	movl	%ebx, 220(%rsp)
	salq	$3, %rax
	addq	%rax, %rdx
	addq	%rax, %rsi
	movq	%rax, 104(%rsp)
	movq	%rdx, 128(%rsp)
	movq	%rsi, 112(%rsp)
	movq	144(%rsp), %rdx
	movl	88(%rsp), %esi
	addq	%rax, %rdx
	leal	(%rsi,%rsi,2), %eax
	movq	%rdx, 120(%rsp)
	cltq
	salq	$3, %rax
	movq	%rax, 160(%rsp)
	movq	496(%rsp), %rax
	movq	%rax, 136(%rsp)
.LVL248:
	.p2align 4,,10
	.p2align 3
.L221:
	.loc 1 433 0
	movl	88(%rsp), %edx
	movl	96(%rsp), %eax
	testl	%edx, %edx
	jle	.L225
	movq	192(%rsp), %rcx
	movq	168(%rsp), %rax
	xorl	%ebp, %ebp
	movq	144(%rsp), %r15
	addq	80(%rsp), %rcx
	addq	80(%rsp), %rax
	addq	80(%rsp), %r15
	movq	136(%rsp), %rbx
	movq	120(%rsp), %r14
	movq	112(%rsp), %r13
	movq	128(%rsp), %r12
.LVL249:
	.p2align 4,,10
	.p2align 3
.L222:
	.loc 1 434 0
	movq	(%rcx), %rdx
	.loc 1 440 0
	leaq	304(%rsp), %rsi
	leaq	336(%rsp), %rdi
	movq	%rax, 72(%rsp)
	movq	%rcx, 64(%rsp)
	.loc 1 433 0
	addl	$1, %ebp
	.loc 1 434 0
	movq	%rdx, 304(%rsp)
	.loc 1 435 0
	movq	(%rax), %rdx
	movq	%rdx, 312(%rsp)
	.loc 1 436 0
	movq	(%r15), %rdx
	.loc 1 433 0
	addq	$8, %r15
	.loc 1 436 0
	movq	%rdx, 320(%rsp)
	.loc 1 437 0
	movq	(%r12), %rdx
	.loc 1 433 0
	addq	$8, %r12
	.loc 1 437 0
	movq	%rdx, 336(%rsp)
	.loc 1 438 0
	movq	0(%r13), %rdx
	.loc 1 433 0
	addq	$8, %r13
	.loc 1 438 0
	movq	%rdx, 344(%rsp)
	.loc 1 439 0
	movq	(%r14), %rdx
	.loc 1 433 0
	addq	$8, %r14
	.loc 1 439 0
	movq	%rdx, 352(%rsp)
	.loc 1 440 0
	movq	%rbx, %rdx
	call	vect_cross
	.loc 1 441 0
	movq	%rbx, %rdi
	.loc 1 433 0
	addq	$24, %rbx
	.loc 1 441 0
	call	normalize_vect
.LVL250:
	.loc 1 433 0
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rax
	addq	$8, %rcx
	addq	$8, %rax
	cmpl	%ebp, 88(%rsp)
	jg	.L222
	movl	96(%rsp), %eax
.LVL251:
.L225:
	movq	104(%rsp), %rdx
	addl	$1, 96(%rsp)
	addq	%rdx, 80(%rsp)
	movq	160(%rsp), %rsi
	addq	%rdx, 128(%rsp)
	addq	%rdx, 112(%rsp)
	addq	%rdx, 120(%rsp)
	addq	%rsi, 136(%rsp)
	cmpl	%eax, 156(%rsp)
	jg	.L221
	movl	220(%rsp), %ebx
	.loc 1 444 0
	movl	156(%rsp), %eax
	.loc 1 374 0
	movl	$1, %r14d
	.loc 1 444 0
	imull	%ebx, %eax
	movslq	%eax, %rbp
	movl	%eax, 220(%rsp)
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc
	.loc 1 445 0
	movq	%rbp, %rdi
	.loc 1 444 0
	movq	%rax, 128(%rsp)
	movq	%rax, 232(%rsp)
.LVL252:
	.loc 1 445 0
	call	malloc
.LVL253:
	.loc 1 374 0
	movslq	%ebx, %rdx
	movq	200(%rsp), %r12
	.loc 1 445 0
	movq	%rax, 160(%rsp)
	.loc 1 374 0
	movq	%rdx, 136(%rsp)
	movq	136(%rsp), %rsi
	addq	$2, %rdx
	.loc 1 445 0
	movq	%rax, 224(%rsp)
.LVL254:
	.loc 1 374 0
	movq	128(%rsp), %r9
	movq	%rax, %r8
	.loc 1 446 0
	movl	%ebx, %r10d
	.loc 1 374 0
	addq	$16, %rax
.LVL255:
	movq	%rdx, 120(%rsp)
	leaq	24(,%rsi,8), %r11
	salq	$3, %rdx
	movq	%rax, 104(%rsp)
	.loc 1 446 0
	shrl	%r10d
	.loc 1 374 0
	movq	120(%rsp), %rax
	movq	%rdx, 112(%rsp)
	addq	%r11, %r12
	addq	208(%rsp), %r11
	.loc 1 446 0
	leal	(%r10,%r10), %edx
	.loc 1 374 0
	movq	%rsi, %r13
	movq	%r9, %r15
	movq	$0, 80(%rsp)
	salq	$3, %r13
	addq	$16, %r15
	movq	%rax, 88(%rsp)
	.loc 1 446 0
	movl	%edx, 96(%rsp)
.LVL256:
	.p2align 4,,10
	.p2align 3
.L226:
	testl	%ebx, %ebx
	movl	%r14d, %eax
	jle	.L235
	.loc 1 374 0
	cmpl	$16, %ebx
	leaq	16(%r12), %rax
	leaq	16(%r11), %rdx
	jbe	.L242
	movq	%r9, %rcx
	orq	%r8, %rcx
	andl	$15, %ecx
	jne	.L242
	cmpq	%r9, %rax
	jae	.L256
	cmpq	%r8, %rax
	jae	.L257
.L239:
	cmpq	%r11, %r15
	.p2align 4,,2
	jae	.L258
.L240:
	cmpq	%r8, %r15
	.p2align 4,,2
	jae	.L259
.L241:
	cmpq	%rdx, %r8
	.p2align 4,,2
	jbe	.L260
.L236:
	.loc 1 446 0
	movl	96(%rsp), %eax
	testl	%eax, %eax
	je	.L261
	movq	%r11, %rcx
	movq	%r12, %rdx
	xorl	%eax, %eax
	xorl	%esi, %esi
.LVL257:
	.p2align 4,,10
	.p2align 3
.L231:
	.loc 1 447 0
	movsd	(%rdx), %xmm1
	.loc 1 448 0
	addl	$1, %esi
	.loc 1 447 0
	movhpd	8(%rdx), %xmm1
	.loc 1 448 0
	addq	$16, %rdx
	.loc 1 447 0
	movapd	%xmm1, (%r9,%rax)
	.loc 1 448 0
	movsd	(%rcx), %xmm1
	movhpd	8(%rcx), %xmm1
	addq	$16, %rcx
	movapd	%xmm1, (%r8,%rax)
	addq	$16, %rax
	cmpl	%r10d, %esi
	jb	.L231
	movl	96(%rsp), %eax
	cmpl	%eax, %ebx
	je	.L228
.L230:
	.loc 1 374 0
	movq	88(%rsp), %rsi
	movslq	%eax, %rdx
	movq	200(%rsp), %rdi
	leaq	1(%rsi,%rdx), %rcx
	addq	80(%rsp), %rdx
	movq	128(%rsp), %rsi
	salq	$3, %rcx
	addq	%rcx, %rdi
	addq	208(%rsp), %rcx
	salq	$3, %rdx
	addq	%rdx, %rsi
	addq	160(%rsp), %rdx
	.p2align 4,,10
	.p2align 3
.L232:
	.loc 1 447 0
	movq	(%rdi), %rbp
	.loc 1 446 0
	addl	$1, %eax
.LVL258:
	addq	$8, %rdi
	.loc 1 447 0
	movq	%rbp, (%rsi)
	.loc 1 448 0
	movq	(%rcx), %rbp
	.loc 1 446 0
	addq	$8, %rsi
	addq	$8, %rcx
	.loc 1 448 0
	movq	%rbp, (%rdx)
	.loc 1 446 0
	addq	$8, %rdx
	cmpl	%eax, %ebx
	jg	.L232
.LVL259:
.L228:
	movl	%r14d, %eax
.L235:
.LVL260:
	addl	$1, %r14d
.LVL261:
	addq	112(%rsp), %r12
	addq	%r13, %r9
	addq	112(%rsp), %r11
	addq	%r13, %r8
	addq	%r13, %r15
	addq	%r13, 104(%rsp)
	movq	120(%rsp), %rdx
	movq	136(%rsp), %rsi
	addq	%rdx, 88(%rsp)
	addq	%rsi, 80(%rsp)
	cmpl	%eax, 156(%rsp)
	jg	.L226
.LVL262:
.L233:
	.loc 1 450 0
	movq	512(%rsp), %r8
	movq	504(%rsp), %rcx
	movq	224(%rsp), %rdx
	movq	232(%rsp), %rsi
	movl	220(%rsp), %edi
	call	unit_vect_latlon
	.loc 1 451 0
	movq	544(%rsp), %rax
	movq	184(%rsp), %r9
	movl	%ebx, %edi
	movq	176(%rsp), %r8
	movq	208(%rsp), %rcx
	movq	200(%rsp), %rdx
	movl	156(%rsp), %esi
	movl	(%rax), %eax
	movl	%eax, 56(%rsp)
	movq	536(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 48(%rsp)
	movq	528(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 40(%rsp)
	movq	520(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 32(%rsp)
	movq	480(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	472(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	464(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	456(%rsp), %rax
	movq	%rax, (%rsp)
	call	get_edge
	.loc 1 454 0
	movq	192(%rsp), %rdi
	call	free
	.loc 1 455 0
	movq	168(%rsp), %rdi
	call	free
	.loc 1 456 0
	movq	144(%rsp), %rdi
	call	free
	.loc 1 457 0
	movq	232(%rsp), %rdi
	call	free
	.loc 1 458 0
	movq	224(%rsp), %rdi
	call	free
	.loc 1 460 0
	addq	$376, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL263:
	.p2align 4,,10
	.p2align 3
.L259:
	.cfi_restore_state
	.loc 1 374 0
	cmpq	104(%rsp), %r9
	ja	.L241
	.p2align 4,,10
	.p2align 3
.L242:
	movq	%r8, %rdi
	movq	%r11, %rsi
	movq	%r9, %rcx
	movq	%r12, %rdx
	xorl	%eax, %eax
.LVL264:
	.p2align 4,,10
	.p2align 3
.L227:
	.loc 1 447 0
	movq	(%rdx), %rbp
	.loc 1 446 0
	addl	$1, %eax
.LVL265:
	addq	$8, %rdx
	.loc 1 447 0
	movq	%rbp, (%rcx)
	.loc 1 448 0
	movq	(%rsi), %rbp
	.loc 1 446 0
	addq	$8, %rcx
	addq	$8, %rsi
	.loc 1 448 0
	movq	%rbp, (%rdi)
	.loc 1 446 0
	addq	$8, %rdi
	cmpl	%ebx, %eax
	jne	.L227
	jmp	.L228
.LVL266:
	.p2align 4,,10
	.p2align 3
.L256:
	.loc 1 374 0
	cmpq	%r12, %r15
	jae	.L242
	cmpq	%r8, %rax
	.p2align 4,,5
	jb	.L239
	.p2align 4,,10
	.p2align 3
.L257:
	cmpq	104(%rsp), %r12
	jbe	.L242
	cmpq	%r11, %r15
	jb	.L240
	.p2align 4,,10
	.p2align 3
.L258:
	cmpq	%rdx, %r9
	ja	.L240
	.p2align 4,,5
	jmp	.L242
.L260:
	cmpq	%r11, 104(%rsp)
	.p2align 4,,3
	jb	.L236
	.p2align 4,,6
	jmp	.L242
.LVL267:
.L220:
	.loc 1 444 0
	movl	156(%rsp), %eax
	imull	%ebx, %eax
	movslq	%eax, %rbp
	movl	%eax, 220(%rsp)
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc
	.loc 1 445 0
	movq	%rbp, %rdi
	.loc 1 444 0
	movq	%rax, 232(%rsp)
	.loc 1 445 0
	call	malloc
	movq	%rax, 224(%rsp)
	jmp	.L233
.LVL268:
.L261:
	.loc 1 446 0
	xorl	%eax, %eax
	jmp	.L230
	.cfi_endproc
.LFE28:
	.size	calc_c2l_grid_info, .-calc_c2l_grid_info
	.p2align 4,,15
.globl calc_c2l_grid_info_
	.type	calc_c2l_grid_info_, @function
calc_c2l_grid_info_:
.LFB27:
	.loc 1 368 0
	.cfi_startproc
.LVL269:
	.loc 1 369 0
	jmp	calc_c2l_grid_info
	.cfi_endproc
.LFE27:
	.size	calc_c2l_grid_info_, .-calc_c2l_grid_info_
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1070596096
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC2:
	.long	1431655765
	.long	1070945621
	.align 8
.LC3:
	.long	0
	.long	1071644672
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.section	.rodata.cst16
	.align 16
.LC5:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC6:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	1096306094
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
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL4-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -128
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL3-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -120
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL6-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL45-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL59-.Ltext0
	.quad	.LVL63-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL64-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL8-1-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LVL0-.Ltext0
	.quad	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL8-1-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LVL0-.Ltext0
	.quad	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL8-1-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LVL2-.Ltext0
	.quad	.LVL7-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL7-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -136
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LVL5-.Ltext0
	.quad	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL8-1-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -100
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LVL19-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL21-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL32-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL33-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL35-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL40-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL41-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL43-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL50-.Ltext0
	.quad	.LVL51-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL53-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL54-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL57-.Ltext0
	.quad	.LVL58-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL59-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL61-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL63-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL66-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LVL15-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL17-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -140
	.quad	.LVL23-.Ltext0
	.quad	.LVL24-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL26-.Ltext0
	.quad	.LVL27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -140
	.quad	.LVL28-.Ltext0
	.quad	.LVL29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -140
	.quad	.LVL46-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -140
	.quad	.LVL48-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -140
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LVL13-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL18-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL25-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -113
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x9f
	.quad	.LVL50-.Ltext0
	.quad	.LVL54-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL54-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -113
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x9f
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -164
	.quad	.LVL66-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -113
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LVL14-.Ltext0
	.quad	.LVL17-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL17-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -140
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LVL15-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL16-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -168
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL10-1-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-.Ltext0
	.quad	.LFE23-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LVL67-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LVL67-.Ltext0
	.quad	.LVL76-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LVL67-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL70-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LVL67-.Ltext0
	.quad	.LVL71-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL71-.Ltext0
	.quad	.LVL76-1-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST19:
	.quad	.LVL67-.Ltext0
	.quad	.LVL72-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL72-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -160
	.quad	0x0
	.quad	0x0
.LLST20:
	.quad	.LVL67-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL73-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -152
	.quad	0x0
	.quad	0x0
.LLST21:
	.quad	.LVL77-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL78-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -184
	.quad	0x0
	.quad	0x0
.LLST22:
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL80-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -176
	.quad	0x0
	.quad	0x0
.LLST23:
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL82-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -168
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LVL83-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL84-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -192
	.quad	0x0
	.quad	0x0
.LLST25:
	.quad	.LVL68-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL74-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL97-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -108
	.quad	.LVL119-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST26:
	.quad	.LVL69-.Ltext0
	.quad	.LVL76-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL76-1-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL86-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	.LVL95-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x3
	.byte	0x7c
	.sleb128 -1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST27:
	.quad	.LVL75-.Ltext0
	.quad	.LVL76-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL76-1-.Ltext0
	.quad	.LFE22-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -108
	.quad	0x0
	.quad	0x0
.LLST28:
	.quad	.LVL75-.Ltext0
	.quad	.LVL96-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL87-.Ltext0
	.quad	.LVL88-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL92-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL97-.Ltext0
	.quad	.LVL98-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL110-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL114-.Ltext0
	.quad	.LVL115-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL94-.Ltext0
	.quad	.LVL95-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL95-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL103-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL105-.Ltext0
	.quad	.LVL106-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL111-.Ltext0
	.quad	.LVL112-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL112-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL113-.Ltext0
	.quad	.LVL114-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL118-.Ltext0
	.quad	.LVL119-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LVL88-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0x9
	.byte	0x73
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL89-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0xb
	.byte	0x73
	.sleb128 0
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL115-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x7d
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0xe
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x7d
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL88-.Ltext0
	.quad	.LVL89-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.quad	.LVL89-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0xe
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x79
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL115-.Ltext0
	.quad	.LVL116-.Ltext0
	.value	0xe
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x7d
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x33
	.byte	0x1e
	.byte	0x9f
	.quad	.LVL116-.Ltext0
	.quad	.LVL117-.Ltext0
	.value	0x10
	.byte	0x91
	.sleb128 -108
	.byte	0x94
	.byte	0x4
	.byte	0x7d
	.sleb128 0
	.byte	0x1e
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x31
	.byte	0x1c
	.byte	0x33
	.byte	0x1e
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL88-.Ltext0
	.quad	.LVL90-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL90-.Ltext0
	.quad	.LVL91-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL91-.Ltext0
	.quad	.LVL92-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL92-.Ltext0
	.quad	.LVL93-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL98-.Ltext0
	.quad	.LVL99-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL99-.Ltext0
	.quad	.LVL100-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL100-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL101-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	.LVL107-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL108-.Ltext0
	.quad	.LVL109-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL109-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL110-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x2
	.byte	0x33
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL123-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL126-.Ltext0
	.quad	.LVL127-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL123-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL124-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST36:
	.quad	.LVL123-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL125-.Ltext0
	.quad	.LVL132-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST37:
	.quad	.LVL128-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x1
	.byte	0x57
	.quad	.LVL131-.Ltext0
	.quad	.LFE25-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -128
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST38:
	.quad	.LVL129-.Ltext0
	.quad	.LVL130-1-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST39:
	.quad	.LVL134-.Ltext0
	.quad	.LVL142-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL142-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -216
	.quad	0x0
	.quad	0x0
.LLST40:
	.quad	.LVL134-.Ltext0
	.quad	.LVL135-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL135-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -192
	.quad	0x0
	.quad	0x0
.LLST41:
	.quad	.LVL134-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL143-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -168
	.quad	0x0
	.quad	0x0
.LLST42:
	.quad	.LVL134-.Ltext0
	.quad	.LVL140-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL140-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -160
	.quad	0x0
	.quad	0x0
.LLST43:
	.quad	.LVL134-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL136-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -136
	.quad	0x0
	.quad	0x0
.LLST44:
	.quad	.LVL134-.Ltext0
	.quad	.LVL144-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL144-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -128
	.quad	0x0
	.quad	0x0
.LLST45:
	.quad	.LVL138-.Ltext0
	.quad	.LVL143-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL182-.Ltext0
	.quad	.LVL183-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL183-.Ltext0
	.quad	.LVL184-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL185-.Ltext0
	.quad	.LVL186-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL186-.Ltext0
	.quad	.LVL187-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -196
	.quad	.LVL187-.Ltext0
	.quad	.LVL188-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL188-.Ltext0
	.quad	.LVL192-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL194-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL195-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL196-.Ltext0
	.quad	.LVL197-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL198-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -216
	.quad	.LVL199-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL200-.Ltext0
	.quad	.LVL204-.Ltext0
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL204-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL208-.Ltext0
	.quad	.LVL209-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL210-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST46:
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL148-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL155-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL159-.Ltext0
	.quad	.LVL160-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL160-.Ltext0
	.quad	.LVL161-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL161-.Ltext0
	.quad	.LVL162-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL162-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -232
	.quad	.LVL163-.Ltext0
	.quad	.LVL164-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL164-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x3
	.byte	0x7e
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL168-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL170-.Ltext0
	.quad	.LVL171-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL171-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL172-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL173-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL174-.Ltext0
	.quad	.LVL175-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -148
	.quad	.LVL175-.Ltext0
	.quad	.LVL176-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL176-.Ltext0
	.quad	.LVL180-.Ltext0
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL180-.Ltext0
	.quad	.LVL181-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL211-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST47:
	.quad	.LVL137-.Ltext0
	.quad	.LVL139-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL139-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -220
	.quad	0x0
	.quad	0x0
.LLST48:
	.quad	.LVL138-.Ltext0
	.quad	.LVL141-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL141-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -188
	.quad	0x0
	.quad	0x0
.LLST49:
	.quad	.LVL153-.Ltext0
	.quad	.LVL158-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL158-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -108
	.quad	.LVL169-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -169
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST50:
	.quad	.LVL154-.Ltext0
	.quad	.LVL157-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL157-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -236
	.quad	0x0
	.quad	0x0
.LLST51:
	.quad	.LVL154-.Ltext0
	.quad	.LVL159-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL159-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -232
	.quad	.LVL169-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0xc
	.byte	0x91
	.sleb128 -149
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0x38
	.byte	0x24
	.byte	0x8
	.byte	0x38
	.byte	0x25
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST52:
	.quad	.LVL154-.Ltext0
	.quad	.LVL163-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL163-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -232
	.quad	0x0
	.quad	0x0
.LLST53:
	.quad	.LVL152-.Ltext0
	.quad	.LVL156-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL156-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -144
	.quad	0x0
	.quad	0x0
.LLST54:
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL151-1-.Ltext0
	.quad	.LVL206-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -184
	.quad	0x0
	.quad	0x0
.LLST55:
	.quad	.LVL165-.Ltext0
	.quad	.LVL166-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL189-.Ltext0
	.quad	.LVL190-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL201-.Ltext0
	.quad	.LVL202-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST56:
	.quad	.LVL166-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL178-.Ltext0
	.quad	.LVL179-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL190-.Ltext0
	.quad	.LVL191-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL202-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST57:
	.quad	.LVL212-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST58:
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST59:
	.quad	.LVL212-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL219-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -232
	.quad	0x0
	.quad	0x0
.LLST60:
	.quad	.LVL212-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL220-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -224
	.quad	0x0
	.quad	0x0
.LLST61:
	.quad	.LVL212-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL220-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -256
	.quad	0x0
	.quad	0x0
.LLST62:
	.quad	.LVL212-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL220-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -248
	.quad	0x0
	.quad	0x0
.LLST63:
	.quad	.LVL236-.Ltext0
	.quad	.LVL237-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL237-1-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -240
	.quad	0x0
	.quad	0x0
.LLST64:
	.quad	.LVL238-.Ltext0
	.quad	.LVL239-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL239-1-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	0x0
	.quad	0x0
.LLST65:
	.quad	.LVL240-.Ltext0
	.quad	.LVL241-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL241-1-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -288
	.quad	0x0
	.quad	0x0
.LLST66:
	.quad	.LVL252-.Ltext0
	.quad	.LVL253-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL253-1-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -304
	.quad	.LVL263-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -304
	.quad	.LVL268-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -304
	.quad	0x0
	.quad	0x0
.LLST67:
	.quad	.LVL254-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL256-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -272
	.quad	.LVL263-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -272
	.quad	.LVL268-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -272
	.quad	0x0
	.quad	0x0
.LLST68:
	.quad	.LVL214-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL220-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL226-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -264
	.quad	.LVL235-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -344
	.byte	0x94
	.byte	0x4
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST69:
	.quad	.LVL215-.Ltext0
	.quad	.LVL216-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL216-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -276
	.quad	0x0
	.quad	0x0
.LLST70:
	.quad	.LVL217-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL218-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -344
	.quad	0x0
	.quad	0x0
.LLST71:
	.quad	.LVL217-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL220-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -272
	.quad	0x0
	.quad	0x0
.LLST72:
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL222-.Ltext0
	.quad	.LVL223-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL226-.Ltext0
	.quad	.LVL227-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL228-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL231-.Ltext0
	.quad	.LVL232-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL233-.Ltext0
	.quad	.LVL234-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL242-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL244-.Ltext0
	.quad	.LVL245-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL248-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL250-.Ltext0
	.quad	.LVL251-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL258-.Ltext0
	.quad	.LVL259-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL263-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL265-.Ltext0
	.quad	.LVL266-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL266-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL268-.Ltext0
	.quad	.LFE28-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL217-.Ltext0
	.quad	.LVL220-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL224-.Ltext0
	.quad	.LVL225-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -328
	.quad	.LVL225-.Ltext0
	.quad	.LVL226-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL229-.Ltext0
	.quad	.LVL230-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -336
	.quad	.LVL230-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL234-.Ltext0
	.quad	.LVL235-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -336
	.quad	.LVL241-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -328
	.quad	.LVL247-.Ltext0
	.quad	.LVL248-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL251-.Ltext0
	.quad	.LVL254-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -336
	.quad	.LVL254-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL260-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL261-.Ltext0
	.quad	.LVL262-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL267-.Ltext0
	.quad	.LVL268-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.section	.debug_info
	.long	0xe48
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF89
	.byte	0x1
	.long	.LASF90
	.long	.LASF91
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x8
	.long	0x48
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x5
	.long	.LASF11
	.byte	0x2
	.byte	0xd3
	.long	0x5a
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.byte	0x8
	.long	0x3b
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF7
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x8d
	.long	0x6e
	.uleb128 0x5
	.long	.LASF13
	.byte	0x3
	.byte	0x8e
	.long	0x6e
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF14
	.uleb128 0x7
	.long	.LASF44
	.byte	0xd8
	.byte	0x4
	.value	0x10f
	.long	0x253
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.value	0x110
	.long	0x3b
	.sleb128 0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.value	0x115
	.long	0x42
	.sleb128 8
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.value	0x116
	.long	0x42
	.sleb128 16
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.value	0x117
	.long	0x42
	.sleb128 24
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.value	0x118
	.long	0x42
	.sleb128 32
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.value	0x119
	.long	0x42
	.sleb128 40
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.value	0x11a
	.long	0x42
	.sleb128 48
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.value	0x11b
	.long	0x42
	.sleb128 56
	.uleb128 0x8
	.long	.LASF23
	.byte	0x4
	.value	0x11c
	.long	0x42
	.sleb128 64
	.uleb128 0x8
	.long	.LASF24
	.byte	0x4
	.value	0x11e
	.long	0x42
	.sleb128 72
	.uleb128 0x8
	.long	.LASF25
	.byte	0x4
	.value	0x11f
	.long	0x42
	.sleb128 80
	.uleb128 0x8
	.long	.LASF26
	.byte	0x4
	.value	0x120
	.long	0x42
	.sleb128 88
	.uleb128 0x8
	.long	.LASF27
	.byte	0x4
	.value	0x122
	.long	0x28b
	.sleb128 96
	.uleb128 0x8
	.long	.LASF28
	.byte	0x4
	.value	0x124
	.long	0x291
	.sleb128 104
	.uleb128 0x8
	.long	.LASF29
	.byte	0x4
	.value	0x126
	.long	0x3b
	.sleb128 112
	.uleb128 0x8
	.long	.LASF30
	.byte	0x4
	.value	0x12a
	.long	0x3b
	.sleb128 116
	.uleb128 0x8
	.long	.LASF31
	.byte	0x4
	.value	0x12c
	.long	0x98
	.sleb128 120
	.uleb128 0x8
	.long	.LASF32
	.byte	0x4
	.value	0x130
	.long	0x83
	.sleb128 128
	.uleb128 0x8
	.long	.LASF33
	.byte	0x4
	.value	0x131
	.long	0x8a
	.sleb128 130
	.uleb128 0x8
	.long	.LASF34
	.byte	0x4
	.value	0x132
	.long	0x297
	.sleb128 131
	.uleb128 0x8
	.long	.LASF35
	.byte	0x4
	.value	0x136
	.long	0x2a7
	.sleb128 136
	.uleb128 0x8
	.long	.LASF36
	.byte	0x4
	.value	0x13f
	.long	0xa3
	.sleb128 144
	.uleb128 0x8
	.long	.LASF37
	.byte	0x4
	.value	0x148
	.long	0xae
	.sleb128 152
	.uleb128 0x8
	.long	.LASF38
	.byte	0x4
	.value	0x149
	.long	0xae
	.sleb128 160
	.uleb128 0x8
	.long	.LASF39
	.byte	0x4
	.value	0x14a
	.long	0xae
	.sleb128 168
	.uleb128 0x8
	.long	.LASF40
	.byte	0x4
	.value	0x14b
	.long	0xae
	.sleb128 176
	.uleb128 0x8
	.long	.LASF41
	.byte	0x4
	.value	0x14c
	.long	0x4f
	.sleb128 184
	.uleb128 0x8
	.long	.LASF42
	.byte	0x4
	.value	0x14e
	.long	0x3b
	.sleb128 192
	.uleb128 0x8
	.long	.LASF43
	.byte	0x4
	.value	0x150
	.long	0x2ad
	.sleb128 196
	.byte	0x0
	.uleb128 0x9
	.long	.LASF92
	.byte	0x4
	.byte	0xb4
	.uleb128 0xa
	.long	.LASF45
	.byte	0x18
	.byte	0x4
	.byte	0xba
	.long	0x28b
	.uleb128 0xb
	.long	.LASF46
	.byte	0x4
	.byte	0xbb
	.long	0x28b
	.sleb128 0
	.uleb128 0xb
	.long	.LASF47
	.byte	0x4
	.byte	0xbc
	.long	0x291
	.sleb128 8
	.uleb128 0xb
	.long	.LASF48
	.byte	0x4
	.byte	0xc0
	.long	0x3b
	.sleb128 16
	.byte	0x0
	.uleb128 0x4
	.byte	0x8
	.long	0x25a
	.uleb128 0x4
	.byte	0x8
	.long	0xb7
	.uleb128 0xc
	.long	0x48
	.long	0x2a7
	.uleb128 0xd
	.long	0x5a
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.byte	0x8
	.long	0x253
	.uleb128 0xc
	.long	0x48
	.long	0x2bd
	.uleb128 0xd
	.long	0x5a
	.byte	0x13
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF62
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.quad	.LFB23
	.quad	.LFE23
	.byte	0x1
	.byte	0x9c
	.long	0x42a
	.uleb128 0xf
	.string	"nx"
	.byte	0x1
	.byte	0x85
	.long	0x3b
	.long	.LLST0
	.uleb128 0xf
	.string	"ny"
	.byte	0x1
	.byte	0x85
	.long	0x3b
	.long	.LLST1
	.uleb128 0xf
	.string	"qin"
	.byte	0x1
	.byte	0x85
	.long	0x42a
	.long	.LLST2
	.uleb128 0x10
	.long	.LASF49
	.byte	0x1
	.byte	0x85
	.long	0x42a
	.long	.LLST3
	.uleb128 0x10
	.long	.LASF50
	.byte	0x1
	.byte	0x85
	.long	0x42a
	.long	.LLST4
	.uleb128 0x10
	.long	.LASF51
	.byte	0x1
	.byte	0x86
	.long	0x42a
	.long	.LLST5
	.uleb128 0x11
	.long	.LASF52
	.byte	0x1
	.byte	0x86
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF53
	.byte	0x1
	.byte	0x86
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x87
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0x87
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x11
	.long	.LASF56
	.byte	0x1
	.byte	0x87
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0x87
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x12
	.string	"nxp"
	.byte	0x1
	.byte	0x89
	.long	0x3b
	.long	.LLST6
	.uleb128 0x12
	.string	"nyp"
	.byte	0x1
	.byte	0x89
	.long	0x3b
	.long	.LLST7
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0x89
	.long	0x3b
	.long	.LLST8
	.uleb128 0x12
	.string	"j"
	.byte	0x1
	.byte	0x89
	.long	0x3b
	.long	.LLST9
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x8a
	.long	0x3b
	.long	.LLST10
	.uleb128 0x14
	.long	.LASF59
	.byte	0x1
	.byte	0x8a
	.long	0x3b
	.byte	0x1
	.byte	0x59
	.uleb128 0x13
	.long	.LASF60
	.byte	0x1
	.byte	0x8a
	.long	0x3b
	.long	.LLST11
	.uleb128 0x13
	.long	.LASF61
	.byte	0x1
	.byte	0x8a
	.long	0x3b
	.long	.LLST12
	.uleb128 0x12
	.string	"q1"
	.byte	0x1
	.byte	0x8b
	.long	0x435
	.long	.LLST13
	.uleb128 0x12
	.string	"q2"
	.byte	0x1
	.byte	0x8b
	.long	0x435
	.long	.LLST14
	.uleb128 0x15
	.string	"r3"
	.byte	0x1
	.byte	0x8c
	.long	0x430
	.byte	0x8
	.long	0x55555555
	.long	0x3fd55555
	.byte	0x0
	.uleb128 0x4
	.byte	0x8
	.long	0x430
	.uleb128 0x16
	.long	0x34
	.uleb128 0x4
	.byte	0x8
	.long	0x34
	.uleb128 0xe
	.byte	0x1
	.long	.LASF63
	.byte	0x1
	.byte	0x43
	.byte	0x1
	.quad	.LFB22
	.quad	.LFE22
	.byte	0x1
	.byte	0x9c
	.long	0x63f
	.uleb128 0x10
	.long	.LASF64
	.byte	0x1
	.byte	0x43
	.long	0x63f
	.long	.LLST15
	.uleb128 0x10
	.long	.LASF65
	.byte	0x1
	.byte	0x43
	.long	0x63f
	.long	.LLST16
	.uleb128 0xf
	.string	"pin"
	.byte	0x1
	.byte	0x43
	.long	0x42a
	.long	.LLST17
	.uleb128 0xf
	.string	"dx"
	.byte	0x1
	.byte	0x43
	.long	0x42a
	.long	.LLST18
	.uleb128 0xf
	.string	"dy"
	.byte	0x1
	.byte	0x43
	.long	0x42a
	.long	.LLST19
	.uleb128 0x10
	.long	.LASF66
	.byte	0x1
	.byte	0x43
	.long	0x42a
	.long	.LLST20
	.uleb128 0x11
	.long	.LASF49
	.byte	0x1
	.byte	0x44
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.byte	0x44
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.long	.LASF51
	.byte	0x1
	.byte	0x44
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x11
	.long	.LASF52
	.byte	0x1
	.byte	0x44
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x11
	.long	.LASF67
	.byte	0x1
	.byte	0x45
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x11
	.long	.LASF68
	.byte	0x1
	.byte	0x45
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x11
	.long	.LASF69
	.byte	0x1
	.byte	0x45
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0x45
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x11
	.long	.LASF71
	.byte	0x1
	.byte	0x46
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x11
	.long	.LASF72
	.byte	0x1
	.byte	0x46
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x46
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0x46
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x11
	.long	.LASF56
	.byte	0x1
	.byte	0x47
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0x47
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 104
	.uleb128 0x12
	.string	"pb"
	.byte	0x1
	.byte	0x4a
	.long	0x435
	.long	.LLST21
	.uleb128 0x12
	.string	"pdx"
	.byte	0x1
	.byte	0x4a
	.long	0x435
	.long	.LLST22
	.uleb128 0x12
	.string	"pdy"
	.byte	0x1
	.byte	0x4a
	.long	0x435
	.long	.LLST23
	.uleb128 0x13
	.long	.LASF73
	.byte	0x1
	.byte	0x4a
	.long	0x435
	.long	.LLST24
	.uleb128 0x12
	.string	"nx"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST25
	.uleb128 0x12
	.string	"ny"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST26
	.uleb128 0x12
	.string	"nxp"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST27
	.uleb128 0x12
	.string	"nyp"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST28
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST29
	.uleb128 0x12
	.string	"j"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST30
	.uleb128 0x12
	.string	"m0"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST31
	.uleb128 0x12
	.string	"m1"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST32
	.uleb128 0x17
	.string	"m2"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.uleb128 0x12
	.string	"n"
	.byte	0x1
	.byte	0x4b
	.long	0x3b
	.long	.LLST33
	.byte	0x0
	.uleb128 0x4
	.byte	0x8
	.long	0x645
	.uleb128 0x16
	.long	0x3b
	.uleb128 0xe
	.byte	0x1
	.long	.LASF74
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.quad	.LFB21
	.quad	.LFE21
	.byte	0x1
	.byte	0x9c
	.long	0x780
	.uleb128 0x11
	.long	.LASF64
	.byte	0x1
	.byte	0x39
	.long	0x63f
	.byte	0x1
	.byte	0x55
	.uleb128 0x11
	.long	.LASF65
	.byte	0x1
	.byte	0x39
	.long	0x63f
	.byte	0x1
	.byte	0x54
	.uleb128 0x18
	.string	"pin"
	.byte	0x1
	.byte	0x39
	.long	0x42a
	.byte	0x1
	.byte	0x51
	.uleb128 0x18
	.string	"dx"
	.byte	0x1
	.byte	0x39
	.long	0x42a
	.byte	0x1
	.byte	0x52
	.uleb128 0x18
	.string	"dy"
	.byte	0x1
	.byte	0x39
	.long	0x42a
	.byte	0x1
	.byte	0x58
	.uleb128 0x11
	.long	.LASF66
	.byte	0x1
	.byte	0x39
	.long	0x42a
	.byte	0x1
	.byte	0x59
	.uleb128 0x11
	.long	.LASF49
	.byte	0x1
	.byte	0x3a
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.byte	0x3a
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.long	.LASF51
	.byte	0x1
	.byte	0x3a
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x11
	.long	.LASF52
	.byte	0x1
	.byte	0x3a
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x11
	.long	.LASF67
	.byte	0x1
	.byte	0x3b
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x11
	.long	.LASF68
	.byte	0x1
	.byte	0x3b
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x11
	.long	.LASF69
	.byte	0x1
	.byte	0x3b
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x11
	.long	.LASF70
	.byte	0x1
	.byte	0x3b
	.long	0x42a
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x11
	.long	.LASF71
	.byte	0x1
	.byte	0x3c
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x11
	.long	.LASF72
	.byte	0x1
	.byte	0x3c
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x3c
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0x3c
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x11
	.long	.LASF56
	.byte	0x1
	.byte	0x3d
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0x3d
	.long	0x63f
	.byte	0x3
	.byte	0x91
	.sleb128 104
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF93
	.byte	0x1
	.value	0x14c
	.byte	0x1
	.byte	0x1
	.long	0x7bb
	.uleb128 0x1a
	.string	"p1"
	.byte	0x1
	.value	0x14c
	.long	0x42a
	.uleb128 0x1a
	.string	"p2"
	.byte	0x1
	.value	0x14c
	.long	0x42a
	.uleb128 0x1a
	.string	"e"
	.byte	0x1
	.value	0x14c
	.long	0x435
	.uleb128 0x1b
	.string	"dd"
	.byte	0x1
	.value	0x14e
	.long	0x34
	.byte	0x0
	.uleb128 0x1c
	.long	0x780
	.quad	.LFB26
	.quad	.LFE26
	.byte	0x1
	.byte	0x9c
	.long	0x7f3
	.uleb128 0x1d
	.long	0x78f
	.byte	0x1
	.byte	0x55
	.uleb128 0x1d
	.long	0x79a
	.byte	0x1
	.byte	0x54
	.uleb128 0x1d
	.long	0x7a5
	.byte	0x1
	.byte	0x51
	.uleb128 0x1e
	.long	0x7af
	.byte	0x1
	.byte	0x64
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF75
	.byte	0x1
	.value	0x141
	.byte	0x1
	.quad	.LFB25
	.quad	.LFE25
	.byte	0x1
	.byte	0x9c
	.long	0x8ad
	.uleb128 0x20
	.string	"p1"
	.byte	0x1
	.value	0x141
	.long	0x42a
	.long	.LLST34
	.uleb128 0x20
	.string	"p2"
	.byte	0x1
	.value	0x141
	.long	0x42a
	.long	.LLST35
	.uleb128 0x20
	.string	"pm"
	.byte	0x1
	.value	0x141
	.long	0x435
	.long	.LLST36
	.uleb128 0x21
	.string	"e1"
	.byte	0x1
	.value	0x143
	.long	0x8ad
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x21
	.string	"e2"
	.byte	0x1
	.value	0x143
	.long	0x8ad
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x21
	.string	"e3"
	.byte	0x1
	.value	0x143
	.long	0x8ad
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x22
	.long	0x780
	.quad	.LBB4
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.value	0x147
	.uleb128 0x23
	.long	0x7a5
	.long	.LLST37
	.uleb128 0x1d
	.long	0x79a
	.byte	0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x9f
	.uleb128 0x1d
	.long	0x78f
	.byte	0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x9f
	.uleb128 0x24
	.long	.Ldebug_ranges0+0x60
	.uleb128 0x25
	.long	0x7af
	.long	.LLST38
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.long	0x34
	.long	0x8bd
	.uleb128 0xd
	.long	0x5a
	.byte	0x2
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF76
	.byte	0x1
	.byte	0xcc
	.byte	0x1
	.quad	.LFB24
	.quad	.LFE24
	.byte	0x1
	.byte	0x9c
	.long	0xa6d
	.uleb128 0xf
	.string	"nx"
	.byte	0x1
	.byte	0xcc
	.long	0x3b
	.long	.LLST39
	.uleb128 0xf
	.string	"ny"
	.byte	0x1
	.byte	0xcc
	.long	0x3b
	.long	.LLST40
	.uleb128 0x10
	.long	.LASF77
	.byte	0x1
	.byte	0xcc
	.long	0x42a
	.long	.LLST41
	.uleb128 0x10
	.long	.LASF78
	.byte	0x1
	.byte	0xcc
	.long	0x42a
	.long	.LLST42
	.uleb128 0x10
	.long	.LASF79
	.byte	0x1
	.byte	0xcd
	.long	0x42a
	.long	.LLST43
	.uleb128 0x10
	.long	.LASF80
	.byte	0x1
	.byte	0xcd
	.long	0x42a
	.long	.LLST44
	.uleb128 0x11
	.long	.LASF49
	.byte	0x1
	.byte	0xcd
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.byte	0xcd
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.long	.LASF51
	.byte	0x1
	.byte	0xcd
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x11
	.long	.LASF52
	.byte	0x1
	.byte	0xcd
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0xce
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0xce
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x11
	.long	.LASF56
	.byte	0x1
	.byte	0xce
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x11
	.long	.LASF57
	.byte	0x1
	.byte	0xce
	.long	0x3b
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0xd0
	.long	0x3b
	.long	.LLST45
	.uleb128 0x12
	.string	"j"
	.byte	0x1
	.byte	0xd0
	.long	0x3b
	.long	.LLST46
	.uleb128 0x12
	.string	"nxp"
	.byte	0x1
	.byte	0xd0
	.long	0x3b
	.long	.LLST47
	.uleb128 0x12
	.string	"nyp"
	.byte	0x1
	.byte	0xd0
	.long	0x3b
	.long	.LLST48
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0xd1
	.long	0x3b
	.long	.LLST49
	.uleb128 0x13
	.long	.LASF59
	.byte	0x1
	.byte	0xd1
	.long	0x3b
	.long	.LLST50
	.uleb128 0x13
	.long	.LASF60
	.byte	0x1
	.byte	0xd1
	.long	0x3b
	.long	.LLST51
	.uleb128 0x13
	.long	.LASF61
	.byte	0x1
	.byte	0xd1
	.long	0x3b
	.long	.LLST52
	.uleb128 0x26
	.string	"p1"
	.byte	0x1
	.byte	0xd2
	.long	0xa6d
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x26
	.string	"p2"
	.byte	0x1
	.byte	0xd2
	.long	0xa6d
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x12
	.string	"py"
	.byte	0x1
	.byte	0xd3
	.long	0x435
	.long	.LLST53
	.uleb128 0x12
	.string	"px"
	.byte	0x1
	.byte	0xd3
	.long	0x435
	.long	.LLST54
	.uleb128 0x12
	.string	"d1"
	.byte	0x1
	.byte	0xd4
	.long	0x34
	.long	.LLST55
	.uleb128 0x12
	.string	"d2"
	.byte	0x1
	.byte	0xd4
	.long	0x34
	.long	.LLST56
	.byte	0x0
	.uleb128 0xc
	.long	0x34
	.long	0xa7d
	.uleb128 0xd
	.long	0x5a
	.byte	0x1
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF81
	.byte	0x1
	.value	0x176
	.byte	0x1
	.quad	.LFB28
	.quad	.LFE28
	.byte	0x1
	.byte	0x9c
	.long	0xcc0
	.uleb128 0x27
	.long	.LASF82
	.byte	0x1
	.value	0x176
	.long	0x68
	.long	.LLST57
	.uleb128 0x27
	.long	.LASF83
	.byte	0x1
	.value	0x176
	.long	0x68
	.long	.LLST58
	.uleb128 0x20
	.string	"xt"
	.byte	0x1
	.value	0x176
	.long	0x42a
	.long	.LLST59
	.uleb128 0x20
	.string	"yt"
	.byte	0x1
	.value	0x176
	.long	0x42a
	.long	.LLST60
	.uleb128 0x20
	.string	"xc"
	.byte	0x1
	.value	0x176
	.long	0x42a
	.long	.LLST61
	.uleb128 0x20
	.string	"yc"
	.byte	0x1
	.value	0x176
	.long	0x42a
	.long	.LLST62
	.uleb128 0x28
	.string	"dx"
	.byte	0x1
	.value	0x177
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x28
	.string	"dy"
	.byte	0x1
	.value	0x177
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x29
	.long	.LASF66
	.byte	0x1
	.value	0x177
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x29
	.long	.LASF49
	.byte	0x1
	.value	0x177
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x29
	.long	.LASF50
	.byte	0x1
	.value	0x177
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x29
	.long	.LASF51
	.byte	0x1
	.value	0x177
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x29
	.long	.LASF52
	.byte	0x1
	.value	0x178
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x29
	.long	.LASF67
	.byte	0x1
	.value	0x178
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x29
	.long	.LASF68
	.byte	0x1
	.value	0x178
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x29
	.long	.LASF69
	.byte	0x1
	.value	0x178
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x29
	.long	.LASF70
	.byte	0x1
	.value	0x178
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x29
	.long	.LASF54
	.byte	0x1
	.value	0x179
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x29
	.long	.LASF55
	.byte	0x1
	.value	0x179
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x29
	.long	.LASF56
	.byte	0x1
	.value	0x179
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 104
	.uleb128 0x29
	.long	.LASF57
	.byte	0x1
	.value	0x179
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 112
	.uleb128 0x2a
	.string	"x"
	.byte	0x1
	.value	0x17b
	.long	0x435
	.long	.LLST63
	.uleb128 0x2a
	.string	"y"
	.byte	0x1
	.value	0x17b
	.long	0x435
	.long	.LLST64
	.uleb128 0x2a
	.string	"z"
	.byte	0x1
	.value	0x17b
	.long	0x435
	.long	.LLST65
	.uleb128 0x2b
	.long	.LASF84
	.byte	0x1
	.value	0x17b
	.long	0x435
	.long	.LLST66
	.uleb128 0x2b
	.long	.LASF85
	.byte	0x1
	.value	0x17b
	.long	0x435
	.long	.LLST67
	.uleb128 0x2a
	.string	"nx"
	.byte	0x1
	.value	0x17c
	.long	0x3b
	.long	.LLST68
	.uleb128 0x2a
	.string	"ny"
	.byte	0x1
	.value	0x17c
	.long	0x3b
	.long	.LLST69
	.uleb128 0x2a
	.string	"nxp"
	.byte	0x1
	.value	0x17c
	.long	0x3b
	.long	.LLST70
	.uleb128 0x2a
	.string	"nyp"
	.byte	0x1
	.value	0x17c
	.long	0x3b
	.long	.LLST71
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.value	0x17c
	.long	0x3b
	.long	.LLST72
	.uleb128 0x2a
	.string	"j"
	.byte	0x1
	.value	0x17c
	.long	0x3b
	.long	.LLST73
	.uleb128 0x21
	.string	"p1"
	.byte	0x1
	.value	0x17d
	.long	0x8ad
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x21
	.string	"p2"
	.byte	0x1
	.value	0x17d
	.long	0x8ad
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x21
	.string	"p3"
	.byte	0x1
	.value	0x17d
	.long	0x8ad
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x21
	.string	"p4"
	.byte	0x1
	.value	0x17d
	.long	0x8ad
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.byte	0x0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF86
	.byte	0x1
	.value	0x16c
	.byte	0x1
	.quad	.LFB27
	.quad	.LFE27
	.byte	0x1
	.byte	0x9c
	.long	0xe17
	.uleb128 0x29
	.long	.LASF82
	.byte	0x1
	.value	0x16c
	.long	0x68
	.byte	0x1
	.byte	0x55
	.uleb128 0x29
	.long	.LASF83
	.byte	0x1
	.value	0x16c
	.long	0x68
	.byte	0x1
	.byte	0x54
	.uleb128 0x28
	.string	"xt"
	.byte	0x1
	.value	0x16c
	.long	0x42a
	.byte	0x1
	.byte	0x51
	.uleb128 0x28
	.string	"yt"
	.byte	0x1
	.value	0x16c
	.long	0x42a
	.byte	0x1
	.byte	0x52
	.uleb128 0x28
	.string	"xc"
	.byte	0x1
	.value	0x16c
	.long	0x42a
	.byte	0x1
	.byte	0x58
	.uleb128 0x28
	.string	"yc"
	.byte	0x1
	.value	0x16c
	.long	0x42a
	.byte	0x1
	.byte	0x59
	.uleb128 0x28
	.string	"dx"
	.byte	0x1
	.value	0x16d
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x28
	.string	"dy"
	.byte	0x1
	.value	0x16d
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x29
	.long	.LASF66
	.byte	0x1
	.value	0x16d
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x29
	.long	.LASF49
	.byte	0x1
	.value	0x16d
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x29
	.long	.LASF50
	.byte	0x1
	.value	0x16d
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x29
	.long	.LASF51
	.byte	0x1
	.value	0x16d
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x29
	.long	.LASF52
	.byte	0x1
	.value	0x16e
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x29
	.long	.LASF67
	.byte	0x1
	.value	0x16e
	.long	0x435
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x29
	.long	.LASF68
	.byte	0x1
	.value	0x16e
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x29
	.long	.LASF69
	.byte	0x1
	.value	0x16e
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x29
	.long	.LASF70
	.byte	0x1
	.value	0x16e
	.long	0x435
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x29
	.long	.LASF54
	.byte	0x1
	.value	0x16f
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x29
	.long	.LASF55
	.byte	0x1
	.value	0x16f
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x29
	.long	.LASF56
	.byte	0x1
	.value	0x16f
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 104
	.uleb128 0x29
	.long	.LASF57
	.byte	0x1
	.value	0x16f
	.long	0x68
	.byte	0x3
	.byte	0x91
	.sleb128 112
	.byte	0x0
	.uleb128 0x2c
	.long	.LASF87
	.byte	0x5
	.byte	0xa5
	.long	0x291
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.long	.LASF88
	.byte	0x5
	.byte	0xa6
	.long	0x291
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.long	.LASF87
	.byte	0x5
	.byte	0xa5
	.long	0x291
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.long	.LASF88
	.byte	0x5
	.byte	0xa6
	.long	0x291
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0xf
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0xa
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.long	0x95
	.value	0x2
	.long	.Ldebug_info0
	.long	0xe4c
	.long	0x2bd
	.string	"a2b_ord2"
	.long	0x43b
	.string	"grad_c2l"
	.long	0x64a
	.string	"grad_c2l_"
	.long	0x7bb
	.string	"mid_pt3_cart"
	.long	0x7f3
	.string	"mid_pt_sphere"
	.long	0x8bd
	.string	"get_edge"
	.long	0xa7d
	.string	"calc_c2l_grid_info"
	.long	0xcc0
	.string	"calc_c2l_grid_info_"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x5e
	.value	0x2
	.long	.Ldebug_info0
	.long	0xe4c
	.long	0x4f
	.string	"size_t"
	.long	0x98
	.string	"__off_t"
	.long	0xa3
	.string	"__off64_t"
	.long	0x253
	.string	"_IO_lock_t"
	.long	0x25a
	.string	"_IO_marker"
	.long	0xb7
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
	.quad	.LBB4-.Ltext0
	.quad	.LBE4-.Ltext0
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	.LBB12-.Ltext0
	.quad	.LBE12-.Ltext0
	.quad	.LBB11-.Ltext0
	.quad	.LBE11-.Ltext0
	.quad	.LBB10-.Ltext0
	.quad	.LBE10-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB7-.Ltext0
	.quad	.LBE7-.Ltext0
	.quad	.LBB9-.Ltext0
	.quad	.LBE9-.Ltext0
	.quad	.LBB5-.Ltext0
	.quad	.LBE5-.Ltext0
	.quad	.LBB8-.Ltext0
	.quad	.LBE8-.Ltext0
	.quad	.LBB6-.Ltext0
	.quad	.LBE6-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF12:
	.string	"__off_t"
.LASF16:
	.string	"_IO_read_ptr"
.LASF28:
	.string	"_chain"
.LASF11:
	.string	"size_t"
.LASF50:
	.string	"edge_e"
.LASF34:
	.string	"_shortbuf"
.LASF52:
	.string	"edge_n"
.LASF51:
	.string	"edge_s"
.LASF49:
	.string	"edge_w"
.LASF58:
	.string	"istart"
.LASF22:
	.string	"_IO_buf_base"
.LASF93:
	.string	"mid_pt3_cart"
.LASF69:
	.string	"vlon"
.LASF14:
	.string	"long long unsigned int"
.LASF81:
	.string	"calc_c2l_grid_info"
.LASF6:
	.string	"long long int"
.LASF9:
	.string	"signed char"
.LASF68:
	.string	"en_e"
.LASF82:
	.string	"nx_pt"
.LASF29:
	.string	"_fileno"
.LASF17:
	.string	"_IO_read_end"
.LASF67:
	.string	"en_n"
.LASF79:
	.string	"lonc"
.LASF5:
	.string	"long int"
.LASF60:
	.string	"jstart"
.LASF15:
	.string	"_flags"
.LASF23:
	.string	"_IO_buf_end"
.LASF32:
	.string	"_cur_column"
.LASF90:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/gradient_c2l.c"
.LASF1:
	.string	"double"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF70:
	.string	"vlat"
.LASF66:
	.string	"area"
.LASF55:
	.string	"on_east_edge"
.LASF45:
	.string	"_IO_marker"
.LASF4:
	.string	"unsigned int"
.LASF3:
	.string	"long unsigned int"
.LASF73:
	.string	"grad3"
.LASF20:
	.string	"_IO_write_ptr"
.LASF85:
	.string	"yt_tmp"
.LASF47:
	.string	"_sbuf"
.LASF8:
	.string	"short unsigned int"
.LASF24:
	.string	"_IO_save_base"
.LASF87:
	.string	"stdin"
.LASF35:
	.string	"_lock"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF88:
	.string	"stdout"
.LASF57:
	.string	"on_north_edge"
.LASF74:
	.string	"grad_c2l_"
.LASF84:
	.string	"xt_tmp"
.LASF80:
	.string	"latc"
.LASF63:
	.string	"grad_c2l"
.LASF21:
	.string	"_IO_write_end"
.LASF78:
	.string	"latt"
.LASF92:
	.string	"_IO_lock_t"
.LASF44:
	.string	"_IO_FILE"
.LASF56:
	.string	"on_south_edge"
.LASF53:
	.string	"qout"
.LASF0:
	.string	"float"
.LASF48:
	.string	"_pos"
.LASF27:
	.string	"_markers"
.LASF76:
	.string	"get_edge"
.LASF7:
	.string	"unsigned char"
.LASF91:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/preprocessing/regrid_2d/exec"
.LASF64:
	.string	"nlon"
.LASF10:
	.string	"short int"
.LASF33:
	.string	"_vtable_offset"
.LASF86:
	.string	"calc_c2l_grid_info_"
.LASF75:
	.string	"mid_pt_sphere"
.LASF2:
	.string	"char"
.LASF59:
	.string	"iend"
.LASF54:
	.string	"on_west_edge"
.LASF89:
	.string	"GNU C 4.4.7 20120313 (Red Hat 4.4.7-16)"
.LASF46:
	.string	"_next"
.LASF13:
	.string	"__off64_t"
.LASF83:
	.string	"ny_pt"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF62:
	.string	"a2b_ord2"
.LASF65:
	.string	"nlat"
.LASF37:
	.string	"__pad1"
.LASF38:
	.string	"__pad2"
.LASF39:
	.string	"__pad3"
.LASF40:
	.string	"__pad4"
.LASF41:
	.string	"__pad5"
.LASF43:
	.string	"_unused2"
.LASF61:
	.string	"jend"
.LASF25:
	.string	"_IO_backup_base"
.LASF77:
	.string	"lont"
.LASF71:
	.string	"grad_x"
.LASF72:
	.string	"grad_y"
.LASF19:
	.string	"_IO_write_base"
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
