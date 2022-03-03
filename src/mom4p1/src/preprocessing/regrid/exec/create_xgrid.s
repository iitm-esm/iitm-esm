	.file	"create_xgrid.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.p2align 4,,15
.globl get_maxxgrid
	.type	get_maxxgrid, @function
get_maxxgrid:
.LFB21:
	.file 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/create_xgrid.c"
	.loc 1 48 0
	.cfi_startproc
	.loc 1 50 0
	movl	$10000000, %eax
	ret
	.cfi_endproc
.LFE21:
	.size	get_maxxgrid, .-get_maxxgrid
	.p2align 4,,15
.globl get_maxxgrid_
	.type	get_maxxgrid_, @function
get_maxxgrid_:
.LFB22:
	.loc 1 53 0
	.cfi_startproc
	.loc 1 55 0
	movl	$10000000, %eax
	ret
	.cfi_endproc
.LFE22:
	.size	get_maxxgrid_, .-get_maxxgrid_
	.p2align 4,,15
.globl clip
	.type	clip, @function
clip:
.LFB38:
	.loc 1 745 0
	.cfi_startproc
.LVL0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 750 0
	movslq	%edx, %rax
	subq	$1, %rax
	.loc 1 745 0
	subq	$680, %rsp
	.cfi_def_cfa_offset 696
	.loc 1 750 0
	movsd	(%rdi,%rax,8), %xmm7
.LVL1:
	.loc 1 751 0
	movsd	(%rsi,%rax,8), %xmm8
.LVL2:
	.loc 1 753 0
	xorl	%eax, %eax
.LVL3:
	testl	%edx, %edx
	jle	.L7
.LVL4:
	.loc 1 752 0
	xorl	%r9d, %r9d
	ucomisd	%xmm0, %xmm7
	setae	%r9b
	.loc 1 743 0
	subl	$1, %edx
.LVL5:
	leaq	8(,%rdx,8), %r10
	xorl	%edx, %edx
	jmp	.L12
.LVL6:
	.p2align 4,,10
	.p2align 3
.L8:
	.loc 1 757 0
	movslq	%eax, %r9
	.loc 1 758 0
	movapd	%xmm0, %xmm4
	.loc 1 757 0
	movsd	%xmm0, 280(%rsp,%r9,8)
	.loc 1 758 0
	addl	$1, %eax
	subsd	%xmm7, %xmm4
	movsd	(%rsi,%rdx), %xmm6
	movapd	%xmm6, %xmm9
	subsd	%xmm8, %xmm9
	mulsd	%xmm9, %xmm4
	movapd	%xmm5, %xmm9
	subsd	%xmm7, %xmm9
	divsd	%xmm9, %xmm4
	addsd	%xmm8, %xmm4
	movsd	%xmm4, -120(%rsp,%r9,8)
.LVL7:
.L9:
	.loc 1 762 0
	testl	%ebx, %ebx
	je	.L10
	.loc 1 763 0
	movslq	%eax, %r9
	.loc 1 764 0
	addl	$1, %eax
.LVL8:
	.loc 1 763 0
	movsd	%xmm5, 280(%rsp,%r9,8)
	.loc 1 764 0
	movsd	%xmm6, -120(%rsp,%r9,8)
.LVL9:
.L10:
	addq	$8, %rdx
	movl	%ebx, %r9d
	.loc 1 753 0
	cmpq	%r10, %rdx
	je	.L11
	movapd	%xmm6, %xmm8
	movapd	%xmm5, %xmm7
.LVL10:
.L12:
	.loc 1 756 0
	movsd	(%rdi,%rdx), %xmm5
	xorl	%ebx, %ebx
	ucomisd	%xmm0, %xmm5
	setae	%bl
.LVL11:
	cmpl	%r9d, %ebx
	jne	.L8
	movsd	(%rsi,%rdx), %xmm6
	jmp	.L9
.LVL12:
.L31:
	.loc 1 824 0
	movl	%edi, %eax
.LVL13:
.L7:
	.loc 1 842 0
	addq	$680, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.LVL14:
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	.loc 1 770 0
	testl	%eax, %eax
	je	.L7
	.loc 1 773 0
	leal	-1(%rax), %edx
	.loc 1 775 0
	xorl	%r10d, %r10d
	leaq	280(%rsp), %r11
	leaq	-120(%rsp), %rbx
.LVL15:
	.loc 1 773 0
	movslq	%edx, %rdx
	movsd	280(%rsp,%rdx,8), %xmm6
.LVL16:
	.loc 1 774 0
	movsd	-120(%rsp,%rdx,8), %xmm7
.LVL17:
	.loc 1 775 0
	ucomisd	%xmm6, %xmm2
	setae	%r10b
.LVL18:
	xorl	%edx, %edx
.LVL19:
	xorl	%edi, %edi
.LVL20:
	xorl	%r9d, %r9d
.LVL21:
	jmp	.L17
.LVL22:
	.p2align 4,,10
	.p2align 3
.L13:
	.loc 1 780 0
	movslq	%edi, %r10
.LVL23:
	.loc 1 781 0
	movapd	%xmm2, %xmm0
	.loc 1 780 0
	movsd	%xmm2, (%rcx,%r10,8)
	.loc 1 781 0
	addl	$1, %edi
	subsd	%xmm6, %xmm0
	movsd	(%rbx,%rdx), %xmm5
	movapd	%xmm5, %xmm8
	subsd	%xmm7, %xmm8
	mulsd	%xmm8, %xmm0
	movapd	%xmm4, %xmm8
	subsd	%xmm6, %xmm8
	divsd	%xmm8, %xmm0
	addsd	%xmm7, %xmm0
	movsd	%xmm0, (%r8,%r10,8)
.LVL24:
.L14:
	.loc 1 786 0
	testl	%esi, %esi
	je	.L15
	.loc 1 787 0
	movslq	%edi, %r10
	.loc 1 788 0
	addl	$1, %edi
.LVL25:
	.loc 1 787 0
	movsd	%xmm4, (%rcx,%r10,8)
	.loc 1 788 0
	movsd	%xmm5, (%r8,%r10,8)
.LVL26:
.L15:
	.loc 1 776 0
	addl	$1, %r9d
.LVL27:
	addq	$8, %rdx
	movl	%esi, %r10d
	cmpl	%eax, %r9d
	jge	.L16
	movapd	%xmm5, %xmm7
	movapd	%xmm4, %xmm6
.LVL28:
.L17:
	.loc 1 779 0
	movsd	(%r11,%rdx), %xmm4
	xorl	%esi, %esi
	ucomisd	%xmm4, %xmm2
	setae	%sil
.LVL29:
	cmpl	%r10d, %esi
	jne	.L13
	movsd	(%rbx,%rdx), %xmm5
	jmp	.L14
.LVL30:
	.p2align 4,,10
	.p2align 3
.L16:
	.loc 1 824 0
	xorl	%eax, %eax
	.loc 1 795 0
	testl	%edi, %edi
	je	.L7
	.loc 1 798 0
	movslq	%edi, %rdx
	.loc 1 800 0
	xorl	%r10d, %r10d
	.loc 1 798 0
	subq	$1, %rdx
	.loc 1 799 0
	movsd	(%r8,%rdx,8), %xmm5
.LVL31:
	.loc 1 798 0
	movsd	(%rcx,%rdx,8), %xmm6
.LVL32:
	.loc 1 800 0
	ucomisd	%xmm1, %xmm5
	setae	%r10b
.LVL33:
	xorl	%edx, %edx
.LVL34:
	xorl	%r9d, %r9d
	jmp	.L23
.LVL35:
	.p2align 4,,10
	.p2align 3
.L19:
	.loc 1 806 0
	movsd	(%rcx,%rdx), %xmm4
	.loc 1 805 0
	movslq	%eax, %r10
.LVL36:
	.loc 1 806 0
	movapd	%xmm1, %xmm0
	.loc 1 805 0
	movsd	%xmm1, -120(%rsp,%r10,8)
	.loc 1 806 0
	movapd	%xmm4, %xmm7
	addl	$1, %eax
	subsd	%xmm5, %xmm0
	movapd	%xmm2, %xmm9
	subsd	%xmm6, %xmm7
	subsd	%xmm5, %xmm9
	mulsd	%xmm7, %xmm0
	divsd	%xmm9, %xmm0
	addsd	%xmm6, %xmm0
	movsd	%xmm0, 280(%rsp,%r10,8)
.LVL37:
.L20:
	.loc 1 810 0
	testl	%esi, %esi
	je	.L21
	.loc 1 811 0
	movslq	%eax, %r10
	.loc 1 812 0
	addl	$1, %eax
.LVL38:
	.loc 1 811 0
	movsd	%xmm4, 280(%rsp,%r10,8)
	.loc 1 812 0
	movsd	%xmm2, -120(%rsp,%r10,8)
.LVL39:
.L21:
	.loc 1 801 0
	addl	$1, %r9d
.LVL40:
	addq	$8, %rdx
	movl	%esi, %r10d
	cmpl	%edi, %r9d
	jge	.L22
	movapd	%xmm2, %xmm5
	movapd	%xmm4, %xmm6
.LVL41:
.L23:
	.loc 1 804 0
	movsd	(%r8,%rdx), %xmm2
	xorl	%esi, %esi
.LVL42:
	ucomisd	%xmm1, %xmm2
	setae	%sil
.LVL43:
	cmpl	%r10d, %esi
	jne	.L19
	movsd	(%rcx,%rdx), %xmm4
	jmp	.L20
.LVL44:
	.p2align 4,,10
	.p2align 3
.L22:
	.loc 1 818 0
	testl	%eax, %eax
	je	.L7
	.loc 1 821 0
	leal	-1(%rax), %edx
	.loc 1 823 0
	xorl	%r10d, %r10d
	.loc 1 821 0
	movslq	%edx, %rdx
	.loc 1 822 0
	movsd	-120(%rsp,%rdx,8), %xmm4
.LVL45:
	.loc 1 821 0
	movsd	280(%rsp,%rdx,8), %xmm5
.LVL46:
	.loc 1 823 0
	ucomisd	%xmm4, %xmm3
	setae	%r10b
.LVL47:
	xorl	%edx, %edx
.LVL48:
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	jmp	.L28
.LVL49:
	.p2align 4,,10
	.p2align 3
.L24:
	.loc 1 829 0
	movsd	(%r11,%rdx), %xmm2
	.loc 1 828 0
	movslq	%edi, %r10
.LVL50:
	.loc 1 829 0
	movapd	%xmm3, %xmm0
	.loc 1 828 0
	movsd	%xmm3, (%r8,%r10,8)
	.loc 1 829 0
	movapd	%xmm2, %xmm6
	addl	$1, %edi
	subsd	%xmm4, %xmm0
	subsd	%xmm5, %xmm6
	mulsd	%xmm6, %xmm0
	movapd	%xmm1, %xmm6
	subsd	%xmm4, %xmm6
	divsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	movsd	%xmm0, (%rcx,%r10,8)
.LVL51:
.L25:
	.loc 1 833 0
	testl	%esi, %esi
	je	.L26
	.loc 1 834 0
	movslq	%edi, %r10
	.loc 1 835 0
	addl	$1, %edi
.LVL52:
	.loc 1 834 0
	movsd	%xmm2, (%rcx,%r10,8)
	.loc 1 835 0
	movsd	%xmm1, (%r8,%r10,8)
.LVL53:
.L26:
	.loc 1 824 0
	addl	$1, %r9d
.LVL54:
	addq	$8, %rdx
	movl	%esi, %r10d
	cmpl	%r9d, %eax
	jle	.L31
	movapd	%xmm1, %xmm4
	movapd	%xmm2, %xmm5
.LVL55:
.L28:
	.loc 1 827 0
	movsd	(%rbx,%rdx), %xmm1
	xorl	%esi, %esi
.LVL56:
	ucomisd	%xmm1, %xmm3
	setae	%sil
.LVL57:
	cmpl	%r10d, %esi
	jne	.L24
	movsd	(%r11,%rdx), %xmm2
	jmp	.L25
	.cfi_endproc
.LFE38:
	.size	clip, .-clip
	.p2align 4,,15
.globl inside_edge
	.type	inside_edge, @function
inside_edge:
.LFB46:
	.loc 1 1126 0
	.cfi_startproc
.LVL58:
	.loc 1 1126 0
	subsd	%xmm0, %xmm4
.LVL59:
	xorl	%eax, %eax
	subsd	%xmm1, %xmm3
.LVL60:
	subsd	%xmm2, %xmm0
.LVL61:
	subsd	%xmm1, %xmm5
.LVL62:
	mulsd	%xmm3, %xmm4
	mulsd	%xmm5, %xmm0
	addsd	%xmm0, %xmm4
.LVL63:
	movsd	.LC0(%rip), %xmm0
	ucomisd	%xmm4, %xmm0
	setae	%al
	.loc 1 1133 0
	ret
	.cfi_endproc
.LFE46:
	.size	inside_edge, .-inside_edge
	.p2align 4,,15
.globl dist_between_boxes
	.type	dist_between_boxes, @function
dist_between_boxes:
.LFB45:
	.loc 1 1101 0
	.cfi_startproc
.LVL64:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	.loc 1 1105 0
	xorl	%r12d, %r12d
	.loc 1 1101 0
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	.loc 1 1105 0
	xorl	%ebp, %ebp
	testl	%ecx, %ecx
	.loc 1 1101 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 1101 0
	movq	32(%rsp), %rbx
	movl	40(%rsp), %r11d
	.loc 1 1105 0
	jle	.L35
.LVL65:
	.p2align 4,,10
	.p2align 3
.L36:
	.loc 1 1106 0
	testl	%r11d, %r11d
	jle	.L40
	movsd	(%rdi,%rbp), %xmm6
	.loc 1 1105 0
	xorl	%eax, %eax
	movsd	(%rsi,%rbp), %xmm5
	xorl	%r10d, %r10d
	movsd	(%rdx,%rbp), %xmm0
.LVL66:
	.p2align 4,,10
	.p2align 3
.L38:
	.loc 1 1107 0
	movapd	%xmm6, %xmm1
	.loc 1 1106 0
	addl	$1, %r10d
	.loc 1 1107 0
	movapd	%xmm5, %xmm3
	subsd	(%r8,%rax), %xmm1
	movapd	%xmm0, %xmm2
	subsd	(%r9,%rax), %xmm3
	subsd	(%rbx,%rax), %xmm2
	.loc 1 1106 0
	addq	$8, %rax
	cmpl	%r10d, %r11d
	.loc 1 1107 0
	mulsd	%xmm1, %xmm1
	mulsd	%xmm3, %xmm3
	mulsd	%xmm2, %xmm2
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	maxsd	%xmm1, %xmm4
.LVL67:
	.loc 1 1106 0
	jg	.L38
.LVL68:
.L40:
	.loc 1 1105 0
	addl	$1, %r12d
.LVL69:
	addq	$8, %rbp
	cmpl	%r12d, %ecx
	jg	.L36
.LVL70:
.L35:
	.loc 1 1111 0
	sqrtsd	%xmm4, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L45
	je	.L41
.L45:
	movapd	%xmm4, %xmm0
	call	sqrt
.LVL71:
.L41:
	.loc 1 1114 0
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE45:
	.size	dist_between_boxes, .-dist_between_boxes
	.p2align 4,,15
.globl grid_box_radius
	.type	grid_box_radius, @function
grid_box_radius:
.LFB44:
	.loc 1 1076 0
	.cfi_startproc
.LVL72:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 1076 0
	leal	-1(%rcx), %ebx
	xorl	%r11d, %r11d
	addq	$8, %rdi
.LVL73:
	addq	$8, %rsi
.LVL74:
	addq	$8, %rdx
.LVL75:
	.loc 1 1081 0
	cmpl	%ebx, %r11d
	.loc 1 1076 0
	xorpd	%xmm4, %xmm4
.LVL76:
	.loc 1 1081 0
	jge	.L57
.LVL77:
	.p2align 4,,10
	.p2align 3
.L51:
	.loc 1 1082 0
	addl	$1, %r11d
.LVL78:
	cmpl	%r11d, %ecx
	jle	.L48
	movsd	-8(%rdi), %xmm6
	movq	%rdx, %r10
	movsd	-8(%rsi), %xmm5
	movq	%rsi, %r9
	movsd	-8(%rdx), %xmm0
	movq	%rdi, %r8
	movl	%r11d, %eax
.LVL79:
	.p2align 4,,10
	.p2align 3
.L50:
	.loc 1 1083 0
	movapd	%xmm6, %xmm1
	.loc 1 1082 0
	addl	$1, %eax
.LVL80:
	.loc 1 1083 0
	movapd	%xmm5, %xmm3
	subsd	(%r8), %xmm1
	movapd	%xmm0, %xmm2
	subsd	(%r9), %xmm3
	.loc 1 1082 0
	addq	$8, %r8
	addq	$8, %r9
	.loc 1 1083 0
	subsd	(%r10), %xmm2
	.loc 1 1082 0
	addq	$8, %r10
	cmpl	%eax, %ecx
	.loc 1 1083 0
	mulsd	%xmm1, %xmm1
	mulsd	%xmm3, %xmm3
	mulsd	%xmm2, %xmm2
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	maxsd	%xmm1, %xmm4
.LVL81:
	.loc 1 1082 0
	jg	.L50
.LVL82:
.L48:
	addq	$8, %rdi
	addq	$8, %rsi
	addq	$8, %rdx
	.loc 1 1081 0
	cmpl	%ebx, %r11d
	jl	.L51
.L57:
	.loc 1 1087 0
	sqrtsd	%xmm4, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L56
	je	.L52
.L56:
	movapd	%xmm4, %xmm0
	call	sqrt
.LVL83:
.L52:
	.loc 1 1091 0
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL84:
	.p2align 4,,3
	ret
	.cfi_endproc
.LFE44:
	.size	grid_box_radius, .-grid_box_radius
	.p2align 4,,15
.globl box_ctrlon
	.type	box_ctrlon, @function
box_ctrlon:
.LFB43:
	.loc 1 1023 0
	.cfi_startproc
.LVL85:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$184, %rsp
	.cfi_def_cfa_offset 224
	.loc 1 1023 0
	leaq	168(%rsp), %rbx
	leaq	160(%rsp), %rbp
	movsd	%xmm0, 136(%rsp)
	movapd	%xmm1, %xmm0
.LVL86:
	movsd	%xmm1, 16(%rsp)
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movsd	%xmm4, (%rsp)
	movsd	%xmm2, 144(%rsp)
	movsd	%xmm3, 152(%rsp)
	call	sincos
.LVL87:
	movsd	168(%rsp), %xmm8
.LVL88:
	.loc 1 1040 0
	movsd	144(%rsp), %xmm9
	.loc 1 1041 0
	mulsd	160(%rsp), %xmm8
	movsd	16(%rsp), %xmm1
	.loc 1 1040 0
	subsd	136(%rsp), %xmm9
.LVL89:
	.loc 1 1041 0
	movsd	.LC2(%rip), %xmm5
	.loc 1 1044 0
	movsd	(%rsp), %xmm4
	.loc 1 1041 0
	addsd	%xmm1, %xmm8
	.loc 1 1044 0
	movsd	.LC3(%rip), %xmm1
	ucomisd	%xmm1, %xmm9
	.loc 1 1041 0
	mulsd	%xmm5, %xmm8
.LVL90:
	.loc 1 1044 0
	jbe	.L59
	subsd	.LC4(%rip), %xmm9
.LVL91:
.L59:
	.loc 1 1045 0
	movsd	.LC5(%rip), %xmm2
	ucomisd	%xmm9, %xmm2
	jbe	.L61
	addsd	.LC4(%rip), %xmm9
.LVL92:
.L61:
	.loc 1 1047 0
	movsd	144(%rsp), %xmm3
	subsd	%xmm4, %xmm3
.LVL93:
	.loc 1 1048 0
	ucomisd	%xmm1, %xmm3
	seta	%r12b
	ja	.L63
	movapd	%xmm3, %xmm0
.LVL94:
.L64:
	.loc 1 1049 0
	ucomisd	%xmm0, %xmm2
	jbe	.L65
	addsd	.LC4(%rip), %xmm0
.LVL95:
.L65:
	.loc 1 1050 0
	movsd	136(%rsp), %xmm6
	subsd	%xmm4, %xmm6
	.loc 1 1051 0
	ucomisd	%xmm1, %xmm6
	.loc 1 1050 0
	movapd	%xmm6, %xmm4
.LVL96:
	.loc 1 1051 0
	seta	%r13b
	ja	.L67
	movapd	%xmm6, %xmm10
.LVL97:
.L68:
	.loc 1 1052 0
	ucomisd	%xmm10, %xmm2
	jbe	.L69
	addsd	.LC4(%rip), %xmm10
.LVL98:
.L69:
	.loc 1 1054 0
	movapd	%xmm10, %xmm6
	subsd	%xmm0, %xmm6
	cvttsd2si	%xmm6, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2sd	%eax, %xmm6
	ucomisd	%xmm6, %xmm1
	ja	.L71
	.loc 1 1058 0
	xorpd	%xmm7, %xmm7
	ucomisd	%xmm7, %xmm0
	ja	.L72
	movsd	.LC6(%rip), %xmm14
	movapd	%xmm2, %xmm13
.L73:
.LVL99:
	.loc 1 1063 0
	movapd	%xmm0, %xmm11
	movapd	%xmm0, %xmm6
	cvttsd2si	%xmm9, %eax
	mulsd	%xmm5, %xmm11
	movapd	%xmm10, %xmm12
	subsd	%xmm13, %xmm6
	movapd	%xmm10, %xmm15
	addsd	%xmm0, %xmm10
.LVL100:
	addsd	%xmm13, %xmm15
	subsd	%xmm0, %xmm13
.LVL101:
	mulsd	%xmm6, %xmm11
	movsd	.LC8(%rip), %xmm6
	mulsd	%xmm14, %xmm10
	mulsd	%xmm6, %xmm12
.LVL102:
	mulsd	%xmm8, %xmm11
	movl	%eax, %edx
	sarl	$31, %edx
	mulsd	%xmm15, %xmm12
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2sd	%eax, %xmm0
.LVL103:
	mulsd	%xmm8, %xmm12
	addsd	%xmm12, %xmm11
	movapd	%xmm8, %xmm12
	subsd	%xmm8, %xmm12
	mulsd	%xmm13, %xmm12
	divsd	%xmm0, %xmm12
	movapd	%xmm7, %xmm0
	addsd	%xmm8, %xmm12
	mulsd	%xmm12, %xmm10
	addsd	%xmm10, %xmm11
	subsd	%xmm11, %xmm0
	movapd	%xmm0, %xmm11
.LVL104:
	jmp	.L74
.LVL105:
	.p2align 4,,10
	.p2align 3
.L67:
	.loc 1 1051 0
	movapd	%xmm6, %xmm10
	subsd	.LC4(%rip), %xmm10
.LVL106:
	jmp	.L68
.LVL107:
	.p2align 4,,10
	.p2align 3
.L63:
	.loc 1 1048 0
	movapd	%xmm3, %xmm0
	subsd	.LC4(%rip), %xmm0
.LVL108:
	jmp	.L64
.LVL109:
	.p2align 4,,10
	.p2align 3
.L71:
	.loc 1 1055 0
	movapd	%xmm0, %xmm11
	movsd	.LC8(%rip), %xmm6
	mulsd	%xmm8, %xmm11
	mulsd	%xmm10, %xmm8
.LVL110:
	xorpd	%xmm7, %xmm7
	addsd	%xmm8, %xmm11
	mulsd	%xmm9, %xmm11
	mulsd	%xmm6, %xmm11
	addsd	%xmm7, %xmm11
.LVL111:
.L74:
	movsd	152(%rsp), %xmm0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm2, 48(%rsp)
	movsd	%xmm3, 96(%rsp)
	movsd	%xmm4, (%rsp)
	movsd	%xmm5, 64(%rsp)
	movsd	%xmm6, 32(%rsp)
	movsd	%xmm7, 80(%rsp)
	movsd	%xmm11, 112(%rsp)
	call	sincos
.LVL112:
	movsd	168(%rsp), %xmm8
.LVL113:
	.loc 1 1040 0
	movsd	136(%rsp), %xmm9
	.loc 1 1041 0
	mulsd	160(%rsp), %xmm8
	.loc 1 1040 0
	subsd	144(%rsp), %xmm9
.LVL114:
	.loc 1 1041 0
	movsd	64(%rsp), %xmm5
	.loc 1 1044 0
	movsd	16(%rsp), %xmm1
	movsd	48(%rsp), %xmm2
	movsd	96(%rsp), %xmm3
	movsd	(%rsp), %xmm4
	.loc 1 1041 0
	addsd	152(%rsp), %xmm8
	.loc 1 1044 0
	movsd	32(%rsp), %xmm6
	ucomisd	%xmm1, %xmm9
	movsd	80(%rsp), %xmm7
	movsd	112(%rsp), %xmm11
	.loc 1 1041 0
	mulsd	%xmm5, %xmm8
.LVL115:
	.loc 1 1044 0
	jbe	.L75
	subsd	.LC4(%rip), %xmm9
.LVL116:
.L75:
	.loc 1 1045 0
	ucomisd	%xmm9, %xmm2
	jbe	.L77
	addsd	.LC4(%rip), %xmm9
.LVL117:
.L77:
	.loc 1 1048 0
	testb	%r13b, %r13b
	movapd	%xmm4, %xmm0
	je	.L80
	subsd	.LC4(%rip), %xmm0
.LVL118:
.L80:
	.loc 1 1049 0
	ucomisd	%xmm0, %xmm2
	jbe	.L81
	addsd	.LC4(%rip), %xmm0
.LVL119:
.L81:
	.loc 1 1051 0
	testb	%r12b, %r12b
	movapd	%xmm3, %xmm4
	je	.L84
	subsd	.LC4(%rip), %xmm4
.LVL120:
.L84:
	.loc 1 1052 0
	ucomisd	%xmm4, %xmm2
	jbe	.L85
	addsd	.LC4(%rip), %xmm4
.LVL121:
.L85:
	.loc 1 1054 0
	movapd	%xmm4, %xmm3
	subsd	%xmm0, %xmm3
	cvttsd2si	%xmm3, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2sd	%eax, %xmm3
	ucomisd	%xmm3, %xmm1
	jbe	.L102
	.loc 1 1055 0
	mulsd	%xmm8, %xmm0
.LVL122:
	mulsd	%xmm4, %xmm8
.LVL123:
	addsd	%xmm8, %xmm0
	mulsd	%xmm9, %xmm0
	mulsd	%xmm6, %xmm0
	addsd	%xmm11, %xmm0
.LVL124:
.L89:
	.loc 1 1063 0
	movsd	.LC9(%rip), %xmm1
	.loc 1 1068 0
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	.loc 1 1063 0
	mulsd	%xmm1, %xmm0
.LVL125:
	.loc 1 1068 0
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	.loc 1 1063 0
	mulsd	%xmm1, %xmm0
	.loc 1 1068 0
	ret
.LVL126:
	.p2align 4,,10
	.p2align 3
.L102:
	.cfi_restore_state
	.loc 1 1058 0
	ucomisd	%xmm7, %xmm0
	ja	.L90
	movsd	.LC6(%rip), %xmm3
	movapd	%xmm2, %xmm1
.L91:
.LVL127:
	.loc 1 1063 0
	cvttsd2si	%xmm9, %eax
	mulsd	%xmm0, %xmm5
	movapd	%xmm0, %xmm2
	mulsd	%xmm4, %xmm6
	subsd	%xmm1, %xmm2
	mulsd	%xmm2, %xmm5
	movapd	%xmm4, %xmm2
	addsd	%xmm0, %xmm4
.LVL128:
	addsd	%xmm1, %xmm2
.LVL129:
	subsd	%xmm0, %xmm1
.LVL130:
	movl	%eax, %edx
	mulsd	%xmm8, %xmm5
	sarl	$31, %edx
	mulsd	%xmm3, %xmm4
	xorl	%edx, %eax
	movapd	%xmm8, %xmm3
	subl	%edx, %eax
	mulsd	%xmm2, %xmm6
	cvtsi2sd	%eax, %xmm0
.LVL131:
	subsd	%xmm8, %xmm3
	mulsd	%xmm8, %xmm6
	mulsd	%xmm1, %xmm3
	addsd	%xmm6, %xmm5
	divsd	%xmm0, %xmm3
	movapd	%xmm11, %xmm0
	addsd	%xmm8, %xmm3
	mulsd	%xmm3, %xmm4
	addsd	%xmm4, %xmm5
	subsd	%xmm5, %xmm0
.LVL132:
	jmp	.L89
.LVL133:
	.p2align 4,,10
	.p2align 3
.L90:
	.loc 1 1058 0
	movsd	.LC7(%rip), %xmm3
	jmp	.L91
.LVL134:
	.p2align 4,,10
	.p2align 3
.L72:
	movsd	.LC7(%rip), %xmm14
	movapd	%xmm1, %xmm13
	jmp	.L73
	.cfi_endproc
.LFE43:
	.size	box_ctrlon, .-box_ctrlon
	.p2align 4,,15
.globl box_ctrlat
	.type	box_ctrlat, @function
box_ctrlat:
.LFB42:
	.loc 1 1008 0
	.cfi_startproc
.LVL135:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	.loc 1 1009 0
	subsd	%xmm0, %xmm2
.LVL136:
	.loc 1 1008 0
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$88, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 1012 0
	ucomisd	.LC3(%rip), %xmm2
	.loc 1 1008 0
	movsd	%xmm3, 40(%rsp)
	.loc 1 1012 0
	jbe	.L104
	subsd	.LC4(%rip), %xmm2
.LVL137:
.L104:
	.loc 1 1013 0
	ucomisd	.LC5(%rip), %xmm2
	jae	.L106
	jp	.L106
	addsd	.LC4(%rip), %xmm2
.LVL138:
.L106:
	leaq	72(%rsp), %rbx
	leaq	64(%rsp), %rbp
	movsd	%xmm1, (%rsp)
	movapd	%xmm1, %xmm0
.LVL139:
	movsd	%xmm2, 16(%rsp)
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	sincos
.LVL140:
	movsd	64(%rsp), %xmm0
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movsd	%xmm0, 48(%rsp)
	movsd	72(%rsp), %xmm0
	movsd	%xmm0, 56(%rsp)
	movsd	40(%rsp), %xmm0
	call	sincos
.LVL141:
	movsd	40(%rsp), %xmm0
	movsd	(%rsp), %xmm1
	mulsd	72(%rsp), %xmm0
	mulsd	56(%rsp), %xmm1
	movsd	16(%rsp), %xmm2
	addsd	64(%rsp), %xmm0
	addsd	48(%rsp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	.LC9(%rip), %xmm1
	.loc 1 1016 0
	addq	$88, %rsp
	.cfi_def_cfa_offset 24
.LVL142:
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL143:
	popq	%rbp
	.cfi_def_cfa_offset 8
.LVL144:
	.loc 1 1013 0
	mulsd	%xmm2, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	.loc 1 1016 0
	ret
	.cfi_endproc
.LFE42:
	.size	box_ctrlat, .-box_ctrlat
	.p2align 4,,15
.globl poly_ctrlon
	.type	poly_ctrlon, @function
poly_ctrlon:
.LFB41:
	.loc 1 955 0
	.cfi_startproc
.LVL145:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	.loc 1 960 0
	xorpd	%xmm9, %xmm9
	.loc 1 955 0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
.LVL146:
	.loc 1 960 0
	testl	%edx, %edx
	.loc 1 955 0
	movsd	%xmm0, 152(%rsp)
	.loc 1 960 0
	jle	.L113
	xorpd	%xmm7, %xmm7
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
.LBB8:
	.loc 1 970 0
	leaq	176(%rsp), %r15
	.loc 1 972 0
	movsd	.LC2(%rip), %xmm8
.LBE8:
	.loc 1 960 0
	movapd	%xmm7, %xmm9
.LBB9:
	.loc 1 977 0
	movsd	.LC3(%rip), %xmm4
	.loc 1 978 0
	movsd	.LC5(%rip), %xmm6
	jmp	.L131
.LVL147:
	.p2align 4,,10
	.p2align 3
.L144:
	.loc 1 987 0
	mulsd	%xmm3, %xmm0
.LVL148:
	mulsd	%xmm2, %xmm10
.LVL149:
	addsd	%xmm10, %xmm0
	mulsd	%xmm1, %xmm0
	mulsd	.LC8(%rip), %xmm0
	addsd	%xmm0, %xmm9
.LVL150:
.L114:
	.loc 1 995 0
	addq	$8, %rbp
.LBE9:
	.loc 1 960 0
	cmpl	%r12d, %ebx
	je	.L113
.LVL151:
.L131:
.LBB10:
	.loc 1 961 0
	addl	$1, %ebx
.LVL152:
	.loc 1 965 0
	movsd	0(%r13,%rbp), %xmm2
	.loc 1 964 0
	movl	%ebx, %edx
	movl	%ebx, %eax
	sarl	$31, %edx
	.loc 1 967 0
	movsd	(%r14,%rbp), %xmm5
	.loc 1 964 0
	idivl	%r12d
	movslq	%edx, %rdx
	movsd	0(%r13,%rdx,8), %xmm3
.LVL153:
	.loc 1 966 0
	movsd	(%r14,%rdx,8), %xmm0
	.loc 1 968 0
	movapd	%xmm3, %xmm1
	.loc 1 966 0
	movsd	%xmm0, 144(%rsp)
.LVL154:
	.loc 1 968 0
	subsd	%xmm2, %xmm1
.LVL155:
	.loc 1 970 0
	ucomisd	%xmm7, %xmm1
	jp	.L143
	je	.L114
.L143:
	movapd	%xmm5, %xmm0
	leaq	184(%rsp), %rdi
	movq	%r15, %rsi
	movsd	%xmm1, 112(%rsp)
	movsd	%xmm2, 96(%rsp)
	movsd	%xmm3, 80(%rsp)
	movsd	%xmm4, 32(%rsp)
	movsd	%xmm5, 128(%rsp)
	movsd	%xmm6, 16(%rsp)
	movsd	%xmm7, 64(%rsp)
	movsd	%xmm8, 48(%rsp)
	movsd	%xmm9, (%rsp)
	call	sincos
.LVL156:
	movsd	176(%rsp), %xmm0
	leaq	184(%rsp), %rdi
	movq	%r15, %rsi
	movsd	%xmm0, 160(%rsp)
	movsd	184(%rsp), %xmm0
	movsd	%xmm0, 168(%rsp)
	movsd	144(%rsp), %xmm0
	call	sincos
	movsd	184(%rsp), %xmm0
	.loc 1 973 0
	movsd	160(%rsp), %xmm10
	.loc 1 972 0
	mulsd	176(%rsp), %xmm0
	.loc 1 973 0
	mulsd	168(%rsp), %xmm10
	movsd	128(%rsp), %xmm5
	.loc 1 972 0
	movsd	48(%rsp), %xmm8
	.loc 1 977 0
	movsd	112(%rsp), %xmm1
	movsd	32(%rsp), %xmm4
	.loc 1 972 0
	addsd	144(%rsp), %xmm0
	.loc 1 977 0
	movsd	96(%rsp), %xmm2
	.loc 1 973 0
	addsd	%xmm5, %xmm10
	.loc 1 977 0
	ucomisd	%xmm4, %xmm1
	movsd	80(%rsp), %xmm3
	movsd	16(%rsp), %xmm6
	movsd	64(%rsp), %xmm7
	movsd	(%rsp), %xmm9
	.loc 1 973 0
	mulsd	%xmm8, %xmm10
	.loc 1 972 0
	mulsd	%xmm8, %xmm0
.LVL157:
	.loc 1 977 0
	jbe	.L115
	subsd	.LC4(%rip), %xmm1
.LVL158:
.L115:
	.loc 1 978 0
	ucomisd	%xmm1, %xmm6
	jbe	.L117
	addsd	.LC4(%rip), %xmm1
.LVL159:
.L117:
	.loc 1 979 0
	subsd	152(%rsp), %xmm3
.LVL160:
	.loc 1 980 0
	ucomisd	%xmm4, %xmm3
	jbe	.L119
	subsd	.LC4(%rip), %xmm3
.LVL161:
.L119:
	.loc 1 981 0
	ucomisd	%xmm3, %xmm6
	jbe	.L121
	addsd	.LC4(%rip), %xmm3
.LVL162:
.L121:
	.loc 1 982 0
	subsd	152(%rsp), %xmm2
.LVL163:
	.loc 1 983 0
	ucomisd	%xmm4, %xmm2
	jbe	.L123
	subsd	.LC4(%rip), %xmm2
.LVL164:
.L123:
	.loc 1 984 0
	ucomisd	%xmm2, %xmm6
	jbe	.L125
	addsd	.LC4(%rip), %xmm2
.LVL165:
.L125:
	.loc 1 986 0
	movapd	%xmm2, %xmm5
	subsd	%xmm3, %xmm5
	cvttsd2si	%xmm5, %eax
	movl	%eax, %edx
	sarl	$31, %edx
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2sd	%eax, %xmm5
	ucomisd	%xmm5, %xmm4
	ja	.L144
	.loc 1 990 0
	movsd	.LC7(%rip), %xmm13
	ucomisd	%xmm7, %xmm3
	movapd	%xmm4, %xmm12
	ja	.L130
	movsd	.LC6(%rip), %xmm13
	movapd	%xmm6, %xmm12
.L130:
.LVL166:
	.loc 1 995 0
	cvttsd2si	%xmm1, %eax
	addq	$8, %rbp
	movapd	%xmm3, %xmm5
	movapd	%xmm3, %xmm11
	movapd	%xmm2, %xmm14
	mulsd	%xmm8, %xmm5
	subsd	%xmm12, %xmm11
	addsd	%xmm12, %xmm14
	subsd	%xmm3, %xmm12
.LVL167:
	mulsd	%xmm11, %xmm5
	movsd	.LC8(%rip), %xmm11
	mulsd	%xmm2, %xmm11
	movl	%eax, %edx
	addsd	%xmm3, %xmm2
.LVL168:
	sarl	$31, %edx
	mulsd	%xmm0, %xmm5
	xorl	%edx, %eax
	subl	%edx, %eax
.LBE10:
	.loc 1 960 0
	cmpl	%r12d, %ebx
.LBB11:
	.loc 1 995 0
	mulsd	%xmm14, %xmm11
	cvtsi2sd	%eax, %xmm1
.LVL169:
	mulsd	%xmm13, %xmm2
	mulsd	%xmm10, %xmm11
	subsd	%xmm0, %xmm10
.LVL170:
	mulsd	%xmm12, %xmm10
	addsd	%xmm11, %xmm5
	divsd	%xmm1, %xmm10
	addsd	%xmm0, %xmm10
	mulsd	%xmm10, %xmm2
	addsd	%xmm2, %xmm5
	subsd	%xmm5, %xmm9
.LVL171:
.LBE11:
	.loc 1 960 0
	jne	.L131
.LVL172:
.L113:
	movsd	.LC9(%rip), %xmm1
	.loc 1 1001 0
	addq	$200, %rsp
	.cfi_def_cfa_offset 56
	.loc 1 960 0
	movapd	%xmm9, %xmm0
	.loc 1 1001 0
	popq	%rbx
	.cfi_def_cfa_offset 48
	.loc 1 960 0
	mulsd	%xmm1, %xmm0
	.loc 1 1001 0
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL173:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL174:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL175:
	.loc 1 960 0
	mulsd	%xmm1, %xmm0
	.loc 1 1001 0
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	poly_ctrlon, .-poly_ctrlon
	.p2align 4,,15
.globl poly_ctrlat
	.type	poly_ctrlat, @function
poly_ctrlat:
.LFB40:
	.loc 1 924 0
	.cfi_startproc
.LVL176:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	.loc 1 928 0
	xorpd	%xmm5, %xmm5
	.loc 1 924 0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.loc 1 928 0
	testl	%edx, %edx
	jle	.L147
	xorpd	%xmm6, %xmm6
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
.LBB12:
	.loc 1 943 0
	leaq	128(%rsp), %r15
.LBE12:
	.loc 1 928 0
	movapd	%xmm6, %xmm5
	jmp	.L155
.LVL177:
	.p2align 4,,10
	.p2align 3
.L164:
.LBB13:
	.loc 1 943 0
	movapd	%xmm7, %xmm0
	movsd	%xmm1, 32(%rsp)
	movsd	%xmm2, 48(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm6, (%rsp)
	movsd	%xmm4, 80(%rsp)
	movsd	%xmm7, 96(%rsp)
	call	cos
.LVL178:
	movsd	96(%rsp), %xmm7
	movapd	%xmm0, %xmm3
	movapd	%xmm7, %xmm0
	movsd	%xmm3, 64(%rsp)
	call	sin
	movsd	80(%rsp), %xmm4
.LVL179:
	movsd	%xmm0, 120(%rsp)
	movapd	%xmm4, %xmm0
	call	cos
.LVL180:
	movsd	48(%rsp), %xmm2
.LVL181:
	movsd	64(%rsp), %xmm3
	mulsd	120(%rsp), %xmm2
.LVL182:
	addsd	%xmm3, %xmm3
	movsd	32(%rsp), %xmm1
.LVL183:
	movsd	16(%rsp), %xmm5
	movsd	(%rsp), %xmm6
	addsd	%xmm2, %xmm3
	subsd	%xmm0, %xmm3
	mulsd	%xmm1, %xmm3
	subsd	%xmm3, %xmm5
.LVL184:
.L148:
	.loc 1 945 0
	addq	$8, %rbp
.LBE13:
	.loc 1 928 0
	cmpl	%r12d, %ebx
	je	.L147
.LVL185:
.L155:
.LBB14:
	.loc 1 929 0
	addl	$1, %ebx
.LVL186:
	.loc 1 934 0
	movsd	(%r14,%rbp), %xmm2
	.loc 1 930 0
	movl	%ebx, %edx
	movl	%ebx, %eax
	sarl	$31, %edx
	idivl	%r12d
	movslq	%edx, %rdx
	movsd	0(%r13,%rdx,8), %xmm1
	.loc 1 933 0
	movsd	(%r14,%rdx,8), %xmm4
	.loc 1 930 0
	subsd	0(%r13,%rbp), %xmm1
.LVL187:
	.loc 1 938 0
	ucomisd	%xmm6, %xmm1
	jp	.L163
	je	.L148
.L163:
	.loc 1 939 0
	ucomisd	.LC3(%rip), %xmm1
	jbe	.L149
	subsd	.LC4(%rip), %xmm1
.LVL188:
.L149:
	.loc 1 940 0
	movsd	.LC5(%rip), %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.L151
	addsd	.LC4(%rip), %xmm1
.LVL189:
.L151:
	.loc 1 936 0
	movapd	%xmm2, %xmm3
	.loc 1 937 0
	movapd	%xmm4, %xmm7
	.loc 1 942 0
	movsd	.LC11(%rip), %xmm8
	.loc 1 936 0
	subsd	%xmm4, %xmm3
	.loc 1 937 0
	addsd	%xmm2, %xmm7
	.loc 1 936 0
	mulsd	.LC2(%rip), %xmm3
	.loc 1 937 0
	mulsd	.LC2(%rip), %xmm7
	.loc 1 942 0
	movapd	%xmm3, %xmm0
	andpd	.LC10(%rip), %xmm0
	ucomisd	%xmm0, %xmm8
	ja	.L164
	.loc 1 943 0
	movapd	%xmm7, %xmm0
	leaq	136(%rsp), %rdi
	movq	%r15, %rsi
	movsd	%xmm1, 32(%rsp)
	.loc 1 945 0
	addq	$8, %rbp
.LVL190:
	.loc 1 943 0
	movsd	%xmm2, 48(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm6, (%rsp)
	movsd	%xmm4, 80(%rsp)
	movsd	%xmm3, 64(%rsp)
	call	sincos
.LVL191:
	.loc 1 945 0
	movsd	64(%rsp), %xmm3
	movapd	%xmm3, %xmm0
	call	sin
	movsd	80(%rsp), %xmm4
	movapd	%xmm0, %xmm7
	movapd	%xmm4, %xmm0
	movsd	%xmm7, 96(%rsp)
	call	cos
	movsd	64(%rsp), %xmm3
.LBE14:
	.loc 1 928 0
	cmpl	%r12d, %ebx
.LBB15:
	.loc 1 945 0
	movsd	96(%rsp), %xmm7
	movsd	48(%rsp), %xmm2
	divsd	%xmm3, %xmm7
	mulsd	136(%rsp), %xmm2
	movsd	128(%rsp), %xmm3
	movsd	32(%rsp), %xmm1
	addsd	%xmm3, %xmm3
	movsd	16(%rsp), %xmm5
	movsd	(%rsp), %xmm6
	addsd	%xmm2, %xmm3
	mulsd	%xmm3, %xmm7
	subsd	%xmm0, %xmm7
	mulsd	%xmm1, %xmm7
	subsd	%xmm7, %xmm5
.LVL192:
.LBE15:
	.loc 1 928 0
	jne	.L155
.LVL193:
.L147:
	movsd	.LC9(%rip), %xmm1
	.loc 1 948 0
	addq	$152, %rsp
	.cfi_def_cfa_offset 56
	.loc 1 928 0
	movapd	%xmm5, %xmm0
	.loc 1 948 0
	popq	%rbx
	.cfi_def_cfa_offset 48
	.loc 1 928 0
	mulsd	%xmm1, %xmm0
	.loc 1 948 0
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL194:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL195:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL196:
	.loc 1 928 0
	mulsd	%xmm1, %xmm0
	.loc 1 948 0
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	poly_ctrlat, .-poly_ctrlat
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"the line between <x1_0,y1_0> and  <x1_1,y1_1> should not parallel to the line between <x2_0,y2_0> and  <x2_1,y2_1>"
	.text
	.p2align 4,,15
.globl clip_2dx2d
	.type	clip_2dx2d, @function
clip_2dx2d:
.LFB39:
	.loc 1 853 0
	.cfi_startproc
.LVL197:
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
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	subq	$1128, %rsp
	.cfi_def_cfa_offset 1184
	.loc 1 862 0
	testl	%edx, %edx
	.loc 1 853 0
	movl	%r9d, 316(%rsp)
	movq	1184(%rsp), %rcx
.LVL198:
	movq	1192(%rsp), %r8
.LVL199:
	.loc 1 862 0
	jle	.L166
.LVL200:
	movl	%edx, %r10d
	shrl	%r10d
	cmpl	$1, %edx
	leal	(%r10,%r10), %r13d
	jbe	.L183
	testl	%r13d, %r13d
	je	.L183
	leaq	720(%rsp), %r12
	leaq	320(%rsp), %r11
	xorl	%eax, %eax
	xorl	%r9d, %r9d
.LVL201:
	.p2align 4,,10
	.p2align 3
.L170:
	.loc 1 863 0
	movsd	(%rdi,%rax), %xmm1
	.loc 1 864 0
	addl	$1, %r9d
	.loc 1 863 0
	movhpd	8(%rdi,%rax), %xmm1
	movapd	%xmm1, (%r12,%rax)
	.loc 1 864 0
	movsd	(%rsi,%rax), %xmm1
	movhpd	8(%rsi,%rax), %xmm1
	movapd	%xmm1, (%r11,%rax)
	addq	$16, %rax
	cmpl	%r10d, %r9d
	jb	.L170
	cmpl	%edx, %r13d
	movl	%r13d, %eax
	je	.L166
.L169:
	.loc 1 850 0
	movslq	%eax, %r9
	leaq	0(,%r9,8), %r10
	addq	%r10, %rdi
.LVL202:
	addq	%r10, %rsi
.LVL203:
	jmp	.L171
.LVL204:
	.p2align 4,,10
	.p2align 3
.L191:
	movslq	%eax, %r9
.LVL205:
.L171:
	.loc 1 863 0
	movq	(%rdi), %r10
	.loc 1 862 0
	addl	$1, %eax
.LVL206:
	addq	$8, %rdi
	.loc 1 863 0
	movq	%r10, 720(%rsp,%r9,8)
	.loc 1 864 0
	movq	(%rsi), %r10
	.loc 1 862 0
	addq	$8, %rsi
	cmpl	%eax, %edx
	.loc 1 864 0
	movq	%r10, 320(%rsp,%r9,8)
	.loc 1 862 0
	jg	.L191
.LVL207:
.L166:
	.loc 1 866 0
	movslq	316(%rsp), %rax
	.loc 1 868 0
	movl	316(%rsp), %esi
	.loc 1 866 0
	subq	$1, %rax
	.loc 1 868 0
	testl	%esi, %esi
	.loc 1 866 0
	movsd	(%rbx,%rax,8), %xmm5
.LVL208:
	.loc 1 867 0
	movsd	0(%rbp,%rax,8), %xmm10
.LVL209:
	.loc 1 868 0
	movl	%edx, %eax
.LVL210:
	jle	.L173
	movl	%edx, %esi
.LBB16:
.LBB17:
	.loc 1 1131 0
	movsd	.LC0(%rip), %xmm14
	leaq	720(%rsp), %rdx
.LVL211:
	leaq	320(%rsp), %rax
.LVL212:
.LBE17:
.LBE16:
	.loc 1 868 0
	movq	$0, 304(%rsp)
	.loc 1 888 0
	movsd	.LC12(%rip), %xmm15
	.loc 1 868 0
	movl	$0, 312(%rsp)
.LVL213:
	.p2align 4,,10
	.p2align 3
.L181:
	.loc 1 869 0
	movq	304(%rsp), %rdi
	.loc 1 874 0
	testl	%esi, %esi
	.loc 1 870 0
	movsd	0(%rbp,%rdi), %xmm0
	.loc 1 869 0
	movsd	(%rbx,%rdi), %xmm11
.LVL214:
	.loc 1 871 0
	leal	-1(%rsi), %edi
	.loc 1 870 0
	movsd	%xmm0, 296(%rsp)
.LVL215:
	.loc 1 871 0
	movslq	%edi, %rdi
	movsd	720(%rsp,%rdi,8), %xmm3
.LVL216:
	.loc 1 872 0
	movsd	320(%rsp,%rdi,8), %xmm4
.LVL217:
	.loc 1 874 0
	jle	.L174
.LBB19:
.LBB18:
	.loc 1 1130 0
	movapd	%xmm0, %xmm6
	.loc 1 1131 0
	xorl	%edi, %edi
.LVL218:
	.loc 1 1130 0
	movapd	%xmm5, %xmm13
	.loc 1 1131 0
	movapd	%xmm3, %xmm0
	movapd	%xmm4, %xmm1
	.loc 1 1130 0
	subsd	%xmm10, %xmm6
	subsd	%xmm11, %xmm13
	.loc 1 1131 0
	subsd	%xmm5, %xmm0
	subsd	%xmm10, %xmm1
	mulsd	%xmm6, %xmm0
	mulsd	%xmm13, %xmm1
	addsd	%xmm1, %xmm0
	ucomisd	%xmm0, %xmm14
	setae	%dil
	xorl	%r13d, %r13d
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	jmp	.L179
.LVL219:
	.p2align 4,,10
	.p2align 3
.L176:
.LBE18:
.LBE19:
	.loc 1 892 0
	mulsd	%xmm4, %xmm9
	movslq	%r12d, %rdi
	.loc 1 893 0
	addl	$1, %r12d
	.loc 1 892 0
	mulsd	%xmm3, %xmm8
	.loc 1 893 0
	mulsd	%xmm6, %xmm4
	mulsd	%xmm7, %xmm3
	.loc 1 892 0
	subsd	%xmm8, %xmm9
	.loc 1 893 0
	subsd	%xmm3, %xmm4
	.loc 1 892 0
	divsd	%xmm2, %xmm9
	.loc 1 893 0
	divsd	%xmm2, %xmm4
	.loc 1 892 0
	movsd	%xmm9, (%rcx,%rdi,8)
	.loc 1 893 0
	movsd	%xmm4, (%r8,%rdi,8)
.LVL220:
.L175:
	.loc 1 897 0
	testl	%r14d, %r14d
	je	.L178
	.loc 1 898 0
	movslq	%r12d, %rdi
	.loc 1 899 0
	addl	$1, %r12d
.LVL221:
	.loc 1 898 0
	movsd	%xmm1, (%rcx,%rdi,8)
	.loc 1 899 0
	movsd	%xmm0, (%r8,%rdi,8)
.LVL222:
.L178:
	.loc 1 874 0
	addl	$1, %r15d
.LVL223:
	addq	$8, %r13
	movl	%r14d, %edi
	cmpl	%r15d, %esi
	movapd	%xmm1, %xmm3
	movapd	%xmm0, %xmm4
	jle	.L192
.LVL224:
.L179:
	.loc 1 875 0
	movsd	(%rdx,%r13), %xmm1
.LVL225:
.LBB20:
.LBB21:
	.loc 1 1131 0
	xorl	%r14d, %r14d
.LBE21:
.LBE20:
	.loc 1 876 0
	movsd	(%rax,%r13), %xmm0
.LVL226:
.LBB23:
.LBB22:
	.loc 1 1131 0
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm7
	subsd	%xmm5, %xmm2
	subsd	%xmm10, %xmm7
	mulsd	%xmm6, %xmm2
	mulsd	%xmm13, %xmm7
	addsd	%xmm7, %xmm2
	ucomisd	%xmm2, %xmm14
	setae	%r14b
.LVL227:
.LBE22:
.LBE23:
	.loc 1 877 0
	cmpl	%r14d, %edi
	je	.L175
	.loc 1 881 0
	movapd	%xmm0, %xmm7
	.loc 1 883 0
	movapd	%xmm1, %xmm8
	.loc 1 886 0
	movsd	296(%rsp), %xmm2
	.loc 1 881 0
	subsd	%xmm4, %xmm7
.LVL228:
	.loc 1 885 0
	mulsd	%xmm1, %xmm4
.LVL229:
	.loc 1 883 0
	subsd	%xmm3, %xmm8
.LVL230:
	.loc 1 885 0
	mulsd	%xmm0, %xmm3
.LVL231:
	.loc 1 886 0
	mulsd	%xmm5, %xmm2
	.loc 1 884 0
	movapd	%xmm11, %xmm9
	subsd	%xmm5, %xmm9
.LVL232:
	.loc 1 887 0
	movapd	%xmm7, %xmm12
	.loc 1 885 0
	subsd	%xmm3, %xmm4
.LVL233:
	.loc 1 886 0
	movapd	%xmm10, %xmm3
	mulsd	%xmm11, %xmm3
	.loc 1 887 0
	mulsd	%xmm9, %xmm12
	.loc 1 886 0
	subsd	%xmm2, %xmm3
.LVL234:
	.loc 1 887 0
	movapd	%xmm8, %xmm2
	mulsd	%xmm6, %xmm2
	subsd	%xmm12, %xmm2
.LVL235:
	.loc 1 888 0
	movapd	%xmm2, %xmm12
	andpd	.LC10(%rip), %xmm12
	ucomisd	%xmm12, %xmm15
	jbe	.L176
	.loc 1 889 0
	movl	$.LC13, %edi
	movq	%rax, 128(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rcx, 8(%rsp)
	movl	%esi, 104(%rsp)
	movsd	%xmm0, 176(%rsp)
	movsd	%xmm1, 160(%rsp)
	movq	%r8, (%rsp)
	movsd	%xmm2, 240(%rsp)
	movsd	%xmm3, 272(%rsp)
	movsd	%xmm4, 256(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm6, 80(%rsp)
	movsd	%xmm7, 208(%rsp)
	movsd	%xmm8, 192(%rsp)
	movsd	%xmm9, 224(%rsp)
	movsd	%xmm10, 32(%rsp)
	movsd	%xmm11, 48(%rsp)
	movsd	%xmm13, 64(%rsp)
	movsd	%xmm14, 144(%rsp)
	movsd	%xmm15, 112(%rsp)
	call	error_handler
.LVL236:
	movsd	112(%rsp), %xmm15
	movsd	144(%rsp), %xmm14
	movq	(%rsp), %r8
	movsd	64(%rsp), %xmm13
	movl	104(%rsp), %esi
	movsd	48(%rsp), %xmm11
	movq	8(%rsp), %rcx
	movsd	32(%rsp), %xmm10
	movq	136(%rsp), %rdx
	movsd	224(%rsp), %xmm9
	movq	128(%rsp), %rax
	movsd	192(%rsp), %xmm8
	movsd	208(%rsp), %xmm7
	movsd	80(%rsp), %xmm6
	movsd	16(%rsp), %xmm5
	movsd	256(%rsp), %xmm4
	movsd	272(%rsp), %xmm3
	movsd	240(%rsp), %xmm2
	movsd	160(%rsp), %xmm1
	movsd	176(%rsp), %xmm0
	jmp	.L176
.LVL237:
	.p2align 4,,10
	.p2align 3
.L192:
	.loc 1 905 0
	testl	%r12d, %r12d
	je	.L174
	xorl	%esi, %esi
	xorl	%edi, %edi
.LVL238:
	.p2align 4,,10
	.p2align 3
.L180:
	.loc 1 907 0
	movq	(%rcx,%rsi), %r9
	.loc 1 906 0
	addl	$1, %edi
.LVL239:
	.loc 1 907 0
	movq	%r9, (%rdx,%rsi)
	.loc 1 908 0
	movq	(%r8,%rsi), %r9
	movq	%r9, (%rax,%rsi)
	.loc 1 906 0
	addq	$8, %rsi
	cmpl	%edi, %r12d
	jg	.L180
.LVL240:
	.loc 1 868 0
	addl	$1, 312(%rsp)
.LVL241:
	addq	$8, 304(%rsp)
	movl	%r12d, %esi
	movl	312(%rsp), %edi
.LVL242:
	cmpl	%edi, 316(%rsp)
	movapd	%xmm11, %xmm5
	movsd	296(%rsp), %xmm10
	jg	.L181
	movl	%r12d, %eax
.LVL243:
.L173:
	.loc 1 915 0
	addq	$1128, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL244:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL245:
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL246:
.L174:
	.cfi_restore_state
	.loc 1 868 0
	xorl	%eax, %eax
	jmp	.L173
.LVL247:
.L183:
	.loc 1 862 0
	xorl	%eax, %eax
	jmp	.L169
	.cfi_endproc
.LFE39:
	.size	clip_2dx2d, .-clip_2dx2d
	.p2align 4,,15
.globl get_grid_area
	.type	get_grid_area, @function
get_grid_area:
.LFB24:
	.loc 1 67 0
	.cfi_startproc
.LVL248:
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
	subq	$408, %rsp
	.cfi_def_cfa_offset 464
	.loc 1 71 0
	movl	(%rdi), %edi
.LVL249:
	.loc 1 72 0
	movl	(%rsi), %esi
.LVL250:
	.loc 1 73 0
	movl	%edi, %eax
	.loc 1 71 0
	movl	%edi, 4(%rsp)
.LVL251:
	.loc 1 72 0
	movl	%esi, 68(%rsp)
.LVL252:
	.loc 1 73 0
	addl	$1, %eax
.LVL253:
	.loc 1 75 0
	testl	%esi, %esi
	jle	.L199
	.loc 1 66 0
	cltq
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	leaq	0(,%rax,8), %rbx
	leaq	8(,%rax,8), %rax
.LVL254:
	movl	$1, 20(%rsp)
	movq	%rbx, 8(%rsp)
	leaq	8(%rdx), %rbx
	addq	%rax, %rdx
.LVL255:
	addq	%rcx, %rax
	movq	%rdx, 48(%rsp)
	movq	%rax, 40(%rsp)
	movslq	%edi, %rax
	movq	%rbx, 56(%rsp)
	salq	$3, %rax
	movq	%rax, 72(%rsp)
.LVL256:
	.p2align 4,,10
	.p2align 3
.L195:
	.loc 1 75 0
	movl	4(%rsp), %edi
	movl	20(%rsp), %eax
	testl	%edi, %edi
	jle	.L198
	.loc 1 66 0
	movq	32(%rsp), %r15
	movq	40(%rsp), %r13
	xorl	%r14d, %r14d
	movq	24(%rsp), %r12
	movq	48(%rsp), %rbp
	movq	56(%rsp), %rbx
.LVL257:
	.p2align 4,,10
	.p2align 3
.L196:
	.loc 1 76 0
	movq	-8(%rbx), %rax
	.loc 1 84 0
	movsd	.LC3(%rip), %xmm0
	leaq	80(%rsp), %rsi
	leaq	240(%rsp), %rdi
	movl	$4, %edx
	.loc 1 75 0
	addl	$1, %r14d
	.loc 1 76 0
	movq	%rax, 240(%rsp)
	.loc 1 77 0
	movq	(%rbx), %rax
	.loc 1 75 0
	addq	$8, %rbx
	.loc 1 77 0
	movq	%rax, 248(%rsp)
	.loc 1 78 0
	movq	0(%rbp), %rax
	movq	%rax, 256(%rsp)
	.loc 1 79 0
	movq	-8(%rbp), %rax
	.loc 1 75 0
	addq	$8, %rbp
	.loc 1 79 0
	movq	%rax, 264(%rsp)
	.loc 1 80 0
	movq	(%r12), %rax
	movq	%rax, 80(%rsp)
	.loc 1 81 0
	movq	8(%r12), %rax
	.loc 1 75 0
	addq	$8, %r12
	.loc 1 81 0
	movq	%rax, 88(%rsp)
	.loc 1 82 0
	movq	0(%r13), %rax
	movq	%rax, 96(%rsp)
	.loc 1 83 0
	movq	-8(%r13), %rax
	.loc 1 75 0
	addq	$8, %r13
	.loc 1 83 0
	movq	%rax, 104(%rsp)
	.loc 1 84 0
	call	fix_lon
.LVL258:
	.loc 1 85 0
	leaq	80(%rsp), %rsi
	leaq	240(%rsp), %rdi
	movl	%eax, %edx
	call	poly_area
.LVL259:
	movsd	%xmm0, (%r15)
	.loc 1 75 0
	addq	$8, %r15
	cmpl	%r14d, 4(%rsp)
	jg	.L196
	movl	20(%rsp), %eax
.LVL260:
.L198:
	movq	8(%rsp), %rdx
	addl	$1, 20(%rsp)
	addq	%rdx, 56(%rsp)
	movq	72(%rsp), %rbx
	addq	%rdx, 48(%rsp)
	addq	%rdx, 24(%rsp)
	addq	%rdx, 40(%rsp)
	addq	%rbx, 32(%rsp)
	cmpl	%eax, 68(%rsp)
	jg	.L195
.LVL261:
.L199:
	.loc 1 88 0
	addq	$408, %rsp
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
	.cfi_endproc
.LFE24:
	.size	get_grid_area, .-get_grid_area
	.p2align 4,,15
.globl get_grid_area_
	.type	get_grid_area_, @function
get_grid_area_:
.LFB23:
	.loc 1 62 0
	.cfi_startproc
.LVL262:
	.loc 1 63 0
	jmp	get_grid_area
	.cfi_endproc
.LFE23:
	.size	get_grid_area_, .-get_grid_area_
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"nxgrid is greater than MAXXGRID, increase MAXXGRID"
	.text
	.p2align 4,,15
.globl create_xgrid_2dx2d_order2
	.type	create_xgrid_2dx2d_order2, @function
create_xgrid_2dx2d_order2:
.LFB37:
	.loc 1 654 0
	.cfi_startproc
.LVL263:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$2760, %rsp
	.cfi_def_cfa_offset 2816
	.loc 1 663 0
	movl	(%rdi), %eax
	.loc 1 664 0
	movl	(%rsi), %edx
.LVL264:
	.loc 1 665 0
	movl	0(%r13), %ecx
.LVL265:
	.loc 1 654 0
	movq	%r9, 320(%rsp)
	movq	%r8, 304(%rsp)
	.loc 1 663 0
	movl	%eax, 224(%rsp)
.LVL266:
	.loc 1 673 0
	movl	224(%rsp), %edi
.LVL267:
	.loc 1 666 0
	movl	(%r12), %eax
	.loc 1 669 0
	movl	%ecx, %r15d
	.loc 1 664 0
	movl	%edx, 316(%rsp)
.LVL268:
	.loc 1 665 0
	movl	%ecx, 60(%rsp)
.LVL269:
	.loc 1 668 0
	movl	224(%rsp), %r14d
	.loc 1 669 0
	addl	$1, %r15d
	.loc 1 673 0
	imull	%edx, %edi
	.loc 1 666 0
	movl	%eax, 148(%rsp)
.LVL270:
	.loc 1 668 0
	addl	$1, %r14d
.LVL271:
	.loc 1 673 0
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
.LVL272:
	.loc 1 674 0
	movl	148(%rsp), %edi
	.loc 1 673 0
	movq	%rax, 336(%rsp)
.LVL273:
	.loc 1 674 0
	imull	60(%rsp), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
.LVL274:
	.loc 1 675 0
	movq	336(%rsp), %r8
	movq	320(%rsp), %rcx
	movq	%rbx, %rsi
	movq	304(%rsp), %rdx
	movq	%rbp, %rdi
	.loc 1 674 0
	movq	%rax, 256(%rsp)
.LVL275:
	.loc 1 675 0
	call	get_grid_area
.LVL276:
	.loc 1 676 0
	movq	256(%rsp), %r8
	movq	2824(%rsp), %rcx
	movq	%r12, %rsi
	movq	2816(%rsp), %rdx
	movq	%r13, %rdi
	call	get_grid_area
.LVL277:
	.loc 1 678 0
	cmpl	$0, 316(%rsp)
	.loc 1 650 0
	movl	$0, 268(%rsp)
	.loc 1 678 0
	jle	.L217
	.loc 1 650 0
	movslq	224(%rsp), %rax
	movq	304(%rsp), %rcx
	movslq	%r15d, %r15
	movq	$0, 232(%rsp)
	movq	$0, 240(%rsp)
	movl	$1, 228(%rsp)
	movq	%r15, 272(%rsp)
	salq	$3, %rax
	movq	%rax, 344(%rsp)
	movslq	%r14d, %rax
	leaq	0(,%rax,8), %rdx
	leaq	8(%rcx,%rax,8), %rax
	movq	%rax, 248(%rsp)
	movq	2816(%rsp), %rax
	movq	%rdx, 296(%rsp)
	leaq	8(%rax,%r15,8), %rax
	movq	%rax, 280(%rsp)
.LVL278:
.L205:
	.loc 1 678 0
	movl	228(%rsp), %edx
	movl	224(%rsp), %ebp
	movl	228(%rsp), %ecx
	subl	$1, %edx
	testl	%ebp, %ebp
	movl	%edx, 332(%rsp)
.LVL279:
	movl	%ecx, 292(%rsp)
	jle	.L219
	movq	2832(%rsp), %rdx
	addq	240(%rsp), %rdx
	.loc 1 650 0
	movq	232(%rsp), %rax
	movq	232(%rsp), %rcx
	addq	320(%rsp), %rcx
	movl	$0, 160(%rsp)
	.loc 1 678 0
	movq	%rdx, 136(%rsp)
	.loc 1 650 0
	movq	304(%rsp), %rdx
	movq	%rcx, 192(%rsp)
	movq	248(%rsp), %rcx
	leaq	8(%rdx,%rax), %rax
	movq	%rax, 184(%rsp)
	movq	320(%rsp), %rax
	movq	%rcx, 168(%rsp)
	subq	%rdx, %rax
	movq	336(%rsp), %rdx
	addq	248(%rsp), %rax
	addq	240(%rsp), %rdx
	movq	%rax, 176(%rsp)
	movq	%rdx, 208(%rsp)
	jmp	.L216
.LVL280:
	.p2align 4,,10
	.p2align 3
.L206:
	.loc 1 678 0
	addl	$1, 160(%rsp)
.LVL281:
	addq	$8, 136(%rsp)
	movl	160(%rsp), %eax
	addq	$8, 192(%rsp)
	addq	$8, 184(%rsp)
	addq	$8, 168(%rsp)
	addq	$8, 176(%rsp)
	addq	$8, 208(%rsp)
	cmpl	%eax, 224(%rsp)
	jle	.L219
.LVL282:
.L216:
	movq	136(%rsp), %rdx
	movsd	(%rdx), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jbe	.L206
	.loc 1 681 0
	movq	184(%rsp), %rcx
	movq	192(%rsp), %rdx
	.loc 1 685 0
	leaq	1952(%rsp), %rsi
	movl	$4, %edi
	.loc 1 681 0
	movq	-8(%rcx), %rax
	movq	%rax, 2352(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 1952(%rsp)
	.loc 1 682 0
	movq	(%rcx), %rax
	.loc 1 683 0
	movq	168(%rsp), %rcx
	.loc 1 682 0
	movq	%rax, 2360(%rsp)
	movq	8(%rdx), %rax
	.loc 1 683 0
	movq	176(%rsp), %rdx
	.loc 1 682 0
	movq	%rax, 1960(%rsp)
	.loc 1 683 0
	movq	(%rcx), %rax
	movq	%rax, 2368(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 1968(%rsp)
	.loc 1 684 0
	movq	-8(%rcx), %rax
	movq	%rax, 2376(%rsp)
	movq	-8(%rdx), %rax
	movq	%rax, 1976(%rsp)
	.loc 1 685 0
	call	minval_double
	.loc 1 686 0
	leaq	1952(%rsp), %rsi
	movl	$4, %edi
	.loc 1 685 0
	movsd	%xmm0, 72(%rsp)
.LVL283:
	.loc 1 686 0
	call	maxval_double
.LVL284:
	.loc 1 687 0
	leaq	1952(%rsp), %rsi
	.loc 1 686 0
	movsd	%xmm0, 64(%rsp)
.LVL285:
	.loc 1 687 0
	leaq	2352(%rsp), %rdi
	movsd	.LC3(%rip), %xmm0
.LVL286:
	movl	$4, %edx
	call	fix_lon
	.loc 1 688 0
	leaq	2352(%rsp), %rsi
	movl	%eax, %edi
	.loc 1 687 0
	movl	%eax, 220(%rsp)
.LVL287:
	.loc 1 688 0
	call	minval_double
.LVL288:
	.loc 1 689 0
	movl	220(%rsp), %edi
	leaq	2352(%rsp), %rsi
	.loc 1 688 0
	movsd	%xmm0, 200(%rsp)
.LVL289:
	.loc 1 689 0
	call	maxval_double
.LVL290:
	.loc 1 690 0
	movl	220(%rsp), %edi
	leaq	2352(%rsp), %rsi
	.loc 1 689 0
	movsd	%xmm0, 128(%rsp)
.LVL291:
	.loc 1 690 0
	call	avgval_double
.LVL292:
	.loc 1 692 0
	movl	148(%rsp), %r9d
	.loc 1 690 0
	movsd	%xmm0, 120(%rsp)
.LVL293:
	.loc 1 692 0
	testl	%r9d, %r9d
	jle	.L206
	.loc 1 650 0
	movq	280(%rsp), %rax
	movq	272(%rsp), %rcx
	movq	256(%rsp), %rdx
	movq	$0, 88(%rsp)
	movl	$1, 80(%rsp)
	movq	%rax, 96(%rsp)
	movslq	60(%rsp), %rax
	salq	$3, %rcx
	movq	%rcx, 112(%rsp)
	movq	%rdx, 104(%rsp)
	salq	$3, %rax
	movq	%rax, 152(%rsp)
.LVL294:
	.p2align 4,,10
	.p2align 3
.L208:
	.loc 1 692 0
	movl	80(%rsp), %ecx
	movl	60(%rsp), %r8d
	movl	80(%rsp), %eax
	subl	$1, %ecx
	testl	%r8d, %r8d
	movl	%ecx, 164(%rsp)
.LVL295:
	jle	.L215
	.loc 1 650 0
	movq	2816(%rsp), %rdx
	movq	88(%rsp), %rax
	xorl	%r14d, %r14d
	movq	2824(%rsp), %r13
	movq	104(%rsp), %rcx
	leaq	1152(%rsp), %r15
	movq	88(%rsp), %rbx
	movq	96(%rsp), %r12
	addq	2824(%rsp), %rbx
	leaq	8(%rdx,%rax), %rbp
	subq	%rdx, %r13
	movq	%rcx, 48(%rsp)
	addq	96(%rsp), %r13
	jmp	.L213
.LVL296:
	.p2align 4,,10
	.p2align 3
.L209:
	.loc 1 692 0
	addl	$1, %r14d
.LVL297:
	addq	$8, %rbx
	addq	$8, %rbp
	addq	$8, %r12
	addq	$8, %r13
	addq	$8, 48(%rsp)
	cmpl	%r14d, 60(%rsp)
	jle	.L226
.LVL298:
.L213:
.LBB24:
	.loc 1 697 0
	movq	-8(%rbp), %rax
	.loc 1 702 0
	movq	%r15, %rsi
	movl	$4, %edi
	.loc 1 697 0
	movq	%rax, 1552(%rsp)
	movq	(%rbx), %rax
	movq	%rax, 1152(%rsp)
	.loc 1 698 0
	movq	0(%rbp), %rax
	movq	%rax, 1560(%rsp)
	movq	8(%rbx), %rax
	movq	%rax, 1160(%rsp)
	.loc 1 699 0
	movq	(%r12), %rax
	movq	%rax, 1568(%rsp)
	movq	0(%r13), %rax
	movq	%rax, 1168(%rsp)
	.loc 1 700 0
	movq	-8(%r12), %rax
	movq	%rax, 1576(%rsp)
	movq	-8(%r13), %rax
	movq	%rax, 1176(%rsp)
	.loc 1 702 0
	call	minval_double
.LVL299:
	.loc 1 703 0
	movq	%r15, %rsi
	movl	$4, %edi
	movsd	%xmm0, 16(%rsp)
	call	maxval_double
.LVL300:
	.loc 1 704 0
	movsd	16(%rsp), %xmm1
	ucomisd	64(%rsp), %xmm1
	jae	.L209
	movsd	72(%rsp), %xmm1
	ucomisd	%xmm0, %xmm1
	jae	.L209
	.loc 1 705 0
	movsd	120(%rsp), %xmm0
.LVL301:
	leaq	1552(%rsp), %rdi
	movl	$4, %edx
	movq	%r15, %rsi
	call	fix_lon
	.loc 1 706 0
	leaq	1552(%rsp), %rsi
	movl	%eax, %edi
	.loc 1 705 0
	movl	%eax, 84(%rsp)
.LVL302:
	.loc 1 706 0
	call	minval_double
.LVL303:
	.loc 1 707 0
	movl	84(%rsp), %edi
	leaq	1552(%rsp), %rsi
	movsd	%xmm0, 16(%rsp)
	call	maxval_double
.LVL304:
	.loc 1 712 0
	movsd	16(%rsp), %xmm1
	ucomisd	128(%rsp), %xmm1
	jae	.L209
	movsd	200(%rsp), %xmm2
	ucomisd	%xmm0, %xmm2
	jae	.L209
	.loc 1 714 0
	leaq	752(%rsp), %rdx
	movl	84(%rsp), %r9d
	leaq	352(%rsp), %rax
	leaq	1552(%rsp), %rcx
	leaq	1952(%rsp), %rsi
	leaq	2352(%rsp), %rdi
	movq	%rdx, (%rsp)
	movl	220(%rsp), %edx
	movq	%r15, %r8
	movq	%rax, 8(%rsp)
	call	clip_2dx2d
.LVL305:
	testl	%eax, %eax
	jle	.L209
	.loc 1 715 0
	leaq	352(%rsp), %rsi
	leaq	752(%rsp), %rdi
	movl	%eax, %edx
	movl	%eax, 32(%rsp)
	call	poly_area
.LVL306:
	movq	136(%rsp), %rax
	.loc 1 716 0
	movq	208(%rsp), %rdx
	.loc 1 717 0
	movl	32(%rsp), %ecx
	.loc 1 715 0
	mulsd	(%rax), %xmm0
.LVL307:
	.loc 1 716 0
	movq	48(%rsp), %rax
	movsd	(%rdx), %xmm1
	minsd	(%rax), %xmm1
.LVL308:
	.loc 1 717 0
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	ucomisd	.LC14(%rip), %xmm2
	jbe	.L209
	.loc 1 718 0
	movslq	268(%rsp), %rax
	movq	2872(%rsp), %rdx
	.loc 1 719 0
	leaq	352(%rsp), %rsi
	leaq	752(%rsp), %rdi
	.loc 1 718 0
	movsd	%xmm0, (%rdx,%rax,8)
	.loc 1 719 0
	movl	%ecx, %edx
	movq	%rax, 40(%rsp)
	movsd	120(%rsp), %xmm0
.LVL309:
	call	poly_ctrlon
.LVL310:
	movq	40(%rsp), %rax
	movq	2880(%rsp), %rdx
	.loc 1 720 0
	leaq	352(%rsp), %rsi
	movl	32(%rsp), %ecx
	leaq	752(%rsp), %rdi
	.loc 1 719 0
	movsd	%xmm0, (%rdx,%rax,8)
	.loc 1 720 0
	movl	%ecx, %edx
	call	poly_ctrlat
	movq	40(%rsp), %rax
	movq	2888(%rsp), %rcx
	.loc 1 721 0
	movq	2840(%rsp), %rdx
	.loc 1 725 0
	addl	$1, 268(%rsp)
	.loc 1 720 0
	movsd	%xmm0, (%rcx,%rax,8)
	.loc 1 721 0
	movl	160(%rsp), %ecx
	.loc 1 726 0
	cvtsi2sd	268(%rsp), %xmm0
	.loc 1 721 0
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 722 0
	movl	332(%rsp), %ecx
	movq	2848(%rsp), %rdx
	.loc 1 726 0
	ucomisd	.LC15(%rip), %xmm0
	.loc 1 722 0
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 723 0
	movq	2856(%rsp), %rdx
	.loc 1 724 0
	movq	2864(%rsp), %rcx
	.loc 1 723 0
	movl	%r14d, (%rdx,%rax,4)
	.loc 1 724 0
	movl	164(%rsp), %edx
	movl	%edx, (%rcx,%rax,4)
	.loc 1 726 0
	jbe	.L209
	movl	$.LC16, %edi
	call	error_handler
	jmp	.L209
.LVL311:
	.p2align 4,,10
	.p2align 3
.L226:
.LBE24:
	.loc 1 692 0
	movl	80(%rsp), %eax
.LVL312:
.L215:
	movq	112(%rsp), %rcx
	addl	$1, 80(%rsp)
	addq	%rcx, 88(%rsp)
	movq	152(%rsp), %rdx
	addq	%rcx, 96(%rsp)
	addq	%rdx, 104(%rsp)
	cmpl	%eax, 148(%rsp)
	jg	.L208
	jmp	.L206
.LVL313:
.L219:
	.loc 1 678 0
	movq	296(%rsp), %rcx
	addl	$1, 228(%rsp)
	movq	344(%rsp), %rdx
	addq	%rcx, 232(%rsp)
	addq	%rdx, 240(%rsp)
	movl	292(%rsp), %eax
	addq	%rcx, 248(%rsp)
	cmpl	%eax, 316(%rsp)
	jg	.L205
.LVL314:
.L217:
	.loc 1 732 0
	movq	336(%rsp), %rdi
	call	free
	.loc 1 733 0
	movq	256(%rsp), %rdi
	call	free
	.loc 1 737 0
	movl	268(%rsp), %eax
	addq	$2760, %rsp
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
	.cfi_endproc
.LFE37:
	.size	create_xgrid_2dx2d_order2, .-create_xgrid_2dx2d_order2
	.p2align 4,,15
.globl create_xgrid_2dx2d_order2_
	.type	create_xgrid_2dx2d_order2_, @function
create_xgrid_2dx2d_order2_:
.LFB36:
	.loc 1 642 0
	.cfi_startproc
.LVL315:
	.loc 1 644 0
	jmp	create_xgrid_2dx2d_order2
	.cfi_endproc
.LFE36:
	.size	create_xgrid_2dx2d_order2_, .-create_xgrid_2dx2d_order2_
	.p2align 4,,15
.globl create_xgrid_2dx2d_order1
	.type	create_xgrid_2dx2d_order1, @function
create_xgrid_2dx2d_order1:
.LFB35:
	.loc 1 549 0
	.cfi_startproc
.LVL316:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$2728, %rsp
	.cfi_def_cfa_offset 2784
	.loc 1 558 0
	movl	(%rdi), %eax
	.loc 1 559 0
	movl	(%rsi), %edx
.LVL317:
	.loc 1 560 0
	movl	0(%r13), %ecx
.LVL318:
	.loc 1 549 0
	movq	%r9, 296(%rsp)
	movq	%r8, 280(%rsp)
	.loc 1 558 0
	movl	%eax, 204(%rsp)
.LVL319:
	.loc 1 561 0
	movl	(%r12), %eax
	.loc 1 565 0
	movl	%ecx, %r15d
	.loc 1 559 0
	movl	%edx, 292(%rsp)
.LVL320:
	.loc 1 560 0
	movl	%ecx, 44(%rsp)
.LVL321:
	.loc 1 564 0
	movl	204(%rsp), %r14d
	.loc 1 565 0
	addl	$1, %r15d
	.loc 1 561 0
	movl	%eax, 132(%rsp)
.LVL322:
	.loc 1 567 0
	movl	204(%rsp), %eax
	.loc 1 564 0
	addl	$1, %r14d
.LVL323:
	.loc 1 567 0
	imull	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdi
.LVL324:
	call	malloc
.LVL325:
	movq	%rax, 304(%rsp)
.LVL326:
	.loc 1 568 0
	movl	132(%rsp), %eax
.LVL327:
	imull	44(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	.loc 1 569 0
	movq	304(%rsp), %r8
	movq	296(%rsp), %rcx
	movq	%rbx, %rsi
	movq	280(%rsp), %rdx
	movq	%rbp, %rdi
	.loc 1 568 0
	movq	%rax, 240(%rsp)
.LVL328:
	.loc 1 569 0
	call	get_grid_area
.LVL329:
	.loc 1 570 0
	movq	240(%rsp), %r8
	movq	2792(%rsp), %rcx
	movq	%r12, %rsi
	movq	2784(%rsp), %rdx
	movq	%r13, %rdi
	call	get_grid_area
.LVL330:
	.loc 1 572 0
	cmpl	$0, 292(%rsp)
	.loc 1 545 0
	movl	$0, 208(%rsp)
	.loc 1 572 0
	jle	.L243
	.loc 1 545 0
	movslq	204(%rsp), %rax
	movq	280(%rsp), %rcx
	movslq	%r15d, %r15
	movq	$0, 216(%rsp)
	movq	$0, 224(%rsp)
	movl	$1, 212(%rsp)
	movq	%r15, 248(%rsp)
	salq	$3, %rax
	movq	%rax, 312(%rsp)
	movslq	%r14d, %rax
	leaq	0(,%rax,8), %rdx
	leaq	8(%rcx,%rax,8), %rax
	movq	%rax, 232(%rsp)
	movq	2784(%rsp), %rax
	movq	%rdx, 272(%rsp)
	leaq	8(%rax,%r15,8), %rax
	movq	%rax, 256(%rsp)
.LVL331:
.L231:
	.loc 1 572 0
	movl	212(%rsp), %ecx
	movl	204(%rsp), %r10d
	movl	212(%rsp), %eax
	subl	$1, %ecx
	testl	%r10d, %r10d
	movl	%ecx, 268(%rsp)
.LVL332:
	movl	%eax, 264(%rsp)
	jle	.L245
	movq	2800(%rsp), %rcx
	.loc 1 545 0
	movq	216(%rsp), %rax
	.loc 1 572 0
	addq	224(%rsp), %rcx
	.loc 1 545 0
	addq	296(%rsp), %rax
	movq	216(%rsp), %rdx
	movl	$0, 144(%rsp)
	.loc 1 572 0
	movq	%rcx, 120(%rsp)
	.loc 1 545 0
	movq	%rax, 176(%rsp)
	movq	280(%rsp), %rcx
	movq	296(%rsp), %rax
	subq	%rcx, %rax
	addq	232(%rsp), %rax
	leaq	8(%rcx,%rdx), %rdx
	movq	304(%rsp), %rcx
	addq	224(%rsp), %rcx
	movq	%rdx, 168(%rsp)
	movq	%rax, 160(%rsp)
	movq	232(%rsp), %rax
	movq	%rcx, 192(%rsp)
	movq	%rax, 152(%rsp)
	jmp	.L242
.LVL333:
	.p2align 4,,10
	.p2align 3
.L232:
	.loc 1 572 0
	addl	$1, 144(%rsp)
.LVL334:
	addq	$8, 120(%rsp)
	movl	144(%rsp), %edx
	addq	$8, 176(%rsp)
	addq	$8, 168(%rsp)
	addq	$8, 152(%rsp)
	addq	$8, 160(%rsp)
	addq	$8, 192(%rsp)
	cmpl	%edx, 204(%rsp)
	jle	.L245
.LVL335:
.L242:
	movq	120(%rsp), %rdx
	movsd	(%rdx), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jbe	.L232
	.loc 1 575 0
	movq	168(%rsp), %rcx
	movq	176(%rsp), %rdx
	.loc 1 579 0
	leaq	1920(%rsp), %rsi
	movl	$4, %edi
	.loc 1 575 0
	movq	-8(%rcx), %rax
	movq	%rax, 2320(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 1920(%rsp)
	.loc 1 576 0
	movq	(%rcx), %rax
	.loc 1 577 0
	movq	152(%rsp), %rcx
	.loc 1 576 0
	movq	%rax, 2328(%rsp)
	movq	8(%rdx), %rax
	.loc 1 577 0
	movq	160(%rsp), %rdx
	.loc 1 576 0
	movq	%rax, 1928(%rsp)
	.loc 1 577 0
	movq	(%rcx), %rax
	movq	%rax, 2336(%rsp)
	movq	(%rdx), %rax
	movq	%rax, 1936(%rsp)
	.loc 1 578 0
	movq	-8(%rcx), %rax
	movq	%rax, 2344(%rsp)
	movq	-8(%rdx), %rax
	movq	%rax, 1944(%rsp)
	.loc 1 579 0
	call	minval_double
	.loc 1 580 0
	leaq	1920(%rsp), %rsi
	movl	$4, %edi
	.loc 1 579 0
	movsd	%xmm0, 56(%rsp)
.LVL336:
	.loc 1 580 0
	call	maxval_double
.LVL337:
	.loc 1 581 0
	leaq	1920(%rsp), %rsi
	.loc 1 580 0
	movsd	%xmm0, 48(%rsp)
.LVL338:
	.loc 1 581 0
	leaq	2320(%rsp), %rdi
	movsd	.LC3(%rip), %xmm0
.LVL339:
	movl	$4, %edx
	call	fix_lon
	.loc 1 582 0
	leaq	2320(%rsp), %rsi
	movl	%eax, %edi
	.loc 1 581 0
	movl	%eax, 200(%rsp)
.LVL340:
	.loc 1 582 0
	call	minval_double
.LVL341:
	.loc 1 583 0
	movl	200(%rsp), %edi
	leaq	2320(%rsp), %rsi
	.loc 1 582 0
	movsd	%xmm0, 184(%rsp)
.LVL342:
	.loc 1 583 0
	call	maxval_double
.LVL343:
	.loc 1 584 0
	movl	200(%rsp), %edi
	leaq	2320(%rsp), %rsi
	.loc 1 583 0
	movsd	%xmm0, 112(%rsp)
.LVL344:
	.loc 1 584 0
	call	avgval_double
.LVL345:
	.loc 1 586 0
	movl	132(%rsp), %r12d
	.loc 1 584 0
	movsd	%xmm0, 104(%rsp)
.LVL346:
	.loc 1 586 0
	testl	%r12d, %r12d
	jle	.L232
	.loc 1 545 0
	movq	256(%rsp), %rax
	movq	248(%rsp), %rcx
	movq	240(%rsp), %rdx
	movq	$0, 72(%rsp)
	movl	$1, 64(%rsp)
	movq	%rax, 80(%rsp)
	movslq	44(%rsp), %rax
	salq	$3, %rcx
	movq	%rcx, 96(%rsp)
	movq	%rdx, 88(%rsp)
	salq	$3, %rax
	movq	%rax, 136(%rsp)
.LVL347:
	.p2align 4,,10
	.p2align 3
.L234:
	.loc 1 586 0
	movl	64(%rsp), %eax
	movl	44(%rsp), %r11d
	subl	$1, %eax
	testl	%r11d, %r11d
	movl	%eax, 148(%rsp)
.LVL348:
	movl	64(%rsp), %eax
	jle	.L241
	.loc 1 545 0
	movq	2784(%rsp), %rcx
	movq	72(%rsp), %rdx
	xorl	%r14d, %r14d
	movq	2792(%rsp), %r13
	movq	88(%rsp), %rax
	leaq	1120(%rsp), %r15
	movq	72(%rsp), %rbx
	movq	80(%rsp), %r12
	addq	2792(%rsp), %rbx
	leaq	8(%rcx,%rdx), %rbp
	subq	%rcx, %r13
	movq	%rax, 32(%rsp)
	addq	80(%rsp), %r13
	jmp	.L239
.LVL349:
	.p2align 4,,10
	.p2align 3
.L235:
	.loc 1 586 0
	addl	$1, %r14d
.LVL350:
	addq	$8, %rbx
	addq	$8, %rbp
	addq	$8, %r12
	addq	$8, %r13
	addq	$8, 32(%rsp)
	cmpl	%r14d, 44(%rsp)
	jle	.L252
.LVL351:
.L239:
.LBB25:
	.loc 1 591 0
	movq	-8(%rbp), %rax
	.loc 1 596 0
	movq	%r15, %rsi
	movl	$4, %edi
	.loc 1 591 0
	movq	%rax, 1520(%rsp)
	movq	(%rbx), %rax
	movq	%rax, 1120(%rsp)
	.loc 1 592 0
	movq	0(%rbp), %rax
	movq	%rax, 1528(%rsp)
	movq	8(%rbx), %rax
	movq	%rax, 1128(%rsp)
	.loc 1 593 0
	movq	(%r12), %rax
	movq	%rax, 1536(%rsp)
	movq	0(%r13), %rax
	movq	%rax, 1136(%rsp)
	.loc 1 594 0
	movq	-8(%r12), %rax
	movq	%rax, 1544(%rsp)
	movq	-8(%r13), %rax
	movq	%rax, 1144(%rsp)
	.loc 1 596 0
	call	minval_double
.LVL352:
	.loc 1 597 0
	movq	%r15, %rsi
	movl	$4, %edi
	movsd	%xmm0, 16(%rsp)
	call	maxval_double
.LVL353:
	.loc 1 598 0
	movsd	16(%rsp), %xmm1
	ucomisd	48(%rsp), %xmm1
	jae	.L235
	movsd	56(%rsp), %xmm1
	ucomisd	%xmm0, %xmm1
	jae	.L235
	.loc 1 599 0
	movsd	104(%rsp), %xmm0
.LVL354:
	leaq	1520(%rsp), %rdi
	movl	$4, %edx
	movq	%r15, %rsi
	call	fix_lon
	.loc 1 600 0
	leaq	1520(%rsp), %rsi
	movl	%eax, %edi
	.loc 1 599 0
	movl	%eax, 68(%rsp)
.LVL355:
	.loc 1 600 0
	call	minval_double
.LVL356:
	.loc 1 601 0
	movl	68(%rsp), %edi
	leaq	1520(%rsp), %rsi
	movsd	%xmm0, 16(%rsp)
	call	maxval_double
.LVL357:
	.loc 1 606 0
	movsd	16(%rsp), %xmm1
	ucomisd	112(%rsp), %xmm1
	jae	.L235
	movsd	184(%rsp), %xmm2
	ucomisd	%xmm0, %xmm2
	jae	.L235
	.loc 1 608 0
	leaq	720(%rsp), %rdx
	movl	68(%rsp), %r9d
	leaq	320(%rsp), %rax
	leaq	1520(%rsp), %rcx
	leaq	1920(%rsp), %rsi
	leaq	2320(%rsp), %rdi
	movq	%rdx, (%rsp)
	movl	200(%rsp), %edx
	movq	%r15, %r8
	movq	%rax, 8(%rsp)
	call	clip_2dx2d
.LVL358:
	testl	%eax, %eax
	jle	.L235
	.loc 1 609 0
	leaq	320(%rsp), %rsi
	leaq	720(%rsp), %rdi
	movl	%eax, %edx
	call	poly_area
.LVL359:
	movq	120(%rsp), %rcx
	.loc 1 610 0
	movq	192(%rsp), %rax
	movq	32(%rsp), %rdx
	.loc 1 609 0
	mulsd	(%rcx), %xmm0
.LVL360:
	.loc 1 610 0
	movsd	(%rax), %xmm1
	minsd	(%rdx), %xmm1
.LVL361:
	.loc 1 611 0
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	ucomisd	.LC14(%rip), %xmm2
	jbe	.L235
	.loc 1 612 0
	movslq	208(%rsp), %rax
	movq	2840(%rsp), %rdx
	.loc 1 613 0
	movq	2808(%rsp), %rcx
	.loc 1 617 0
	addl	$1, 208(%rsp)
	.loc 1 612 0
	movsd	%xmm0, (%rdx,%rax,8)
	.loc 1 613 0
	movl	144(%rsp), %edx
	.loc 1 618 0
	cvtsi2sd	208(%rsp), %xmm0
.LVL362:
	ucomisd	.LC15(%rip), %xmm0
	.loc 1 613 0
	movl	%edx, (%rcx,%rax,4)
	.loc 1 614 0
	movl	268(%rsp), %edx
	movq	2816(%rsp), %rcx
	movl	%edx, (%rcx,%rax,4)
	.loc 1 615 0
	movq	2824(%rsp), %rcx
	.loc 1 616 0
	movq	2832(%rsp), %rdx
	.loc 1 615 0
	movl	%r14d, (%rcx,%rax,4)
	.loc 1 616 0
	movl	148(%rsp), %ecx
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 618 0
	jbe	.L235
	movl	$.LC16, %edi
	call	error_handler
.LVL363:
	jmp	.L235
.LVL364:
	.p2align 4,,10
	.p2align 3
.L252:
.LBE25:
	.loc 1 586 0
	movl	64(%rsp), %eax
.LVL365:
.L241:
	movq	96(%rsp), %rdx
	addl	$1, 64(%rsp)
	addq	%rdx, 72(%rsp)
	movq	136(%rsp), %rcx
	addq	%rdx, 80(%rsp)
	addq	%rcx, 88(%rsp)
	cmpl	%eax, 132(%rsp)
	jg	.L234
	jmp	.L232
.LVL366:
.L245:
	.loc 1 572 0
	movq	272(%rsp), %rax
	addl	$1, 212(%rsp)
	movq	312(%rsp), %rcx
	addq	%rax, 216(%rsp)
	addq	%rcx, 224(%rsp)
	movl	264(%rsp), %edx
	addq	%rax, 232(%rsp)
	cmpl	%edx, 292(%rsp)
	jg	.L231
.LVL367:
.L243:
	.loc 1 624 0
	movq	304(%rsp), %rdi
	call	free
	.loc 1 625 0
	movq	240(%rsp), %rdi
	call	free
	.loc 1 628 0
	movl	208(%rsp), %eax
	addq	$2728, %rsp
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
	.cfi_endproc
.LFE35:
	.size	create_xgrid_2dx2d_order1, .-create_xgrid_2dx2d_order1
	.p2align 4,,15
.globl create_xgrid_2dx2d_order1_
	.type	create_xgrid_2dx2d_order1_, @function
create_xgrid_2dx2d_order1_:
.LFB34:
	.loc 1 536 0
	.cfi_startproc
.LVL368:
	.loc 1 539 0
	jmp	create_xgrid_2dx2d_order1
	.cfi_endproc
.LFE34:
	.size	create_xgrid_2dx2d_order1_, .-create_xgrid_2dx2d_order1_
	.p2align 4,,15
.globl create_xgrid_2dx1d_order2
	.type	create_xgrid_2dx1d_order2, @function
create_xgrid_2dx1d_order2:
.LFB33:
	.loc 1 442 0
	.cfi_startproc
.LVL369:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
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
	subq	$1864, %rsp
	.cfi_def_cfa_offset 1920
	.loc 1 451 0
	movl	(%rdi), %eax
	.loc 1 442 0
	movq	%rdx, 32(%rsp)
	.loc 1 452 0
	movl	(%rsi), %edx
.LVL370:
	.loc 1 442 0
	movq	%rcx, 40(%rsp)
	movq	%r8, 136(%rsp)
	.loc 1 451 0
	movl	%eax, 52(%rsp)
.LVL371:
	.loc 1 453 0
	movq	32(%rsp), %rax
	.loc 1 452 0
	movl	%edx, 156(%rsp)
.LVL372:
	.loc 1 454 0
	movl	(%rcx), %edx
	.loc 1 442 0
	movq	%r9, 144(%rsp)
	movq	1928(%rsp), %rbp
	.loc 1 453 0
	movl	(%rax), %eax
	.loc 1 454 0
	movl	%edx, 228(%rsp)
	.loc 1 453 0
	movl	%eax, 204(%rsp)
.LVL373:
	.loc 1 457 0
	movl	52(%rsp), %eax
	.loc 1 458 0
	movl	204(%rsp), %ebx
	.loc 1 457 0
	addl	$1, %eax
	movl	%eax, 56(%rsp)
.LVL374:
	.loc 1 460 0
	movl	156(%rsp), %eax
.LVL375:
	.loc 1 458 0
	addl	$1, %ebx
.LVL376:
	.loc 1 460 0
	imull	52(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
.LVL377:
	call	malloc
.LVL378:
	movq	%rax, 168(%rsp)
.LVL379:
	.loc 1 461 0
	movl	228(%rsp), %eax
.LVL380:
	imull	204(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 232(%rsp)
.LVL381:
	.loc 1 462 0
	movl	228(%rsp), %eax
.LVL382:
	addl	$1, %eax
	imull	%ebx, %eax
	cltq
	leaq	0(,%rax,8), %r13
	movq	%r13, %rdi
	call	malloc
	.loc 1 463 0
	movq	%r13, %rdi
	.loc 1 462 0
	movq	%rax, %r12
.LVL383:
	.loc 1 463 0
	call	malloc
.LVL384:
	.loc 1 464 0
	cmpl	$0, 228(%rsp)
	.loc 1 463 0
	movq	%rax, %r13
.LVL385:
	.loc 1 464 0
	js	.L256
	.loc 1 438 0
	movslq	%ebx, %rax
.LVL386:
	movq	%r15, 64(%rsp)
	movq	1920(%rsp), %r15
.LVL387:
	leaq	0(,%rax,8), %r10
	mov	228(%rsp), %eax
	movq	%r12, %r8
	movq	%r13, %r9
	xorl	%ebx, %ebx
.LVL388:
	leaq	8(,%rax,8), %r11
	mov	204(%rsp), %eax
	leaq	8(,%rax,8), %rdi
.LVL389:
.L257:
	.loc 1 464 0
	cmpl	$0, 204(%rsp)
	js	.L260
	.loc 1 438 0
	movq	%r9, %rcx
	movq	%r8, %rdx
	xorl	%eax, %eax
.LVL390:
.L258:
	.loc 1 465 0
	movq	(%r15,%rax), %rsi
	.loc 1 466 0
	addq	$8, %rax
	.loc 1 465 0
	movq	%rsi, (%rdx)
	.loc 1 466 0
	movq	0(%rbp,%rbx), %rsi
	addq	$8, %rdx
	movq	%rsi, (%rcx)
	addq	$8, %rcx
	.loc 1 464 0
	cmpq	%rdi, %rax
	jne	.L258
.L260:
	addq	$8, %rbx
	addq	%r10, %r8
	addq	%r10, %r9
	cmpq	%r11, %rbx
	jne	.L257
	movq	64(%rsp), %r15
	.loc 1 468 0
	movq	168(%rsp), %r8
	movq	%r14, %rsi
	movq	144(%rsp), %rcx
	movq	136(%rsp), %rdx
	movq	%r15, %rdi
	call	get_grid_area
	.loc 1 469 0
	movq	232(%rsp), %r8
	movq	40(%rsp), %rsi
	movq	%r13, %rcx
	movq	32(%rsp), %rdi
	movq	%r12, %rdx
	call	get_grid_area
	.loc 1 471 0
	movq	%r12, %rdi
	call	free
	.loc 1 472 0
	movq	%r13, %rdi
	call	free
.LVL391:
	.loc 1 474 0
	cmpl	$0, 228(%rsp)
	movl	$0, 116(%rsp)
	jle	.L282
	.loc 1 438 0
	movslq	204(%rsp), %rax
	movq	232(%rsp), %rdx
	movq	%rbp, 192(%rsp)
	movl	$0, 180(%rsp)
	movq	%rdx, 240(%rsp)
	movq	136(%rsp), %rdx
	salq	$3, %rax
	movq	%rax, 248(%rsp)
	movslq	56(%rsp), %rax
	leaq	8(%rdx,%rax,8), %rdx
	movq	%rax, 208(%rsp)
	movq	%rdx, 216(%rsp)
.LVL392:
.L262:
	.loc 1 474 0
	cmpl	$0, 204(%rsp)
	jle	.L283
	movq	1920(%rsp), %rdx
	movq	240(%rsp), %rax
	movl	$0, 176(%rsp)
	movq	%rdx, 184(%rsp)
	movq	%rax, 120(%rsp)
.LVL393:
.L281:
	.loc 1 476 0
	movq	184(%rsp), %rax
	.loc 1 478 0
	movl	156(%rsp), %r14d
	.loc 1 476 0
	movsd	(%rax), %xmm0
	movq	192(%rsp), %rax
	.loc 1 478 0
	testl	%r14d, %r14d
	.loc 1 476 0
	movsd	%xmm0, 64(%rsp)
.LVL394:
	movsd	(%rax), %xmm0
	.loc 1 477 0
	movq	184(%rsp), %rax
	.loc 1 476 0
	movsd	%xmm0, 40(%rsp)
.LVL395:
	.loc 1 477 0
	movsd	8(%rax), %xmm0
	movq	192(%rsp), %rax
	movsd	%xmm0, 56(%rsp)
.LVL396:
	movsd	8(%rax), %xmm0
	movsd	%xmm0, 32(%rsp)
.LVL397:
	.loc 1 478 0
	jle	.L263
	.loc 1 438 0
	movslq	52(%rsp), %rax
	movq	216(%rsp), %rdx
	movq	$0, 88(%rsp)
	movq	$0, 96(%rsp)
	movl	$1, 76(%rsp)
	movq	%rdx, 104(%rsp)
	salq	$3, %rax
	movq	%rax, 160(%rsp)
	movq	208(%rsp), %rax
	salq	$3, %rax
	movq	%rax, 128(%rsp)
.LVL398:
	.p2align 4,,10
	.p2align 3
.L264:
	.loc 1 478 0
	movl	76(%rsp), %edx
	movl	52(%rsp), %r13d
	movl	76(%rsp), %eax
	subl	$1, %edx
	testl	%r13d, %r13d
	movl	%edx, 152(%rsp)
.LVL399:
	movl	%eax, 112(%rsp)
	jle	.L280
	.loc 1 438 0
	movq	136(%rsp), %rdx
	movq	88(%rsp), %rax
	xorl	%r15d, %r15d
	movq	144(%rsp), %r14
	.loc 1 478 0
	movq	1936(%rsp), %rbx
	.loc 1 438 0
	movq	168(%rsp), %r9
	.loc 1 478 0
	addq	96(%rsp), %rbx
	.loc 1 438 0
	movq	%rax, %r13
	addq	96(%rsp), %r9
	addq	144(%rsp), %r13
	subq	%rdx, %r14
	addq	104(%rsp), %r14
	movq	104(%rsp), %rbp
	leaq	8(%rdx,%rax), %r12
.LVL400:
	.p2align 4,,10
	.p2align 3
.L278:
	.loc 1 478 0
	movsd	(%rbx), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jbe	.L265
.LBB26:
	.loc 1 482 0
	movsd	0(%r13), %xmm0
	.loc 1 486 0
	movsd	40(%rsp), %xmm4
	.loc 1 482 0
	movsd	%xmm0, 1056(%rsp)
	.loc 1 486 0
	ucomisd	%xmm0, %xmm4
	.loc 1 483 0
	movsd	8(%r13), %xmm1
	movsd	%xmm1, 1064(%rsp)
	.loc 1 484 0
	movsd	(%r14), %xmm2
	movsd	%xmm2, 1072(%rsp)
	.loc 1 485 0
	movsd	-8(%r14), %xmm3
	movsd	%xmm3, 1080(%rsp)
	.loc 1 486 0
	jb	.L267
	ucomisd	%xmm1, %xmm4
	jb	.L267
	ucomisd	%xmm2, %xmm4
	jb	.L267
	ucomisd	%xmm3, %xmm4
	jae	.L265
	.p2align 4,,10
	.p2align 3
.L267:
	.loc 1 488 0
	ucomisd	32(%rsp), %xmm0
	jb	.L271
	ucomisd	32(%rsp), %xmm1
	jb	.L271
	ucomisd	32(%rsp), %xmm2
	jb	.L271
	ucomisd	32(%rsp), %xmm3
	jae	.L265
	.p2align 4,,10
	.p2align 3
.L271:
	.loc 1 496 0
	movsd	64(%rsp), %xmm0
	.loc 1 491 0
	movq	-8(%r12), %rax
	.loc 1 496 0
	leaq	1056(%rsp), %rsi
	leaq	1456(%rsp), %rdi
	movl	$4, %edx
	addsd	56(%rsp), %xmm0
	movq	%r9, 8(%rsp)
	.loc 1 491 0
	movq	%rax, 1456(%rsp)
	.loc 1 492 0
	movq	(%r12), %rax
	movq	%rax, 1464(%rsp)
	.loc 1 493 0
	movq	0(%rbp), %rax
	.loc 1 496 0
	mulsd	.LC2(%rip), %xmm0
	.loc 1 493 0
	movq	%rax, 1472(%rsp)
	.loc 1 494 0
	movq	-8(%rbp), %rax
	movq	%rax, 1480(%rsp)
	.loc 1 496 0
	call	fix_lon
.LVL401:
	.loc 1 497 0
	leaq	1456(%rsp), %rsi
	movl	%eax, %edi
	movl	%eax, 16(%rsp)
	call	avgval_double
.LVL402:
	.loc 1 499 0
	movl	16(%rsp), %eax
	.loc 1 497 0
	movsd	%xmm0, 80(%rsp)
.LVL403:
	.loc 1 499 0
	leaq	256(%rsp), %r8
	leaq	656(%rsp), %rcx
	movsd	32(%rsp), %xmm3
	movsd	56(%rsp), %xmm2
	leaq	1056(%rsp), %rsi
	movsd	40(%rsp), %xmm1
	leaq	1456(%rsp), %rdi
	movsd	64(%rsp), %xmm0
.LVL404:
	movl	%eax, %edx
	call	clip
.LVL405:
	testl	%eax, %eax
	movq	8(%rsp), %r9
	jle	.L265
	.loc 1 500 0
	leaq	256(%rsp), %rsi
	leaq	656(%rsp), %rdi
	movl	%eax, %edx
	movl	%eax, 16(%rsp)
	call	poly_area
.LVL406:
	.loc 1 501 0
	movq	8(%rsp), %r9
	movq	120(%rsp), %rdx
	.loc 1 500 0
	mulsd	(%rbx), %xmm0
.LVL407:
	.loc 1 502 0
	movl	16(%rsp), %eax
	.loc 1 501 0
	movsd	(%r9), %xmm1
	minsd	(%rdx), %xmm1
.LVL408:
	.loc 1 502 0
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	ucomisd	.LC14(%rip), %xmm2
	ja	.L297
.LVL409:
	.p2align 4,,10
	.p2align 3
.L265:
.LBE26:
	.loc 1 478 0
	addl	$1, %r15d
.LVL410:
	addq	$8, %rbx
	addq	$8, %r12
	addq	$8, %rbp
	addq	$8, %r9
	addq	$8, %r13
	addq	$8, %r14
	cmpl	%r15d, 52(%rsp)
	jg	.L278
.LVL411:
.L280:
	movq	160(%rsp), %rax
	movq	128(%rsp), %rdx
	addq	%rax, 96(%rsp)
	addl	$1, 76(%rsp)
	addq	%rdx, 88(%rsp)
	addq	%rdx, 104(%rsp)
	movl	112(%rsp), %eax
	cmpl	%eax, 156(%rsp)
	jg	.L264
.LVL412:
.L263:
	.loc 1 474 0
	addl	$1, 176(%rsp)
.LVL413:
	addq	$8, 184(%rsp)
	movl	176(%rsp), %eax
	addq	$8, 120(%rsp)
	cmpl	%eax, 204(%rsp)
	jg	.L281
.LVL414:
.L283:
	addl	$1, 180(%rsp)
.LVL415:
	movq	248(%rsp), %rdx
	addq	$8, 192(%rsp)
	movl	180(%rsp), %eax
	addq	%rdx, 240(%rsp)
	cmpl	%eax, 228(%rsp)
	jg	.L262
.LVL416:
.L282:
	.loc 1 517 0
	movq	168(%rsp), %rdi
	call	free
	.loc 1 518 0
	movq	232(%rsp), %rdi
	call	free
	.loc 1 522 0
	movl	116(%rsp), %eax
	addq	$1864, %rsp
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
.LVL417:
	.p2align 4,,10
	.p2align 3
.L297:
	.cfi_restore_state
.LBB27:
	.loc 1 503 0
	movslq	116(%rsp), %rcx
	movq	1976(%rsp), %rdx
	.loc 1 504 0
	leaq	256(%rsp), %rsi
	leaq	656(%rsp), %rdi
	.loc 1 503 0
	movsd	%xmm0, (%rdx,%rcx,8)
	.loc 1 504 0
	movl	%eax, %edx
	movq	%rcx, 24(%rsp)
	movsd	80(%rsp), %xmm0
.LVL418:
	call	poly_ctrlon
.LVL419:
	movq	24(%rsp), %rcx
	movq	1984(%rsp), %rdx
	.loc 1 505 0
	leaq	256(%rsp), %rsi
	movl	16(%rsp), %eax
	leaq	656(%rsp), %rdi
	.loc 1 504 0
	movsd	%xmm0, (%rdx,%rcx,8)
	.loc 1 505 0
	movl	%eax, %edx
	call	poly_ctrlat
	movq	24(%rsp), %rcx
	movq	1992(%rsp), %rax
	.loc 1 506 0
	movq	1944(%rsp), %rdx
	.loc 1 510 0
	addl	$1, 116(%rsp)
	.loc 1 511 0
	movq	8(%rsp), %r9
	.loc 1 505 0
	movsd	%xmm0, (%rax,%rcx,8)
	.loc 1 507 0
	movq	1952(%rsp), %rax
	.loc 1 506 0
	movl	%r15d, (%rdx,%rcx,4)
	.loc 1 511 0
	cvtsi2sd	116(%rsp), %xmm0
	.loc 1 507 0
	movl	152(%rsp), %edx
	.loc 1 511 0
	ucomisd	.LC15(%rip), %xmm0
	.loc 1 507 0
	movl	%edx, (%rax,%rcx,4)
	.loc 1 508 0
	movl	176(%rsp), %edx
	movq	1960(%rsp), %rax
	movl	%edx, (%rax,%rcx,4)
	.loc 1 509 0
	movl	180(%rsp), %edx
	movq	1968(%rsp), %rax
	movl	%edx, (%rax,%rcx,4)
	.loc 1 511 0
	jbe	.L265
	movl	$.LC16, %edi
	call	error_handler
	movq	8(%rsp), %r9
	jmp	.L265
.LVL420:
.L256:
.LBE27:
	.loc 1 468 0
	movq	168(%rsp), %r8
	movq	144(%rsp), %rcx
	movq	%r14, %rsi
	movq	136(%rsp), %rdx
	movq	%r15, %rdi
	call	get_grid_area
.LVL421:
	.loc 1 469 0
	movq	232(%rsp), %r8
	movq	40(%rsp), %rsi
	movq	%r13, %rcx
	movq	32(%rsp), %rdi
	movq	%r12, %rdx
	call	get_grid_area
	.loc 1 471 0
	movq	%r12, %rdi
	call	free
	.loc 1 472 0
	movq	%r13, %rdi
	call	free
	movl	$0, 116(%rsp)
	jmp	.L282
	.cfi_endproc
.LFE33:
	.size	create_xgrid_2dx1d_order2, .-create_xgrid_2dx1d_order2
	.p2align 4,,15
.globl create_xgrid_2dx1d_order2_
	.type	create_xgrid_2dx1d_order2_, @function
create_xgrid_2dx1d_order2_:
.LFB32:
	.loc 1 430 0
	.cfi_startproc
.LVL422:
	.loc 1 432 0
	jmp	create_xgrid_2dx1d_order2
	.cfi_endproc
.LFE32:
	.size	create_xgrid_2dx1d_order2_, .-create_xgrid_2dx1d_order2_
	.p2align 4,,15
.globl create_xgrid_2dx1d_order1
	.type	create_xgrid_2dx1d_order1, @function
create_xgrid_2dx1d_order1:
.LFB31:
	.loc 1 341 0
	.cfi_startproc
.LVL423:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
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
	subq	$1848, %rsp
	.cfi_def_cfa_offset 1904
	.loc 1 349 0
	movl	(%rdi), %eax
	.loc 1 341 0
	movq	%rcx, 24(%rsp)
	movq	%rdx, 16(%rsp)
	.loc 1 350 0
	movl	(%rsi), %edx
.LVL424:
	.loc 1 351 0
	movq	16(%rsp), %rcx
.LVL425:
	.loc 1 349 0
	movl	%eax, 36(%rsp)
.LVL426:
	.loc 1 352 0
	movq	24(%rsp), %rax
	.loc 1 341 0
	movq	%r8, 120(%rsp)
	movq	%r9, 128(%rsp)
	.loc 1 350 0
	movl	%edx, 148(%rsp)
.LVL427:
	.loc 1 355 0
	movl	36(%rsp), %edx
	.loc 1 352 0
	movl	(%rax), %eax
	.loc 1 351 0
	movl	(%rcx), %ecx
	.loc 1 341 0
	movq	1912(%rsp), %rbp
	.loc 1 355 0
	addl	$1, %edx
	.loc 1 352 0
	movl	%eax, 212(%rsp)
	.loc 1 357 0
	movl	148(%rsp), %eax
	.loc 1 356 0
	movl	%ecx, %ebx
	.loc 1 357 0
	imull	36(%rsp), %eax
	.loc 1 351 0
	movl	%ecx, 188(%rsp)
.LVL428:
	.loc 1 355 0
	movl	%edx, 40(%rsp)
.LVL429:
	.loc 1 356 0
	addl	$1, %ebx
.LVL430:
	.loc 1 357 0
	cltq
	leaq	0(,%rax,8), %rdi
.LVL431:
	call	malloc
.LVL432:
	movq	%rax, 160(%rsp)
.LVL433:
	.loc 1 358 0
	movl	212(%rsp), %eax
.LVL434:
	imull	188(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 216(%rsp)
.LVL435:
	.loc 1 359 0
	movl	212(%rsp), %eax
.LVL436:
	addl	$1, %eax
	imull	%ebx, %eax
	cltq
	leaq	0(,%rax,8), %r13
	movq	%r13, %rdi
	call	malloc
	.loc 1 360 0
	movq	%r13, %rdi
	.loc 1 359 0
	movq	%rax, %r12
.LVL437:
	.loc 1 360 0
	call	malloc
.LVL438:
	.loc 1 361 0
	cmpl	$0, 212(%rsp)
	.loc 1 360 0
	movq	%rax, %r13
.LVL439:
	.loc 1 361 0
	js	.L301
	.loc 1 337 0
	movslq	%ebx, %rax
.LVL440:
	movq	%r15, 48(%rsp)
	movq	1904(%rsp), %r15
.LVL441:
	leaq	0(,%rax,8), %r10
	mov	212(%rsp), %eax
	movq	%r12, %r8
	movq	%r13, %r9
	xorl	%ebx, %ebx
.LVL442:
	leaq	8(,%rax,8), %r11
	mov	188(%rsp), %eax
	leaq	8(,%rax,8), %rdi
.LVL443:
.L302:
	.loc 1 361 0
	cmpl	$0, 188(%rsp)
	js	.L305
	.loc 1 337 0
	movq	%r9, %rcx
	movq	%r8, %rdx
	xorl	%eax, %eax
.LVL444:
.L303:
	.loc 1 362 0
	movq	(%r15,%rax), %rsi
	.loc 1 363 0
	addq	$8, %rax
	.loc 1 362 0
	movq	%rsi, (%rdx)
	.loc 1 363 0
	movq	0(%rbp,%rbx), %rsi
	addq	$8, %rdx
	movq	%rsi, (%rcx)
	addq	$8, %rcx
	.loc 1 361 0
	cmpq	%rdi, %rax
	jne	.L303
.L305:
	addq	$8, %rbx
	addq	%r10, %r8
	addq	%r10, %r9
	cmpq	%r11, %rbx
	jne	.L302
	movq	48(%rsp), %r15
	.loc 1 365 0
	movq	160(%rsp), %r8
	movq	%r14, %rsi
	movq	128(%rsp), %rcx
	movq	120(%rsp), %rdx
	movq	%r15, %rdi
	call	get_grid_area
	.loc 1 366 0
	movq	216(%rsp), %r8
	movq	24(%rsp), %rsi
	movq	%r13, %rcx
	movq	16(%rsp), %rdi
	movq	%r12, %rdx
	call	get_grid_area
	.loc 1 368 0
	movq	%r12, %rdi
	call	free
	.loc 1 369 0
	movq	%r13, %rdi
	call	free
.LVL445:
	.loc 1 371 0
	cmpl	$0, 212(%rsp)
	movl	$0, 60(%rsp)
	jle	.L327
	.loc 1 337 0
	movslq	188(%rsp), %rax
	movq	120(%rsp), %rdx
	movq	216(%rsp), %rcx
	movq	%rbp, 176(%rsp)
	movl	$0, 144(%rsp)
	salq	$3, %rax
	movq	%rcx, 224(%rsp)
	movq	%rax, 232(%rsp)
	movslq	40(%rsp), %rax
	leaq	8(%rdx,%rax,8), %rdx
	movq	%rax, 192(%rsp)
	movq	%rdx, 200(%rsp)
.LVL446:
.L307:
	.loc 1 371 0
	cmpl	$0, 188(%rsp)
	jle	.L328
	movq	1904(%rsp), %rcx
	movq	224(%rsp), %rax
	movl	$0, 140(%rsp)
	movq	%rcx, 168(%rsp)
	movq	%rax, 96(%rsp)
.LVL447:
.L326:
	.loc 1 373 0
	movq	168(%rsp), %rcx
	movq	176(%rsp), %rax
	movsd	(%rcx), %xmm0
	.loc 1 374 0
	movsd	8(%rax), %xmm4
	.loc 1 373 0
	movsd	%xmm0, 48(%rsp)
.LVL448:
	movsd	(%rax), %xmm0
	.loc 1 375 0
	movl	148(%rsp), %eax
	.loc 1 374 0
	movsd	8(%rcx), %xmm2
	.loc 1 373 0
	movsd	%xmm0, 24(%rsp)
.LVL449:
	.loc 1 375 0
	testl	%eax, %eax
	.loc 1 374 0
	movsd	%xmm2, 40(%rsp)
.LVL450:
	movsd	%xmm4, 16(%rsp)
.LVL451:
	.loc 1 375 0
	jle	.L308
	.loc 1 337 0
	movslq	36(%rsp), %rax
	movq	200(%rsp), %rdx
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	movl	$1, 56(%rsp)
	movq	%rdx, 80(%rsp)
	salq	$3, %rax
	movq	%rax, 152(%rsp)
	movq	192(%rsp), %rax
	salq	$3, %rax
	movq	%rax, 112(%rsp)
.LVL452:
	.p2align 4,,10
	.p2align 3
.L309:
	.loc 1 375 0
	movl	56(%rsp), %eax
	movl	36(%rsp), %r15d
	movl	56(%rsp), %edx
	subl	$1, %eax
	testl	%r15d, %r15d
	movl	%eax, 108(%rsp)
.LVL453:
	movl	%edx, 92(%rsp)
	jle	.L325
	.loc 1 337 0
	movq	120(%rsp), %rdx
	movq	64(%rsp), %rax
	xorl	%r15d, %r15d
	movq	128(%rsp), %r14
	.loc 1 375 0
	movq	1920(%rsp), %rbx
	.loc 1 337 0
	movq	160(%rsp), %r9
	.loc 1 375 0
	addq	72(%rsp), %rbx
	.loc 1 337 0
	movq	%rax, %r13
	addq	72(%rsp), %r9
	addq	128(%rsp), %r13
	subq	%rdx, %r14
	addq	80(%rsp), %r14
	movq	80(%rsp), %rbp
	leaq	8(%rdx,%rax), %r12
.LVL454:
	.p2align 4,,10
	.p2align 3
.L323:
	.loc 1 375 0
	movsd	(%rbx), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jbe	.L310
.LBB28:
	.loc 1 379 0
	movsd	0(%r13), %xmm0
	.loc 1 383 0
	movsd	24(%rsp), %xmm4
	.loc 1 379 0
	movsd	%xmm0, 1040(%rsp)
	.loc 1 383 0
	ucomisd	%xmm0, %xmm4
	.loc 1 380 0
	movsd	8(%r13), %xmm1
	movsd	%xmm1, 1048(%rsp)
	.loc 1 381 0
	movsd	(%r14), %xmm2
	movsd	%xmm2, 1056(%rsp)
	.loc 1 382 0
	movsd	-8(%r14), %xmm3
	movsd	%xmm3, 1064(%rsp)
	.loc 1 383 0
	jb	.L312
	ucomisd	%xmm1, %xmm4
	jb	.L312
	ucomisd	%xmm2, %xmm4
	jb	.L312
	ucomisd	%xmm3, %xmm4
	jae	.L310
	.p2align 4,,10
	.p2align 3
.L312:
	.loc 1 385 0
	ucomisd	16(%rsp), %xmm0
	jb	.L316
	ucomisd	16(%rsp), %xmm1
	jb	.L316
	ucomisd	16(%rsp), %xmm2
	jb	.L316
	ucomisd	16(%rsp), %xmm3
	jae	.L310
	.p2align 4,,10
	.p2align 3
.L316:
	.loc 1 393 0
	movsd	48(%rsp), %xmm0
	.loc 1 388 0
	movq	-8(%r12), %rax
	.loc 1 393 0
	leaq	1040(%rsp), %rsi
	leaq	1440(%rsp), %rdi
	movl	$4, %edx
	addsd	40(%rsp), %xmm0
	movq	%r9, 8(%rsp)
	.loc 1 388 0
	movq	%rax, 1440(%rsp)
	.loc 1 389 0
	movq	(%r12), %rax
	movq	%rax, 1448(%rsp)
	.loc 1 390 0
	movq	0(%rbp), %rax
	.loc 1 393 0
	mulsd	.LC2(%rip), %xmm0
	.loc 1 390 0
	movq	%rax, 1456(%rsp)
	.loc 1 391 0
	movq	-8(%rbp), %rax
	movq	%rax, 1464(%rsp)
	.loc 1 393 0
	call	fix_lon
.LVL455:
	.loc 1 395 0
	leaq	240(%rsp), %r8
	leaq	640(%rsp), %rcx
	leaq	1040(%rsp), %rsi
	movsd	16(%rsp), %xmm3
	leaq	1440(%rsp), %rdi
	movsd	40(%rsp), %xmm2
	movl	%eax, %edx
	movsd	24(%rsp), %xmm1
	movsd	48(%rsp), %xmm0
	call	clip
.LVL456:
	testl	%eax, %eax
	movq	8(%rsp), %r9
	jle	.L310
	.loc 1 396 0
	leaq	240(%rsp), %rsi
	leaq	640(%rsp), %rdi
	movl	%eax, %edx
	call	poly_area
.LVL457:
	.loc 1 397 0
	movq	8(%rsp), %r9
	movq	96(%rsp), %rax
	.loc 1 396 0
	mulsd	(%rbx), %xmm0
.LVL458:
	.loc 1 397 0
	movsd	(%r9), %xmm1
	minsd	(%rax), %xmm1
.LVL459:
	.loc 1 398 0
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	ucomisd	.LC14(%rip), %xmm2
	jbe	.L310
	.loc 1 399 0
	movslq	60(%rsp), %rax
	movq	1960(%rsp), %rdx
	.loc 1 400 0
	movq	1928(%rsp), %rcx
	.loc 1 404 0
	addl	$1, 60(%rsp)
	.loc 1 400 0
	movl	%r15d, (%rcx,%rax,4)
	.loc 1 399 0
	movsd	%xmm0, (%rdx,%rax,8)
	.loc 1 401 0
	movl	108(%rsp), %ecx
	.loc 1 405 0
	cvtsi2sd	60(%rsp), %xmm0
.LVL460:
	.loc 1 401 0
	movq	1936(%rsp), %rdx
	.loc 1 405 0
	ucomisd	.LC15(%rip), %xmm0
	.loc 1 401 0
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 402 0
	movl	140(%rsp), %ecx
	movq	1944(%rsp), %rdx
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 403 0
	movl	144(%rsp), %ecx
	movq	1952(%rsp), %rdx
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 405 0
	ja	.L342
.LVL461:
	.p2align 4,,10
	.p2align 3
.L310:
.LBE28:
	.loc 1 375 0
	addl	$1, %r15d
.LVL462:
	addq	$8, %rbx
	addq	$8, %r12
	addq	$8, %rbp
	addq	$8, %r9
	addq	$8, %r13
	addq	$8, %r14
	cmpl	%r15d, 36(%rsp)
	jg	.L323
.LVL463:
.L325:
	movq	112(%rsp), %rdx
	addl	$1, 56(%rsp)
	movq	152(%rsp), %rax
	addq	%rdx, 64(%rsp)
	addq	%rax, 72(%rsp)
	movl	92(%rsp), %ecx
	addq	%rdx, 80(%rsp)
	cmpl	%ecx, 148(%rsp)
	jg	.L309
.LVL464:
.L308:
	.loc 1 371 0
	addl	$1, 140(%rsp)
.LVL465:
	addq	$8, 168(%rsp)
	movl	140(%rsp), %ecx
	addq	$8, 96(%rsp)
	cmpl	%ecx, 188(%rsp)
	jg	.L326
.LVL466:
.L328:
	addl	$1, 144(%rsp)
.LVL467:
	movq	232(%rsp), %rax
	addq	$8, 176(%rsp)
	movl	144(%rsp), %edx
	addq	%rax, 224(%rsp)
	cmpl	%edx, 212(%rsp)
	jg	.L307
.LVL468:
.L327:
	.loc 1 411 0
	movq	160(%rsp), %rdi
	call	free
	.loc 1 412 0
	movq	216(%rsp), %rdi
	call	free
	.loc 1 416 0
	movl	60(%rsp), %eax
	addq	$1848, %rsp
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
.LVL469:
	.p2align 4,,10
	.p2align 3
.L342:
	.cfi_restore_state
.LBB29:
	.loc 1 405 0
	movl	$.LC16, %edi
	call	error_handler
.LVL470:
	movq	8(%rsp), %r9
	jmp	.L310
.LVL471:
.L301:
.LBE29:
	.loc 1 365 0
	movq	160(%rsp), %r8
	movq	128(%rsp), %rcx
	movq	%r14, %rsi
	movq	120(%rsp), %rdx
	movq	%r15, %rdi
	call	get_grid_area
.LVL472:
	.loc 1 366 0
	movq	216(%rsp), %r8
	movq	24(%rsp), %rsi
	movq	%r13, %rcx
	movq	16(%rsp), %rdi
	movq	%r12, %rdx
	call	get_grid_area
	.loc 1 368 0
	movq	%r12, %rdi
	call	free
	.loc 1 369 0
	movq	%r13, %rdi
	call	free
	movl	$0, 60(%rsp)
	jmp	.L327
	.cfi_endproc
.LFE31:
	.size	create_xgrid_2dx1d_order1, .-create_xgrid_2dx1d_order1
	.p2align 4,,15
.globl create_xgrid_2dx1d_order1_
	.type	create_xgrid_2dx1d_order1_, @function
create_xgrid_2dx1d_order1_:
.LFB30:
	.loc 1 329 0
	.cfi_startproc
.LVL473:
	.loc 1 332 0
	jmp	create_xgrid_2dx1d_order1
	.cfi_endproc
.LFE30:
	.size	create_xgrid_2dx1d_order1_, .-create_xgrid_2dx1d_order1_
	.p2align 4,,15
.globl create_xgrid_1dx2d_order2
	.type	create_xgrid_1dx2d_order2, @function
create_xgrid_1dx2d_order2:
.LFB29:
	.loc 1 240 0
	.cfi_startproc
.LVL474:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
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
	movq	%r9, %rbx
	subq	$1864, %rsp
	.cfi_def_cfa_offset 1920
	.loc 1 248 0
	movl	(%rdi), %eax
	.loc 1 240 0
	movq	%rdx, 24(%rsp)
	.loc 1 249 0
	movl	(%rsi), %edx
.LVL475:
	.loc 1 240 0
	movq	%rcx, 32(%rsp)
	movq	%r8, 240(%rsp)
	.loc 1 248 0
	movl	%eax, 180(%rsp)
.LVL476:
	.loc 1 250 0
	movq	24(%rsp), %rax
	.loc 1 249 0
	movl	%edx, 220(%rsp)
.LVL477:
	.loc 1 251 0
	movl	(%rcx), %edx
	.loc 1 254 0
	movl	180(%rsp), %ebp
	.loc 1 250 0
	movl	(%rax), %eax
	.loc 1 251 0
	movl	%edx, 156(%rsp)
	.loc 1 254 0
	addl	$1, %ebp
	.loc 1 250 0
	movl	%eax, 60(%rsp)
.LVL478:
	.loc 1 255 0
	addl	$1, %eax
	movl	%eax, 40(%rsp)
.LVL479:
	.loc 1 257 0
	movl	220(%rsp), %eax
.LVL480:
	imull	180(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
.LVL481:
	call	malloc
.LVL482:
	movq	%rax, 232(%rsp)
.LVL483:
	.loc 1 258 0
	movl	156(%rsp), %eax
.LVL484:
	imull	60(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 192(%rsp)
.LVL485:
	.loc 1 259 0
	movl	220(%rsp), %eax
.LVL486:
	addl	$1, %eax
	imull	%ebp, %eax
	cltq
	leaq	0(,%rax,8), %r13
	movq	%r13, %rdi
	call	malloc
	.loc 1 260 0
	movq	%r13, %rdi
	.loc 1 259 0
	movq	%rax, %r12
.LVL487:
	.loc 1 260 0
	call	malloc
.LVL488:
	.loc 1 261 0
	cmpl	$0, 220(%rsp)
	.loc 1 260 0
	movq	%rax, %r13
.LVL489:
	.loc 1 261 0
	js	.L346
	.loc 1 236 0
	movslq	%ebp, %rax
.LVL490:
	movq	%r15, 48(%rsp)
	movq	240(%rsp), %r15
.LVL491:
	leaq	0(,%rax,8), %r10
	mov	220(%rsp), %eax
	movq	%r12, %r8
	movq	%r13, %r9
	xorl	%esi, %esi
	leaq	8(,%rax,8), %r11
	mov	180(%rsp), %eax
	leaq	8(,%rax,8), %rbp
.LVL492:
.L347:
	.loc 1 261 0
	movl	180(%rsp), %edi
	testl	%edi, %edi
	js	.L350
	.loc 1 236 0
	movq	%r9, %rcx
	movq	%r8, %rdx
	xorl	%eax, %eax
.LVL493:
	.p2align 4,,10
	.p2align 3
.L348:
	.loc 1 262 0
	movq	(%r15,%rax), %rdi
	.loc 1 263 0
	addq	$8, %rax
	.loc 1 262 0
	movq	%rdi, (%rdx)
	.loc 1 263 0
	movq	(%rbx,%rsi), %rdi
	addq	$8, %rdx
	movq	%rdi, (%rcx)
	addq	$8, %rcx
	.loc 1 261 0
	cmpq	%rbp, %rax
	jne	.L348
.L350:
	addq	$8, %rsi
	addq	%r10, %r8
	addq	%r10, %r9
	cmpq	%r11, %rsi
	jne	.L347
	movq	48(%rsp), %r15
	.loc 1 265 0
	movq	232(%rsp), %r8
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	get_grid_area
	.loc 1 266 0
	movq	192(%rsp), %r8
	movq	1928(%rsp), %rcx
	movq	1920(%rsp), %rdx
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	get_grid_area
	.loc 1 267 0
	movq	%r12, %rdi
	call	free
	.loc 1 268 0
	movq	%r13, %rdi
	call	free
.LVL494:
	.loc 1 270 0
	cmpl	$0, 220(%rsp)
	movl	$0, 76(%rsp)
	jle	.L372
	.loc 1 236 0
	movslq	180(%rsp), %rax
	movq	1928(%rsp), %rdx
	movq	%rbx, 184(%rsp)
	movq	$0, 224(%rsp)
	movl	$0, 152(%rsp)
	salq	$3, %rax
	movq	%rax, 248(%rsp)
	movslq	40(%rsp), %rax
	leaq	8(%rdx,%rax,8), %rdx
	movq	%rax, 200(%rsp)
	movq	%rdx, 208(%rsp)
.LVL495:
.L352:
	.loc 1 270 0
	movl	180(%rsp), %edx
	testl	%edx, %edx
	jle	.L373
	movq	1936(%rsp), %rax
	addq	224(%rsp), %rax
	movq	240(%rsp), %rdx
	movl	$0, 148(%rsp)
	movq	%rax, 80(%rsp)
	movq	232(%rsp), %rax
	addq	224(%rsp), %rax
	movq	%rdx, 168(%rsp)
	movq	%rax, 96(%rsp)
.LVL496:
	.p2align 4,,10
	.p2align 3
.L371:
	movq	80(%rsp), %rax
	movsd	(%rax), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jbe	.L353
	.loc 1 272 0
	movq	168(%rsp), %rdx
	movq	184(%rsp), %rax
	.loc 1 274 0
	movl	156(%rsp), %ebx
	.loc 1 272 0
	movsd	(%rdx), %xmm0
	.loc 1 273 0
	movsd	8(%rdx), %xmm2
	.loc 1 274 0
	testl	%ebx, %ebx
	.loc 1 272 0
	movsd	%xmm0, 48(%rsp)
.LVL497:
	.loc 1 273 0
	movsd	8(%rax), %xmm4
	.loc 1 272 0
	movsd	(%rax), %xmm0
	.loc 1 273 0
	movsd	%xmm2, 40(%rsp)
	.loc 1 272 0
	movsd	%xmm0, 32(%rsp)
.LVL498:
	.loc 1 273 0
	movsd	%xmm4, 24(%rsp)
.LVL499:
	.loc 1 274 0
	jle	.L353
	.loc 1 236 0
	movq	200(%rsp), %rax
	movq	208(%rsp), %rdx
	movq	$0, 104(%rsp)
	movl	$1, 92(%rsp)
	salq	$3, %rax
	movq	%rdx, 112(%rsp)
	movq	%rax, 136(%rsp)
	movslq	60(%rsp), %rax
	salq	$3, %rax
	movq	%rax, 160(%rsp)
	movq	192(%rsp), %rax
	movq	%rax, 120(%rsp)
.LVL500:
	.p2align 4,,10
	.p2align 3
.L355:
	.loc 1 274 0
	movl	92(%rsp), %eax
	movl	60(%rsp), %ecx
	subl	$1, %eax
	testl	%ecx, %ecx
	movl	%eax, 132(%rsp)
.LVL501:
	movl	92(%rsp), %eax
	jle	.L370
	.loc 1 236 0
	movq	1928(%rsp), %rax
	movq	104(%rsp), %rdx
	xorl	%r14d, %r14d
	movq	1920(%rsp), %rbp
	movq	120(%rsp), %r15
	movq	112(%rsp), %r13
	movq	%rdx, %r12
	leaq	8(%rax,%rdx), %rbx
	addq	1920(%rsp), %r12
	subq	%rax, %rbp
	addq	112(%rsp), %rbp
	jmp	.L368
.LVL502:
	.p2align 4,,10
	.p2align 3
.L360:
	.loc 1 274 0
	addl	$1, %r14d
.LVL503:
	addq	$8, %rbx
	addq	$8, %r13
	addq	$8, %r12
	addq	$8, %rbp
	addq	$8, %r15
	cmpl	%r14d, 60(%rsp)
	jle	.L387
.LVL504:
.L368:
.LBB30:
	.loc 1 278 0
	movsd	-8(%rbx), %xmm0
	.loc 1 282 0
	movsd	32(%rsp), %xmm4
	.loc 1 278 0
	movsd	%xmm0, 1056(%rsp)
	.loc 1 282 0
	ucomisd	%xmm0, %xmm4
	.loc 1 279 0
	movsd	(%rbx), %xmm1
	movsd	%xmm1, 1064(%rsp)
	.loc 1 280 0
	movsd	0(%r13), %xmm2
	movsd	%xmm2, 1072(%rsp)
	.loc 1 281 0
	movsd	-8(%r13), %xmm3
	movsd	%xmm3, 1080(%rsp)
	.loc 1 282 0
	jb	.L356
	ucomisd	%xmm1, %xmm4
	jb	.L356
	ucomisd	%xmm2, %xmm4
	jb	.L356
	ucomisd	%xmm3, %xmm4
	jae	.L360
	.p2align 4,,10
	.p2align 3
.L356:
	.loc 1 284 0
	ucomisd	24(%rsp), %xmm0
	jb	.L361
	ucomisd	24(%rsp), %xmm1
	jb	.L361
	ucomisd	24(%rsp), %xmm2
	jb	.L361
	ucomisd	24(%rsp), %xmm3
	jae	.L360
	.p2align 4,,10
	.p2align 3
.L361:
	.loc 1 291 0
	movsd	48(%rsp), %xmm0
	.loc 1 287 0
	movq	(%r12), %rax
	.loc 1 291 0
	leaq	1056(%rsp), %rsi
	leaq	1456(%rsp), %rdi
	movl	$4, %edx
	addsd	40(%rsp), %xmm0
	.loc 1 287 0
	movq	%rax, 1456(%rsp)
	.loc 1 288 0
	movq	8(%r12), %rax
	movq	%rax, 1464(%rsp)
	.loc 1 289 0
	movq	0(%rbp), %rax
	.loc 1 291 0
	mulsd	.LC2(%rip), %xmm0
	.loc 1 289 0
	movq	%rax, 1472(%rsp)
	.loc 1 290 0
	movq	-8(%rbp), %rax
	movq	%rax, 1480(%rsp)
	.loc 1 291 0
	call	fix_lon
.LVL505:
	.loc 1 292 0
	leaq	1456(%rsp), %rsi
	movl	%eax, %edi
	movl	%eax, 8(%rsp)
	call	avgval_double
.LVL506:
	.loc 1 294 0
	movl	8(%rsp), %eax
	.loc 1 292 0
	movsd	%xmm0, 64(%rsp)
.LVL507:
	.loc 1 294 0
	leaq	256(%rsp), %r8
	leaq	656(%rsp), %rcx
	movsd	24(%rsp), %xmm3
	movsd	40(%rsp), %xmm2
	leaq	1056(%rsp), %rsi
	movsd	32(%rsp), %xmm1
	leaq	1456(%rsp), %rdi
	movsd	48(%rsp), %xmm0
.LVL508:
	movl	%eax, %edx
	call	clip
.LVL509:
	testl	%eax, %eax
	jle	.L360
	.loc 1 295 0
	leaq	256(%rsp), %rsi
	leaq	656(%rsp), %rdi
	movl	%eax, %edx
	movl	%eax, 8(%rsp)
	call	poly_area
.LVL510:
	movq	80(%rsp), %rdx
	.loc 1 297 0
	movl	8(%rsp), %eax
	.loc 1 295 0
	mulsd	(%rdx), %xmm0
.LVL511:
	.loc 1 296 0
	movq	96(%rsp), %rdx
	movsd	(%rdx), %xmm1
	minsd	(%r15), %xmm1
.LVL512:
	.loc 1 297 0
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	ucomisd	.LC14(%rip), %xmm2
	jbe	.L360
	.loc 1 298 0
	movslq	76(%rsp), %rcx
	movq	1976(%rsp), %rdx
	.loc 1 299 0
	leaq	256(%rsp), %rsi
	leaq	656(%rsp), %rdi
	.loc 1 298 0
	movsd	%xmm0, (%rdx,%rcx,8)
	.loc 1 299 0
	movl	%eax, %edx
	movq	%rcx, 16(%rsp)
	movsd	64(%rsp), %xmm0
.LVL513:
	call	poly_ctrlon
.LVL514:
	movq	16(%rsp), %rcx
	movq	1984(%rsp), %rdx
	.loc 1 300 0
	leaq	256(%rsp), %rsi
	movl	8(%rsp), %eax
	leaq	656(%rsp), %rdi
	.loc 1 299 0
	movsd	%xmm0, (%rdx,%rcx,8)
	.loc 1 300 0
	movl	%eax, %edx
	call	poly_ctrlat
	movq	16(%rsp), %rcx
	movq	1992(%rsp), %rax
	.loc 1 301 0
	movq	1944(%rsp), %rdx
	.loc 1 305 0
	addl	$1, 76(%rsp)
	.loc 1 300 0
	movsd	%xmm0, (%rax,%rcx,8)
	.loc 1 301 0
	movl	148(%rsp), %eax
	.loc 1 306 0
	cvtsi2sd	76(%rsp), %xmm0
	.loc 1 301 0
	movl	%eax, (%rdx,%rcx,4)
	.loc 1 302 0
	movl	152(%rsp), %eax
	movq	1952(%rsp), %rdx
	.loc 1 306 0
	ucomisd	.LC15(%rip), %xmm0
	.loc 1 302 0
	movl	%eax, (%rdx,%rcx,4)
	.loc 1 303 0
	movq	1960(%rsp), %rdx
	.loc 1 304 0
	movq	1968(%rsp), %rax
	.loc 1 303 0
	movl	%r14d, (%rdx,%rcx,4)
	.loc 1 304 0
	movl	132(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	.loc 1 306 0
	jbe	.L360
	movl	$.LC16, %edi
	call	error_handler
	jmp	.L360
.LVL515:
	.p2align 4,,10
	.p2align 3
.L387:
.LBE30:
	.loc 1 274 0
	movl	92(%rsp), %eax
.LVL516:
.L370:
	movq	136(%rsp), %rdx
	addl	$1, 92(%rsp)
	addq	%rdx, 104(%rsp)
	addq	%rdx, 112(%rsp)
	movq	160(%rsp), %rdx
	addq	%rdx, 120(%rsp)
	cmpl	%eax, 156(%rsp)
	jg	.L355
.LVL517:
.L353:
	.loc 1 270 0
	addl	$1, 148(%rsp)
.LVL518:
	addq	$8, 80(%rsp)
	movl	148(%rsp), %edx
	addq	$8, 168(%rsp)
	addq	$8, 96(%rsp)
	cmpl	%edx, 180(%rsp)
	jg	.L371
.LVL519:
.L373:
	addl	$1, 152(%rsp)
.LVL520:
	movq	248(%rsp), %rax
	addq	$8, 184(%rsp)
	movl	152(%rsp), %edx
	addq	%rax, 224(%rsp)
	cmpl	%edx, 220(%rsp)
	jg	.L352
.LVL521:
.L372:
	.loc 1 311 0
	movq	232(%rsp), %rdi
	call	free
	.loc 1 312 0
	movq	192(%rsp), %rdi
	call	free
	.loc 1 316 0
	movl	76(%rsp), %eax
	addq	$1864, %rsp
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
.LVL522:
.L346:
	.cfi_restore_state
	.loc 1 265 0
	movq	232(%rsp), %r8
	movq	%rax, %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	get_grid_area
.LVL523:
	.loc 1 266 0
	movq	192(%rsp), %r8
	movq	1928(%rsp), %rcx
	movq	1920(%rsp), %rdx
	movq	32(%rsp), %rsi
	movq	24(%rsp), %rdi
	call	get_grid_area
	.loc 1 267 0
	movq	%r12, %rdi
	call	free
	.loc 1 268 0
	movq	%r13, %rdi
	call	free
	movl	$0, 76(%rsp)
	jmp	.L372
	.cfi_endproc
.LFE29:
	.size	create_xgrid_1dx2d_order2, .-create_xgrid_1dx2d_order2
	.p2align 4,,15
.globl create_xgrid_1dx2d_order2_
	.type	create_xgrid_1dx2d_order2_, @function
create_xgrid_1dx2d_order2_:
.LFB28:
	.loc 1 229 0
	.cfi_startproc
.LVL524:
	.loc 1 231 0
	jmp	create_xgrid_1dx2d_order2
	.cfi_endproc
.LFE28:
	.size	create_xgrid_1dx2d_order2_, .-create_xgrid_1dx2d_order2_
	.p2align 4,,15
.globl get_grid_area_no_adjust
	.type	get_grid_area_no_adjust, @function
get_grid_area_no_adjust:
.LFB25:
	.loc 1 92 0
	.cfi_startproc
.LVL525:
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
	subq	$408, %rsp
	.cfi_def_cfa_offset 464
	.loc 1 96 0
	movl	(%rdi), %edi
.LVL526:
	.loc 1 97 0
	movl	(%rsi), %esi
.LVL527:
	.loc 1 98 0
	movl	%edi, %eax
	.loc 1 96 0
	movl	%edi, 4(%rsp)
.LVL528:
	.loc 1 97 0
	movl	%esi, 68(%rsp)
.LVL529:
	.loc 1 98 0
	addl	$1, %eax
.LVL530:
	.loc 1 100 0
	testl	%esi, %esi
	jle	.L396
	.loc 1 91 0
	cltq
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	leaq	0(,%rax,8), %rbx
	leaq	8(,%rax,8), %rax
.LVL531:
	movl	$1, 20(%rsp)
	movq	%rbx, 8(%rsp)
	leaq	8(%rdx), %rbx
	addq	%rax, %rdx
.LVL532:
	addq	%rcx, %rax
	movq	%rdx, 48(%rsp)
	movq	%rax, 40(%rsp)
	movslq	%edi, %rax
	movq	%rbx, 56(%rsp)
	salq	$3, %rax
	movq	%rax, 72(%rsp)
.LVL533:
	.p2align 4,,10
	.p2align 3
.L392:
	.loc 1 100 0
	movl	4(%rsp), %ebp
	movl	20(%rsp), %eax
	testl	%ebp, %ebp
	jle	.L395
	.loc 1 91 0
	movq	32(%rsp), %r15
	movq	40(%rsp), %r13
	xorl	%r14d, %r14d
	movq	24(%rsp), %r12
	movq	48(%rsp), %rbp
	movq	56(%rsp), %rbx
.LVL534:
	.p2align 4,,10
	.p2align 3
.L393:
	.loc 1 101 0
	movq	-8(%rbx), %rax
	.loc 1 110 0
	leaq	80(%rsp), %rsi
	leaq	240(%rsp), %rdi
	movl	$4, %edx
	.loc 1 100 0
	addl	$1, %r14d
	.loc 1 101 0
	movq	%rax, 240(%rsp)
	.loc 1 102 0
	movq	(%rbx), %rax
	.loc 1 100 0
	addq	$8, %rbx
	.loc 1 102 0
	movq	%rax, 248(%rsp)
	.loc 1 103 0
	movq	0(%rbp), %rax
	movq	%rax, 256(%rsp)
	.loc 1 104 0
	movq	-8(%rbp), %rax
	.loc 1 100 0
	addq	$8, %rbp
	.loc 1 104 0
	movq	%rax, 264(%rsp)
	.loc 1 105 0
	movq	(%r12), %rax
	movq	%rax, 80(%rsp)
	.loc 1 106 0
	movq	8(%r12), %rax
	.loc 1 100 0
	addq	$8, %r12
	.loc 1 106 0
	movq	%rax, 88(%rsp)
	.loc 1 107 0
	movq	0(%r13), %rax
	movq	%rax, 96(%rsp)
	.loc 1 108 0
	movq	-8(%r13), %rax
	.loc 1 100 0
	addq	$8, %r13
	.loc 1 108 0
	movq	%rax, 104(%rsp)
.LVL535:
	.loc 1 110 0
	call	poly_area_no_adjust
.LVL536:
	movsd	%xmm0, (%r15)
	.loc 1 100 0
	addq	$8, %r15
	cmpl	%r14d, 4(%rsp)
	jg	.L393
	movl	20(%rsp), %eax
.LVL537:
.L395:
	movq	8(%rsp), %rdx
	addl	$1, 20(%rsp)
	addq	%rdx, 56(%rsp)
	movq	72(%rsp), %rbx
	addq	%rdx, 48(%rsp)
	addq	%rdx, 24(%rsp)
	addq	%rdx, 40(%rsp)
	addq	%rbx, 32(%rsp)
	cmpl	%eax, 68(%rsp)
	jg	.L392
.LVL538:
.L396:
	.loc 1 113 0
	addq	$408, %rsp
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
	.cfi_endproc
.LFE25:
	.size	get_grid_area_no_adjust, .-get_grid_area_no_adjust
	.p2align 4,,15
.globl create_xgrid_1dx2d_order1
	.type	create_xgrid_1dx2d_order1, @function
create_xgrid_1dx2d_order1:
.LFB27:
	.loc 1 137 0
	.cfi_startproc
.LVL539:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
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
	movq	%r9, %rbx
	subq	$1832, %rsp
	.cfi_def_cfa_offset 1888
	.loc 1 145 0
	movl	(%rdi), %eax
	.loc 1 137 0
	movq	%rcx, 16(%rsp)
	movq	%rdx, 8(%rsp)
	.loc 1 146 0
	movl	(%rsi), %edx
.LVL540:
	.loc 1 147 0
	movq	8(%rsp), %rcx
.LVL541:
	.loc 1 145 0
	movl	%eax, 148(%rsp)
.LVL542:
	.loc 1 148 0
	movq	16(%rsp), %rax
	.loc 1 137 0
	movq	%r8, 208(%rsp)
	.loc 1 151 0
	movl	148(%rsp), %ebp
	.loc 1 147 0
	movl	(%rcx), %ecx
	.loc 1 146 0
	movl	%edx, 188(%rsp)
.LVL543:
	.loc 1 148 0
	movl	(%rax), %eax
	.loc 1 151 0
	addl	$1, %ebp
	.loc 1 147 0
	movl	%ecx, 40(%rsp)
.LVL544:
	.loc 1 152 0
	addl	$1, %ecx
	.loc 1 148 0
	movl	%eax, 124(%rsp)
.LVL545:
	.loc 1 154 0
	movl	148(%rsp), %eax
	.loc 1 152 0
	movl	%ecx, 24(%rsp)
.LVL546:
	.loc 1 154 0
	imull	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdi
.LVL547:
	call	malloc
.LVL548:
	movq	%rax, 200(%rsp)
.LVL549:
	.loc 1 155 0
	movl	124(%rsp), %eax
.LVL550:
	imull	40(%rsp), %eax
	cltq
	leaq	0(,%rax,8), %rdi
	call	malloc
	movq	%rax, 160(%rsp)
.LVL551:
	.loc 1 156 0
	movl	188(%rsp), %eax
.LVL552:
	addl	$1, %eax
	imull	%ebp, %eax
	cltq
	leaq	0(,%rax,8), %r13
	movq	%r13, %rdi
	call	malloc
	.loc 1 157 0
	movq	%r13, %rdi
	.loc 1 156 0
	movq	%rax, %r12
.LVL553:
	.loc 1 157 0
	call	malloc
.LVL554:
	.loc 1 158 0
	cmpl	$0, 188(%rsp)
	.loc 1 157 0
	movq	%rax, %r13
.LVL555:
	.loc 1 158 0
	js	.L399
	.loc 1 133 0
	movslq	%ebp, %rax
.LVL556:
	movq	%r15, 32(%rsp)
	movq	208(%rsp), %r15
.LVL557:
	leaq	0(,%rax,8), %r10
	mov	188(%rsp), %eax
	movq	%r12, %r8
	movq	%r13, %r9
	xorl	%edi, %edi
	leaq	8(,%rax,8), %r11
	mov	148(%rsp), %eax
	leaq	8(,%rax,8), %rbp
.LVL558:
.L400:
	.loc 1 158 0
	movl	148(%rsp), %eax
	testl	%eax, %eax
	js	.L402
	.loc 1 133 0
	movq	%r9, %rcx
	movq	%r8, %rdx
	xorl	%eax, %eax
.LVL559:
	.p2align 4,,10
	.p2align 3
.L401:
	.loc 1 159 0
	movq	(%r15,%rax), %rsi
	.loc 1 160 0
	addq	$8, %rax
	.loc 1 159 0
	movq	%rsi, (%rdx)
	.loc 1 160 0
	movq	(%rbx,%rdi), %rsi
	addq	$8, %rdx
	movq	%rsi, (%rcx)
	addq	$8, %rcx
	.loc 1 158 0
	cmpq	%rbp, %rax
	jne	.L401
.L402:
	addq	$8, %rdi
	addq	%r10, %r8
	addq	%r10, %r9
	cmpq	%r11, %rdi
	jne	.L400
	movq	32(%rsp), %r15
.LVL560:
.L399:
	.loc 1 163 0
	cmpl	$1, 148(%rsp)
	jle	.L403
	.loc 1 164 0
	movq	200(%rsp), %r8
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	get_grid_area
.L404:
	.loc 1 168 0
	movq	160(%rsp), %r8
	movq	1896(%rsp), %rcx
	movq	1888(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	8(%rsp), %rdi
	call	get_grid_area
	.loc 1 169 0
	movq	%r12, %rdi
	call	free
	.loc 1 170 0
	movq	%r13, %rdi
	call	free
.LVL561:
	.loc 1 172 0
	cmpl	$0, 188(%rsp)
	movl	$0, 44(%rsp)
	jle	.L426
	.loc 1 133 0
	movslq	24(%rsp), %rdx
	movslq	148(%rsp), %rax
	movq	1896(%rsp), %rcx
	movq	%rbx, 152(%rsp)
	movq	$0, 192(%rsp)
	movl	$0, 108(%rsp)
	leaq	8(%rcx,%rdx,8), %rcx
	salq	$3, %rax
	movq	%rdx, 168(%rsp)
	movq	%rax, 216(%rsp)
	movq	%rcx, 176(%rsp)
.LVL562:
.L406:
	.loc 1 172 0
	movl	148(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L427
	movq	1904(%rsp), %rax
	movq	200(%rsp), %rcx
	addq	192(%rsp), %rax
	addq	192(%rsp), %rcx
	movq	208(%rsp), %rdx
	movl	$0, 104(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rcx, 64(%rsp)
.LVL563:
	.p2align 4,,10
	.p2align 3
.L425:
	movq	48(%rsp), %rax
	movsd	(%rax), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jbe	.L407
	.loc 1 174 0
	movq	136(%rsp), %rdx
	movq	152(%rsp), %rax
	.loc 1 176 0
	movl	124(%rsp), %r10d
	.loc 1 174 0
	movsd	(%rdx), %xmm0
	.loc 1 175 0
	movsd	8(%rdx), %xmm2
	.loc 1 176 0
	testl	%r10d, %r10d
	.loc 1 174 0
	movsd	%xmm0, 32(%rsp)
.LVL564:
	.loc 1 175 0
	movsd	8(%rax), %xmm4
	.loc 1 174 0
	movsd	(%rax), %xmm0
	.loc 1 175 0
	movsd	%xmm2, 24(%rsp)
	.loc 1 174 0
	movsd	%xmm0, 16(%rsp)
.LVL565:
	.loc 1 175 0
	movsd	%xmm4, 8(%rsp)
.LVL566:
	.loc 1 176 0
	jle	.L407
	.loc 1 133 0
	movq	168(%rsp), %rax
	movq	176(%rsp), %rdx
	movq	160(%rsp), %rcx
	movq	$0, 72(%rsp)
	movl	$1, 60(%rsp)
	salq	$3, %rax
	movq	%rdx, 80(%rsp)
	movq	%rax, 112(%rsp)
	movslq	40(%rsp), %rax
	movq	%rcx, 96(%rsp)
	salq	$3, %rax
	movq	%rax, 128(%rsp)
.LVL567:
	.p2align 4,,10
	.p2align 3
.L409:
	.loc 1 176 0
	movl	60(%rsp), %eax
	movl	40(%rsp), %r9d
	subl	$1, %eax
	testl	%r9d, %r9d
	movl	%eax, 92(%rsp)
.LVL568:
	movl	60(%rsp), %eax
	jle	.L424
	.loc 1 133 0
	movq	1896(%rsp), %rcx
	movq	72(%rsp), %rdx
	xorl	%r14d, %r14d
	movq	1888(%rsp), %rbp
	movq	96(%rsp), %r15
	movq	80(%rsp), %r13
	movq	%rdx, %r12
	addq	1888(%rsp), %r12
	leaq	8(%rcx,%rdx), %rbx
	subq	%rcx, %rbp
	addq	80(%rsp), %rbp
.LVL569:
	.p2align 4,,10
	.p2align 3
.L422:
.LBB31:
	.loc 1 180 0
	movsd	-8(%rbx), %xmm0
	.loc 1 184 0
	movsd	16(%rsp), %xmm4
	.loc 1 180 0
	movsd	%xmm0, 1024(%rsp)
	.loc 1 184 0
	ucomisd	%xmm0, %xmm4
	.loc 1 181 0
	movsd	(%rbx), %xmm1
	movsd	%xmm1, 1032(%rsp)
	.loc 1 182 0
	movsd	0(%r13), %xmm2
	movsd	%xmm2, 1040(%rsp)
	.loc 1 183 0
	movsd	-8(%r13), %xmm3
	movsd	%xmm3, 1048(%rsp)
	.loc 1 184 0
	jb	.L410
	ucomisd	%xmm1, %xmm4
	jb	.L410
	ucomisd	%xmm2, %xmm4
	jb	.L410
	ucomisd	%xmm3, %xmm4
	jae	.L414
	.p2align 4,,10
	.p2align 3
.L410:
	.loc 1 186 0
	ucomisd	8(%rsp), %xmm0
	jb	.L415
	ucomisd	8(%rsp), %xmm1
	jb	.L415
	ucomisd	8(%rsp), %xmm2
	jb	.L415
	ucomisd	8(%rsp), %xmm3
	jae	.L414
	.p2align 4,,10
	.p2align 3
.L415:
	.loc 1 193 0
	movsd	32(%rsp), %xmm0
	.loc 1 189 0
	movq	(%r12), %rax
	.loc 1 193 0
	leaq	1024(%rsp), %rsi
	leaq	1424(%rsp), %rdi
	movl	$4, %edx
	addsd	24(%rsp), %xmm0
	.loc 1 189 0
	movq	%rax, 1424(%rsp)
	.loc 1 190 0
	movq	8(%r12), %rax
	movq	%rax, 1432(%rsp)
	.loc 1 191 0
	movq	0(%rbp), %rax
	.loc 1 193 0
	mulsd	.LC2(%rip), %xmm0
	.loc 1 191 0
	movq	%rax, 1440(%rsp)
	.loc 1 192 0
	movq	-8(%rbp), %rax
	movq	%rax, 1448(%rsp)
	.loc 1 193 0
	call	fix_lon
.LVL570:
	.loc 1 195 0
	leaq	224(%rsp), %r8
	leaq	624(%rsp), %rcx
	leaq	1024(%rsp), %rsi
	movsd	8(%rsp), %xmm3
	leaq	1424(%rsp), %rdi
	movsd	24(%rsp), %xmm2
	movl	%eax, %edx
	movsd	16(%rsp), %xmm1
	movsd	32(%rsp), %xmm0
	call	clip
.LVL571:
	testl	%eax, %eax
	jle	.L414
	.loc 1 196 0
	leaq	224(%rsp), %rsi
	leaq	624(%rsp), %rdi
	movl	%eax, %edx
	call	poly_area
.LVL572:
	movq	48(%rsp), %rax
	.loc 1 197 0
	movq	64(%rsp), %rdx
	.loc 1 196 0
	mulsd	(%rax), %xmm0
.LVL573:
	.loc 1 197 0
	movsd	(%rdx), %xmm1
	minsd	(%r15), %xmm1
.LVL574:
	.loc 1 198 0
	movapd	%xmm0, %xmm2
	divsd	%xmm1, %xmm2
	ucomisd	.LC14(%rip), %xmm2
	jbe	.L414
	.loc 1 199 0
	movslq	44(%rsp), %rax
	movq	1944(%rsp), %rdx
	.loc 1 200 0
	movq	1912(%rsp), %rcx
	.loc 1 204 0
	addl	$1, 44(%rsp)
	.loc 1 199 0
	movsd	%xmm0, (%rdx,%rax,8)
	.loc 1 200 0
	movl	104(%rsp), %edx
	.loc 1 205 0
	cvtsi2sd	44(%rsp), %xmm0
.LVL575:
	ucomisd	.LC15(%rip), %xmm0
	.loc 1 200 0
	movl	%edx, (%rcx,%rax,4)
	.loc 1 201 0
	movl	108(%rsp), %edx
	movq	1920(%rsp), %rcx
	movl	%edx, (%rcx,%rax,4)
	.loc 1 202 0
	movq	1928(%rsp), %rcx
	.loc 1 203 0
	movq	1936(%rsp), %rdx
	.loc 1 202 0
	movl	%r14d, (%rcx,%rax,4)
	.loc 1 203 0
	movl	92(%rsp), %ecx
	movl	%ecx, (%rdx,%rax,4)
	.loc 1 205 0
	ja	.L442
.LVL576:
	.p2align 4,,10
	.p2align 3
.L414:
.LBE31:
	.loc 1 176 0
	addl	$1, %r14d
.LVL577:
	addq	$8, %rbx
	addq	$8, %r13
	addq	$8, %r12
	addq	$8, %rbp
	addq	$8, %r15
	cmpl	%r14d, 40(%rsp)
	jg	.L422
	movl	60(%rsp), %eax
.LVL578:
.L424:
	movq	112(%rsp), %rdx
	addl	$1, 60(%rsp)
	addq	%rdx, 72(%rsp)
	movq	128(%rsp), %rcx
	addq	%rdx, 80(%rsp)
	addq	%rcx, 96(%rsp)
	cmpl	%eax, 124(%rsp)
	jg	.L409
.LVL579:
.L407:
	.loc 1 172 0
	addl	$1, 104(%rsp)
.LVL580:
	addq	$8, 48(%rsp)
	movl	104(%rsp), %eax
	addq	$8, 136(%rsp)
	addq	$8, 64(%rsp)
	cmpl	%eax, 148(%rsp)
	jg	.L425
.LVL581:
.L427:
	addl	$1, 108(%rsp)
.LVL582:
	movq	216(%rsp), %rdx
	addq	$8, 152(%rsp)
	movl	108(%rsp), %ecx
	addq	%rdx, 192(%rsp)
	cmpl	%ecx, 188(%rsp)
	jg	.L406
.LVL583:
.L426:
	.loc 1 211 0
	movq	200(%rsp), %rdi
	call	free
	.loc 1 212 0
	movq	160(%rsp), %rdi
	call	free
	.loc 1 216 0
	movl	44(%rsp), %eax
	addq	$1832, %rsp
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
.LVL584:
	.p2align 4,,10
	.p2align 3
.L442:
	.cfi_restore_state
.LBB32:
	.loc 1 205 0
	movl	$.LC16, %edi
	call	error_handler
.LVL585:
	jmp	.L414
.LVL586:
.L403:
.LBE32:
	.loc 1 166 0
	movq	200(%rsp), %r8
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	get_grid_area_no_adjust
	jmp	.L404
	.cfi_endproc
.LFE27:
	.size	create_xgrid_1dx2d_order1, .-create_xgrid_1dx2d_order1
	.p2align 4,,15
.globl create_xgrid_1dx2d_order1_
	.type	create_xgrid_1dx2d_order1_, @function
create_xgrid_1dx2d_order1_:
.LFB26:
	.loc 1 124 0
	.cfi_startproc
.LVL587:
	.loc 1 127 0
	jmp	create_xgrid_1dx2d_order1
	.cfi_endproc
.LFE26:
	.size	create_xgrid_1dx2d_order1_, .-create_xgrid_1dx2d_order1_
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	2167269905
	.long	1030854553
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	1413754136
	.long	1074340347
	.align 8
.LC4:
	.long	1413754136
	.long	1075388923
	.align 8
.LC5:
	.long	1413754136
	.long	-1073143301
	.align 8
.LC6:
	.long	1413754136
	.long	-1074191877
	.align 8
.LC7:
	.long	1413754136
	.long	1073291771
	.align 8
.LC8:
	.long	0
	.long	-1075838976
	.align 8
.LC9:
	.long	0
	.long	1096306094
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC10:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	3654794683
	.long	1037794527
	.align 8
.LC12:
	.long	4276863648
	.long	968116299
	.align 8
.LC14:
	.long	2696277389
	.long	1051772663
	.align 8
.LC15:
	.long	0
	.long	1097011920
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL14-.Ltext0
	.quad	.LVL20-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LVL0-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL14-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LVL0-.Ltext0
	.quad	.LVL5-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LVL0-.Ltext0
	.quad	.LVL4-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL6-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL14-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LVL0-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL14-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LVL0-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL14-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LVL1-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.quad	.LVL3-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL10-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL14-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL16-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0xb
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x1a0
	.byte	0x1c
	.quad	.LVL19-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL26-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL28-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL30-.Ltext0
	.quad	.LVL32-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL32-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.quad	.LVL34-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL41-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL44-.Ltext0
	.quad	.LVL45-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL46-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0xb
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x1a0
	.byte	0x1c
	.quad	.LVL48-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL53-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL55-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LVL2-.Ltext0
	.quad	.LVL3-.Ltext0
	.value	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x74
	.sleb128 0
	.byte	0x22
	.quad	.LVL3-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL10-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL14-.Ltext0
	.quad	.LVL16-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL17-.Ltext0
	.quad	.LVL19-.Ltext0
	.value	0xb
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x330
	.byte	0x1c
	.quad	.LVL19-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL26-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL28-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	.LVL30-.Ltext0
	.quad	.LVL31-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL32-.Ltext0
	.quad	.LVL34-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.quad	.LVL34-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL41-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL44-.Ltext0
	.quad	.LVL46-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL46-.Ltext0
	.quad	.LVL48-.Ltext0
	.value	0xb
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x330
	.byte	0x1c
	.quad	.LVL48-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL53-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL55-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LVL2-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL18-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL27-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL30-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL40-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL44-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL47-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL54-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LVL2-.Ltext0
	.quad	.LVL6-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL7-.Ltext0
	.quad	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL8-.Ltext0
	.quad	.LVL9-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL14-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL18-.Ltext0
	.quad	.LVL22-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL24-.Ltext0
	.quad	.LVL25-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL25-.Ltext0
	.quad	.LVL26-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL26-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL30-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL33-.Ltext0
	.quad	.LVL35-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL37-.Ltext0
	.quad	.LVL38-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL38-.Ltext0
	.quad	.LVL39-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL44-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL47-.Ltext0
	.quad	.LVL49-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL51-.Ltext0
	.quad	.LVL52-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL52-.Ltext0
	.quad	.LVL53-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL53-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL14-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL30-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL44-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LVL9-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL14-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL15-.Ltext0
	.quad	.LVL18-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL18-.Ltext0
	.quad	.LVL23-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL26-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL28-.Ltext0
	.quad	.LVL30-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL30-.Ltext0
	.quad	.LVL33-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL33-.Ltext0
	.quad	.LVL36-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL39-.Ltext0
	.quad	.LVL41-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL41-.Ltext0
	.quad	.LVL44-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL44-.Ltext0
	.quad	.LVL47-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL47-.Ltext0
	.quad	.LVL50-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	.LVL53-.Ltext0
	.quad	.LVL55-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL55-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LVL6-.Ltext0
	.quad	.LVL10-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL11-.Ltext0
	.quad	.LVL12-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL12-.Ltext0
	.quad	.LVL13-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL14-.Ltext0
	.quad	.LVL15-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL15-.Ltext0
	.quad	.LVL21-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL22-.Ltext0
	.quad	.LVL28-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL29-.Ltext0
	.quad	.LVL42-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL43-.Ltext0
	.quad	.LVL56-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL57-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LVL58-.Ltext0
	.quad	.LVL61-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LVL58-.Ltext0
	.quad	.LVL60-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LVL58-.Ltext0
	.quad	.LVL59-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LVL58-.Ltext0
	.quad	.LVL62-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LVL63-.Ltext0
	.quad	.LFE46-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LVL64-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST19:
	.quad	.LVL64-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST20:
	.quad	.LVL64-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST21:
	.quad	.LVL64-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	0x0
	.quad	0x0
.LLST22:
	.quad	.LVL64-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	0x0
	.quad	0x0
.LLST23:
	.quad	.LVL64-.Ltext0
	.quad	.LVL71-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	0x0
	.quad	0x0
.LLST24:
	.quad	.LVL65-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL71-.Ltext0
	.quad	.LFE45-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST25:
	.quad	.LVL64-.Ltext0
	.quad	.LVL65-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL69-.Ltext0
	.quad	.LVL70-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST26:
	.quad	.LVL65-.Ltext0
	.quad	.LVL66-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL67-.Ltext0
	.quad	.LVL68-.Ltext0
	.value	0x1
	.byte	0x5a
	.quad	0x0
	.quad	0x0
.LLST27:
	.quad	.LVL72-.Ltext0
	.quad	.LVL73-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL73-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -8
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST28:
	.quad	.LVL72-.Ltext0
	.quad	.LVL74-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL74-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x3
	.byte	0x74
	.sleb128 -8
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST29:
	.quad	.LVL72-.Ltext0
	.quad	.LVL75-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL75-.Ltext0
	.quad	.LVL77-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -8
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST30:
	.quad	.LVL72-.Ltext0
	.quad	.LVL83-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL83-1-.Ltext0
	.quad	.LVL84-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST31:
	.quad	.LVL72-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL76-.Ltext0
	.quad	.LVL83-1-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL83-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST32:
	.quad	.LVL72-.Ltext0
	.quad	.LVL76-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL76-.Ltext0
	.quad	.LVL78-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL78-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x3
	.byte	0x7b
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL82-.Ltext0
	.quad	.LVL83-1-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	0x0
	.quad	0x0
.LLST33:
	.quad	.LVL78-.Ltext0
	.quad	.LVL79-.Ltext0
	.value	0x1
	.byte	0x5b
	.quad	.LVL79-.Ltext0
	.quad	.LVL80-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL80-.Ltext0
	.quad	.LVL81-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL81-.Ltext0
	.quad	.LVL82-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST34:
	.quad	.LVL85-.Ltext0
	.quad	.LVL86-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL86-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0x0
	.quad	0x0
.LLST35:
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST36:
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL87-1-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0x0
	.quad	0x0
.LLST37:
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-1-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL87-1-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST38:
	.quad	.LVL85-.Ltext0
	.quad	.LVL87-1-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST39:
	.quad	.LVL88-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL113-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL134-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0x0
	.quad	0x0
.LLST40:
	.quad	.LVL88-.Ltext0
	.quad	.LVL113-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	.LVL113-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	.LVL134-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0x0
	.quad	0x0
.LLST41:
	.quad	.LVL89-.Ltext0
	.quad	.LVL112-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	.LVL114-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST42:
	.quad	.LVL88-.Ltext0
	.quad	.LVL112-1-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -208
	.quad	.LVL113-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL134-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -208
	.quad	0x0
	.quad	0x0
.LLST43:
	.quad	.LVL93-.Ltext0
	.quad	.LVL94-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL94-.Ltext0
	.quad	.LVL103-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL105-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL107-.Ltext0
	.quad	.LVL108-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL108-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL117-.Ltext0
	.quad	.LVL118-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL118-.Ltext0
	.quad	.LVL122-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL126-.Ltext0
	.quad	.LVL131-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL133-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST44:
	.quad	.LVL96-.Ltext0
	.quad	.LVL97-.Ltext0
	.value	0x1
	.byte	0x67
	.quad	.LVL97-.Ltext0
	.quad	.LVL100-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	.LVL100-.Ltext0
	.quad	.LVL102-.Ltext0
	.value	0x1
	.byte	0x6d
	.quad	.LVL105-.Ltext0
	.quad	.LVL106-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL106-.Ltext0
	.quad	.LVL107-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	.LVL109-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	.LVL119-.Ltext0
	.quad	.LVL120-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -128
	.quad	.LVL120-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL126-.Ltext0
	.quad	.LVL128-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL128-.Ltext0
	.quad	.LVL129-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL133-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL134-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST45:
	.quad	.LVL90-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	.LVL115-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	.LVL126-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	0x0
	.quad	0x0
.LLST46:
	.quad	.LVL90-.Ltext0
	.quad	.LVL110-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	.LVL115-.Ltext0
	.quad	.LVL123-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	.LVL126-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	0x0
	.quad	0x0
.LLST47:
	.quad	.LVL99-.Ltext0
	.quad	.LVL101-.Ltext0
	.value	0x1
	.byte	0x6e
	.quad	.LVL127-.Ltext0
	.quad	.LVL130-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST48:
	.quad	.LVL85-.Ltext0
	.quad	.LVL104-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL104-.Ltext0
	.quad	.LVL105-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL105-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL111-.Ltext0
	.quad	.LVL112-1-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	.LVL124-.Ltext0
	.quad	.LVL125-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL132-.Ltext0
	.quad	.LVL133-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL134-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	0x0
	.quad	0x0
.LLST49:
	.quad	.LVL85-.Ltext0
	.quad	.LVL111-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL111-.Ltext0
	.quad	.LVL124-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL124-.Ltext0
	.quad	.LVL126-.Ltext0
	.value	0x2
	.byte	0x32
	.byte	0x9f
	.quad	.LVL126-.Ltext0
	.quad	.LVL134-.Ltext0
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL134-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST50:
	.quad	.LVL135-.Ltext0
	.quad	.LVL139-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST51:
	.quad	.LVL135-.Ltext0
	.quad	.LVL140-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST52:
	.quad	.LVL135-.Ltext0
	.quad	.LVL136-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST53:
	.quad	.LVL135-.Ltext0
	.quad	.LVL140-1-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL140-1-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0x0
	.quad	0x0
.LLST54:
	.quad	.LVL136-.Ltext0
	.quad	.LVL140-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL141-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0x0
	.quad	0x0
.LLST55:
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL147-.Ltext0
	.quad	.LVL174-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST56:
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL147-.Ltext0
	.quad	.LVL175-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST57:
	.quad	.LVL145-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL147-.Ltext0
	.quad	.LVL173-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST58:
	.quad	.LVL145-.Ltext0
	.quad	.LVL146-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL146-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0x0
	.quad	0x0
.LLST59:
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	.LVL171-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST60:
	.quad	.LVL146-.Ltext0
	.quad	.LVL147-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL150-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL171-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST61:
	.quad	.LVL147-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0xa
	.byte	0x73
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL152-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0xa
	.byte	0x73
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST62:
	.quad	.LVL153-.Ltext0
	.quad	.LVL156-1-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST63:
	.quad	.LVL153-.Ltext0
	.quad	.LVL156-1-.Ltext0
	.value	0x5
	.byte	0x7d
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST64:
	.quad	.LVL147-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL155-.Ltext0
	.quad	.LVL156-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL158-.Ltext0
	.quad	.LVL169-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST65:
	.quad	.LVL147-.Ltext0
	.quad	.LVL151-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	.LVL154-.Ltext0
	.quad	.LVL156-1-.Ltext0
	.value	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x7e
	.sleb128 0
	.byte	0x22
	.quad	.LVL156-1-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -112
	.quad	0x0
	.quad	0x0
.LLST66:
	.quad	.LVL154-.Ltext0
	.quad	.LVL156-1-.Ltext0
	.value	0x5
	.byte	0x7e
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST67:
	.quad	.LVL147-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL160-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST68:
	.quad	.LVL147-.Ltext0
	.quad	.LVL150-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL163-.Ltext0
	.quad	.LVL168-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST69:
	.quad	.LVL147-.Ltext0
	.quad	.LVL148-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL157-.Ltext0
	.quad	.LVL172-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST70:
	.quad	.LVL147-.Ltext0
	.quad	.LVL149-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	.LVL157-.Ltext0
	.quad	.LVL170-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST71:
	.quad	.LVL166-.Ltext0
	.quad	.LVL167-.Ltext0
	.value	0x1
	.byte	0x6d
	.quad	0x0
	.quad	0x0
.LLST72:
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL177-.Ltext0
	.quad	.LVL195-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST73:
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL177-.Ltext0
	.quad	.LVL196-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST74:
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL177-.Ltext0
	.quad	.LVL194-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST75:
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x0
	.long	0x0
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST76:
	.quad	.LVL176-.Ltext0
	.quad	.LVL177-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL184-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL192-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST77:
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL178-1-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0xa
	.byte	0x73
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL186-.Ltext0
	.quad	.LVL193-.Ltext0
	.value	0xa
	.byte	0x73
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST78:
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL183-.Ltext0
	.quad	.LVL185-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL187-.Ltext0
	.quad	.LVL191-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST79:
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL179-.Ltext0
	.quad	.LVL180-1-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL187-.Ltext0
	.quad	.LVL191-1-.Ltext0
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
.LLST80:
	.quad	.LVL177-.Ltext0
	.quad	.LVL178-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL181-.Ltext0
	.quad	.LVL182-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	.LVL187-.Ltext0
	.quad	.LVL190-.Ltext0
	.value	0x5
	.byte	0x7e
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.quad	.LVL190-.Ltext0
	.quad	.LVL191-1-.Ltext0
	.value	0x7
	.byte	0x7e
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.byte	0x38
	.byte	0x1c
	.quad	0x0
	.quad	0x0
.LLST81:
	.quad	.LVL197-.Ltext0
	.quad	.LVL202-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL247-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST82:
	.quad	.LVL197-.Ltext0
	.quad	.LVL203-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL247-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST83:
	.quad	.LVL197-.Ltext0
	.quad	.LVL200-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL201-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL247-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST84:
	.quad	.LVL197-.Ltext0
	.quad	.LVL198-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL198-.Ltext0
	.quad	.LVL244-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL246-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST85:
	.quad	.LVL197-.Ltext0
	.quad	.LVL199-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL199-.Ltext0
	.quad	.LVL245-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL246-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST86:
	.quad	.LVL197-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL201-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -868
	.quad	0x0
	.quad	0x0
.LLST87:
	.quad	.LVL216-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0xb
	.byte	0x75
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x1d0
	.byte	0x1c
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL222-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL224-.Ltext0
	.quad	.LVL231-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	.LVL237-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST88:
	.quad	.LVL217-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0xb
	.byte	0x75
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x360
	.byte	0x1c
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL222-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL224-.Ltext0
	.quad	.LVL229-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	.LVL237-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST89:
	.quad	.LVL225-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x5
	.byte	0x71
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST90:
	.quad	.LVL226-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST91:
	.quad	.LVL208-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.quad	.LVL210-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	.LVL240-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0x0
	.quad	0x0
.LLST92:
	.quad	.LVL209-.Ltext0
	.quad	.LVL210-.Ltext0
	.value	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.quad	.LVL210-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	.LVL240-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	0x0
	.quad	0x0
.LLST93:
	.quad	.LVL214-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x91
	.sleb128 -880
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST94:
	.quad	.LVL215-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x7
	.byte	0x76
	.sleb128 0
	.byte	0x91
	.sleb128 -880
	.byte	0x6
	.byte	0x22
	.quad	.LVL219-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	0x0
	.quad	0x0
.LLST95:
	.quad	.LVL230-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x69
	.quad	0x0
	.quad	0x0
.LLST96:
	.quad	.LVL228-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x68
	.quad	0x0
	.quad	0x0
.LLST97:
	.quad	.LVL232-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x6a
	.quad	0x0
	.quad	0x0
.LLST98:
	.quad	.LVL235-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x63
	.quad	0x0
	.quad	0x0
.LLST99:
	.quad	.LVL233-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST100:
	.quad	.LVL234-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST101:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL220-.Ltext0
	.quad	.LVL221-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL221-.Ltext0
	.quad	.LVL222-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL222-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL237-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST102:
	.quad	.LVL197-.Ltext0
	.quad	.LVL211-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL211-.Ltext0
	.quad	.LVL212-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL212-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL237-.Ltext0
	.quad	.LVL241-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL247-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	0x0
	.quad	0x0
.LLST103:
	.quad	.LVL222-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL238-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST104:
	.quad	.LVL219-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL227-.Ltext0
	.quad	.LVL237-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL238-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST105:
	.quad	.LVL197-.Ltext0
	.quad	.LVL201-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL204-.Ltext0
	.quad	.LVL205-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL206-.Ltext0
	.quad	.LVL207-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL223-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL237-.Ltext0
	.quad	.LVL238-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL239-.Ltext0
	.quad	.LVL242-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL247-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST106:
	.quad	.LVL209-.Ltext0
	.quad	.LVL213-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL241-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -872
	.quad	0x0
	.quad	0x0
.LLST107:
	.quad	.LVL217-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0xb
	.byte	0x75
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x360
	.byte	0x1c
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x65
	.quad	0x0
	.quad	0x0
.LLST108:
	.quad	.LVL217-.Ltext0
	.quad	.LVL218-.Ltext0
	.value	0xb
	.byte	0x75
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x22
	.byte	0xa
	.value	0x1d0
	.byte	0x1c
	.quad	.LVL218-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x64
	.quad	0x0
	.quad	0x0
.LLST109:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x7
	.byte	0x76
	.sleb128 0
	.byte	0x91
	.sleb128 -880
	.byte	0x6
	.byte	0x22
	.quad	.LVL219-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	0x0
	.quad	0x0
.LLST110:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x91
	.sleb128 -880
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST111:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST112:
	.quad	.LVL217-.Ltext0
	.quad	.LVL219-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST113:
	.quad	.LVL217-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x812dea11
	.long	0x3d719799
	.quad	.LVL246-.Ltext0
	.quad	.LVL247-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x812dea11
	.long	0x3d719799
	.quad	0x0
	.quad	0x0
.LLST114:
	.quad	.LVL226-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST115:
	.quad	.LVL226-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x5
	.byte	0x71
	.sleb128 0
	.byte	0x7d
	.sleb128 0
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST116:
	.quad	.LVL219-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	.LVL226-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -888
	.quad	0x0
	.quad	0x0
.LLST117:
	.quad	.LVL226-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x6c
	.quad	0x0
	.quad	0x0
.LLST118:
	.quad	.LVL226-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x6b
	.quad	0x0
	.quad	0x0
.LLST119:
	.quad	.LVL226-.Ltext0
	.quad	.LVL236-1-.Ltext0
	.value	0x1
	.byte	0x66
	.quad	0x0
	.quad	0x0
.LLST120:
	.quad	.LVL219-.Ltext0
	.quad	.LVL224-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x812dea11
	.long	0x3d719799
	.quad	.LVL226-.Ltext0
	.quad	.LVL243-.Ltext0
	.value	0xa
	.byte	0x9e
	.uleb128 0x8
	.long	0x812dea11
	.long	0x3d719799
	.quad	0x0
	.quad	0x0
.LLST121:
	.quad	.LVL248-.Ltext0
	.quad	.LVL249-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST122:
	.quad	.LVL248-.Ltext0
	.quad	.LVL250-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST123:
	.quad	.LVL248-.Ltext0
	.quad	.LVL255-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL255-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -8
	.byte	0x9f
	.quad	.LVL256-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -408
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST124:
	.quad	.LVL248-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL256-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -440
	.quad	0x0
	.quad	0x0
.LLST125:
	.quad	.LVL248-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL256-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -432
	.quad	0x0
	.quad	0x0
.LLST126:
	.quad	.LVL251-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL256-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -460
	.quad	0x0
	.quad	0x0
.LLST127:
	.quad	.LVL252-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL256-.Ltext0
	.quad	.LFE24-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -396
	.quad	0x0
	.quad	0x0
.LLST128:
	.quad	.LVL253-.Ltext0
	.quad	.LVL254-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST129:
	.quad	.LVL256-.Ltext0
	.quad	.LVL257-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL259-.Ltext0
	.quad	.LVL260-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST130:
	.quad	.LVL253-.Ltext0
	.quad	.LVL256-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL260-.Ltext0
	.quad	.LVL261-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -444
	.quad	0x0
	.quad	0x0
.LLST131:
	.quad	.LVL258-.Ltext0
	.quad	.LVL259-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST132:
	.quad	.LVL263-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL267-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST133:
	.quad	.LVL263-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL272-1-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST134:
	.quad	.LVL263-.Ltext0
	.quad	.LVL264-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL264-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST135:
	.quad	.LVL263-.Ltext0
	.quad	.LVL265-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL265-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST136:
	.quad	.LVL263-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2512
	.quad	0x0
	.quad	0x0
.LLST137:
	.quad	.LVL263-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2496
	.quad	0x0
	.quad	0x0
.LLST138:
	.quad	.LVL266-.Ltext0
	.quad	.LVL267-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL267-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 0
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2592
	.quad	0x0
	.quad	0x0
.LLST139:
	.quad	.LVL269-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2756
	.quad	0x0
	.quad	0x0
.LLST140:
	.quad	.LVL268-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2500
	.quad	0x0
	.quad	0x0
.LLST141:
	.quad	.LVL270-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2668
	.quad	0x0
	.quad	0x0
.LLST142:
	.quad	.LVL271-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST143:
	.quad	.LVL271-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL278-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2544
	.quad	0x0
	.quad	0x0
.LLST144:
	.quad	.LVL271-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x7
	.byte	0x74
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -2500
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST145:
	.quad	.LVL271-.Ltext0
	.quad	.LVL272-1-.Ltext0
	.value	0x7
	.byte	0x7c
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	.LVL272-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x8
	.byte	0x91
	.sleb128 -2668
	.byte	0x94
	.byte	0x4
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST146:
	.quad	.LVL270-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL279-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2548
	.quad	0x0
	.quad	0x0
.LLST147:
	.quad	.LVL287-.Ltext0
	.quad	.LVL288-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL288-1-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2596
	.quad	0x0
	.quad	0x0
.LLST148:
	.quad	.LVL302-.Ltext0
	.quad	.LVL303-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL303-1-.Ltext0
	.quad	.LVL311-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2732
	.quad	0x0
	.quad	0x0
.LLST149:
	.quad	.LVL279-.Ltext0
	.quad	.LVL280-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL281-.Ltext0
	.quad	.LVL282-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2656
	.quad	0x0
	.quad	0x0
.LLST150:
	.quad	.LVL277-.Ltext0
	.quad	.LVL278-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL313-.Ltext0
	.quad	.LVL314-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2588
	.quad	0x0
	.quad	0x0
.LLST151:
	.quad	.LVL295-.Ltext0
	.quad	.LVL296-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL297-.Ltext0
	.quad	.LVL298-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL311-.Ltext0
	.quad	.LVL312-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST152:
	.quad	.LVL293-.Ltext0
	.quad	.LVL294-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL312-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2736
	.quad	0x0
	.quad	0x0
.LLST153:
	.quad	.LVL289-.Ltext0
	.quad	.LVL290-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL290-1-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2616
	.quad	0x0
	.quad	0x0
.LLST154:
	.quad	.LVL303-.Ltext0
	.quad	.LVL304-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST155:
	.quad	.LVL291-.Ltext0
	.quad	.LVL292-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL292-1-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2688
	.quad	0x0
	.quad	0x0
.LLST156:
	.quad	.LVL304-.Ltext0
	.quad	.LVL305-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST157:
	.quad	.LVL283-.Ltext0
	.quad	.LVL284-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL284-1-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2744
	.quad	0x0
	.quad	0x0
.LLST158:
	.quad	.LVL285-.Ltext0
	.quad	.LVL286-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL286-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2752
	.quad	0x0
	.quad	0x0
.LLST159:
	.quad	.LVL299-.Ltext0
	.quad	.LVL300-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST160:
	.quad	.LVL300-.Ltext0
	.quad	.LVL301-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST161:
	.quad	.LVL293-.Ltext0
	.quad	.LVL294-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL294-.Ltext0
	.quad	.LVL313-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2696
	.quad	0x0
	.quad	0x0
.LLST162:
	.quad	.LVL273-.Ltext0
	.quad	.LVL274-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL274-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2480
	.quad	0x0
	.quad	0x0
.LLST163:
	.quad	.LVL275-.Ltext0
	.quad	.LVL276-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL276-1-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2560
	.quad	0x0
	.quad	0x0
.LLST164:
	.quad	.LVL308-.Ltext0
	.quad	.LVL310-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST165:
	.quad	.LVL305-.Ltext0
	.quad	.LVL306-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST166:
	.quad	.LVL307-.Ltext0
	.quad	.LVL309-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL309-.Ltext0
	.quad	.LVL310-1-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST167:
	.quad	.LVL316-.Ltext0
	.quad	.LVL324-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL324-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST168:
	.quad	.LVL316-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL325-1-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST169:
	.quad	.LVL316-.Ltext0
	.quad	.LVL317-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL317-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST170:
	.quad	.LVL316-.Ltext0
	.quad	.LVL318-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL318-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST171:
	.quad	.LVL316-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL325-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2504
	.quad	0x0
	.quad	0x0
.LLST172:
	.quad	.LVL316-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL325-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2488
	.quad	0x0
	.quad	0x0
.LLST173:
	.quad	.LVL319-.Ltext0
	.quad	.LVL324-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL324-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 0
	.quad	.LVL325-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2580
	.quad	0x0
	.quad	0x0
.LLST174:
	.quad	.LVL320-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL325-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2492
	.quad	0x0
	.quad	0x0
.LLST175:
	.quad	.LVL321-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x2
	.byte	0x7d
	.sleb128 0
	.quad	.LVL325-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2740
	.quad	0x0
	.quad	0x0
.LLST176:
	.quad	.LVL322-.Ltext0
	.quad	.LVL325-1-.Ltext0
	.value	0x2
	.byte	0x7c
	.sleb128 0
	.quad	.LVL325-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2652
	.quad	0x0
	.quad	0x0
.LLST177:
	.quad	.LVL323-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST178:
	.quad	.LVL323-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL331-.Ltext0
	.quad	.LVL367-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2536
	.quad	0x0
	.quad	0x0
.LLST179:
	.quad	.LVL322-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL332-.Ltext0
	.quad	.LVL367-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2576
	.quad	0x0
	.quad	0x0
.LLST180:
	.quad	.LVL340-.Ltext0
	.quad	.LVL341-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL341-1-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2584
	.quad	0x0
	.quad	0x0
.LLST181:
	.quad	.LVL355-.Ltext0
	.quad	.LVL356-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL356-1-.Ltext0
	.quad	.LVL364-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2716
	.quad	0x0
	.quad	0x0
.LLST182:
	.quad	.LVL332-.Ltext0
	.quad	.LVL333-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL334-.Ltext0
	.quad	.LVL335-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2640
	.quad	0x0
	.quad	0x0
.LLST183:
	.quad	.LVL330-.Ltext0
	.quad	.LVL331-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL366-.Ltext0
	.quad	.LVL367-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2572
	.quad	0x0
	.quad	0x0
.LLST184:
	.quad	.LVL348-.Ltext0
	.quad	.LVL349-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL350-.Ltext0
	.quad	.LVL351-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL364-.Ltext0
	.quad	.LVL365-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST185:
	.quad	.LVL346-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL365-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2720
	.quad	0x0
	.quad	0x0
.LLST186:
	.quad	.LVL342-.Ltext0
	.quad	.LVL343-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL343-1-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2600
	.quad	0x0
	.quad	0x0
.LLST187:
	.quad	.LVL356-.Ltext0
	.quad	.LVL357-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST188:
	.quad	.LVL344-.Ltext0
	.quad	.LVL345-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL345-1-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2672
	.quad	0x0
	.quad	0x0
.LLST189:
	.quad	.LVL357-.Ltext0
	.quad	.LVL358-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST190:
	.quad	.LVL336-.Ltext0
	.quad	.LVL337-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL337-1-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2728
	.quad	0x0
	.quad	0x0
.LLST191:
	.quad	.LVL338-.Ltext0
	.quad	.LVL339-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL339-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2736
	.quad	0x0
	.quad	0x0
.LLST192:
	.quad	.LVL352-.Ltext0
	.quad	.LVL353-1-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST193:
	.quad	.LVL353-.Ltext0
	.quad	.LVL354-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	0x0
	.quad	0x0
.LLST194:
	.quad	.LVL346-.Ltext0
	.quad	.LVL347-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL347-.Ltext0
	.quad	.LVL366-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2680
	.quad	0x0
	.quad	0x0
.LLST195:
	.quad	.LVL326-.Ltext0
	.quad	.LVL327-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL327-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2480
	.quad	0x0
	.quad	0x0
.LLST196:
	.quad	.LVL328-.Ltext0
	.quad	.LVL329-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL329-1-.Ltext0
	.quad	.LFE35-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -2544
	.quad	0x0
	.quad	0x0
.LLST197:
	.quad	.LVL361-.Ltext0
	.quad	.LVL363-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST198:
	.quad	.LVL358-.Ltext0
	.quad	.LVL359-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST199:
	.quad	.LVL360-.Ltext0
	.quad	.LVL362-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL362-.Ltext0
	.quad	.LVL363-1-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST200:
	.quad	.LVL369-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL377-.Ltext0
	.quad	.LVL387-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL387-.Ltext0
	.quad	.LVL416-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL420-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST201:
	.quad	.LVL369-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL378-1-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL420-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST202:
	.quad	.LVL369-.Ltext0
	.quad	.LVL370-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL370-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	0x0
	.quad	0x0
.LLST203:
	.quad	.LVL369-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST204:
	.quad	.LVL369-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1784
	.quad	0x0
	.quad	0x0
.LLST205:
	.quad	.LVL369-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1776
	.quad	0x0
	.quad	0x0
.LLST206:
	.quad	.LVL371-.Ltext0
	.quad	.LVL377-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL377-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1868
	.quad	0x0
	.quad	0x0
.LLST207:
	.quad	.LVL372-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1764
	.quad	0x0
	.quad	0x0
.LLST208:
	.quad	.LVL373-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1716
	.quad	0x0
	.quad	0x0
.LLST209:
	.quad	.LVL373-.Ltext0
	.quad	.LVL378-1-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL378-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1692
	.quad	0x0
	.quad	0x0
.LLST210:
	.quad	.LVL374-.Ltext0
	.quad	.LVL375-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL375-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	0x0
	.quad	0x0
.LLST211:
	.quad	.LVL376-.Ltext0
	.quad	.LVL388-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL420-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST212:
	.quad	.LVL399-.Ltext0
	.quad	.LVL400-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL410-.Ltext0
	.quad	.LVL411-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST213:
	.quad	.LVL397-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL411-.Ltext0
	.quad	.LVL412-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1844
	.quad	0x0
	.quad	0x0
.LLST214:
	.quad	.LVL389-.Ltext0
	.quad	.LVL390-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL392-.Ltext0
	.quad	.LVL393-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL413-.Ltext0
	.quad	.LVL414-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1744
	.quad	0x0
	.quad	0x0
.LLST215:
	.quad	.LVL385-.Ltext0
	.quad	.LVL389-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL391-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL415-.Ltext0
	.quad	.LVL416-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1740
	.quad	.LVL420-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST216:
	.quad	.LVL373-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL392-.Ltext0
	.quad	.LVL416-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1804
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1804
	.quad	.LVL420-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST217:
	.quad	.LVL394-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.quad	.LVL398-.Ltext0
	.quad	.LVL414-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	0x0
	.quad	0x0
.LLST218:
	.quad	.LVL395-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1728
	.byte	0x6
	.quad	.LVL398-.Ltext0
	.quad	.LVL414-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST219:
	.quad	.LVL396-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL398-.Ltext0
	.quad	.LVL414-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	0x0
	.quad	0x0
.LLST220:
	.quad	.LVL397-.Ltext0
	.quad	.LVL398-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1728
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL398-.Ltext0
	.quad	.LVL414-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	0x0
	.quad	0x0
.LLST221:
	.quad	.LVL383-.Ltext0
	.quad	.LVL384-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL384-1-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL420-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST222:
	.quad	.LVL385-.Ltext0
	.quad	.LVL386-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL386-.Ltext0
	.quad	.LVL392-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL420-.Ltext0
	.quad	.LVL421-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL421-1-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST223:
	.quad	.LVL379-.Ltext0
	.quad	.LVL380-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL380-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1752
	.quad	0x0
	.quad	0x0
.LLST224:
	.quad	.LVL381-.Ltext0
	.quad	.LVL382-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL382-.Ltext0
	.quad	.LFE33-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1688
	.quad	0x0
	.quad	0x0
.LLST225:
	.quad	.LVL408-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL417-.Ltext0
	.quad	.LVL419-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST226:
	.quad	.LVL403-.Ltext0
	.quad	.LVL404-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL404-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1840
	.quad	.LVL417-.Ltext0
	.quad	.LVL420-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1840
	.quad	0x0
	.quad	0x0
.LLST227:
	.quad	.LVL401-.Ltext0
	.quad	.LVL402-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST228:
	.quad	.LVL405-.Ltext0
	.quad	.LVL406-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST229:
	.quad	.LVL407-.Ltext0
	.quad	.LVL409-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL417-.Ltext0
	.quad	.LVL418-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL418-.Ltext0
	.quad	.LVL419-1-.Ltext0
	.value	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST230:
	.quad	.LVL423-.Ltext0
	.quad	.LVL431-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL431-.Ltext0
	.quad	.LVL441-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL441-.Ltext0
	.quad	.LVL468-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL469-.Ltext0
	.quad	.LVL471-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL471-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST231:
	.quad	.LVL423-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL432-1-.Ltext0
	.quad	.LVL446-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL471-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST232:
	.quad	.LVL423-.Ltext0
	.quad	.LVL424-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL424-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	0x0
	.quad	0x0
.LLST233:
	.quad	.LVL423-.Ltext0
	.quad	.LVL425-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL425-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST234:
	.quad	.LVL423-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1784
	.quad	0x0
	.quad	0x0
.LLST235:
	.quad	.LVL423-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1776
	.quad	0x0
	.quad	0x0
.LLST236:
	.quad	.LVL426-.Ltext0
	.quad	.LVL431-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL431-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1868
	.quad	0x0
	.quad	0x0
.LLST237:
	.quad	.LVL427-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1756
	.quad	0x0
	.quad	0x0
.LLST238:
	.quad	.LVL428-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1888
	.byte	0x6
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1716
	.quad	0x0
	.quad	0x0
.LLST239:
	.quad	.LVL428-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1880
	.byte	0x6
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1692
	.quad	0x0
	.quad	0x0
.LLST240:
	.quad	.LVL429-.Ltext0
	.quad	.LVL432-1-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL432-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	0x0
	.quad	0x0
.LLST241:
	.quad	.LVL430-.Ltext0
	.quad	.LVL442-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL471-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST242:
	.quad	.LVL453-.Ltext0
	.quad	.LVL454-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL462-.Ltext0
	.quad	.LVL463-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST243:
	.quad	.LVL451-.Ltext0
	.quad	.LVL452-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL463-.Ltext0
	.quad	.LVL464-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1848
	.quad	0x0
	.quad	0x0
.LLST244:
	.quad	.LVL443-.Ltext0
	.quad	.LVL444-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL446-.Ltext0
	.quad	.LVL447-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL465-.Ltext0
	.quad	.LVL466-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1764
	.quad	0x0
	.quad	0x0
.LLST245:
	.quad	.LVL439-.Ltext0
	.quad	.LVL443-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL445-.Ltext0
	.quad	.LVL446-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL467-.Ltext0
	.quad	.LVL468-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1760
	.quad	.LVL471-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST246:
	.quad	.LVL428-.Ltext0
	.quad	.LVL446-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL446-.Ltext0
	.quad	.LVL468-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1844
	.quad	.LVL469-.Ltext0
	.quad	.LVL471-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1844
	.quad	.LVL471-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST247:
	.quad	.LVL448-.Ltext0
	.quad	.LVL452-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.quad	.LVL452-.Ltext0
	.quad	.LVL466-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL469-.Ltext0
	.quad	.LVL471-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	0x0
	.quad	0x0
.LLST248:
	.quad	.LVL449-.Ltext0
	.quad	.LVL452-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1728
	.byte	0x6
	.quad	.LVL452-.Ltext0
	.quad	.LVL466-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	.LVL469-.Ltext0
	.quad	.LVL471-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST249:
	.quad	.LVL450-.Ltext0
	.quad	.LVL452-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL452-.Ltext0
	.quad	.LVL466-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	.LVL469-.Ltext0
	.quad	.LVL471-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	0x0
	.quad	0x0
.LLST250:
	.quad	.LVL451-.Ltext0
	.quad	.LVL452-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1728
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL452-.Ltext0
	.quad	.LVL466-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	.LVL469-.Ltext0
	.quad	.LVL471-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	0x0
	.quad	0x0
.LLST251:
	.quad	.LVL433-.Ltext0
	.quad	.LVL434-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL434-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1744
	.quad	0x0
	.quad	0x0
.LLST252:
	.quad	.LVL435-.Ltext0
	.quad	.LVL436-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL436-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1688
	.quad	0x0
	.quad	0x0
.LLST253:
	.quad	.LVL459-.Ltext0
	.quad	.LVL461-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL469-.Ltext0
	.quad	.LVL470-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST254:
	.quad	.LVL437-.Ltext0
	.quad	.LVL438-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL438-1-.Ltext0
	.quad	.LVL446-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL471-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST255:
	.quad	.LVL439-.Ltext0
	.quad	.LVL440-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL440-.Ltext0
	.quad	.LVL446-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL471-.Ltext0
	.quad	.LVL472-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL472-1-.Ltext0
	.quad	.LFE31-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST256:
	.quad	.LVL455-.Ltext0
	.quad	.LVL456-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST257:
	.quad	.LVL456-.Ltext0
	.quad	.LVL457-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST258:
	.quad	.LVL458-.Ltext0
	.quad	.LVL460-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL460-.Ltext0
	.quad	.LVL461-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	.LVL469-.Ltext0
	.quad	.LVL470-1-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST259:
	.quad	.LVL474-.Ltext0
	.quad	.LVL481-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL491-.Ltext0
	.quad	.LVL521-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1872
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	0x0
	.quad	0x0
.LLST260:
	.quad	.LVL474-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL482-1-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST261:
	.quad	.LVL474-.Ltext0
	.quad	.LVL475-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL475-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1896
	.quad	0x0
	.quad	0x0
.LLST262:
	.quad	.LVL474-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL482-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	0x0
	.quad	0x0
.LLST263:
	.quad	.LVL474-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL482-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1680
	.quad	0x0
	.quad	0x0
.LLST264:
	.quad	.LVL474-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL482-1-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL495-.Ltext0
	.quad	.LVL521-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1736
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST265:
	.quad	.LVL476-.Ltext0
	.quad	.LVL481-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL481-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL482-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1740
	.quad	0x0
	.quad	0x0
.LLST266:
	.quad	.LVL477-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL482-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1700
	.quad	0x0
	.quad	0x0
.LLST267:
	.quad	.LVL478-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1896
	.byte	0x6
	.quad	.LVL482-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1860
	.quad	0x0
	.quad	0x0
.LLST268:
	.quad	.LVL478-.Ltext0
	.quad	.LVL482-1-.Ltext0
	.value	0x2
	.byte	0x72
	.sleb128 0
	.quad	.LVL482-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1764
	.quad	0x0
	.quad	0x0
.LLST269:
	.quad	.LVL478-.Ltext0
	.quad	.LVL492-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST270:
	.quad	.LVL479-.Ltext0
	.quad	.LVL480-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL480-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST271:
	.quad	.LVL492-.Ltext0
	.quad	.LVL493-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL495-.Ltext0
	.quad	.LVL496-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL518-.Ltext0
	.quad	.LVL519-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1772
	.quad	0x0
	.quad	0x0
.LLST272:
	.quad	.LVL489-.Ltext0
	.quad	.LVL492-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL494-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL520-.Ltext0
	.quad	.LVL521-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1768
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST273:
	.quad	.LVL501-.Ltext0
	.quad	.LVL502-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL503-.Ltext0
	.quad	.LVL504-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL515-.Ltext0
	.quad	.LVL516-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST274:
	.quad	.LVL499-.Ltext0
	.quad	.LVL500-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL516-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1828
	.quad	0x0
	.quad	0x0
.LLST275:
	.quad	.LVL478-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL495-.Ltext0
	.quad	.LVL521-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1844
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST276:
	.quad	.LVL497-.Ltext0
	.quad	.LVL500-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1752
	.byte	0x6
	.quad	.LVL500-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1872
	.quad	0x0
	.quad	0x0
.LLST277:
	.quad	.LVL498-.Ltext0
	.quad	.LVL500-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.quad	.LVL500-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1888
	.quad	0x0
	.quad	0x0
.LLST278:
	.quad	.LVL498-.Ltext0
	.quad	.LVL500-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1752
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL500-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST279:
	.quad	.LVL499-.Ltext0
	.quad	.LVL500-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL500-.Ltext0
	.quad	.LVL517-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1896
	.quad	0x0
	.quad	0x0
.LLST280:
	.quad	.LVL483-.Ltext0
	.quad	.LVL484-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL484-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1688
	.quad	0x0
	.quad	0x0
.LLST281:
	.quad	.LVL485-.Ltext0
	.quad	.LVL486-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL486-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1728
	.quad	0x0
	.quad	0x0
.LLST282:
	.quad	.LVL512-.Ltext0
	.quad	.LVL514-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST283:
	.quad	.LVL487-.Ltext0
	.quad	.LVL488-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL488-1-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL522-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST284:
	.quad	.LVL489-.Ltext0
	.quad	.LVL490-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL490-.Ltext0
	.quad	.LVL495-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL522-.Ltext0
	.quad	.LVL523-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL523-1-.Ltext0
	.quad	.LFE29-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST285:
	.quad	.LVL505-.Ltext0
	.quad	.LVL506-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST286:
	.quad	.LVL509-.Ltext0
	.quad	.LVL510-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST287:
	.quad	.LVL511-.Ltext0
	.quad	.LVL513-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL513-.Ltext0
	.quad	.LVL514-1-.Ltext0
	.value	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
.LLST288:
	.quad	.LVL507-.Ltext0
	.quad	.LVL508-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL508-.Ltext0
	.quad	.LVL515-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	0x0
	.quad	0x0
.LLST289:
	.quad	.LVL525-.Ltext0
	.quad	.LVL526-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	0x0
	.quad	0x0
.LLST290:
	.quad	.LVL525-.Ltext0
	.quad	.LVL527-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	0x0
	.quad	0x0
.LLST291:
	.quad	.LVL525-.Ltext0
	.quad	.LVL532-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL532-.Ltext0
	.quad	.LVL533-.Ltext0
	.value	0x3
	.byte	0x73
	.sleb128 -8
	.byte	0x9f
	.quad	.LVL533-.Ltext0
	.quad	.LVL538-.Ltext0
	.value	0x7
	.byte	0x91
	.sleb128 -408
	.byte	0x6
	.byte	0x38
	.byte	0x1c
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST292:
	.quad	.LVL525-.Ltext0
	.quad	.LVL533-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL533-.Ltext0
	.quad	.LVL538-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -440
	.quad	0x0
	.quad	0x0
.LLST293:
	.quad	.LVL525-.Ltext0
	.quad	.LVL533-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL533-.Ltext0
	.quad	.LVL538-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -432
	.quad	0x0
	.quad	0x0
.LLST294:
	.quad	.LVL528-.Ltext0
	.quad	.LVL533-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL533-.Ltext0
	.quad	.LFE25-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -460
	.quad	0x0
	.quad	0x0
.LLST295:
	.quad	.LVL529-.Ltext0
	.quad	.LVL533-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL533-.Ltext0
	.quad	.LFE25-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -396
	.quad	0x0
	.quad	0x0
.LLST296:
	.quad	.LVL530-.Ltext0
	.quad	.LVL531-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST297:
	.quad	.LVL533-.Ltext0
	.quad	.LVL534-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL536-.Ltext0
	.quad	.LVL537-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST298:
	.quad	.LVL530-.Ltext0
	.quad	.LVL533-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL537-.Ltext0
	.quad	.LVL538-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -444
	.quad	0x0
	.quad	0x0
.LLST299:
	.quad	.LVL535-.Ltext0
	.quad	.LVL537-.Ltext0
	.value	0x2
	.byte	0x34
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST300:
	.quad	.LVL539-.Ltext0
	.quad	.LVL547-.Ltext0
	.value	0x1
	.byte	0x55
	.quad	.LVL547-.Ltext0
	.quad	.LVL557-.Ltext0
	.value	0x1
	.byte	0x5f
	.quad	.LVL557-.Ltext0
	.quad	.LVL560-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	0x0
	.quad	0x0
.LLST301:
	.quad	.LVL539-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x1
	.byte	0x54
	.quad	.LVL548-1-.Ltext0
	.quad	.LVL562-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	.LVL586-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST302:
	.quad	.LVL539-.Ltext0
	.quad	.LVL540-.Ltext0
	.value	0x1
	.byte	0x51
	.quad	.LVL540-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST303:
	.quad	.LVL539-.Ltext0
	.quad	.LVL541-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL541-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1872
	.quad	0x0
	.quad	0x0
.LLST304:
	.quad	.LVL539-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x1
	.byte	0x58
	.quad	.LVL548-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1680
	.quad	0x0
	.quad	0x0
.LLST305:
	.quad	.LVL539-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x1
	.byte	0x59
	.quad	.LVL548-1-.Ltext0
	.quad	.LVL562-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	.LVL562-.Ltext0
	.quad	.LVL583-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1736
	.quad	.LVL584-.Ltext0
	.quad	.LVL586-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1736
	.quad	.LVL586-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x1
	.byte	0x53
	.quad	0x0
	.quad	0x0
.LLST306:
	.quad	.LVL542-.Ltext0
	.quad	.LVL547-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 0
	.quad	.LVL547-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x2
	.byte	0x7f
	.sleb128 0
	.quad	.LVL548-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1740
	.quad	0x0
	.quad	0x0
.LLST307:
	.quad	.LVL543-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 0
	.quad	.LVL548-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1700
	.quad	0x0
	.quad	0x0
.LLST308:
	.quad	.LVL544-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1880
	.byte	0x6
	.quad	.LVL548-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1848
	.quad	0x0
	.quad	0x0
.LLST309:
	.quad	.LVL545-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1872
	.byte	0x6
	.quad	.LVL548-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1764
	.quad	0x0
	.quad	0x0
.LLST310:
	.quad	.LVL545-.Ltext0
	.quad	.LVL558-.Ltext0
	.value	0x1
	.byte	0x56
	.quad	0x0
	.quad	0x0
.LLST311:
	.quad	.LVL546-.Ltext0
	.quad	.LVL548-1-.Ltext0
	.value	0x1
	.byte	0x52
	.quad	.LVL548-1-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	0x0
	.quad	0x0
.LLST312:
	.quad	.LVL558-.Ltext0
	.quad	.LVL559-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL562-.Ltext0
	.quad	.LVL563-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL580-.Ltext0
	.quad	.LVL581-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1784
	.quad	0x0
	.quad	0x0
.LLST313:
	.quad	.LVL555-.Ltext0
	.quad	.LVL558-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL561-.Ltext0
	.quad	.LVL562-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL582-.Ltext0
	.quad	.LVL583-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1780
	.quad	0x0
	.quad	0x0
.LLST314:
	.quad	.LVL568-.Ltext0
	.quad	.LVL569-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL577-.Ltext0
	.quad	.LVL578-.Ltext0
	.value	0x1
	.byte	0x5e
	.quad	0x0
	.quad	0x0
.LLST315:
	.quad	.LVL566-.Ltext0
	.quad	.LVL567-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL578-.Ltext0
	.quad	.LVL579-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1828
	.quad	0x0
	.quad	0x0
.LLST316:
	.quad	.LVL545-.Ltext0
	.quad	.LVL562-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL562-.Ltext0
	.quad	.LVL583-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1844
	.quad	.LVL584-.Ltext0
	.quad	.LVL586-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1844
	.quad	.LVL586-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0x0
	.quad	0x0
.LLST317:
	.quad	.LVL564-.Ltext0
	.quad	.LVL567-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1752
	.byte	0x6
	.quad	.LVL567-.Ltext0
	.quad	.LVL579-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	.LVL584-.Ltext0
	.quad	.LVL586-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1856
	.quad	0x0
	.quad	0x0
.LLST318:
	.quad	.LVL565-.Ltext0
	.quad	.LVL567-.Ltext0
	.value	0x4
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.quad	.LVL567-.Ltext0
	.quad	.LVL579-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1872
	.quad	.LVL584-.Ltext0
	.quad	.LVL586-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1872
	.quad	0x0
	.quad	0x0
.LLST319:
	.quad	.LVL565-.Ltext0
	.quad	.LVL567-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1752
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL567-.Ltext0
	.quad	.LVL579-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	.LVL584-.Ltext0
	.quad	.LVL586-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1864
	.quad	0x0
	.quad	0x0
.LLST320:
	.quad	.LVL566-.Ltext0
	.quad	.LVL567-.Ltext0
	.value	0x6
	.byte	0x91
	.sleb128 -1736
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.quad	.LVL567-.Ltext0
	.quad	.LVL579-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	.LVL584-.Ltext0
	.quad	.LVL586-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1880
	.quad	0x0
	.quad	0x0
.LLST321:
	.quad	.LVL549-.Ltext0
	.quad	.LVL550-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL550-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1688
	.quad	0x0
	.quad	0x0
.LLST322:
	.quad	.LVL551-.Ltext0
	.quad	.LVL552-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL552-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x3
	.byte	0x91
	.sleb128 -1728
	.quad	0x0
	.quad	0x0
.LLST323:
	.quad	.LVL574-.Ltext0
	.quad	.LVL576-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	.LVL584-.Ltext0
	.quad	.LVL585-1-.Ltext0
	.value	0x1
	.byte	0x62
	.quad	0x0
	.quad	0x0
.LLST324:
	.quad	.LVL553-.Ltext0
	.quad	.LVL554-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL554-1-.Ltext0
	.quad	.LVL562-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	.LVL586-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x1
	.byte	0x5c
	.quad	0x0
	.quad	0x0
.LLST325:
	.quad	.LVL555-.Ltext0
	.quad	.LVL556-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	.LVL556-.Ltext0
	.quad	.LVL562-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	.LVL586-.Ltext0
	.quad	.LFE27-.Ltext0
	.value	0x1
	.byte	0x5d
	.quad	0x0
	.quad	0x0
.LLST326:
	.quad	.LVL570-.Ltext0
	.quad	.LVL571-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST327:
	.quad	.LVL571-.Ltext0
	.quad	.LVL572-1-.Ltext0
	.value	0x1
	.byte	0x50
	.quad	0x0
	.quad	0x0
.LLST328:
	.quad	.LVL573-.Ltext0
	.quad	.LVL575-.Ltext0
	.value	0x1
	.byte	0x61
	.quad	.LVL575-.Ltext0
	.quad	.LVL576-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	.LVL584-.Ltext0
	.quad	.LVL585-1-.Ltext0
	.value	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0x91
	.sleb128 56
	.byte	0x6
	.byte	0x22
	.quad	0x0
	.quad	0x0
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.section	.debug_info
	.long	0x27ca
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF169
	.byte	0x1
	.long	.LASF170
	.long	.LASF171
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
	.uleb128 0x5
	.byte	0x8
	.long	0x3f
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
	.long	0x53
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8e
	.long	0x53
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x5
	.byte	0x8
	.long	0x9b
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
	.long	0x245
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
	.long	0x95
	.sleb128 8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.value	0x116
	.long	0x95
	.sleb128 16
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.value	0x117
	.long	0x95
	.sleb128 24
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.value	0x118
	.long	0x95
	.sleb128 32
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.value	0x119
	.long	0x95
	.sleb128 40
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.value	0x11a
	.long	0x95
	.sleb128 48
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.value	0x11b
	.long	0x95
	.sleb128 56
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.value	0x11c
	.long	0x95
	.sleb128 64
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.value	0x11e
	.long	0x95
	.sleb128 72
	.uleb128 0x8
	.long	.LASF23
	.byte	0x4
	.value	0x11f
	.long	0x95
	.sleb128 80
	.uleb128 0x8
	.long	.LASF24
	.byte	0x4
	.value	0x120
	.long	0x95
	.sleb128 88
	.uleb128 0x8
	.long	.LASF25
	.byte	0x4
	.value	0x122
	.long	0x27d
	.sleb128 96
	.uleb128 0x8
	.long	.LASF26
	.byte	0x4
	.value	0x124
	.long	0x283
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
	.long	0x7d
	.sleb128 120
	.uleb128 0x8
	.long	.LASF30
	.byte	0x4
	.value	0x130
	.long	0x68
	.sleb128 128
	.uleb128 0x8
	.long	.LASF31
	.byte	0x4
	.value	0x131
	.long	0x6f
	.sleb128 130
	.uleb128 0x8
	.long	.LASF32
	.byte	0x4
	.value	0x132
	.long	0x289
	.sleb128 131
	.uleb128 0x8
	.long	.LASF33
	.byte	0x4
	.value	0x136
	.long	0x299
	.sleb128 136
	.uleb128 0x8
	.long	.LASF34
	.byte	0x4
	.value	0x13f
	.long	0x88
	.sleb128 144
	.uleb128 0x8
	.long	.LASF35
	.byte	0x4
	.value	0x148
	.long	0x93
	.sleb128 152
	.uleb128 0x8
	.long	.LASF36
	.byte	0x4
	.value	0x149
	.long	0x93
	.sleb128 160
	.uleb128 0x8
	.long	.LASF37
	.byte	0x4
	.value	0x14a
	.long	0x93
	.sleb128 168
	.uleb128 0x8
	.long	.LASF38
	.byte	0x4
	.value	0x14b
	.long	0x93
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
	.long	0x29f
	.sleb128 196
	.byte	0x0
	.uleb128 0x9
	.long	.LASF172
	.byte	0x4
	.byte	0xb4
	.uleb128 0xa
	.long	.LASF43
	.byte	0x18
	.byte	0x4
	.byte	0xba
	.long	0x27d
	.uleb128 0xb
	.long	.LASF44
	.byte	0x4
	.byte	0xbb
	.long	0x27d
	.sleb128 0
	.uleb128 0xb
	.long	.LASF45
	.byte	0x4
	.byte	0xbc
	.long	0x283
	.sleb128 8
	.uleb128 0xb
	.long	.LASF46
	.byte	0x4
	.byte	0xc0
	.long	0x3f
	.sleb128 16
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.long	0x24c
	.uleb128 0x5
	.byte	0x8
	.long	0xa9
	.uleb128 0xc
	.long	0x9b
	.long	0x299
	.uleb128 0xd
	.long	0x38
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.long	0x245
	.uleb128 0xc
	.long	0x9b
	.long	0x2af
	.uleb128 0xd
	.long	0x38
	.byte	0x13
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF48
	.uleb128 0xe
	.byte	0x1
	.long	.LASF173
	.byte	0x1
	.byte	0x2f
	.byte	0x1
	.long	0x3f
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF174
	.byte	0x1
	.value	0x465
	.byte	0x1
	.long	0x3f
	.byte	0x1
	.long	0x337
	.uleb128 0x10
	.string	"x0"
	.byte	0x1
	.value	0x465
	.long	0x2b6
	.uleb128 0x10
	.string	"y0"
	.byte	0x1
	.value	0x465
	.long	0x2b6
	.uleb128 0x10
	.string	"x1"
	.byte	0x1
	.value	0x465
	.long	0x2b6
	.uleb128 0x10
	.string	"y1"
	.byte	0x1
	.value	0x465
	.long	0x2b6
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.value	0x465
	.long	0x2b6
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.value	0x465
	.long	0x2b6
	.uleb128 0x11
	.long	.LASF49
	.byte	0x1
	.value	0x467
	.long	0x337
	.uleb128 0x11
	.long	.LASF50
	.byte	0x1
	.value	0x468
	.long	0x2b6
	.byte	0x0
	.uleb128 0x12
	.long	0x2b6
	.uleb128 0x13
	.long	0x2bd
	.quad	.LFB21
	.quad	.LFE21
	.byte	0x1
	.byte	0x9c
	.uleb128 0x14
	.byte	0x1
	.long	.LASF175
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x3f
	.quad	.LFB22
	.quad	.LFE22
	.byte	0x1
	.byte	0x9c
	.uleb128 0x15
	.byte	0x1
	.long	.LASF69
	.byte	0x1
	.value	0x2e7
	.byte	0x1
	.long	0x3f
	.quad	.LFB38
	.quad	.LFE38
	.byte	0x1
	.byte	0x9c
	.long	0x4b1
	.uleb128 0x16
	.long	.LASF51
	.byte	0x1
	.value	0x2e7
	.long	0x4b1
	.long	.LLST0
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.value	0x2e7
	.long	0x4b1
	.long	.LLST1
	.uleb128 0x16
	.long	.LASF53
	.byte	0x1
	.value	0x2e7
	.long	0x3f
	.long	.LLST2
	.uleb128 0x16
	.long	.LASF54
	.byte	0x1
	.value	0x2e7
	.long	0x2b6
	.long	.LLST3
	.uleb128 0x16
	.long	.LASF55
	.byte	0x1
	.value	0x2e7
	.long	0x2b6
	.long	.LLST4
	.uleb128 0x16
	.long	.LASF56
	.byte	0x1
	.value	0x2e8
	.long	0x2b6
	.long	.LLST5
	.uleb128 0x17
	.long	.LASF57
	.byte	0x1
	.value	0x2e8
	.long	0x2b6
	.byte	0x1
	.byte	0x64
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x2e8
	.long	0x4b7
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x2e8
	.long	0x4b7
	.byte	0x1
	.byte	0x58
	.uleb128 0x18
	.long	.LASF60
	.byte	0x1
	.value	0x2ea
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -416
	.uleb128 0x18
	.long	.LASF61
	.byte	0x1
	.value	0x2ea
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -816
	.uleb128 0x19
	.long	.LASF62
	.byte	0x1
	.value	0x2ea
	.long	0x2b6
	.long	.LLST6
	.uleb128 0x19
	.long	.LASF63
	.byte	0x1
	.value	0x2ea
	.long	0x2b6
	.long	.LLST7
	.uleb128 0x19
	.long	.LASF64
	.byte	0x1
	.value	0x2eb
	.long	0x3f
	.long	.LLST8
	.uleb128 0x19
	.long	.LASF65
	.byte	0x1
	.value	0x2eb
	.long	0x3f
	.long	.LLST9
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x2eb
	.long	0x3f
	.long	.LLST10
	.uleb128 0x19
	.long	.LASF67
	.byte	0x1
	.value	0x2eb
	.long	0x3f
	.long	.LLST11
	.uleb128 0x19
	.long	.LASF68
	.byte	0x1
	.value	0x2eb
	.long	0x3f
	.long	.LLST12
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.long	0x337
	.uleb128 0x5
	.byte	0x8
	.long	0x2b6
	.uleb128 0xc
	.long	0x2b6
	.long	0x4cd
	.uleb128 0xd
	.long	0x38
	.byte	0x31
	.byte	0x0
	.uleb128 0x1a
	.long	0x2cb
	.quad	.LFB46
	.quad	.LFE46
	.byte	0x1
	.byte	0x9c
	.long	0x532
	.uleb128 0x1b
	.long	0x2de
	.long	.LLST13
	.uleb128 0x1c
	.long	0x2e9
	.byte	0x1
	.byte	0x62
	.uleb128 0x1c
	.long	0x2f4
	.byte	0x1
	.byte	0x63
	.uleb128 0x1b
	.long	0x2ff
	.long	.LLST14
	.uleb128 0x1b
	.long	0x30a
	.long	.LLST15
	.uleb128 0x1b
	.long	0x314
	.long	.LLST16
	.uleb128 0x1d
	.long	0x31e
	.byte	0x8
	.long	0x812dea11
	.long	0x3d719799
	.uleb128 0x1e
	.long	0x32a
	.long	.LLST17
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF70
	.byte	0x1
	.value	0x44b
	.byte	0x1
	.long	0x2b6
	.quad	.LFB45
	.quad	.LFE45
	.byte	0x1
	.byte	0x9c
	.long	0x5f9
	.uleb128 0x1f
	.string	"x1"
	.byte	0x1
	.value	0x44b
	.long	0x4b1
	.long	.LLST18
	.uleb128 0x1f
	.string	"y1"
	.byte	0x1
	.value	0x44b
	.long	0x4b1
	.long	.LLST19
	.uleb128 0x1f
	.string	"z1"
	.byte	0x1
	.value	0x44b
	.long	0x4b1
	.long	.LLST20
	.uleb128 0x1f
	.string	"n1"
	.byte	0x1
	.value	0x44b
	.long	0x3f
	.long	.LLST21
	.uleb128 0x1f
	.string	"x2"
	.byte	0x1
	.value	0x44c
	.long	0x4b1
	.long	.LLST22
	.uleb128 0x1f
	.string	"y2"
	.byte	0x1
	.value	0x44c
	.long	0x4b1
	.long	.LLST23
	.uleb128 0x20
	.string	"z2"
	.byte	0x1
	.value	0x44c
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.string	"n2"
	.byte	0x1
	.value	0x44c
	.long	0x3f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x19
	.long	.LASF71
	.byte	0x1
	.value	0x44e
	.long	0x2b6
	.long	.LLST24
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x44f
	.long	0x3f
	.long	.LLST25
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x44f
	.long	0x3f
	.long	.LLST26
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF72
	.byte	0x1
	.value	0x433
	.byte	0x1
	.long	0x2b6
	.quad	.LFB44
	.quad	.LFE44
	.byte	0x1
	.byte	0x9c
	.long	0x682
	.uleb128 0x1f
	.string	"x"
	.byte	0x1
	.value	0x433
	.long	0x4b1
	.long	.LLST27
	.uleb128 0x1f
	.string	"y"
	.byte	0x1
	.value	0x433
	.long	0x4b1
	.long	.LLST28
	.uleb128 0x1f
	.string	"z"
	.byte	0x1
	.value	0x433
	.long	0x4b1
	.long	.LLST29
	.uleb128 0x1f
	.string	"n"
	.byte	0x1
	.value	0x433
	.long	0x3f
	.long	.LLST30
	.uleb128 0x19
	.long	.LASF73
	.byte	0x1
	.value	0x435
	.long	0x2b6
	.long	.LLST31
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x436
	.long	0x3f
	.long	.LLST32
	.uleb128 0x21
	.string	"j"
	.byte	0x1
	.value	0x436
	.long	0x3f
	.long	.LLST33
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF74
	.byte	0x1
	.value	0x3fe
	.byte	0x1
	.long	0x2b6
	.quad	.LFB43
	.quad	.LFE43
	.byte	0x1
	.byte	0x9c
	.long	0x7bb
	.uleb128 0x16
	.long	.LASF54
	.byte	0x1
	.value	0x3fe
	.long	0x2b6
	.long	.LLST34
	.uleb128 0x16
	.long	.LASF55
	.byte	0x1
	.value	0x3fe
	.long	0x2b6
	.long	.LLST35
	.uleb128 0x16
	.long	.LASF56
	.byte	0x1
	.value	0x3fe
	.long	0x2b6
	.long	.LLST36
	.uleb128 0x16
	.long	.LASF57
	.byte	0x1
	.value	0x3fe
	.long	0x2b6
	.long	.LLST37
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x3fe
	.long	0x2b6
	.long	.LLST38
	.uleb128 0x19
	.long	.LASF76
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.long	.LLST39
	.uleb128 0x19
	.long	.LASF77
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.long	.LLST40
	.uleb128 0x19
	.long	.LASF78
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.long	.LLST41
	.uleb128 0x19
	.long	.LASF79
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.long	.LLST42
	.uleb128 0x11
	.long	.LASF80
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.uleb128 0x19
	.long	.LASF81
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.long	.LLST43
	.uleb128 0x19
	.long	.LASF82
	.byte	0x1
	.value	0x400
	.long	0x2b6
	.long	.LLST44
	.uleb128 0x21
	.string	"f1"
	.byte	0x1
	.value	0x401
	.long	0x2b6
	.long	.LLST45
	.uleb128 0x21
	.string	"f2"
	.byte	0x1
	.value	0x401
	.long	0x2b6
	.long	.LLST46
	.uleb128 0x21
	.string	"fac"
	.byte	0x1
	.value	0x401
	.long	0x2b6
	.long	.LLST47
	.uleb128 0x11
	.long	.LASF83
	.byte	0x1
	.value	0x401
	.long	0x2b6
	.uleb128 0x19
	.long	.LASF84
	.byte	0x1
	.value	0x402
	.long	0x2b6
	.long	.LLST48
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x403
	.long	0x3f
	.long	.LLST49
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF85
	.byte	0x1
	.value	0x3ef
	.byte	0x1
	.long	0x2b6
	.quad	.LFB42
	.quad	.LFE42
	.byte	0x1
	.byte	0x9c
	.long	0x83c
	.uleb128 0x16
	.long	.LASF54
	.byte	0x1
	.value	0x3ef
	.long	0x2b6
	.long	.LLST50
	.uleb128 0x16
	.long	.LASF55
	.byte	0x1
	.value	0x3ef
	.long	0x2b6
	.long	.LLST51
	.uleb128 0x16
	.long	.LASF56
	.byte	0x1
	.value	0x3ef
	.long	0x2b6
	.long	.LLST52
	.uleb128 0x16
	.long	.LASF57
	.byte	0x1
	.value	0x3ef
	.long	0x2b6
	.long	.LLST53
	.uleb128 0x19
	.long	.LASF78
	.byte	0x1
	.value	0x3f1
	.long	0x2b6
	.long	.LLST54
	.uleb128 0x11
	.long	.LASF86
	.byte	0x1
	.value	0x3f2
	.long	0x2b6
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF87
	.byte	0x1
	.value	0x3ba
	.byte	0x1
	.long	0x2b6
	.quad	.LFB41
	.quad	.LFE41
	.byte	0x1
	.byte	0x9c
	.long	0x978
	.uleb128 0x1f
	.string	"x"
	.byte	0x1
	.value	0x3ba
	.long	0x4b1
	.long	.LLST55
	.uleb128 0x1f
	.string	"y"
	.byte	0x1
	.value	0x3ba
	.long	0x4b1
	.long	.LLST56
	.uleb128 0x1f
	.string	"n"
	.byte	0x1
	.value	0x3ba
	.long	0x3f
	.long	.LLST57
	.uleb128 0x16
	.long	.LASF75
	.byte	0x1
	.value	0x3ba
	.long	0x2b6
	.long	.LLST58
	.uleb128 0x19
	.long	.LASF84
	.byte	0x1
	.value	0x3bc
	.long	0x2b6
	.long	.LLST59
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x3bd
	.long	0x3f
	.long	.LLST60
	.uleb128 0x22
	.long	.Ldebug_ranges0+0x0
	.uleb128 0x21
	.string	"ip"
	.byte	0x1
	.value	0x3c1
	.long	0x3f
	.long	.LLST61
	.uleb128 0x19
	.long	.LASF76
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST62
	.uleb128 0x19
	.long	.LASF77
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST63
	.uleb128 0x19
	.long	.LASF78
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST64
	.uleb128 0x19
	.long	.LASF79
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST65
	.uleb128 0x19
	.long	.LASF80
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST66
	.uleb128 0x19
	.long	.LASF81
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST67
	.uleb128 0x19
	.long	.LASF82
	.byte	0x1
	.value	0x3c2
	.long	0x2b6
	.long	.LLST68
	.uleb128 0x21
	.string	"f1"
	.byte	0x1
	.value	0x3c3
	.long	0x2b6
	.long	.LLST69
	.uleb128 0x21
	.string	"f2"
	.byte	0x1
	.value	0x3c3
	.long	0x2b6
	.long	.LLST70
	.uleb128 0x21
	.string	"fac"
	.byte	0x1
	.value	0x3c3
	.long	0x2b6
	.long	.LLST71
	.uleb128 0x11
	.long	.LASF83
	.byte	0x1
	.value	0x3c3
	.long	0x2b6
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF88
	.byte	0x1
	.value	0x39b
	.byte	0x1
	.long	0x2b6
	.quad	.LFB40
	.quad	.LFE40
	.byte	0x1
	.byte	0x9c
	.long	0xa4c
	.uleb128 0x1f
	.string	"x"
	.byte	0x1
	.value	0x39b
	.long	0x4b1
	.long	.LLST72
	.uleb128 0x1f
	.string	"y"
	.byte	0x1
	.value	0x39b
	.long	0x4b1
	.long	.LLST73
	.uleb128 0x1f
	.string	"n"
	.byte	0x1
	.value	0x39b
	.long	0x3f
	.long	.LLST74
	.uleb128 0x19
	.long	.LASF86
	.byte	0x1
	.value	0x39d
	.long	0x2b6
	.long	.LLST75
	.uleb128 0x21
	.string	"i"
	.byte	0x1
	.value	0x39e
	.long	0x3f
	.long	.LLST76
	.uleb128 0x22
	.long	.Ldebug_ranges0+0x50
	.uleb128 0x21
	.string	"ip"
	.byte	0x1
	.value	0x3a1
	.long	0x3f
	.long	.LLST77
	.uleb128 0x21
	.string	"dx"
	.byte	0x1
	.value	0x3a2
	.long	0x2b6
	.long	.LLST78
	.uleb128 0x23
	.string	"dy"
	.byte	0x1
	.value	0x3a3
	.long	0x2b6
	.uleb128 0x11
	.long	.LASF89
	.byte	0x1
	.value	0x3a3
	.long	0x2b6
	.uleb128 0x23
	.string	"hdy"
	.byte	0x1
	.value	0x3a3
	.long	0x2b6
	.uleb128 0x19
	.long	.LASF79
	.byte	0x1
	.value	0x3a4
	.long	0x2b6
	.long	.LLST79
	.uleb128 0x19
	.long	.LASF80
	.byte	0x1
	.value	0x3a4
	.long	0x2b6
	.long	.LLST80
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF90
	.byte	0x1
	.value	0x352
	.byte	0x1
	.long	0x3f
	.quad	.LFB39
	.quad	.LFE39
	.byte	0x1
	.byte	0x9c
	.long	0xd1b
	.uleb128 0x16
	.long	.LASF91
	.byte	0x1
	.value	0x352
	.long	0x4b1
	.long	.LLST81
	.uleb128 0x16
	.long	.LASF92
	.byte	0x1
	.value	0x352
	.long	0x4b1
	.long	.LLST82
	.uleb128 0x16
	.long	.LASF93
	.byte	0x1
	.value	0x352
	.long	0x3f
	.long	.LLST83
	.uleb128 0x16
	.long	.LASF94
	.byte	0x1
	.value	0x353
	.long	0x4b1
	.long	.LLST84
	.uleb128 0x16
	.long	.LASF95
	.byte	0x1
	.value	0x353
	.long	0x4b1
	.long	.LLST85
	.uleb128 0x16
	.long	.LASF96
	.byte	0x1
	.value	0x353
	.long	0x3f
	.long	.LLST86
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x354
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x354
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.long	.LASF97
	.byte	0x1
	.value	0x356
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x18
	.long	.LASF98
	.byte	0x1
	.value	0x356
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x19
	.long	.LASF99
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST87
	.uleb128 0x19
	.long	.LASF100
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST88
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST89
	.uleb128 0x19
	.long	.LASF102
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST90
	.uleb128 0x19
	.long	.LASF103
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST91
	.uleb128 0x19
	.long	.LASF104
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST92
	.uleb128 0x19
	.long	.LASF105
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST93
	.uleb128 0x19
	.long	.LASF106
	.byte	0x1
	.value	0x357
	.long	0x2b6
	.long	.LLST94
	.uleb128 0x21
	.string	"dx1"
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.long	.LLST95
	.uleb128 0x21
	.string	"dy1"
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.long	.LLST96
	.uleb128 0x21
	.string	"dx2"
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.long	.LLST97
	.uleb128 0x23
	.string	"dy2"
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.uleb128 0x19
	.long	.LASF107
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.long	.LLST98
	.uleb128 0x21
	.string	"ds1"
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.long	.LLST99
	.uleb128 0x21
	.string	"ds2"
	.byte	0x1
	.value	0x358
	.long	0x2b6
	.long	.LLST100
	.uleb128 0x19
	.long	.LASF65
	.byte	0x1
	.value	0x359
	.long	0x3f
	.long	.LLST101
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x359
	.long	0x3f
	.long	.LLST102
	.uleb128 0x19
	.long	.LASF67
	.byte	0x1
	.value	0x359
	.long	0x3f
	.long	.LLST103
	.uleb128 0x19
	.long	.LASF68
	.byte	0x1
	.value	0x359
	.long	0x3f
	.long	.LLST104
	.uleb128 0x21
	.string	"i1"
	.byte	0x1
	.value	0x359
	.long	0x3f
	.long	.LLST105
	.uleb128 0x21
	.string	"i2"
	.byte	0x1
	.value	0x359
	.long	0x3f
	.long	.LLST106
	.uleb128 0x24
	.long	0x2cb
	.quad	.LBB16
	.long	.Ldebug_ranges0+0xa0
	.byte	0x1
	.value	0x369
	.long	0xcbb
	.uleb128 0x1b
	.long	0x314
	.long	.LLST107
	.uleb128 0x1b
	.long	0x30a
	.long	.LLST108
	.uleb128 0x1b
	.long	0x2ff
	.long	.LLST109
	.uleb128 0x1b
	.long	0x2f4
	.long	.LLST110
	.uleb128 0x1b
	.long	0x2e9
	.long	.LLST111
	.uleb128 0x1b
	.long	0x2de
	.long	.LLST112
	.uleb128 0x22
	.long	.Ldebug_ranges0+0xd0
	.uleb128 0x1e
	.long	0x31e
	.long	.LLST113
	.uleb128 0x25
	.long	0x32a
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.long	0x2cb
	.quad	.LBB20
	.long	.Ldebug_ranges0+0x100
	.byte	0x1
	.value	0x36d
	.uleb128 0x1b
	.long	0x314
	.long	.LLST114
	.uleb128 0x1b
	.long	0x30a
	.long	.LLST115
	.uleb128 0x1b
	.long	0x2ff
	.long	.LLST116
	.uleb128 0x1b
	.long	0x2f4
	.long	.LLST117
	.uleb128 0x1b
	.long	0x2e9
	.long	.LLST118
	.uleb128 0x1b
	.long	0x2de
	.long	.LLST119
	.uleb128 0x22
	.long	.Ldebug_ranges0+0x130
	.uleb128 0x1e
	.long	0x31e
	.long	.LLST120
	.uleb128 0x25
	.long	0x32a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.quad	.LFB24
	.quad	.LFE24
	.byte	0x1
	.byte	0x9c
	.long	0xdf8
	.uleb128 0x28
	.long	.LASF108
	.byte	0x1
	.byte	0x42
	.long	0xdf8
	.long	.LLST121
	.uleb128 0x28
	.long	.LASF109
	.byte	0x1
	.byte	0x42
	.long	0xdf8
	.long	.LLST122
	.uleb128 0x29
	.string	"lon"
	.byte	0x1
	.byte	0x42
	.long	0x4b1
	.long	.LLST123
	.uleb128 0x29
	.string	"lat"
	.byte	0x1
	.byte	0x42
	.long	0x4b1
	.long	.LLST124
	.uleb128 0x28
	.long	.LASF110
	.byte	0x1
	.byte	0x42
	.long	0x4b7
	.long	.LLST125
	.uleb128 0x2a
	.string	"nx"
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.long	.LLST126
	.uleb128 0x2a
	.string	"ny"
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.long	.LLST127
	.uleb128 0x2a
	.string	"nxp"
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.long	.LLST128
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.long	.LLST129
	.uleb128 0x2a
	.string	"j"
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.long	.LLST130
	.uleb128 0x2b
	.long	.LASF53
	.byte	0x1
	.byte	0x44
	.long	0x3f
	.long	.LLST131
	.uleb128 0x2c
	.long	.LASF111
	.byte	0x1
	.byte	0x45
	.long	0xe03
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2c
	.long	.LASF112
	.byte	0x1
	.byte	0x45
	.long	0xe03
	.byte	0x3
	.byte	0x91
	.sleb128 -384
	.byte	0x0
	.uleb128 0x5
	.byte	0x8
	.long	0xdfe
	.uleb128 0x12
	.long	0x3f
	.uleb128 0xc
	.long	0x2b6
	.long	0xe13
	.uleb128 0xd
	.long	0x38
	.byte	0x13
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF114
	.byte	0x1
	.byte	0x3d
	.byte	0x1
	.quad	.LFB23
	.quad	.LFE23
	.byte	0x1
	.byte	0x9c
	.long	0xe74
	.uleb128 0x2d
	.long	.LASF108
	.byte	0x1
	.byte	0x3d
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x2d
	.long	.LASF109
	.byte	0x1
	.byte	0x3d
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x2e
	.string	"lon"
	.byte	0x1
	.byte	0x3d
	.long	0x4b1
	.byte	0x1
	.byte	0x51
	.uleb128 0x2e
	.string	"lat"
	.byte	0x1
	.byte	0x3d
	.long	0x4b1
	.byte	0x1
	.byte	0x52
	.uleb128 0x2d
	.long	.LASF110
	.byte	0x1
	.byte	0x3d
	.long	0x4b7
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF115
	.byte	0x1
	.value	0x28a
	.byte	0x1
	.long	0x3f
	.quad	.LFB37
	.quad	.LFE37
	.byte	0x1
	.byte	0x9c
	.long	0x1233
	.uleb128 0x16
	.long	.LASF116
	.byte	0x1
	.value	0x28a
	.long	0xdf8
	.long	.LLST132
	.uleb128 0x16
	.long	.LASF117
	.byte	0x1
	.value	0x28a
	.long	0xdf8
	.long	.LLST133
	.uleb128 0x16
	.long	.LASF118
	.byte	0x1
	.value	0x28a
	.long	0xdf8
	.long	.LLST134
	.uleb128 0x16
	.long	.LASF119
	.byte	0x1
	.value	0x28a
	.long	0xdf8
	.long	.LLST135
	.uleb128 0x16
	.long	.LASF51
	.byte	0x1
	.value	0x28b
	.long	0x4b1
	.long	.LLST136
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.value	0x28b
	.long	0x4b1
	.long	.LLST137
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x28b
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x28b
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x28c
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x28c
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x28c
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x28c
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x28c
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x28d
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x17
	.long	.LASF124
	.byte	0x1
	.value	0x28d
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x17
	.long	.LASF125
	.byte	0x1
	.value	0x28d
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x21
	.string	"nx1"
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST138
	.uleb128 0x21
	.string	"nx2"
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST139
	.uleb128 0x21
	.string	"ny1"
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST140
	.uleb128 0x21
	.string	"ny2"
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST141
	.uleb128 0x19
	.long	.LASF126
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST142
	.uleb128 0x19
	.long	.LASF127
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST143
	.uleb128 0x19
	.long	.LASF128
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST144
	.uleb128 0x19
	.long	.LASF129
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST145
	.uleb128 0x19
	.long	.LASF130
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST146
	.uleb128 0x19
	.long	.LASF93
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST147
	.uleb128 0x19
	.long	.LASF96
	.byte	0x1
	.value	0x290
	.long	0x3f
	.long	.LLST148
	.uleb128 0x23
	.string	"n0"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.uleb128 0x23
	.string	"n1"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.uleb128 0x23
	.string	"n2"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.uleb128 0x23
	.string	"n3"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.uleb128 0x21
	.string	"i1"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.long	.LLST149
	.uleb128 0x21
	.string	"j1"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.long	.LLST150
	.uleb128 0x21
	.string	"i2"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.long	.LLST151
	.uleb128 0x21
	.string	"j2"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.long	.LLST152
	.uleb128 0x23
	.string	"l"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.uleb128 0x23
	.string	"n"
	.byte	0x1
	.value	0x291
	.long	0x3f
	.uleb128 0x18
	.long	.LASF131
	.byte	0x1
	.value	0x292
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x18
	.long	.LASF132
	.byte	0x1
	.value	0x292
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x18
	.long	.LASF133
	.byte	0x1
	.value	0x292
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0x18
	.long	.LASF134
	.byte	0x1
	.value	0x292
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0x18
	.long	.LASF135
	.byte	0x1
	.value	0x292
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -2064
	.uleb128 0x18
	.long	.LASF136
	.byte	0x1
	.value	0x292
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -2464
	.uleb128 0x19
	.long	.LASF137
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST153
	.uleb128 0x19
	.long	.LASF138
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST154
	.uleb128 0x19
	.long	.LASF139
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST155
	.uleb128 0x19
	.long	.LASF140
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST156
	.uleb128 0x19
	.long	.LASF141
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST157
	.uleb128 0x19
	.long	.LASF142
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST158
	.uleb128 0x19
	.long	.LASF143
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST159
	.uleb128 0x19
	.long	.LASF144
	.byte	0x1
	.value	0x293
	.long	0x2b6
	.long	.LLST160
	.uleb128 0x19
	.long	.LASF145
	.byte	0x1
	.value	0x294
	.long	0x2b6
	.long	.LLST161
	.uleb128 0x11
	.long	.LASF146
	.byte	0x1
	.value	0x294
	.long	0x2b6
	.uleb128 0x11
	.long	.LASF147
	.byte	0x1
	.value	0x294
	.long	0x2b6
	.uleb128 0x19
	.long	.LASF148
	.byte	0x1
	.value	0x295
	.long	0x4b7
	.long	.LLST162
	.uleb128 0x19
	.long	.LASF149
	.byte	0x1
	.value	0x295
	.long	0x4b7
	.long	.LLST163
	.uleb128 0x19
	.long	.LASF150
	.byte	0x1
	.value	0x295
	.long	0x2b6
	.long	.LLST164
	.uleb128 0x2f
	.quad	.LBB24
	.quad	.LBE24
	.uleb128 0x11
	.long	.LASF53
	.byte	0x1
	.value	0x2b5
	.long	0x3f
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x2b5
	.long	0x3f
	.long	.LLST165
	.uleb128 0x19
	.long	.LASF151
	.byte	0x1
	.value	0x2b6
	.long	0x2b6
	.long	.LLST166
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF152
	.byte	0x1
	.value	0x27e
	.byte	0x1
	.long	0x3f
	.quad	.LFB36
	.quad	.LFE36
	.byte	0x1
	.byte	0x9c
	.long	0x1350
	.uleb128 0x17
	.long	.LASF116
	.byte	0x1
	.value	0x27e
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x17
	.long	.LASF117
	.byte	0x1
	.value	0x27e
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.value	0x27e
	.long	0xdf8
	.byte	0x1
	.byte	0x51
	.uleb128 0x17
	.long	.LASF119
	.byte	0x1
	.value	0x27e
	.long	0xdf8
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.long	.LASF51
	.byte	0x1
	.value	0x27f
	.long	0x4b1
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.value	0x27f
	.long	0x4b1
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x27f
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x27f
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x280
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x280
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x280
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x280
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x280
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x281
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x17
	.long	.LASF124
	.byte	0x1
	.value	0x281
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x17
	.long	.LASF125
	.byte	0x1
	.value	0x281
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x11
	.long	.LASF130
	.byte	0x1
	.value	0x283
	.long	0x3f
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF153
	.byte	0x1
	.value	0x221
	.byte	0x1
	.long	0x3f
	.quad	.LFB35
	.quad	.LFE35
	.byte	0x1
	.byte	0x9c
	.long	0x16c5
	.uleb128 0x16
	.long	.LASF116
	.byte	0x1
	.value	0x221
	.long	0xdf8
	.long	.LLST167
	.uleb128 0x16
	.long	.LASF117
	.byte	0x1
	.value	0x221
	.long	0xdf8
	.long	.LLST168
	.uleb128 0x16
	.long	.LASF118
	.byte	0x1
	.value	0x221
	.long	0xdf8
	.long	.LLST169
	.uleb128 0x16
	.long	.LASF119
	.byte	0x1
	.value	0x221
	.long	0xdf8
	.long	.LLST170
	.uleb128 0x16
	.long	.LASF51
	.byte	0x1
	.value	0x222
	.long	0x4b1
	.long	.LLST171
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.value	0x222
	.long	0x4b1
	.long	.LLST172
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x222
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x222
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x223
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x223
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x223
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x223
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x224
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x224
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x21
	.string	"nx1"
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST173
	.uleb128 0x21
	.string	"ny1"
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST174
	.uleb128 0x21
	.string	"nx2"
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST175
	.uleb128 0x21
	.string	"ny2"
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST176
	.uleb128 0x19
	.long	.LASF126
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST177
	.uleb128 0x19
	.long	.LASF127
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST178
	.uleb128 0x11
	.long	.LASF128
	.byte	0x1
	.value	0x227
	.long	0x3f
	.uleb128 0x11
	.long	.LASF129
	.byte	0x1
	.value	0x227
	.long	0x3f
	.uleb128 0x19
	.long	.LASF130
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST179
	.uleb128 0x19
	.long	.LASF93
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST180
	.uleb128 0x19
	.long	.LASF96
	.byte	0x1
	.value	0x227
	.long	0x3f
	.long	.LLST181
	.uleb128 0x23
	.string	"n0"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.uleb128 0x23
	.string	"n1"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.uleb128 0x23
	.string	"n2"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.uleb128 0x23
	.string	"n3"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.uleb128 0x21
	.string	"i1"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.long	.LLST182
	.uleb128 0x21
	.string	"j1"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.long	.LLST183
	.uleb128 0x21
	.string	"i2"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.long	.LLST184
	.uleb128 0x21
	.string	"j2"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.long	.LLST185
	.uleb128 0x23
	.string	"l"
	.byte	0x1
	.value	0x228
	.long	0x3f
	.uleb128 0x18
	.long	.LASF131
	.byte	0x1
	.value	0x229
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x18
	.long	.LASF132
	.byte	0x1
	.value	0x229
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x18
	.long	.LASF133
	.byte	0x1
	.value	0x229
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0x18
	.long	.LASF134
	.byte	0x1
	.value	0x229
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0x18
	.long	.LASF135
	.byte	0x1
	.value	0x229
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -2064
	.uleb128 0x18
	.long	.LASF136
	.byte	0x1
	.value	0x229
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -2464
	.uleb128 0x19
	.long	.LASF137
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST186
	.uleb128 0x19
	.long	.LASF138
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST187
	.uleb128 0x19
	.long	.LASF139
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST188
	.uleb128 0x19
	.long	.LASF140
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST189
	.uleb128 0x19
	.long	.LASF141
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST190
	.uleb128 0x19
	.long	.LASF142
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST191
	.uleb128 0x19
	.long	.LASF143
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST192
	.uleb128 0x19
	.long	.LASF144
	.byte	0x1
	.value	0x22a
	.long	0x2b6
	.long	.LLST193
	.uleb128 0x19
	.long	.LASF145
	.byte	0x1
	.value	0x22b
	.long	0x2b6
	.long	.LLST194
	.uleb128 0x19
	.long	.LASF148
	.byte	0x1
	.value	0x22c
	.long	0x4b7
	.long	.LLST195
	.uleb128 0x19
	.long	.LASF149
	.byte	0x1
	.value	0x22c
	.long	0x4b7
	.long	.LLST196
	.uleb128 0x19
	.long	.LASF150
	.byte	0x1
	.value	0x22c
	.long	0x2b6
	.long	.LLST197
	.uleb128 0x2f
	.quad	.LBB25
	.quad	.LBE25
	.uleb128 0x11
	.long	.LASF53
	.byte	0x1
	.value	0x24b
	.long	0x3f
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x24b
	.long	0x3f
	.long	.LLST198
	.uleb128 0x19
	.long	.LASF154
	.byte	0x1
	.value	0x24c
	.long	0x2b6
	.long	.LLST199
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF155
	.byte	0x1
	.value	0x214
	.byte	0x1
	.long	0x3f
	.quad	.LFB34
	.quad	.LFE34
	.byte	0x1
	.byte	0x9c
	.long	0x17c2
	.uleb128 0x17
	.long	.LASF116
	.byte	0x1
	.value	0x214
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x17
	.long	.LASF117
	.byte	0x1
	.value	0x214
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.value	0x214
	.long	0xdf8
	.byte	0x1
	.byte	0x51
	.uleb128 0x17
	.long	.LASF119
	.byte	0x1
	.value	0x214
	.long	0xdf8
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.long	.LASF51
	.byte	0x1
	.value	0x215
	.long	0x4b1
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.value	0x215
	.long	0x4b1
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x215
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x215
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x216
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x216
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x216
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x216
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x217
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x217
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x11
	.long	.LASF130
	.byte	0x1
	.value	0x219
	.long	0x3f
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF156
	.byte	0x1
	.value	0x1b6
	.byte	0x1
	.long	0x3f
	.quad	.LFB33
	.quad	.LFE33
	.byte	0x1
	.byte	0x9c
	.long	0x1aab
	.uleb128 0x16
	.long	.LASF116
	.byte	0x1
	.value	0x1b6
	.long	0xdf8
	.long	.LLST200
	.uleb128 0x16
	.long	.LASF117
	.byte	0x1
	.value	0x1b6
	.long	0xdf8
	.long	.LLST201
	.uleb128 0x16
	.long	.LASF118
	.byte	0x1
	.value	0x1b6
	.long	0xdf8
	.long	.LLST202
	.uleb128 0x16
	.long	.LASF119
	.byte	0x1
	.value	0x1b6
	.long	0xdf8
	.long	.LLST203
	.uleb128 0x16
	.long	.LASF51
	.byte	0x1
	.value	0x1b7
	.long	0x4b1
	.long	.LLST204
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.value	0x1b7
	.long	0x4b1
	.long	.LLST205
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x1b7
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x1b7
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x1b8
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x1b8
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x1b8
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x1b8
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x1b8
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x1b9
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x17
	.long	.LASF124
	.byte	0x1
	.value	0x1b9
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x17
	.long	.LASF125
	.byte	0x1
	.value	0x1b9
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x21
	.string	"nx1"
	.byte	0x1
	.value	0x1bc
	.long	0x3f
	.long	.LLST206
	.uleb128 0x21
	.string	"ny1"
	.byte	0x1
	.value	0x1bc
	.long	0x3f
	.long	.LLST207
	.uleb128 0x21
	.string	"nx2"
	.byte	0x1
	.value	0x1bc
	.long	0x3f
	.long	.LLST208
	.uleb128 0x21
	.string	"ny2"
	.byte	0x1
	.value	0x1bc
	.long	0x3f
	.long	.LLST209
	.uleb128 0x19
	.long	.LASF126
	.byte	0x1
	.value	0x1bc
	.long	0x3f
	.long	.LLST210
	.uleb128 0x19
	.long	.LASF127
	.byte	0x1
	.value	0x1bc
	.long	0x3f
	.long	.LLST211
	.uleb128 0x21
	.string	"i1"
	.byte	0x1
	.value	0x1bd
	.long	0x3f
	.long	.LLST212
	.uleb128 0x21
	.string	"j1"
	.byte	0x1
	.value	0x1bd
	.long	0x3f
	.long	.LLST213
	.uleb128 0x21
	.string	"i2"
	.byte	0x1
	.value	0x1bd
	.long	0x3f
	.long	.LLST214
	.uleb128 0x21
	.string	"j2"
	.byte	0x1
	.value	0x1bd
	.long	0x3f
	.long	.LLST215
	.uleb128 0x19
	.long	.LASF130
	.byte	0x1
	.value	0x1bd
	.long	0x3f
	.long	.LLST216
	.uleb128 0x23
	.string	"n"
	.byte	0x1
	.value	0x1bd
	.long	0x3f
	.uleb128 0x19
	.long	.LASF54
	.byte	0x1
	.value	0x1be
	.long	0x2b6
	.long	.LLST217
	.uleb128 0x19
	.long	.LASF55
	.byte	0x1
	.value	0x1be
	.long	0x2b6
	.long	.LLST218
	.uleb128 0x19
	.long	.LASF56
	.byte	0x1
	.value	0x1be
	.long	0x2b6
	.long	.LLST219
	.uleb128 0x19
	.long	.LASF57
	.byte	0x1
	.value	0x1be
	.long	0x2b6
	.long	.LLST220
	.uleb128 0x18
	.long	.LASF111
	.byte	0x1
	.value	0x1be
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x18
	.long	.LASF112
	.byte	0x1
	.value	0x1be
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x18
	.long	.LASF135
	.byte	0x1
	.value	0x1be
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0x18
	.long	.LASF136
	.byte	0x1
	.value	0x1be
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0x19
	.long	.LASF157
	.byte	0x1
	.value	0x1bf
	.long	0x4b7
	.long	.LLST221
	.uleb128 0x19
	.long	.LASF158
	.byte	0x1
	.value	0x1bf
	.long	0x4b7
	.long	.LLST222
	.uleb128 0x19
	.long	.LASF148
	.byte	0x1
	.value	0x1c0
	.long	0x4b7
	.long	.LLST223
	.uleb128 0x19
	.long	.LASF149
	.byte	0x1
	.value	0x1c0
	.long	0x4b7
	.long	.LLST224
	.uleb128 0x19
	.long	.LASF150
	.byte	0x1
	.value	0x1c0
	.long	0x2b6
	.long	.LLST225
	.uleb128 0x19
	.long	.LASF145
	.byte	0x1
	.value	0x1c1
	.long	0x2b6
	.long	.LLST226
	.uleb128 0x22
	.long	.Ldebug_ranges0+0x160
	.uleb128 0x19
	.long	.LASF53
	.byte	0x1
	.value	0x1df
	.long	0x3f
	.long	.LLST227
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x1df
	.long	0x3f
	.long	.LLST228
	.uleb128 0x19
	.long	.LASF151
	.byte	0x1
	.value	0x1e0
	.long	0x2b6
	.long	.LLST229
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF159
	.byte	0x1
	.value	0x1aa
	.byte	0x1
	.long	0x3f
	.quad	.LFB32
	.quad	.LFE32
	.byte	0x1
	.byte	0x9c
	.long	0x1bc8
	.uleb128 0x17
	.long	.LASF116
	.byte	0x1
	.value	0x1aa
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x17
	.long	.LASF117
	.byte	0x1
	.value	0x1aa
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.value	0x1aa
	.long	0xdf8
	.byte	0x1
	.byte	0x51
	.uleb128 0x17
	.long	.LASF119
	.byte	0x1
	.value	0x1aa
	.long	0xdf8
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.long	.LASF51
	.byte	0x1
	.value	0x1ab
	.long	0x4b1
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.value	0x1ab
	.long	0x4b1
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x1ab
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x1ab
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x1ac
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x1ac
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x1ac
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x1ac
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x1ac
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x1ad
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x17
	.long	.LASF124
	.byte	0x1
	.value	0x1ad
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x17
	.long	.LASF125
	.byte	0x1
	.value	0x1ad
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x11
	.long	.LASF130
	.byte	0x1
	.value	0x1af
	.long	0x3f
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF160
	.byte	0x1
	.value	0x151
	.byte	0x1
	.long	0x3f
	.quad	.LFB31
	.quad	.LFE31
	.byte	0x1
	.byte	0x9c
	.long	0x1e77
	.uleb128 0x16
	.long	.LASF116
	.byte	0x1
	.value	0x151
	.long	0xdf8
	.long	.LLST230
	.uleb128 0x16
	.long	.LASF117
	.byte	0x1
	.value	0x151
	.long	0xdf8
	.long	.LLST231
	.uleb128 0x16
	.long	.LASF118
	.byte	0x1
	.value	0x151
	.long	0xdf8
	.long	.LLST232
	.uleb128 0x16
	.long	.LASF119
	.byte	0x1
	.value	0x151
	.long	0xdf8
	.long	.LLST233
	.uleb128 0x16
	.long	.LASF51
	.byte	0x1
	.value	0x151
	.long	0x4b1
	.long	.LLST234
	.uleb128 0x16
	.long	.LASF52
	.byte	0x1
	.value	0x152
	.long	0x4b1
	.long	.LLST235
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x152
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x152
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x153
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x153
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x153
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x153
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x154
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x154
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x21
	.string	"nx1"
	.byte	0x1
	.value	0x157
	.long	0x3f
	.long	.LLST236
	.uleb128 0x21
	.string	"ny1"
	.byte	0x1
	.value	0x157
	.long	0x3f
	.long	.LLST237
	.uleb128 0x21
	.string	"nx2"
	.byte	0x1
	.value	0x157
	.long	0x3f
	.long	.LLST238
	.uleb128 0x21
	.string	"ny2"
	.byte	0x1
	.value	0x157
	.long	0x3f
	.long	.LLST239
	.uleb128 0x19
	.long	.LASF126
	.byte	0x1
	.value	0x157
	.long	0x3f
	.long	.LLST240
	.uleb128 0x19
	.long	.LASF127
	.byte	0x1
	.value	0x157
	.long	0x3f
	.long	.LLST241
	.uleb128 0x21
	.string	"i1"
	.byte	0x1
	.value	0x158
	.long	0x3f
	.long	.LLST242
	.uleb128 0x21
	.string	"j1"
	.byte	0x1
	.value	0x158
	.long	0x3f
	.long	.LLST243
	.uleb128 0x21
	.string	"i2"
	.byte	0x1
	.value	0x158
	.long	0x3f
	.long	.LLST244
	.uleb128 0x21
	.string	"j2"
	.byte	0x1
	.value	0x158
	.long	0x3f
	.long	.LLST245
	.uleb128 0x19
	.long	.LASF130
	.byte	0x1
	.value	0x158
	.long	0x3f
	.long	.LLST246
	.uleb128 0x19
	.long	.LASF54
	.byte	0x1
	.value	0x159
	.long	0x2b6
	.long	.LLST247
	.uleb128 0x19
	.long	.LASF55
	.byte	0x1
	.value	0x159
	.long	0x2b6
	.long	.LLST248
	.uleb128 0x19
	.long	.LASF56
	.byte	0x1
	.value	0x159
	.long	0x2b6
	.long	.LLST249
	.uleb128 0x19
	.long	.LASF57
	.byte	0x1
	.value	0x159
	.long	0x2b6
	.long	.LLST250
	.uleb128 0x18
	.long	.LASF111
	.byte	0x1
	.value	0x159
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x18
	.long	.LASF112
	.byte	0x1
	.value	0x159
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x18
	.long	.LASF135
	.byte	0x1
	.value	0x159
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0x18
	.long	.LASF136
	.byte	0x1
	.value	0x159
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0x19
	.long	.LASF148
	.byte	0x1
	.value	0x15a
	.long	0x4b7
	.long	.LLST251
	.uleb128 0x19
	.long	.LASF149
	.byte	0x1
	.value	0x15a
	.long	0x4b7
	.long	.LLST252
	.uleb128 0x19
	.long	.LASF150
	.byte	0x1
	.value	0x15a
	.long	0x2b6
	.long	.LLST253
	.uleb128 0x19
	.long	.LASF157
	.byte	0x1
	.value	0x15b
	.long	0x4b7
	.long	.LLST254
	.uleb128 0x19
	.long	.LASF158
	.byte	0x1
	.value	0x15b
	.long	0x4b7
	.long	.LLST255
	.uleb128 0x22
	.long	.Ldebug_ranges0+0x190
	.uleb128 0x19
	.long	.LASF53
	.byte	0x1
	.value	0x178
	.long	0x3f
	.long	.LLST256
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x178
	.long	0x3f
	.long	.LLST257
	.uleb128 0x19
	.long	.LASF154
	.byte	0x1
	.value	0x179
	.long	0x2b6
	.long	.LLST258
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF161
	.byte	0x1
	.value	0x145
	.byte	0x1
	.long	0x3f
	.quad	.LFB30
	.quad	.LFE30
	.byte	0x1
	.byte	0x9c
	.long	0x1f74
	.uleb128 0x17
	.long	.LASF116
	.byte	0x1
	.value	0x145
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x17
	.long	.LASF117
	.byte	0x1
	.value	0x145
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.value	0x145
	.long	0xdf8
	.byte	0x1
	.byte	0x51
	.uleb128 0x17
	.long	.LASF119
	.byte	0x1
	.value	0x145
	.long	0xdf8
	.byte	0x1
	.byte	0x52
	.uleb128 0x17
	.long	.LASF51
	.byte	0x1
	.value	0x146
	.long	0x4b1
	.byte	0x1
	.byte	0x58
	.uleb128 0x17
	.long	.LASF52
	.byte	0x1
	.value	0x146
	.long	0x4b1
	.byte	0x1
	.byte	0x59
	.uleb128 0x17
	.long	.LASF58
	.byte	0x1
	.value	0x146
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF59
	.byte	0x1
	.value	0x146
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x17
	.long	.LASF120
	.byte	0x1
	.value	0x147
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.value	0x147
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x17
	.long	.LASF121
	.byte	0x1
	.value	0x147
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.value	0x147
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x17
	.long	.LASF122
	.byte	0x1
	.value	0x148
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x17
	.long	.LASF123
	.byte	0x1
	.value	0x148
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x11
	.long	.LASF130
	.byte	0x1
	.value	0x14a
	.long	0x3f
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF162
	.byte	0x1
	.byte	0xec
	.byte	0x1
	.long	0x3f
	.quad	.LFB29
	.quad	.LFE29
	.byte	0x1
	.byte	0x9c
	.long	0x223f
	.uleb128 0x28
	.long	.LASF116
	.byte	0x1
	.byte	0xec
	.long	0xdf8
	.long	.LLST259
	.uleb128 0x28
	.long	.LASF117
	.byte	0x1
	.byte	0xec
	.long	0xdf8
	.long	.LLST260
	.uleb128 0x28
	.long	.LASF118
	.byte	0x1
	.byte	0xec
	.long	0xdf8
	.long	.LLST261
	.uleb128 0x28
	.long	.LASF119
	.byte	0x1
	.byte	0xec
	.long	0xdf8
	.long	.LLST262
	.uleb128 0x28
	.long	.LASF51
	.byte	0x1
	.byte	0xed
	.long	0x4b1
	.long	.LLST263
	.uleb128 0x28
	.long	.LASF52
	.byte	0x1
	.byte	0xed
	.long	0x4b1
	.long	.LLST264
	.uleb128 0x2d
	.long	.LASF58
	.byte	0x1
	.byte	0xed
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2d
	.long	.LASF59
	.byte	0x1
	.byte	0xed
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2d
	.long	.LASF120
	.byte	0x1
	.byte	0xee
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x2d
	.long	.LASF64
	.byte	0x1
	.byte	0xee
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x2d
	.long	.LASF121
	.byte	0x1
	.byte	0xee
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x2d
	.long	.LASF65
	.byte	0x1
	.byte	0xee
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x2d
	.long	.LASF122
	.byte	0x1
	.byte	0xee
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x2d
	.long	.LASF123
	.byte	0x1
	.byte	0xef
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x2d
	.long	.LASF124
	.byte	0x1
	.byte	0xef
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x2d
	.long	.LASF125
	.byte	0x1
	.byte	0xef
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x2a
	.string	"nx1"
	.byte	0x1
	.byte	0xf2
	.long	0x3f
	.long	.LLST265
	.uleb128 0x2a
	.string	"ny1"
	.byte	0x1
	.byte	0xf2
	.long	0x3f
	.long	.LLST266
	.uleb128 0x2a
	.string	"nx2"
	.byte	0x1
	.byte	0xf2
	.long	0x3f
	.long	.LLST267
	.uleb128 0x2a
	.string	"ny2"
	.byte	0x1
	.byte	0xf2
	.long	0x3f
	.long	.LLST268
	.uleb128 0x2b
	.long	.LASF126
	.byte	0x1
	.byte	0xf2
	.long	0x3f
	.long	.LLST269
	.uleb128 0x2b
	.long	.LASF127
	.byte	0x1
	.byte	0xf2
	.long	0x3f
	.long	.LLST270
	.uleb128 0x2a
	.string	"i1"
	.byte	0x1
	.byte	0xf3
	.long	0x3f
	.long	.LLST271
	.uleb128 0x2a
	.string	"j1"
	.byte	0x1
	.byte	0xf3
	.long	0x3f
	.long	.LLST272
	.uleb128 0x2a
	.string	"i2"
	.byte	0x1
	.byte	0xf3
	.long	0x3f
	.long	.LLST273
	.uleb128 0x2a
	.string	"j2"
	.byte	0x1
	.byte	0xf3
	.long	0x3f
	.long	.LLST274
	.uleb128 0x2b
	.long	.LASF130
	.byte	0x1
	.byte	0xf3
	.long	0x3f
	.long	.LLST275
	.uleb128 0x31
	.string	"n"
	.byte	0x1
	.byte	0xf3
	.long	0x3f
	.uleb128 0x2b
	.long	.LASF54
	.byte	0x1
	.byte	0xf4
	.long	0x2b6
	.long	.LLST276
	.uleb128 0x2b
	.long	.LASF55
	.byte	0x1
	.byte	0xf4
	.long	0x2b6
	.long	.LLST277
	.uleb128 0x2b
	.long	.LASF56
	.byte	0x1
	.byte	0xf4
	.long	0x2b6
	.long	.LLST278
	.uleb128 0x2b
	.long	.LASF57
	.byte	0x1
	.byte	0xf4
	.long	0x2b6
	.long	.LLST279
	.uleb128 0x2c
	.long	.LASF111
	.byte	0x1
	.byte	0xf4
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x2c
	.long	.LASF112
	.byte	0x1
	.byte	0xf4
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x2c
	.long	.LASF135
	.byte	0x1
	.byte	0xf4
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0x2c
	.long	.LASF136
	.byte	0x1
	.byte	0xf4
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0x2b
	.long	.LASF148
	.byte	0x1
	.byte	0xf5
	.long	0x4b7
	.long	.LLST280
	.uleb128 0x2b
	.long	.LASF149
	.byte	0x1
	.byte	0xf5
	.long	0x4b7
	.long	.LLST281
	.uleb128 0x2b
	.long	.LASF150
	.byte	0x1
	.byte	0xf5
	.long	0x2b6
	.long	.LLST282
	.uleb128 0x2b
	.long	.LASF157
	.byte	0x1
	.byte	0xf6
	.long	0x4b7
	.long	.LLST283
	.uleb128 0x2b
	.long	.LASF158
	.byte	0x1
	.byte	0xf6
	.long	0x4b7
	.long	.LLST284
	.uleb128 0x2f
	.quad	.LBB30
	.quad	.LBE30
	.uleb128 0x19
	.long	.LASF53
	.byte	0x1
	.value	0x113
	.long	0x3f
	.long	.LLST285
	.uleb128 0x19
	.long	.LASF66
	.byte	0x1
	.value	0x113
	.long	0x3f
	.long	.LLST286
	.uleb128 0x19
	.long	.LASF151
	.byte	0x1
	.value	0x114
	.long	0x2b6
	.long	.LLST287
	.uleb128 0x19
	.long	.LASF145
	.byte	0x1
	.value	0x114
	.long	0x2b6
	.long	.LLST288
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF163
	.byte	0x1
	.byte	0xe1
	.byte	0x1
	.long	0x3f
	.quad	.LFB28
	.quad	.LFE28
	.byte	0x1
	.byte	0x9c
	.long	0x234a
	.uleb128 0x2d
	.long	.LASF116
	.byte	0x1
	.byte	0xe1
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x2d
	.long	.LASF117
	.byte	0x1
	.byte	0xe1
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x2d
	.long	.LASF118
	.byte	0x1
	.byte	0xe1
	.long	0xdf8
	.byte	0x1
	.byte	0x51
	.uleb128 0x2d
	.long	.LASF119
	.byte	0x1
	.byte	0xe1
	.long	0xdf8
	.byte	0x1
	.byte	0x52
	.uleb128 0x2d
	.long	.LASF51
	.byte	0x1
	.byte	0xe2
	.long	0x4b1
	.byte	0x1
	.byte	0x58
	.uleb128 0x2d
	.long	.LASF52
	.byte	0x1
	.byte	0xe2
	.long	0x4b1
	.byte	0x1
	.byte	0x59
	.uleb128 0x2d
	.long	.LASF58
	.byte	0x1
	.byte	0xe2
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2d
	.long	.LASF59
	.byte	0x1
	.byte	0xe2
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2d
	.long	.LASF120
	.byte	0x1
	.byte	0xe3
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x2d
	.long	.LASF64
	.byte	0x1
	.byte	0xe3
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x2d
	.long	.LASF121
	.byte	0x1
	.byte	0xe3
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x2d
	.long	.LASF65
	.byte	0x1
	.byte	0xe3
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x2d
	.long	.LASF122
	.byte	0x1
	.byte	0xe3
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x2d
	.long	.LASF123
	.byte	0x1
	.byte	0xe4
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x2d
	.long	.LASF124
	.byte	0x1
	.byte	0xe4
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x2d
	.long	.LASF125
	.byte	0x1
	.byte	0xe4
	.long	0x4b7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x32
	.long	.LASF130
	.byte	0x1
	.byte	0xe6
	.long	0x3f
	.byte	0x0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF164
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.quad	.LFB25
	.quad	.LFE25
	.byte	0x1
	.byte	0x9c
	.long	0x2427
	.uleb128 0x28
	.long	.LASF108
	.byte	0x1
	.byte	0x5b
	.long	0xdf8
	.long	.LLST289
	.uleb128 0x28
	.long	.LASF109
	.byte	0x1
	.byte	0x5b
	.long	0xdf8
	.long	.LLST290
	.uleb128 0x29
	.string	"lon"
	.byte	0x1
	.byte	0x5b
	.long	0x4b1
	.long	.LLST291
	.uleb128 0x29
	.string	"lat"
	.byte	0x1
	.byte	0x5b
	.long	0x4b1
	.long	.LLST292
	.uleb128 0x28
	.long	.LASF110
	.byte	0x1
	.byte	0x5b
	.long	0x4b7
	.long	.LLST293
	.uleb128 0x2a
	.string	"nx"
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.long	.LLST294
	.uleb128 0x2a
	.string	"ny"
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.long	.LLST295
	.uleb128 0x2a
	.string	"nxp"
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.long	.LLST296
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.long	.LLST297
	.uleb128 0x2a
	.string	"j"
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.long	.LLST298
	.uleb128 0x2b
	.long	.LASF53
	.byte	0x1
	.byte	0x5d
	.long	0x3f
	.long	.LLST299
	.uleb128 0x2c
	.long	.LASF111
	.byte	0x1
	.byte	0x5e
	.long	0xe03
	.byte	0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x2c
	.long	.LASF112
	.byte	0x1
	.byte	0x5e
	.long	0xe03
	.byte	0x3
	.byte	0x91
	.sleb128 -384
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF165
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.long	0x3f
	.quad	.LFB27
	.quad	.LFE27
	.byte	0x1
	.byte	0x9c
	.long	0x26ac
	.uleb128 0x28
	.long	.LASF116
	.byte	0x1
	.byte	0x85
	.long	0xdf8
	.long	.LLST300
	.uleb128 0x28
	.long	.LASF117
	.byte	0x1
	.byte	0x85
	.long	0xdf8
	.long	.LLST301
	.uleb128 0x28
	.long	.LASF118
	.byte	0x1
	.byte	0x85
	.long	0xdf8
	.long	.LLST302
	.uleb128 0x28
	.long	.LASF119
	.byte	0x1
	.byte	0x85
	.long	0xdf8
	.long	.LLST303
	.uleb128 0x28
	.long	.LASF51
	.byte	0x1
	.byte	0x85
	.long	0x4b1
	.long	.LLST304
	.uleb128 0x28
	.long	.LASF52
	.byte	0x1
	.byte	0x86
	.long	0x4b1
	.long	.LLST305
	.uleb128 0x2d
	.long	.LASF58
	.byte	0x1
	.byte	0x86
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2d
	.long	.LASF59
	.byte	0x1
	.byte	0x86
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2d
	.long	.LASF120
	.byte	0x1
	.byte	0x87
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x2d
	.long	.LASF64
	.byte	0x1
	.byte	0x87
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x2d
	.long	.LASF121
	.byte	0x1
	.byte	0x87
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x2d
	.long	.LASF65
	.byte	0x1
	.byte	0x87
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x2d
	.long	.LASF122
	.byte	0x1
	.byte	0x88
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x2d
	.long	.LASF123
	.byte	0x1
	.byte	0x88
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x2a
	.string	"nx1"
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.long	.LLST306
	.uleb128 0x2a
	.string	"ny1"
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.long	.LLST307
	.uleb128 0x2a
	.string	"nx2"
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.long	.LLST308
	.uleb128 0x2a
	.string	"ny2"
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.long	.LLST309
	.uleb128 0x2b
	.long	.LASF126
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.long	.LLST310
	.uleb128 0x2b
	.long	.LASF127
	.byte	0x1
	.byte	0x8b
	.long	0x3f
	.long	.LLST311
	.uleb128 0x2a
	.string	"i1"
	.byte	0x1
	.byte	0x8c
	.long	0x3f
	.long	.LLST312
	.uleb128 0x2a
	.string	"j1"
	.byte	0x1
	.byte	0x8c
	.long	0x3f
	.long	.LLST313
	.uleb128 0x2a
	.string	"i2"
	.byte	0x1
	.byte	0x8c
	.long	0x3f
	.long	.LLST314
	.uleb128 0x2a
	.string	"j2"
	.byte	0x1
	.byte	0x8c
	.long	0x3f
	.long	.LLST315
	.uleb128 0x2b
	.long	.LASF130
	.byte	0x1
	.byte	0x8c
	.long	0x3f
	.long	.LLST316
	.uleb128 0x2b
	.long	.LASF54
	.byte	0x1
	.byte	0x8d
	.long	0x2b6
	.long	.LLST317
	.uleb128 0x2b
	.long	.LASF55
	.byte	0x1
	.byte	0x8d
	.long	0x2b6
	.long	.LLST318
	.uleb128 0x2b
	.long	.LASF56
	.byte	0x1
	.byte	0x8d
	.long	0x2b6
	.long	.LLST319
	.uleb128 0x2b
	.long	.LASF57
	.byte	0x1
	.byte	0x8d
	.long	0x2b6
	.long	.LLST320
	.uleb128 0x2c
	.long	.LASF111
	.byte	0x1
	.byte	0x8d
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x2c
	.long	.LASF112
	.byte	0x1
	.byte	0x8d
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -864
	.uleb128 0x2c
	.long	.LASF135
	.byte	0x1
	.byte	0x8d
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1264
	.uleb128 0x2c
	.long	.LASF136
	.byte	0x1
	.byte	0x8d
	.long	0x4bd
	.byte	0x3
	.byte	0x91
	.sleb128 -1664
	.uleb128 0x2b
	.long	.LASF148
	.byte	0x1
	.byte	0x8e
	.long	0x4b7
	.long	.LLST321
	.uleb128 0x2b
	.long	.LASF149
	.byte	0x1
	.byte	0x8e
	.long	0x4b7
	.long	.LLST322
	.uleb128 0x2b
	.long	.LASF150
	.byte	0x1
	.byte	0x8e
	.long	0x2b6
	.long	.LLST323
	.uleb128 0x2b
	.long	.LASF157
	.byte	0x1
	.byte	0x8f
	.long	0x4b7
	.long	.LLST324
	.uleb128 0x2b
	.long	.LASF158
	.byte	0x1
	.byte	0x8f
	.long	0x4b7
	.long	.LLST325
	.uleb128 0x22
	.long	.Ldebug_ranges0+0x1c0
	.uleb128 0x2b
	.long	.LASF53
	.byte	0x1
	.byte	0xb1
	.long	0x3f
	.long	.LLST326
	.uleb128 0x2b
	.long	.LASF66
	.byte	0x1
	.byte	0xb1
	.long	0x3f
	.long	.LLST327
	.uleb128 0x2b
	.long	.LASF154
	.byte	0x1
	.byte	0xb2
	.long	0x2b6
	.long	.LLST328
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF166
	.byte	0x1
	.byte	0x79
	.byte	0x1
	.long	0x3f
	.quad	.LFB26
	.quad	.LFE26
	.byte	0x1
	.byte	0x9c
	.long	0x2799
	.uleb128 0x2d
	.long	.LASF116
	.byte	0x1
	.byte	0x79
	.long	0xdf8
	.byte	0x1
	.byte	0x55
	.uleb128 0x2d
	.long	.LASF117
	.byte	0x1
	.byte	0x79
	.long	0xdf8
	.byte	0x1
	.byte	0x54
	.uleb128 0x2d
	.long	.LASF118
	.byte	0x1
	.byte	0x79
	.long	0xdf8
	.byte	0x1
	.byte	0x51
	.uleb128 0x2d
	.long	.LASF119
	.byte	0x1
	.byte	0x79
	.long	0xdf8
	.byte	0x1
	.byte	0x52
	.uleb128 0x2d
	.long	.LASF51
	.byte	0x1
	.byte	0x7a
	.long	0x4b1
	.byte	0x1
	.byte	0x58
	.uleb128 0x2d
	.long	.LASF52
	.byte	0x1
	.byte	0x7a
	.long	0x4b1
	.byte	0x1
	.byte	0x59
	.uleb128 0x2d
	.long	.LASF58
	.byte	0x1
	.byte	0x7a
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2d
	.long	.LASF59
	.byte	0x1
	.byte	0x7a
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2d
	.long	.LASF120
	.byte	0x1
	.byte	0x7b
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x2d
	.long	.LASF64
	.byte	0x1
	.byte	0x7b
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x2d
	.long	.LASF121
	.byte	0x1
	.byte	0x7b
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x2d
	.long	.LASF65
	.byte	0x1
	.byte	0x7b
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x2d
	.long	.LASF122
	.byte	0x1
	.byte	0x7b
	.long	0x4d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x2d
	.long	.LASF123
	.byte	0x1
	.byte	0x7b
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x32
	.long	.LASF130
	.byte	0x1
	.byte	0x7d
	.long	0x3f
	.byte	0x0
	.uleb128 0x33
	.long	.LASF167
	.byte	0x5
	.byte	0xa5
	.long	0x283
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF168
	.byte	0x5
	.byte	0xa6
	.long	0x283
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF167
	.byte	0x5
	.byte	0xa5
	.long	0x283
	.byte	0x1
	.byte	0x1
	.uleb128 0x33
	.long	.LASF168
	.byte	0x5
	.byte	0xa6
	.long	0x283
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
	.byte	0x0
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
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x0
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
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
	.uleb128 0xa
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.long	0x271
	.value	0x2
	.long	.Ldebug_info0
	.long	0x27ce
	.long	0x33c
	.string	"get_maxxgrid"
	.long	0x353
	.string	"get_maxxgrid_"
	.long	0x372
	.string	"clip"
	.long	0x4cd
	.string	"inside_edge"
	.long	0x532
	.string	"dist_between_boxes"
	.long	0x5f9
	.string	"grid_box_radius"
	.long	0x682
	.string	"box_ctrlon"
	.long	0x7bb
	.string	"box_ctrlat"
	.long	0x83c
	.string	"poly_ctrlon"
	.long	0x978
	.string	"poly_ctrlat"
	.long	0xa4c
	.string	"clip_2dx2d"
	.long	0xd1b
	.string	"get_grid_area"
	.long	0xe13
	.string	"get_grid_area_"
	.long	0xe74
	.string	"create_xgrid_2dx2d_order2"
	.long	0x1233
	.string	"create_xgrid_2dx2d_order2_"
	.long	0x1350
	.string	"create_xgrid_2dx2d_order1"
	.long	0x16c5
	.string	"create_xgrid_2dx2d_order1_"
	.long	0x17c2
	.string	"create_xgrid_2dx1d_order2"
	.long	0x1aab
	.string	"create_xgrid_2dx1d_order2_"
	.long	0x1bc8
	.string	"create_xgrid_2dx1d_order1"
	.long	0x1e77
	.string	"create_xgrid_2dx1d_order1_"
	.long	0x1f74
	.string	"create_xgrid_1dx2d_order2"
	.long	0x223f
	.string	"create_xgrid_1dx2d_order2_"
	.long	0x234a
	.string	"get_grid_area_no_adjust"
	.long	0x2427
	.string	"create_xgrid_1dx2d_order1"
	.long	0x26ac
	.string	"create_xgrid_1dx2d_order1_"
	.long	0x0
	.section	.debug_pubtypes,"",@progbits
	.long	0x5e
	.value	0x2
	.long	.Ldebug_info0
	.long	0x27ce
	.long	0x2d
	.string	"size_t"
	.long	0x7d
	.string	"__off_t"
	.long	0x88
	.string	"__off64_t"
	.long	0x245
	.string	"_IO_lock_t"
	.long	0x24c
	.string	"_IO_marker"
	.long	0xa9
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
	.quad	.LBB8-.Ltext0
	.quad	.LBE8-.Ltext0
	.quad	.LBB11-.Ltext0
	.quad	.LBE11-.Ltext0
	.quad	.LBB10-.Ltext0
	.quad	.LBE10-.Ltext0
	.quad	.LBB9-.Ltext0
	.quad	.LBE9-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB12-.Ltext0
	.quad	.LBE12-.Ltext0
	.quad	.LBB15-.Ltext0
	.quad	.LBE15-.Ltext0
	.quad	.LBB14-.Ltext0
	.quad	.LBE14-.Ltext0
	.quad	.LBB13-.Ltext0
	.quad	.LBE13-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB16-.Ltext0
	.quad	.LBE16-.Ltext0
	.quad	.LBB19-.Ltext0
	.quad	.LBE19-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB17-.Ltext0
	.quad	.LBE17-.Ltext0
	.quad	.LBB18-.Ltext0
	.quad	.LBE18-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB20-.Ltext0
	.quad	.LBE20-.Ltext0
	.quad	.LBB23-.Ltext0
	.quad	.LBE23-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB21-.Ltext0
	.quad	.LBE21-.Ltext0
	.quad	.LBB22-.Ltext0
	.quad	.LBE22-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB26-.Ltext0
	.quad	.LBE26-.Ltext0
	.quad	.LBB27-.Ltext0
	.quad	.LBE27-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB28-.Ltext0
	.quad	.LBE28-.Ltext0
	.quad	.LBB29-.Ltext0
	.quad	.LBE29-.Ltext0
	.quad	0x0
	.quad	0x0
	.quad	.LBB31-.Ltext0
	.quad	.LBE31-.Ltext0
	.quad	.LBB32-.Ltext0
	.quad	.LBE32-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF84:
	.string	"ctrlon"
.LASF148:
	.string	"area_in"
.LASF161:
	.string	"create_xgrid_2dx1d_order1_"
.LASF80:
	.string	"lat2"
.LASF127:
	.string	"nx2p"
.LASF32:
	.string	"_shortbuf"
.LASF172:
	.string	"_IO_lock_t"
.LASF100:
	.string	"y1_0"
.LASF94:
	.string	"lon2_in"
.LASF21:
	.string	"_IO_buf_end"
.LASF67:
	.string	"inside_last"
.LASF90:
	.string	"clip_2dx2d"
.LASF159:
	.string	"create_xgrid_2dx1d_order2_"
.LASF19:
	.string	"_IO_write_end"
.LASF1:
	.string	"unsigned int"
.LASF63:
	.string	"y_last"
.LASF125:
	.string	"xgrid_clat"
.LASF158:
	.string	"tmpy"
.LASF86:
	.string	"ctrlat"
.LASF13:
	.string	"_flags"
.LASF98:
	.string	"lat_tmp"
.LASF87:
	.string	"poly_ctrlon"
.LASF60:
	.string	"x_tmp"
.LASF25:
	.string	"_markers"
.LASF118:
	.string	"nlon_out"
.LASF96:
	.string	"n2_in"
.LASF58:
	.string	"lon_out"
.LASF154:
	.string	"Xarea"
.LASF70:
	.string	"dist_between_boxes"
.LASF46:
	.string	"_pos"
.LASF134:
	.string	"y2_in"
.LASF149:
	.string	"area_out"
.LASF168:
	.string	"stdout"
.LASF24:
	.string	"_IO_save_end"
.LASF47:
	.string	"float"
.LASF155:
	.string	"create_xgrid_2dx2d_order1_"
.LASF66:
	.string	"n_out"
.LASF12:
	.string	"long long unsigned int"
.LASF108:
	.string	"nlon"
.LASF54:
	.string	"ll_lon"
.LASF143:
	.string	"lat_out_min"
.LASF23:
	.string	"_IO_backup_base"
.LASF34:
	.string	"_offset"
.LASF49:
	.string	"SMALL"
.LASF27:
	.string	"_fileno"
.LASF136:
	.string	"y_out"
.LASF175:
	.string	"get_maxxgrid_"
.LASF51:
	.string	"lon_in"
.LASF8:
	.string	"size_t"
.LASF120:
	.string	"mask_in"
.LASF16:
	.string	"_IO_read_base"
.LASF109:
	.string	"nlat"
.LASF55:
	.string	"ll_lat"
.LASF167:
	.string	"stdin"
.LASF44:
	.string	"_next"
.LASF139:
	.string	"lon_in_max"
.LASF72:
	.string	"grid_box_radius"
.LASF68:
	.string	"inside"
.LASF76:
	.string	"phi1"
.LASF77:
	.string	"phi2"
.LASF79:
	.string	"lat1"
.LASF104:
	.string	"y2_0"
.LASF106:
	.string	"y2_1"
.LASF74:
	.string	"box_ctrlon"
.LASF83:
	.string	"fint"
.LASF174:
	.string	"inside_edge"
.LASF121:
	.string	"j_in"
.LASF99:
	.string	"x1_0"
.LASF101:
	.string	"x1_1"
.LASF11:
	.string	"char"
.LASF129:
	.string	"ny2p"
.LASF40:
	.string	"_mode"
.LASF88:
	.string	"poly_ctrlat"
.LASF43:
	.string	"_IO_marker"
.LASF89:
	.string	"avg_y"
.LASF14:
	.string	"_IO_read_ptr"
.LASF62:
	.string	"x_last"
.LASF107:
	.string	"determ"
.LASF91:
	.string	"lon1_in"
.LASF128:
	.string	"ny1p"
.LASF110:
	.string	"area"
.LASF85:
	.string	"box_ctrlat"
.LASF142:
	.string	"lat_in_max"
.LASF17:
	.string	"_IO_write_base"
.LASF169:
	.string	"GNU C 4.4.7 20120313 (Red Hat 4.4.7-16)"
.LASF3:
	.string	"long long int"
.LASF22:
	.string	"_IO_save_base"
.LASF165:
	.string	"create_xgrid_1dx2d_order1"
.LASF162:
	.string	"create_xgrid_1dx2d_order2"
.LASF119:
	.string	"nlat_out"
.LASF69:
	.string	"clip"
.LASF95:
	.string	"lat2_in"
.LASF160:
	.string	"create_xgrid_2dx1d_order1"
.LASF156:
	.string	"create_xgrid_2dx1d_order2"
.LASF123:
	.string	"xgrid_area"
.LASF93:
	.string	"n1_in"
.LASF71:
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
.LASF153:
	.string	"create_xgrid_2dx2d_order1"
.LASF97:
	.string	"lon_tmp"
.LASF56:
	.string	"ur_lon"
.LASF31:
	.string	"_vtable_offset"
.LASF78:
	.string	"dphi"
.LASF132:
	.string	"y1_in"
.LASF116:
	.string	"nlon_in"
.LASF111:
	.string	"x_in"
.LASF122:
	.string	"j_out"
.LASF59:
	.string	"lat_out"
.LASF135:
	.string	"x_out"
.LASF52:
	.string	"lat_in"
.LASF15:
	.string	"_IO_read_end"
.LASF140:
	.string	"lon_out_max"
.LASF7:
	.string	"short int"
.LASF133:
	.string	"x2_in"
.LASF2:
	.string	"long int"
.LASF57:
	.string	"ur_lat"
.LASF166:
	.string	"create_xgrid_1dx2d_order1_"
.LASF171:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/preprocessing/regrid/exec"
.LASF173:
	.string	"get_maxxgrid"
.LASF170:
	.string	"/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/create_xgrid.c"
.LASF114:
	.string	"get_grid_area_"
.LASF61:
	.string	"y_tmp"
.LASF144:
	.string	"lat_out_max"
.LASF164:
	.string	"get_grid_area_no_adjust"
.LASF163:
	.string	"create_xgrid_1dx2d_order2_"
.LASF33:
	.string	"_lock"
.LASF0:
	.string	"long unsigned int"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF103:
	.string	"x2_0"
.LASF105:
	.string	"x2_1"
.LASF146:
	.string	"xctrlon"
.LASF73:
	.string	"radius"
.LASF64:
	.string	"i_in"
.LASF4:
	.string	"unsigned char"
.LASF138:
	.string	"lon_out_min"
.LASF45:
	.string	"_sbuf"
.LASF115:
	.string	"create_xgrid_2dx2d_order2"
.LASF130:
	.string	"nxgrid"
.LASF18:
	.string	"_IO_write_ptr"
.LASF157:
	.string	"tmpx"
.LASF137:
	.string	"lon_in_min"
.LASF9:
	.string	"__off_t"
.LASF81:
	.string	"dphi1"
.LASF82:
	.string	"dphi2"
.LASF53:
	.string	"n_in"
.LASF6:
	.string	"signed char"
.LASF75:
	.string	"clon"
.LASF5:
	.string	"short unsigned int"
.LASF150:
	.string	"min_area"
.LASF151:
	.string	"xarea"
.LASF152:
	.string	"create_xgrid_2dx2d_order2_"
.LASF147:
	.string	"xctrlat"
.LASF48:
	.string	"double"
.LASF50:
	.string	"product"
.LASF112:
	.string	"y_in"
.LASF126:
	.string	"nx1p"
.LASF26:
	.string	"_chain"
.LASF145:
	.string	"lon_in_avg"
.LASF92:
	.string	"lat1_in"
.LASF28:
	.string	"_flags2"
.LASF117:
	.string	"nlat_in"
.LASF131:
	.string	"x1_in"
.LASF30:
	.string	"_cur_column"
.LASF65:
	.string	"i_out"
.LASF102:
	.string	"y1_1"
.LASF10:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
.LASF113:
	.string	"get_grid_area"
.LASF124:
	.string	"xgrid_clon"
.LASF141:
	.string	"lat_in_min"
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-16)"
	.section	.note.GNU-stack,"",@progbits
