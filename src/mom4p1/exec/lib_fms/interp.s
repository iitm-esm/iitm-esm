	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 16.0.3.210 Build 20160415";
# mark_description "-I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic -I/opt/cray/pe/libsci/17.09.1/INTEL/16.0/x86_6";
# mark_description "4/include -I/opt/cray/pe/netcdf/4.4.1.1.3/INTEL/16.0/include -I/opt/cray/pe/mpt/7.6.3/gni/mpich-intel/16.0/i";
# mark_description "nclude -I/opt/cray/pe/hdf5/1.10.0.3/INTEL/16.0/include -I/opt/cray/rca/2.2.11-6.0.4.0_13.2__g84de67a.ari/inc";
# mark_description "lude -I/opt/cray/alps/6.4.3-6.0.4.1_2.1__g92a2fc0.ari/include -I/opt/cray/xpmem/2.2.2-6.0.4.1_18.1__g43b0535";
# mark_description ".ari/include -I/opt/cray/gni-headers/5.0.11-6.0.4.0_7.2__g7136988.ari/include -I/opt/cray/pe/pmi/5.0.12/incl";
# mark_description "ude -I/opt/cray/ugni/6.0.14-6.0.4.0_14.1__ge7db4a2.ari/include -I/opt/cray/udreg/2.3.2-6.0.4.0_12.2__g2f9c3e";
# mark_description "e.ari/include -I/opt/cray/wlm_detect/1.2.1-6.0.4.0_22.1__gd26a3dc.ari/include -I/opt/cray/krca/2.2.2-6.0.4.1";
# mark_description "_18.3__g4614cf3.ari/include -I/opt/cray-hss-devel/8.0.0/include -xCORE-AVX2 -D__CRAYXC -D__CRAY_BROADWELL -D";
# mark_description "__CRAYXT_COMPUTE_LINUX_TARGET -Duse_netCDF4 -Duse_libMPI -DENABLE_ODA -DUSE_OCEAN_BGC -g -O3 -save-temps -c";
	.file "interp.c"
	.text
..TXTST0:
.L_2__routine_start_cubic_spline_0:
# -- Begin  cubic_spline
	.text
# mark_begin;
       .align    16,0x90
	.globl cubic_spline
# --- cubic_spline(int, int, const double *, const double *, const double *, double *, double, double)
cubic_spline:
# parameter 1(size1): %edi
# parameter 2(size2): %esi
# parameter 3(grid1): %rdx
# parameter 4(grid2): %rcx
# parameter 5(data1): %r8
# parameter 6(data2): %r9
# parameter 7(yp1): %xmm0
# parameter 8(ypn): %xmm1
..B1.1:                         # Preds ..B1.0
	.cfi_startproc
..___tag_value_cubic_spline.2:
..L3:
                                                          #60.1
..LN0:
	.file   1 "/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c"
	.loc    1  60  is_stmt 1
        pushq     %rbp                                          #60.1
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #60.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-32, %rsp                                    #60.1
..LN3:
        pushq     %r12                                          #60.1
..LN4:
        pushq     %r13                                          #60.1
..LN5:
        pushq     %r14                                          #60.1
..LN6:
        pushq     %r15                                          #60.1
..LN7:
        pushq     %rbx                                          #60.1
..LN8:
        subq      $56, %rsp                                     #60.1
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN9:
        movl      %edi, %r13d                                   #60.1
..LN10:
        vmovsd    %xmm1, 24(%rsp)                               #60.1
..LN11:
        movq      %rcx, %r15                                    #60.1
..LN12:
        vmovsd    %xmm0, 32(%rsp)                               #60.1
..LN13:
        movq      %rdx, %r14                                    #60.1
..LN14:
        movq      %r9, 48(%rsp)                                 #60.1
..LN15:
        movl      %esi, %ebx                                    #60.1
..LN16:
        movq      %r8, 16(%rsp)                                 #60.1
..LN17:
	.loc    1  65  prologue_end  is_stmt 1
        cmpl      $1, %r13d                                     #65.14
..LN18:
        jle       ..B1.10       # Prob 50%                      #65.14
..LN19:
                                # LOE r14 r15 ebx r13d
..B1.2:                         # Preds ..B1.1
..LN20:
        movl      $1, %ecx                                      #65.3
..LN21:
        lea       -1(%r13), %r12d                               #65.3
..LN22:
        movl      %r12d, %eax                                   #65.3
..LN23:
        xorl      %edx, %edx                                    #65.3
..LN24:
        shrl      $31, %eax                                     #65.3
..LN25:
        lea       -1(%r13,%rax), %eax                           #65.3
..LN26:
        sarl      $1, %eax                                      #65.3
..LN27:
        testl     %eax, %eax                                    #65.3
..LN28:
        jbe       ..B1.8        # Prob 15%                      #65.3
..LN29:
                                # LOE r14 r15 eax edx ecx ebx r12d r13d
..B1.3:                         # Preds ..B1.2
..LN30:
        movl      %r13d, 40(%rsp)                               #
..LN31:
        movl      %edx, %r13d                                   #
..LN32:
        movl      %ebx, 8(%rsp)                                 #
..LN33:
        movl      %eax, %ebx                                    #
..LN34:
        movq      %r15, (%rsp)                                  #
..LN35:
                                # LOE r14 ebx r12d r13d
..B1.4:                         # Preds ..B1.6 ..B1.3
..L13:          # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN36:
	.loc    1  66  is_stmt 1
        lea       (%r13,%r13), %r15d                            #66.9
..LN37:
        movslq    %r15d, %r15                                   #66.21
..LN38:
        vmovsd    8(%r14,%r15,8), %xmm1                         #66.9
..LN39:
        vmovsd    (%r14,%r15,8), %xmm0                          #66.21
..LN40:
        vcomisd   %xmm1, %xmm0                                  #66.21
..LN41:
        jae       ..B1.97       # Prob 5%                       #66.21
..LN42:
                                # LOE r14 r15 ebx r12d r13d xmm1
..B1.5:                         # Preds ..B1.98 ..B1.4
..LN43:
        vcomisd   16(%r14,%r15,8), %xmm1                        #66.21
..LN44:
        jae       ..B1.96       # Prob 5%                       #66.21
..LN45:
                                # LOE r14 ebx r12d r13d
..B1.6:                         # Preds ..B1.96 ..B1.5
..LN46:
	.loc    1  65  is_stmt 1
        incl      %r13d                                         #65.3
..LN47:
        cmpl      %ebx, %r13d                                   #65.3
..LN48:
        jb        ..B1.4        # Prob 64%                      #65.3
..LN49:
                                # LOE r14 ebx r12d r13d
..B1.7:                         # Preds ..B1.6
..LN50:
        movl      %r13d, %edx                                   #
..LN51:
        movl      40(%rsp), %r13d                               #
..LN52:
	.loc    1  66  is_stmt 1
        lea       1(%rdx,%rdx), %ecx                            #66.5
..LN53:
        movl      8(%rsp), %ebx                                 #
..LN54:
        movq      (%rsp), %r15                                  #
..LN55:
                                # LOE r14 r15 ecx ebx r12d r13d
..B1.8:                         # Preds ..B1.7 ..B1.2
..LN56:
	.loc    1  65  is_stmt 1
        lea       -1(%rcx), %eax                                #65.3
..LN57:
        cmpl      %eax, %r12d                                   #65.3
..LN58:
        jbe       ..B1.10       # Prob 15%                      #65.3
..LN59:
                                # LOE r14 r15 ecx ebx r13d
..B1.9:                         # Preds ..B1.8
..L14:          # optimization report
                # REMAINDER LOOP
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN60:
	.loc    1  66  is_stmt 1
        movslq    %ecx, %rcx                                    #66.9
..LN61:
        vmovsd    -8(%r14,%rcx,8), %xmm0                        #66.21
..LN62:
        vcomisd   (%r14,%rcx,8), %xmm0                          #66.21
..LN63:
        jae       ..B1.95       # Prob 5%                       #66.21
..LN64:
                                # LOE r14 r15 ebx r13d
..B1.10:                        # Preds ..B1.95 ..B1.1 ..B1.8 ..B1.9
..LN65:
	.loc    1  69  is_stmt 1
        xorl      %edx, %edx                                    #69.7
..LN66:
        testl     %ebx, %ebx                                    #69.14
..LN67:
        jle       ..B1.16       # Prob 10%                      #69.14
..LN68:
                                # LOE rdx r14 r15 ebx r13d
..B1.11:                        # Preds ..B1.10
..LN69:
        movslq    %ebx, %rax                                    #69.3
..LN70:
	.loc    1  70  is_stmt 1
        movslq    %r13d, %r12                                   #70.43
..LN71:
        movl      %r13d, 40(%rsp)                               #70.43
..LN72:
        movq      %rdx, %r13                                    #70.43
..LN73:
        movl      %ebx, 8(%rsp)                                 #70.43
..LN74:
        movq      %rax, %rbx                                    #70.43
..LN75:
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.14 ..B1.11
..L15:          # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN76:
        vmovsd    (%r15,%r13,8), %xmm1                          #70.9
..LN77:
        vmovsd    (%r14), %xmm0                                 #70.20
..LN78:
        vcomisd   %xmm1, %xmm0                                  #70.20
..LN79:
        ja        ..B1.94       # Prob 5%                       #70.20
..LN80:
                                # LOE rbx r12 r13 r14 r15 xmm1
..B1.13:                        # Preds ..B1.12
..LN81:
        vcomisd   -8(%r14,%r12,8), %xmm1                        #70.43
..LN82:
        ja        ..B1.94       # Prob 5%                       #70.43
..LN83:
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.94 ..B1.13
..LN84:
	.loc    1  69  is_stmt 1
        incq      %r13                                          #69.21
..LN85:
        cmpq      %rbx, %r13                                    #69.14
..LN86:
        jl        ..B1.12       # Prob 82%                      #69.14
..LN87:
                                # LOE rbx r12 r13 r14 r15
..B1.15:                        # Preds ..B1.14
..LN88:
        movl      40(%rsp), %r13d                               #
..LN89:
        movl      8(%rsp), %ebx                                 #
..LN90:
                                # LOE r14 r15 ebx r13d
..B1.16:                        # Preds ..B1.10 ..B1.15
..LN91:
	.loc    1  73  is_stmt 1
        cmpl      $2, %r13d                                     #73.14
..LN92:
        jl        ..B1.93       # Prob 5%                       #73.14
..LN93:
                                # LOE r14 r15 ebx r13d
..B1.17:                        # Preds ..B1.16
..LN94:
	.loc    1  74  is_stmt 1
        je        ..B1.48       # Prob 40%                      #74.15
..LN95:
                                # LOE r14 r15 ebx r13d
..B1.18:                        # Preds ..B1.93 ..B1.17
..LN96:
	.loc    1  79  is_stmt 1
        movslq    %r13d, %r12                                   #79.25
..LN97:
        lea       (,%r12,8), %rdi                               #79.31
..LN98:
        movq      %rdi, (%rsp)                                  #79.31
..LN99:
#       malloc(size_t)
        call      malloc                                        #79.18
..LN100:
                                # LOE rax r12 r14 r15 ebx r13d
..B1.101:                       # Preds ..B1.18
..LN101:
        movq      %rax, %rdx                                    #79.18
..LN102:
                                # LOE rdx r12 r14 r15 ebx r13d
..B1.19:                        # Preds ..B1.101
..LN103:
	.loc    1  80  is_stmt 1
        movq      (%rsp), %rdi                                  #80.17
..LN104:
        movq      %rdx, 8(%rsp)                                 #80.17
..LN105:
#       malloc(size_t)
        call      malloc                                        #80.17
..LN106:
                                # LOE rax r12 r14 r15 ebx r13d
..B1.102:                       # Preds ..B1.19
..LN107:
        movq      8(%rsp), %rdx                                 #
..LN108:
        movq      %rax, %r11                                    #80.17
..LN109:
                                # LOE rdx r11 r12 r14 r15 edx ebx r13d dl dh
..B1.20:                        # Preds ..B1.102
..LN110:
	.loc    1  81  is_stmt 1
        vmovsd    .L_2il0floatpacket.0(%rip), %xmm6             #81.12
..LN111:
        vmovsd    32(%rsp), %xmm0                               #81.12
..LN112:
        vcomisd   %xmm6, %xmm0                                  #81.12
..LN113:
        jbe       ..B1.22       # Prob 50%                      #81.12
..LN114:
                                # LOE rdx r11 r12 r14 r15 edx ebx r13d dl dh xmm6
..B1.21:                        # Preds ..B1.20
..LN115:
	.loc    1  82  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #82.5
..LN116:
        vmovsd    %xmm1, (%rdx)                                 #82.5
..LN117:
	.loc    1  83  is_stmt 1
        vmovapd   %xmm1, %xmm7                                  #83.5
..LN118:
        vmovsd    %xmm1, (%r11)                                 #83.5
..LN119:
        jmp       ..B1.23       # Prob 100%                     #83.5
..LN120:
                                # LOE rdx r11 r12 r14 r15 edx ebx r13d dl dh xmm1 xmm6 xmm7
..B1.22:                        # Preds ..B1.20
..LN121:
	.loc    1  87  is_stmt 1
        movq      16(%rsp), %rax                                #87.37
..LN122:
        vmovsd    8(%r14), %xmm0                                #87.15
..LN123:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm2             #87.11
..LN124:
        vmovsd    8(%rax), %xmm3                                #87.37
..LN125:
	.loc    1  86  is_stmt 1
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm1             #86.11
..LN126:
        vmovsd    %xmm1, (%rdx)                                 #86.5
..LN127:
	.loc    1  87  is_stmt 1
        vsubsd    (%r14), %xmm0, %xmm5                          #87.66
..LN128:
        vsubsd    (%rax), %xmm3, %xmm4                          #87.46
..LN129:
        vdivsd    %xmm5, %xmm2, %xmm8                           #87.24
..LN130:
        vdivsd    %xmm5, %xmm4, %xmm7                           #87.66
..LN131:
        vsubsd    32(%rsp), %xmm7, %xmm9                        #87.76
..LN132:
        vmulsd    %xmm9, %xmm8, %xmm7                           #87.76
..LN133:
        vmovsd    %xmm7, (%r11)                                 #87.5
..LN134:
                                # LOE rdx r11 r12 r14 r15 edx ebx r13d dl dh xmm1 xmm6 xmm7
..B1.23:                        # Preds ..B1.21 ..B1.22
..LN135:
	.loc    1  93  is_stmt 1
        vmovsd    .L_2il0floatpacket.6(%rip), %xmm8             #93.16
..LN136:
	.loc    1  90  is_stmt 1
        lea       -1(%r13), %r10d                               #90.20
..LN137:
        xorl      %ecx, %ecx                                    #90.3
..LN138:
        cmpl      $1, %r10d                                     #90.20
..LN139:
        jle       ..B1.27       # Prob 10%                      #90.20
..LN140:
                                # LOE rdx rcx r11 r12 r14 r15 edx ebx r10d r13d dl dh xmm1 xmm6 xmm7 xmm8
..B1.24:                        # Preds ..B1.23
..LN141:
	.loc    1  94  is_stmt 1
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm4             #94.11
..LN142:
	.loc    1  90  is_stmt 1
        lea       -2(%r12), %rax                                #90.20
..LN143:
        movq      16(%rsp), %rsi                                #90.20
..LN144:
                                # LOE rax rdx rcx rsi r11 r12 r14 r15 ebx r10d r13d xmm1 xmm4 xmm6 xmm7 xmm8
..B1.25:                        # Preds ..B1.25 ..B1.24
..L16:          # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN145:
	.loc    1  91  is_stmt 1
        vmovsd    8(%r14,%rcx,8), %xmm12                        #91.10
..LN146:
        vmovsd    (%r14,%rcx,8), %xmm9                          #91.19
..LN147:
        vmovsd    16(%r14,%rcx,8), %xmm11                       #91.32
..LN148:
        vsubsd    %xmm9, %xmm12, %xmm5                          #91.19
..LN149:
        vsubsd    %xmm9, %xmm11, %xmm0                          #91.43
..LN150:
	.loc    1  94  is_stmt 1
        vsubsd    %xmm12, %xmm11, %xmm14                        #94.49
..LN151:
	.loc    1  91  is_stmt 1
        vdivsd    %xmm0, %xmm5, %xmm2                           #91.43
..LN152:
	.loc    1  94  is_stmt 1
        vmovsd    8(%rsi,%rcx,8), %xmm15                        #94.27
..LN153:
        vmovsd    16(%rsi,%rcx,8), %xmm10                       #94.16
..LN154:
	.loc    1  92  is_stmt 1
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm3             #92.5
..LN155:
	.loc    1  94  is_stmt 1
        vsubsd    %xmm15, %xmm10, %xmm13                        #94.27
..LN156:
	.loc    1  92  is_stmt 1
        vfmadd231sd %xmm2, %xmm1, %xmm3                         #92.5
..LN157:
	.loc    1  93  is_stmt 1
        vsubsd    %xmm8, %xmm2, %xmm1                           #93.16
..LN158:
	.loc    1  94  is_stmt 1
        vsubsd    (%rsi,%rcx,8), %xmm15, %xmm15                 #94.69
..LN159:
        vdivsd    %xmm14, %xmm13, %xmm9                         #94.49
..LN160:
	.loc    1  95  is_stmt 1
        vdivsd    %xmm5, %xmm15, %xmm5                          #95.19
..LN161:
	.loc    1  93  is_stmt 1
        vdivsd    %xmm3, %xmm1, %xmm1                           #93.20
..LN162:
        vmovsd    %xmm1, 8(%rdx,%rcx,8)                         #93.5
..LN163:
	.loc    1  95  is_stmt 1
        vsubsd    %xmm5, %xmm9, %xmm10                          #95.19
..LN164:
        vmulsd    %xmm10, %xmm4, %xmm11                         #95.19
..LN165:
        vdivsd    %xmm0, %xmm11, %xmm0                          #95.44
..LN166:
	.loc    1  94  is_stmt 1
        vfnmadd213sd %xmm0, %xmm7, %xmm2                        #94.5
..LN167:
	.loc    1  95  is_stmt 1
        vdivsd    %xmm3, %xmm2, %xmm7                           #95.68
..LN168:
	.loc    1  94  is_stmt 1
        vmovsd    %xmm7, 8(%r11,%rcx,8)                         #94.5
..LN169:
	.loc    1  90  is_stmt 1
        incq      %rcx                                          #90.3
..LN170:
        cmpq      %rax, %rcx                                    #90.3
..LN171:
        jb        ..B1.25       # Prob 82%                      #90.3
..LN172:
                                # LOE rax rdx rcx rsi r11 r12 r14 r15 ebx r10d r13d xmm1 xmm4 xmm6 xmm7 xmm8
..B1.27:                        # Preds ..B1.25 ..B1.23
..LN173:
	.loc    1  99  is_stmt 1
        vmovsd    24(%rsp), %xmm0                               #99.13
..LN174:
        vcomisd   %xmm6, %xmm0                                  #99.13
..LN175:
        jbe       ..B1.29       # Prob 50%                      #99.13
..LN176:
                                # LOE rdx r11 r12 r14 r15 ebx r10d r13d xmm8
..B1.28:                        # Preds ..B1.27
..LN177:
	.loc    1  100  is_stmt 1
        vxorpd    %xmm10, %xmm10, %xmm10                        #100.5
..LN178:
	.loc    1  101  is_stmt 1
        vmovapd   %xmm10, %xmm0                                 #101.5
..LN179:
        jmp       ..B1.30       # Prob 100%                     #101.5
..LN180:
                                # LOE rdx r11 r12 r14 r15 ebx r10d r13d xmm0 xmm8 xmm10
..B1.29:                        # Preds ..B1.27
..LN181:
	.loc    1  105  is_stmt 1
        movq      (%rsp), %rcx                                  #105.83
..LN182:
        movq      16(%rsp), %rax                                #105.51
..LN183:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #105.9
..LN184:
        vmovsd    -8(%r14,%rcx), %xmm0                          #105.83
..LN185:
        vmovsd    -8(%rax,%rcx), %xmm2                          #105.51
..LN186:
        vmovsd    24(%rsp), %xmm5                               #105.98
..LN187:
	.loc    1  104  is_stmt 1
        vmovsd    .L_2il0floatpacket.5(%rip), %xmm10            #104.8
..LN188:
	.loc    1  105  is_stmt 1
        vsubsd    -16(%r14,%rcx), %xmm0, %xmm4                  #105.28
..LN189:
        vsubsd    -16(%rax,%rcx), %xmm2, %xmm3                  #105.66
..LN190:
        vdivsd    %xmm4, %xmm1, %xmm7                           #105.28
..LN191:
        vdivsd    %xmm4, %xmm3, %xmm6                           #105.98
..LN192:
        vsubsd    %xmm6, %xmm5, %xmm9                           #105.98
..LN193:
        vmulsd    %xmm9, %xmm7, %xmm0                           #105.98
..LN194:
                                # LOE rdx r11 r12 r14 r15 ebx r10d r13d xmm0 xmm8 xmm10
..B1.30:                        # Preds ..B1.28 ..B1.29
..LN195:
	.loc    1  110  is_stmt 1
        movl      %r13d, %eax                                   #110.7
..LN196:
	.loc    1  108  is_stmt 1
        lea       (%rdx,%r12,8), %r9                            #108.38
..LN197:
        vmovsd    -16(%r9), %xmm1                               #108.38
..LN198:
        lea       (%r11,%r12,8), %r8                            #108.22
..LN199:
        vfnmadd231sd -16(%r8), %xmm10, %xmm0                    #108.3
..LN200:
	.loc    1  110  is_stmt 1
        addl      $-2, %eax                                     #110.7
..LN201:
	.loc    1  108  is_stmt 1
        vfmadd213sd %xmm8, %xmm10, %xmm1                        #108.3
..LN202:
        vdivsd    %xmm1, %xmm0, %xmm0                           #108.50
..LN203:
        vmovsd    %xmm0, -8(%r9)                                #108.3
..LN204:
	.loc    1  110  is_stmt 1
        js        ..B1.37       # Prob 50%                      #110.21
..LN205:
                                # LOE rdx r8 r9 r11 r12 r14 r15 ebx r10d r13d xmm0 xmm8
..B1.31:                        # Preds ..B1.30
..LN206:
        movl      %r10d, %ecx                                   #110.3
..LN207:
        xorl      %esi, %esi                                    #110.3
..LN208:
        shrl      $31, %ecx                                     #110.3
..LN209:
        movl      $1, %eax                                      #110.3
..LN210:
        xorl      %edi, %edi                                    #110.29
..LN211:
        lea       -1(%r13,%rcx), %ecx                           #110.3
..LN212:
        sarl      $1, %ecx                                      #110.3
..LN213:
        testl     %ecx, %ecx                                    #110.3
..LN214:
        jbe       ..B1.35       # Prob 3%                       #110.3
..LN215:
                                # LOE rdx r8 r9 r11 r12 r14 r15 eax ecx ebx esi edi r10d r13d xmm0 xmm8
..B1.33:                        # Preds ..B1.31 ..B1.33
..L17:          # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN216:
        incl      %esi                                          #110.3
..LN217:
        movslq    %edi, %rdi                                    #110.37
..LN218:
        vmovsd    -16(%r9,%rdi,8), %xmm1                        #110.37
..LN219:
        vfmadd213sd -16(%r8,%rdi,8), %xmm0, %xmm1               #110.29
..LN220:
        vmovsd    -24(%r9,%rdi,8), %xmm0                        #110.37
..LN221:
        vmovsd    %xmm1, -16(%r9,%rdi,8)                        #110.29
..LN222:
        vfmadd213sd -24(%r8,%rdi,8), %xmm1, %xmm0               #110.29
..LN223:
        vmovsd    %xmm0, -24(%r9,%rdi,8)                        #110.29
..LN224:
        addl      $-2, %edi                                     #110.3
..LN225:
        cmpl      %ecx, %esi                                    #110.3
..LN226:
        jb        ..B1.33       # Prob 64%                      #110.3
..LN227:
                                # LOE rdx r8 r9 r11 r12 r14 r15 ecx ebx esi edi r10d r13d xmm0 xmm8
..B1.34:                        # Preds ..B1.33
..LN228:
        lea       1(%rsi,%rsi), %eax                            #110.29
..LN229:
                                # LOE rdx r11 r12 r14 r15 eax ebx r10d r13d xmm8
..B1.35:                        # Preds ..B1.34 ..B1.31
..LN230:
        lea       -1(%rax), %ecx                                #110.3
..LN231:
        cmpl      %ecx, %r10d                                   #110.3
..LN232:
        jbe       ..B1.37       # Prob 3%                       #110.3
..LN233:
                                # LOE rdx r11 r12 r14 r15 eax ebx r13d xmm8
..B1.36:                        # Preds ..B1.35
..L18:          # optimization report
                # REMAINDER LOOP
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN234:
        movslq    %eax, %rax                                    #110.37
..LN235:
        subq      %rax, %r12                                    #110.51
..LN236:
        vmovsd    -8(%rdx,%r12,8), %xmm1                        #110.37
..LN237:
        vmovsd    (%rdx,%r12,8), %xmm0                          #110.43
..LN238:
        vfmadd213sd -8(%r11,%r12,8), %xmm0, %xmm1               #110.29
..LN239:
        vmovsd    %xmm1, -8(%rdx,%r12,8)                        #110.29
..LN240:
                                # LOE rdx r11 r14 r15 ebx r13d xmm8
..B1.37:                        # Preds ..B1.30 ..B1.35 ..B1.36
..LN241:
	.loc    1  113  is_stmt 1
        xorl      %eax, %eax                                    #113.7
..LN242:
        testl     %ebx, %ebx                                    #113.14
..LN243:
        jle       ..B1.45       # Prob 10%                      #113.14
..LN244:
                                # LOE rax rdx r11 r14 r15 ebx r13d xmm8
..B1.38:                        # Preds ..B1.37
..LN245:
        movslq    %ebx, %rbx                                    #113.3
..LN246:
	.loc    1  130  is_stmt 1
        movq      %rbx, 8(%rsp)                                 #130.108
..LN247:
        movq      %rdx, %rbx                                    #130.108
..LN248:
        movq      %r11, (%rsp)                                  #130.108
..LN249:
        movl      %r13d, 40(%rsp)                               #130.108
..LN250:
        movq      %rax, %r13                                    #130.108
..LN251:
        movq      16(%rsp), %r12                                #130.108
..LN252:
                                # LOE rbx r12 r13 r14 r15
..B1.39:                        # Preds ..B1.43 ..B1.38
..L19:          # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN253:
	.loc    1  114  is_stmt 1
        movq      %r14, %rdi                                    #114.9
..LN254:
        movl      40(%rsp), %esi                                #114.9
..LN255:
        vmovsd    (%r15,%r13,8), %xmm0                          #114.9
..___tag_value_cubic_spline.20:
..LN256:
#       nearest_index(double, const double *, int)
        call      nearest_index                                 #114.9
..___tag_value_cubic_spline.21:
..LN257:
                                # LOE rbx r12 r13 r14 r15 eax
..B1.40:                        # Preds ..B1.39
..LN258:
	.loc    1  116  is_stmt 1
        movslq    %eax, %rsi                                    #116.3
..LN259:
	.loc    1  115  is_stmt 1
        vmovsd    (%r15,%r13,8), %xmm2                          #115.20
..LN260:
        vcomisd   (%r14,%rsi,8), %xmm2                          #115.20
..LN261:
        ja        ..B1.43       # Prob 50%                      #115.20
..LN262:
                                # LOE rbx rsi r12 r13 r14 r15 eax xmm2
..B1.42:                        # Preds ..B1.40
..LN263:
	.loc    1  123  is_stmt 1
        testl     %eax, %eax                                    #123.2
..LN264:
        lea       -1(%rsi), %rcx                                #123.11
..LN265:
        cmovne    %rcx, %rsi                                    #123.2
..LN266:
                                # LOE rbx rsi r12 r13 r14 r15 xmm2
..B1.43:                        # Preds ..B1.40 ..B1.42
..LN267:
	.loc    1  130  is_stmt 1
        vmovsd    .L_2il0floatpacket.6(%rip), %xmm5             #130.5
..LN268:
	.loc    1  127  is_stmt 1
        vmovsd    (%r14,%rsi,8), %xmm3                          #127.22
..LN269:
        vmovsd    8(%r14,%rsi,8), %xmm0                         #127.11
..LN270:
	.loc    1  130  is_stmt 1
        movq      48(%rsp), %rcx                                #130.5
..LN271:
	.loc    1  127  is_stmt 1
        vsubsd    %xmm3, %xmm0, %xmm8                           #127.22
..LN272:
	.loc    1  128  is_stmt 1
        vsubsd    %xmm2, %xmm0, %xmm1                           #128.25
..LN273:
	.loc    1  129  is_stmt 1
        vsubsd    %xmm3, %xmm2, %xmm2                           #129.23
..LN274:
	.loc    1  130  is_stmt 1
        vmulsd    %xmm8, %xmm8, %xmm9                           #130.5
..LN275:
	.loc    1  128  is_stmt 1
        vdivsd    %xmm8, %xmm1, %xmm12                          #128.35
..LN276:
	.loc    1  129  is_stmt 1
        vdivsd    %xmm8, %xmm2, %xmm13                          #129.35
..LN277:
	.loc    1  130  is_stmt 1
        vmulsd    8(%rbx,%rsi,8), %xmm13, %xmm7                 #130.5
..LN278:
        vfmsub231sd %xmm12, %xmm12, %xmm5                       #130.5
..LN279:
        vmulsd    %xmm13, %xmm13, %xmm4                         #130.5
..LN280:
        vmulsd    (%rbx,%rsi,8), %xmm12, %xmm6                  #130.5
..LN281:
        vfmsub213sd %xmm7, %xmm4, %xmm7                         #130.5
..LN282:
        vfmadd213sd %xmm7, %xmm6, %xmm5                         #130.5
..LN283:
        vmulsd    %xmm9, %xmm5, %xmm10                          #130.5
..LN284:
        vdivsd    .L_2il0floatpacket.3(%rip), %xmm10, %xmm11    #130.108
..LN285:
        vfmadd132sd (%r12,%rsi,8), %xmm11, %xmm12               #130.5
..LN286:
        vfmadd132sd 8(%r12,%rsi,8), %xmm12, %xmm13              #130.5
..LN287:
        vmovsd    %xmm13, (%rcx,%r13,8)                         #130.5
..LN288:
	.loc    1  113  is_stmt 1
        incq      %r13                                          #113.21
..LN289:
        cmpq      8(%rsp), %r13                                 #113.14
..LN290:
        jl        ..B1.39       # Prob 82%                      #113.14
..LN291:
                                # LOE rbx r12 r13 r14 r15
..B1.44:                        # Preds ..B1.43
..LN292:
        movq      (%rsp), %r11                                  #
..LN293:
        movq      %rbx, %rdx                                    #
..LN294:
                                # LOE rdx r11
..B1.45:                        # Preds ..B1.37 ..B1.44
..LN295:
	.loc    1  133  is_stmt 1
        movq      %rdx, %rdi                                    #133.3
..LN296:
        movq      %r11, (%rsp)                                  #133.3
..LN297:
#       free(void *)
        call      free                                          #133.3
..LN298:
                                # LOE
..B1.46:                        # Preds ..B1.45
..LN299:
        movq      (%rsp), %r11                                  #
..LN300:
	.loc    1  134  is_stmt 1
        movq      %r11, %rdi                                    #134.3
..LN301:
	.loc    1  134  epilogue_begin  is_stmt 1
        addq      $56, %rsp                                     #134.3
	.cfi_restore 3
..LN302:
        popq      %rbx                                          #134.3
	.cfi_restore 15
..LN303:
        popq      %r15                                          #134.3
	.cfi_restore 14
..LN304:
        popq      %r14                                          #134.3
	.cfi_restore 13
..LN305:
        popq      %r13                                          #134.3
	.cfi_restore 12
..LN306:
        popq      %r12                                          #134.3
..LN307:
        movq      %rbp, %rsp                                    #134.3
..LN308:
        popq      %rbp                                          #134.3
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN309:
#       free(void *)
        jmp       free                                          #134.3
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN310:
                                # LOE
..B1.48:                        # Preds ..B1.17
..LN311:
	.loc    1  75  is_stmt 1
        movq      16(%rsp), %rax                                #75.19
..LN312:
        vmovsd    (%r14), %xmm0                                 #75.39
..LN313:
        vmovsd    8(%r14), %xmm3                                #75.30
..LN314:
        vmovsd    (%rax), %xmm1                                 #75.19
..LN315:
        vsubsd    %xmm0, %xmm3, %xmm5                           #75.39
..LN316:
        vmovsd    8(%rax), %xmm2                                #75.10
..LN317:
        vsubsd    %xmm1, %xmm2, %xmm4                           #75.19
..LN318:
        vdivsd    %xmm5, %xmm4, %xmm2                           #75.39
..LN319:
	.loc    1  76  is_stmt 1
        testl     %ebx, %ebx                                    #76.17
..LN320:
        jle       ..B1.88       # Prob 50%                      #76.17
..LN321:
                                # LOE rax r14 r15 eax ebx al ah xmm0 xmm1 xmm2
..B1.49:                        # Preds ..B1.48
..LN322:
        cmpq      48(%rsp), %rax                                #76.66
..LN323:
        jae       ..B1.51       # Prob 50%                      #76.66
..LN324:
                                # LOE r14 r15 ebx xmm0 xmm1 xmm2
..B1.50:                        # Preds ..B1.49
..LN325:
        movq      48(%rsp), %rax                                #76.66
..LN326:
        subq      16(%rsp), %rax                                #76.66
..LN327:
        cmpq      $8, %rax                                      #76.66
..LN328:
        jge       ..B1.53       # Prob 50%                      #76.66
..LN329:
                                # LOE r14 r15 ebx xmm0 xmm1 xmm2
..B1.51:                        # Preds ..B1.49 ..B1.50
..LN330:
        movq      16(%rsp), %rax                                #76.66
..LN331:
        cmpq      48(%rsp), %rax                                #76.66
..LN332:
        jbe       ..B1.82       # Prob 50%                      #76.66
..LN333:
                                # LOE rax r14 r15 eax ebx al ah xmm0 xmm1 xmm2
..B1.52:                        # Preds ..B1.51
..LN334:
	.loc    1  58  is_stmt 1
        movslq    %ebx, %rdx                                    #58.6
..LN335:
	.loc    1  76  is_stmt 1
        subq      48(%rsp), %rax                                #76.66
..LN336:
        shlq      $3, %rdx                                      #76.66
..LN337:
        cmpq      %rdx, %rax                                    #76.66
..LN338:
        jl        ..B1.82       # Prob 50%                      #76.66
..LN339:
                                # LOE r14 r15 ebx xmm0 xmm1 xmm2
..B1.53:                        # Preds ..B1.50 ..B1.52
..LN340:
        cmpq      48(%rsp), %r15                                #76.43
..LN341:
        jae       ..B1.55       # Prob 50%                      #76.43
..LN342:
                                # LOE r14 r15 ebx xmm0 xmm1 xmm2
..B1.54:                        # Preds ..B1.53
..LN343:
	.loc    1  58  is_stmt 1
        movslq    %ebx, %rdx                                    #58.6
..LN344:
	.loc    1  76  is_stmt 1
        movq      48(%rsp), %rax                                #76.43
..LN345:
        subq      %r15, %rax                                    #76.43
..LN346:
        lea       (,%rdx,8), %rcx                               #76.43
..LN347:
        cmpq      %rax, %rcx                                    #76.43
..LN348:
        jle       ..B1.57       # Prob 50%                      #76.43
..LN349:
                                # LOE rdx rcx r14 r15 ebx xmm0 xmm1 xmm2
..B1.55:                        # Preds ..B1.54 ..B1.53
..LN350:
        cmpq      48(%rsp), %r15                                #76.43
..LN351:
        jbe       ..B1.82       # Prob 50%                      #76.43
..LN352:
                                # LOE r14 r15 ebx xmm0 xmm1 xmm2
..B1.56:                        # Preds ..B1.55
..LN353:
	.loc    1  58  is_stmt 1
        movslq    %ebx, %rdx                                    #58.6
..LN354:
	.loc    1  76  is_stmt 1
        movq      %r15, %rax                                    #76.43
..LN355:
        subq      48(%rsp), %rax                                #76.43
..LN356:
        lea       (,%rdx,8), %rcx                               #76.43
..LN357:
        cmpq      %rcx, %rax                                    #76.43
..LN358:
        jl        ..B1.82       # Prob 50%                      #76.43
..LN359:
                                # LOE rdx rcx r14 r15 ebx xmm0 xmm1 xmm2
..B1.57:                        # Preds ..B1.56 ..B1.54
..LN360:
        cmpq      48(%rsp), %r14                                #76.54
..LN361:
        jae       ..B1.59       # Prob 50%                      #76.54
..LN362:
                                # LOE rdx rcx r14 r15 ebx xmm0 xmm1 xmm2
..B1.58:                        # Preds ..B1.57
..LN363:
        movq      48(%rsp), %rax                                #76.54
..LN364:
        subq      %r14, %rax                                    #76.54
..LN365:
        cmpq      $8, %rax                                      #76.54
..LN366:
        jge       ..B1.61       # Prob 50%                      #76.54
..LN367:
                                # LOE rdx rcx r14 r15 ebx xmm0 xmm1 xmm2
..B1.59:                        # Preds ..B1.57 ..B1.58
..LN368:
        cmpq      48(%rsp), %r14                                #76.54
..LN369:
        jbe       ..B1.82       # Prob 50%                      #76.54
..LN370:
                                # LOE rdx rcx r14 r15 ebx xmm0 xmm1 xmm2
..B1.60:                        # Preds ..B1.59
..LN371:
        movq      %r14, %rax                                    #76.54
..LN372:
        subq      48(%rsp), %rax                                #76.54
..LN373:
        cmpq      %rcx, %rax                                    #76.54
..LN374:
        jl        ..B1.82       # Prob 50%                      #76.54
..LN375:
                                # LOE rdx r14 r15 ebx xmm0 xmm1 xmm2
..B1.61:                        # Preds ..B1.58 ..B1.60
..LN376:
        cmpl      $16, %ebx                                     #76.5
..LN377:
        jl        ..B1.90       # Prob 10%                      #76.5
..LN378:
                                # LOE rdx r15 ebx xmm0 xmm1 xmm2
..B1.62:                        # Preds ..B1.61
..LN379:
        movq      48(%rsp), %rsi                                #76.5
..LN380:
        andq      $31, %rsi                                     #76.5
..LN381:
        movl      %esi, %esi                                    #76.5
..LN382:
        testl     %esi, %esi                                    #76.5
..LN383:
        je        ..B1.65       # Prob 50%                      #76.5
..LN384:
                                # LOE rdx rsi r15 ebx xmm0 xmm1 xmm2
..B1.63:                        # Preds ..B1.62
..LN385:
        testl     $7, %esi                                      #76.5
..LN386:
        jne       ..B1.90       # Prob 10%                      #76.5
..LN387:
                                # LOE rdx rsi r15 ebx xmm0 xmm1 xmm2
..B1.64:                        # Preds ..B1.63
..LN388:
        negl      %esi                                          #76.5
..LN389:
        addl      $32, %esi                                     #76.5
..LN390:
        shrl      $3, %esi                                      #76.5
..LN391:
                                # LOE rdx rsi r15 ebx xmm0 xmm1 xmm2
..B1.65:                        # Preds ..B1.64 ..B1.62
..LN392:
        lea       16(%rsi), %eax                                #76.5
..LN393:
        cmpl      %eax, %ebx                                    #76.5
..LN394:
        jl        ..B1.90       # Prob 10%                      #76.5
..LN395:
                                # LOE rdx rsi r15 ebx xmm0 xmm1 xmm2
..B1.66:                        # Preds ..B1.65
..LN396:
        movl      %ebx, %eax                                    #76.5
..LN397:
        xorl      %ecx, %ecx                                    #76.5
..LN398:
        subl      %esi, %eax                                    #76.5
..LN399:
        andl      $15, %eax                                     #76.5
..LN400:
        negl      %eax                                          #76.5
..LN401:
        addl      %ebx, %eax                                    #76.5
..LN402:
        testq     %rsi, %rsi                                    #76.5
..LN403:
        jbe       ..B1.70       # Prob 10%                      #76.5
..LN404:
                                # LOE rdx rcx rsi r15 eax ebx xmm0 xmm1 xmm2
..B1.67:                        # Preds ..B1.66
..LN405:
        movq      48(%rsp), %rdi                                #
..LN406:
                                # LOE rdx rcx rsi rdi r15 eax ebx xmm0 xmm1 xmm2
..B1.68:                        # Preds ..B1.68 ..B1.67
..L37:          # optimization report
                # MULTIVERSIONED FOR DATA DEPENDENCE, VER 1
                # LOOP WAS UNROLLED BY 4
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 4.375000
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.406250
..LN407:
        vmovsd    (%r15,%rcx,8), %xmm3                          #76.43
..LN408:
        vsubsd    %xmm0, %xmm3, %xmm4                           #76.54
..LN409:
        vfmadd213sd %xmm1, %xmm2, %xmm4                         #76.29
..LN410:
        vmovsd    %xmm4, (%rdi,%rcx,8)                          #76.29
..LN411:
        incq      %rcx                                          #76.5
..LN412:
        cmpq      %rsi, %rcx                                    #76.5
..LN413:
        jb        ..B1.68       # Prob 82%                      #76.5
..LN414:
                                # LOE rdx rcx rsi rdi r15 eax ebx xmm0 xmm1 xmm2
..B1.70:                        # Preds ..B1.68 ..B1.66
..LN415:
        vbroadcastsd %xmm1, %ymm5                               #76.66
..LN416:
	.loc    1  75  is_stmt 1
        vbroadcastsd %xmm2, %ymm4                               #75.5
..LN417:
	.loc    1  76  is_stmt 1
        vbroadcastsd %xmm0, %ymm3                               #76.54
..LN418:
        movslq    %eax, %rcx                                    #76.5
..LN419:
        movq      48(%rsp), %rdi                                #76.5
        .align    16,0x90
..LN420:
                                # LOE rdx rcx rsi rdi r15 eax ebx xmm0 xmm1 xmm2 ymm3 ymm4 ymm5
..B1.71:                        # Preds ..B1.71 ..B1.70
..L38:          # optimization report
                # MULTIVERSIONED FOR DATA DEPENDENCE, VER 1
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 4.375000
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.406250
                # MAIN VECTOR TYPE: 64-bits floating point
..LN421:
        vmovupd   (%r15,%rsi,8), %ymm6                          #76.43
..LN422:
        vmovupd   32(%r15,%rsi,8), %ymm8                        #76.43
..LN423:
        vmovupd   64(%r15,%rsi,8), %ymm10                       #76.43
..LN424:
        vmovupd   96(%r15,%rsi,8), %ymm12                       #76.43
..LN425:
        vsubpd    %ymm3, %ymm6, %ymm7                           #76.54
..LN426:
        vsubpd    %ymm3, %ymm8, %ymm9                           #76.54
..LN427:
        vsubpd    %ymm3, %ymm10, %ymm11                         #76.54
..LN428:
        vsubpd    %ymm3, %ymm12, %ymm13                         #76.54
..LN429:
        vfmadd213pd %ymm5, %ymm4, %ymm7                         #76.66
..LN430:
        vfmadd213pd %ymm5, %ymm4, %ymm9                         #76.66
..LN431:
        vfmadd213pd %ymm5, %ymm4, %ymm11                        #76.66
..LN432:
        vfmadd213pd %ymm5, %ymm4, %ymm13                        #76.66
..LN433:
        vmovupd   %ymm7, (%rdi,%rsi,8)                          #76.29
..LN434:
        vmovupd   %ymm9, 32(%rdi,%rsi,8)                        #76.29
..LN435:
        vmovupd   %ymm11, 64(%rdi,%rsi,8)                       #76.29
..LN436:
        vmovupd   %ymm13, 96(%rdi,%rsi,8)                       #76.29
..LN437:
        addq      $16, %rsi                                     #76.5
..LN438:
        cmpq      %rcx, %rsi                                    #76.5
..LN439:
        jb        ..B1.71       # Prob 82%                      #76.5
..LN440:
                                # LOE rdx rcx rsi rdi r15 eax ebx xmm0 xmm1 xmm2 ymm3 ymm4 ymm5
..B1.73:                        # Preds ..B1.71 ..B1.90
..LN441:
        lea       1(%rax), %ecx                                 #76.5
..LN442:
        cmpl      %ecx, %ebx                                    #76.5
..LN443:
        jb        ..B1.88       # Prob 50%                      #76.5
..LN444:
                                # LOE rdx r15 eax xmm0 xmm1 xmm2
..B1.74:                        # Preds ..B1.73
..LN445:
        movslq    %eax, %rax                                    #76.5
..LN446:
        subq      %rax, %rdx                                    #76.5
..LN447:
        cmpq      $4, %rdx                                      #76.5
..LN448:
        jl        ..B1.89       # Prob 10%                      #76.5
..LN449:
                                # LOE rdx r15 eax xmm0 xmm1 xmm2
..B1.75:                        # Preds ..B1.74
..LN450:
        movslq    %eax, %rax                                    #76.43
..LN451:
        movl      %edx, %edi                                    #76.5
..LN452:
        movq      48(%rsp), %rbx                                #76.29
..LN453:
        andl      $-4, %edi                                     #76.5
..LN454:
        movslq    %edi, %rdi                                    #76.5
..LN455:
        xorl      %esi, %esi                                    #76.5
..LN456:
        vbroadcastsd %xmm1, %ymm5                               #76.66
..LN457:
	.loc    1  75  is_stmt 1
        vbroadcastsd %xmm2, %ymm4                               #75.5
..LN458:
	.loc    1  76  is_stmt 1
        vbroadcastsd %xmm0, %ymm3                               #76.54
..LN459:
        lea       (%rbx,%rax,8), %rbx                           #76.29
..LN460:
        lea       (%r15,%rax,8), %rcx                           #76.43
..LN461:
                                # LOE rdx rcx rbx rsi rdi r15 eax xmm0 xmm1 xmm2 ymm3 ymm4 ymm5
..B1.76:                        # Preds ..B1.76 ..B1.75
..L39:          # optimization report
                # MULTIVERSIONED FOR DATA DEPENDENCE, VER 1
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 2.076172
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 1.625000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN462:
        vmovupd   (%rcx,%rsi,8), %ymm6                          #76.43
..LN463:
        vsubpd    %ymm3, %ymm6, %ymm7                           #76.54
..LN464:
        vfmadd213pd %ymm5, %ymm4, %ymm7                         #76.66
..LN465:
        vmovupd   %ymm7, (%rbx,%rsi,8)                          #76.29
..LN466:
        addq      $4, %rsi                                      #76.5
..LN467:
        cmpq      %rdi, %rsi                                    #76.5
..LN468:
        jb        ..B1.76       # Prob 82%                      #76.5
..LN469:
                                # LOE rdx rcx rbx rsi rdi r15 eax xmm0 xmm1 xmm2 ymm3 ymm4 ymm5
..B1.78:                        # Preds ..B1.76 ..B1.89
..LN470:
        cmpq      %rdx, %rdi                                    #76.5
..LN471:
        jae       ..B1.88       # Prob 10%                      #76.5
..LN472:
                                # LOE rdx rdi r15 eax xmm0 xmm1 xmm2
..B1.79:                        # Preds ..B1.78
..LN473:
        movslq    %eax, %rax                                    #76.43
..LN474:
        movq      48(%rsp), %rcx                                #76.29
..LN475:
        lea       (%rcx,%rax,8), %rcx                           #76.29
..LN476:
        lea       (%r15,%rax,8), %rax                           #76.43
..LN477:
                                # LOE rax rdx rcx rdi xmm0 xmm1 xmm2
..B1.80:                        # Preds ..B1.80 ..B1.79
..L40:          # optimization report
                # MULTIVERSIONED FOR DATA DEPENDENCE, VER 1
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 2.076172
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 1.625000
..LN478:
        vmovsd    (%rax,%rdi,8), %xmm3                          #76.43
..LN479:
        vsubsd    %xmm0, %xmm3, %xmm4                           #76.54
..LN480:
        vfmadd213sd %xmm1, %xmm2, %xmm4                         #76.29
..LN481:
        vmovsd    %xmm4, (%rcx,%rdi,8)                          #76.29
..LN482:
        incq      %rdi                                          #76.5
..LN483:
        cmpq      %rdx, %rdi                                    #76.5
..LN484:
        jb        ..B1.80       # Prob 82%                      #76.5
..LN485:
        jmp       ..B1.88       # Prob 100%                     #76.5
..LN486:
                                # LOE rax rdx rcx rdi xmm0 xmm1 xmm2
..B1.82:                        # Preds ..B1.55 ..B1.56 ..B1.59 ..B1.51 ..B1.60
                                #       ..B1.52
..LN487:
        movl      %ebx, %eax                                    #76.5
..LN488:
        movl      $1, %ecx                                      #76.5
..LN489:
        shrl      $31, %eax                                     #76.5
..LN490:
        xorl      %edx, %edx                                    #76.5
..LN491:
	.loc    1  58  is_stmt 1
        addl      %ebx, %eax                                    #58.6
..LN492:
        sarl      $1, %eax                                      #58.6
..LN493:
	.loc    1  76  is_stmt 1
        testl     %eax, %eax                                    #76.5
..LN494:
        jbe       ..B1.86       # Prob 10%                      #76.5
..LN495:
                                # LOE r14 r15 eax edx ecx ebx xmm2
..B1.83:                        # Preds ..B1.82
..LN496:
        movq      16(%rsp), %rsi                                #
..LN497:
        movq      48(%rsp), %rdi                                #
..LN498:
                                # LOE rsi rdi r14 r15 eax edx ebx xmm2
..B1.84:                        # Preds ..B1.84 ..B1.83
..L41:          # optimization report
                # MULTIVERSIONED FOR DATA DEPENDENCE, VER 2
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: non-vectorizable loop instance from multiversioning
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN499:
        lea       (%rdx,%rdx), %ecx                             #76.43
..LN500:
        movslq    %ecx, %rcx                                    #76.43
..LN501:
        incl      %edx                                          #76.5
..LN502:
        vmovsd    (%r15,%rcx,8), %xmm0                          #76.43
..LN503:
        vsubsd    (%r14), %xmm0, %xmm1                          #76.54
..LN504:
        vfmadd213sd (%rsi), %xmm2, %xmm1                        #76.29
..LN505:
        vmovsd    %xmm1, (%rdi,%rcx,8)                          #76.29
..LN506:
        vmovsd    8(%r15,%rcx,8), %xmm3                         #76.43
..LN507:
        vsubsd    (%r14), %xmm3, %xmm4                          #76.54
..LN508:
        vfmadd213sd (%rsi), %xmm2, %xmm4                        #76.29
..LN509:
        vmovsd    %xmm4, 8(%rdi,%rcx,8)                         #76.29
..LN510:
        cmpl      %eax, %edx                                    #76.5
..LN511:
        jb        ..B1.84       # Prob 64%                      #76.5
..LN512:
                                # LOE rsi rdi r14 r15 eax edx ebx xmm2
..B1.85:                        # Preds ..B1.84
..LN513:
        lea       1(%rdx,%rdx), %ecx                            #76.29
..LN514:
                                # LOE r14 r15 ecx ebx xmm2
..B1.86:                        # Preds ..B1.85 ..B1.82
..LN515:
        lea       -1(%rcx), %eax                                #76.5
..LN516:
        cmpl      %eax, %ebx                                    #76.5
..LN517:
        jbe       ..B1.88       # Prob 10%                      #76.5
..LN518:
                                # LOE r14 r15 ecx xmm2
..B1.87:                        # Preds ..B1.86
..L42:          # optimization report
                # REMAINDER LOOP
                # MULTIVERSIONED FOR DATA DEPENDENCE, VER 2
                # %s was not vectorized: non-vectorizable loop instance from multiversioning
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN519:
        movslq    %ecx, %rcx                                    #76.43
..LN520:
        vmovsd    -8(%r15,%rcx,8), %xmm0                        #76.43
..LN521:
        movq      48(%rsp), %r15                                #76.29
..LN522:
        vsubsd    (%r14), %xmm0, %xmm1                          #76.54
..LN523:
        movq      16(%rsp), %r14                                #76.29
..LN524:
        vfmadd213sd (%r14), %xmm1, %xmm2                        #76.29
..LN525:
        vmovsd    %xmm2, -8(%r15,%rcx,8)                        #76.29
..LN526:
                                # LOE
..B1.88:                        # Preds ..B1.80 ..B1.86 ..B1.78 ..B1.73 ..B1.48
                                #       ..B1.87
..LN527:
	.loc    1  77  is_stmt 1
        vzeroupper                                              #77.5
..LN528:
	.loc    1  77  epilogue_begin  is_stmt 1
        addq      $56, %rsp                                     #77.5
	.cfi_restore 3
..LN529:
        popq      %rbx                                          #77.5
	.cfi_restore 15
..LN530:
        popq      %r15                                          #77.5
	.cfi_restore 14
..LN531:
        popq      %r14                                          #77.5
	.cfi_restore 13
..LN532:
        popq      %r13                                          #77.5
	.cfi_restore 12
..LN533:
        popq      %r12                                          #77.5
..LN534:
        movq      %rbp, %rsp                                    #77.5
..LN535:
        popq      %rbp                                          #77.5
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN536:
        ret                                                     #77.5
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN537:
                                # LOE
..B1.89:                        # Preds ..B1.74                 # Infreq
..LN538:
	.loc    1  76  is_stmt 1
        xorl      %edi, %edi                                    #76.5
..LN539:
        jmp       ..B1.78       # Prob 100%                     #76.5
..LN540:
                                # LOE rdx rdi r15 eax xmm0 xmm1 xmm2
..B1.90:                        # Preds ..B1.61 ..B1.63 ..B1.65 # Infreq
..LN541:
        xorl      %eax, %eax                                    #76.5
..LN542:
        jmp       ..B1.73       # Prob 100%                     #76.5
..LN543:
                                # LOE rdx r15 eax ebx xmm0 xmm1 xmm2
..B1.93:                        # Preds ..B1.16                 # Infreq
..LN544:
	.loc    1  73  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #73.17
..___tag_value_cubic_spline.58:
..LN545:
#       error_handler(const char *)
        call      error_handler                                 #73.17
..___tag_value_cubic_spline.59:
..LN546:
        jmp       ..B1.18       # Prob 100%                     #73.17
..LN547:
                                # LOE r14 r15 ebx r13d
..B1.94:                        # Preds ..B1.12 ..B1.13         # Infreq
..LN548:
	.loc    1  70  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #70.59
..___tag_value_cubic_spline.60:
..LN549:
#       error_handler(const char *)
        call      error_handler                                 #70.59
..___tag_value_cubic_spline.61:
..LN550:
        jmp       ..B1.14       # Prob 100%                     #70.59
..LN551:
                                # LOE rbx r12 r13 r14 r15
..B1.95:                        # Preds ..B1.9                  # Infreq
..LN552:
	.loc    1  66  is_stmt 1
        movl      $.L_2__STRING.0, %edi                         #66.34
..___tag_value_cubic_spline.62:
..LN553:
#       error_handler(const char *)
        call      error_handler                                 #66.34
..___tag_value_cubic_spline.63:
..LN554:
        jmp       ..B1.10       # Prob 100%                     #66.34
..LN555:
                                # LOE r14 r15 ebx r13d
..B1.96:                        # Preds ..B1.5                  # Infreq
..LN556:
        movl      $.L_2__STRING.0, %edi                         #66.34
..___tag_value_cubic_spline.64:
..LN557:
#       error_handler(const char *)
        call      error_handler                                 #66.34
..___tag_value_cubic_spline.65:
..LN558:
        jmp       ..B1.6        # Prob 100%                     #66.34
..LN559:
                                # LOE r14 ebx r12d r13d
..B1.97:                        # Preds ..B1.4                  # Infreq
..LN560:
        movl      $.L_2__STRING.0, %edi                         #66.34
..___tag_value_cubic_spline.66:
..LN561:
#       error_handler(const char *)
        call      error_handler                                 #66.34
..___tag_value_cubic_spline.67:
..LN562:
                                # LOE r14 r15 ebx r12d r13d
..B1.98:                        # Preds ..B1.97                 # Infreq
..LN563:
        vmovsd    8(%r14,%r15,8), %xmm1                         #66.21
..LN564:
        jmp       ..B1.5        # Prob 100%                     #66.21
..LN565:
        .align    16,0x90
	.cfi_endproc
..LN566:
                                # LOE r14 r15 ebx r12d r13d xmm1
..LN567:
# mark_end;
	.type	cubic_spline,@function
	.size	cubic_spline,.-cubic_spline
..LNcubic_spline.568:
.LNcubic_spline:
	.data
# -- End  cubic_spline
	.text
.L_2__routine_start_conserve_interp_1:
# -- Begin  conserve_interp
	.text
# mark_begin;
       .align    16,0x90
	.globl conserve_interp
# --- conserve_interp(int, int, int, int, const double *, const double *, const double *, const double *, const double *, const double *, double *)
conserve_interp:
# parameter 1(nx_src): %edi
# parameter 2(ny_src): %esi
# parameter 3(nx_dst): %edx
# parameter 4(ny_dst): %ecx
# parameter 5(x_src): %r8
# parameter 6(y_src): %r9
# parameter 7(x_dst): 16 + %rbp
# parameter 8(y_dst): 24 + %rbp
# parameter 9(mask_src): 32 + %rbp
# parameter 10(data_src): 40 + %rbp
# parameter 11(data_dst): 48 + %rbp
..B2.1:                         # Preds ..B2.0
	.cfi_startproc
..___tag_value_conserve_interp.72:
..L73:
                                                         #147.1
..LN569:
	.loc    1  147  is_stmt 1
        pushq     %rbp                                          #147.1
	.cfi_def_cfa_offset 16
..LN570:
        movq      %rsp, %rbp                                    #147.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN571:
        andq      $-32, %rsp                                    #147.1
..LN572:
        pushq     %r12                                          #147.1
..LN573:
        pushq     %r13                                          #147.1
..LN574:
        pushq     %r14                                          #147.1
..LN575:
        pushq     %r15                                          #147.1
..LN576:
        pushq     %rbx                                          #147.1
..LN577:
        subq      $120, %rsp                                    #147.1
..LN578:
        movl      %edi, 64(%rsp)                                #147.1
..LN579:
	.loc    1  153  prologue_end  is_stmt 1
        movl      $40000000, %edi                               #153.26
..LN580:
	.loc    1  147  is_stmt 1
        movq      16(%rbp), %rax                                #147.1
..LN581:
        movq      40(%rbp), %r10                                #147.1
..LN582:
        movq      48(%rbp), %r11                                #147.1
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN583:
        movq      24(%rbp), %rbx                                #147.1
..LN584:
        movq      32(%rbp), %r12                                #147.1
..LN585:
        movq      %r9, 8(%rsp)                                  #147.1
..LN586:
        movq      %r8, (%rsp)                                   #147.1
..LN587:
        movl      %esi, 72(%rsp)                                #147.1
..LN588:
        movl      %edx, 80(%rsp)                                #147.1
..LN589:
        movl      %ecx, 88(%rsp)                                #147.1
..LN590:
        movq      %rax, 56(%rsp)                                #147.1
..LN591:
        movq      %r10, 24(%rsp)                                #147.1
..LN592:
        movq      %r11, 48(%rsp)                                #147.1
..LN593:
	.loc    1  153  is_stmt 1
#       malloc(size_t)
        call      malloc                                        #153.26
..LN594:
                                # LOE rax rbx r12
..B2.62:                        # Preds ..B2.1
..LN595:
        movq      %rax, 40(%rsp)                                #153.26
..LN596:
                                # LOE rbx r12
..B2.2:                         # Preds ..B2.62
..LN597:
	.loc    1  154  is_stmt 1
        movl      $40000000, %edi                               #154.26
..LN598:
#       malloc(size_t)
        call      malloc                                        #154.26
..LN599:
                                # LOE rax rbx r12
..B2.63:                        # Preds ..B2.2
..LN600:
        movq      %rax, 32(%rsp)                                #154.26
..LN601:
                                # LOE rbx r12
..B2.3:                         # Preds ..B2.63
..LN602:
	.loc    1  155  is_stmt 1
        movl      $40000000, %edi                               #155.26
..LN603:
#       malloc(size_t)
        call      malloc                                        #155.26
..LN604:
                                # LOE rax rbx r12
..B2.64:                        # Preds ..B2.3
..LN605:
        movq      %rax, %r15                                    #155.26
..LN606:
                                # LOE rbx r12 r15
..B2.4:                         # Preds ..B2.64
..LN607:
	.loc    1  156  is_stmt 1
        movl      $40000000, %edi                               #156.26
..LN608:
#       malloc(size_t)
        call      malloc                                        #156.26
..LN609:
                                # LOE rax rbx r12 r15
..B2.65:                        # Preds ..B2.4
..LN610:
        movq      %rax, %r13                                    #156.26
..LN611:
                                # LOE rbx r12 r13 r15
..B2.5:                         # Preds ..B2.65
..LN612:
	.loc    1  157  is_stmt 1
        movl      $80000000, %edi                               #157.26
..LN613:
#       malloc(size_t)
        call      malloc                                        #157.26
..LN614:
                                # LOE rax rbx r12 r13 r15
..B2.66:                        # Preds ..B2.5
..LN615:
        movq      %rax, %r14                                    #157.26
..LN616:
                                # LOE rbx r12 r13 r14 r15
..B2.6:                         # Preds ..B2.66
..LN617:
	.loc    1  158  is_stmt 1
        movl      80(%rsp), %edi                                #158.26
..LN618:
        imull     88(%rsp), %edi                                #158.26
..LN619:
        movslq    %edi, %rdi                                    #158.26
..LN620:
        shlq      $3, %rdi                                      #158.26
..LN621:
#       malloc(size_t)
        call      malloc                                        #158.26
..LN622:
                                # LOE rax rbx r12 r13 r14 r15
..B2.67:                        # Preds ..B2.6
..LN623:
        movq      %rax, 16(%rsp)                                #158.26
..LN624:
                                # LOE rbx r12 r13 r14 r15
..B2.7:                         # Preds ..B2.67
..LN625:
	.loc    1  159  is_stmt 1
        pushq     %r14                                          #159.12
..LN626:
        pushq     %r13                                          #159.12
..LN627:
        pushq     %r15                                          #159.12
..LN628:
        pushq     56(%rsp)                                      #159.12
..LN629:
        pushq     72(%rsp)                                      #159.12
..LN630:
        pushq     %r12                                          #159.12
..LN631:
        pushq     %rbx                                          #159.12
..LN632:
        pushq     112(%rsp)                                     #159.12
..LN633:
        movq      64(%rsp), %r8                                 #159.12
..LN634:
        lea       128(%rsp), %rdi                               #159.12
..LN635:
        movq      -56(%rdi), %r9                                #159.12
..LN636:
        lea       136(%rsp), %rsi                               #159.12
..LN637:
        lea       144(%rsp), %rdx                               #159.12
..LN638:
        lea       152(%rsp), %rcx                               #159.12
..___tag_value_conserve_interp.83:
..LN639:
#       create_xgrid_2dx2d_order1(const int *, const int *, const int *, const int *, const double *, const double *, const double *, const double *, const double *, int *, int *, int *, int *, double *)
        call      create_xgrid_2dx2d_order1                     #159.12
..___tag_value_conserve_interp.84:
..LN640:
                                # LOE rbx r13 r14 r15 eax
..B2.68:                        # Preds ..B2.7
..LN641:
        movl      %eax, %r12d                                   #159.12
..LN642:
        addq      $64, %rsp                                     #159.12
..LN643:
                                # LOE rbx r13 r14 r15 r12d
..B2.8:                         # Preds ..B2.68
..LN644:
	.loc    1  161  is_stmt 1
        movq      %rbx, %rcx                                    #161.3
..LN645:
        lea       80(%rsp), %rdi                                #161.3
..LN646:
        movq      -24(%rdi), %rdx                               #161.3
..LN647:
        lea       88(%rsp), %rsi                                #161.3
..LN648:
        movq      -72(%rsi), %r8                                #161.3
..___tag_value_conserve_interp.85:
..LN649:
#       get_grid_area(const int *, const int *, const double *, const double *, double *)
        call      get_grid_area                                 #161.3
..___tag_value_conserve_interp.86:
..LN650:
                                # LOE r13 r14 r15 r12d
..B2.9:                         # Preds ..B2.8
..LN651:
	.loc    1  162  is_stmt 1
        movslq    %r12d, %r12                                   #162.25
..LN652:
        movq      %r12, 56(%rsp)                                #162.25
..LN653:
        lea       (,%r12,8), %rdi                               #162.25
..LN654:
#       malloc(size_t)
        call      malloc                                        #162.25
..LN655:
                                # LOE rax r12 r13 r14 r15 r12d r12b
..B2.69:                        # Preds ..B2.9
..LN656:
        movq      %rax, %rbx                                    #162.25
..LN657:
                                # LOE rbx r12 r13 r14 r15 r12d r12b
..B2.10:                        # Preds ..B2.69
..LN658:
	.loc    1  163  is_stmt 1
        movl      80(%rsp), %ecx                                #163.77
..LN659:
        testl     %r12d, %r12d                                  #163.14
..LN660:
        jle       ..B2.32       # Prob 15%                      #163.14
..LN661:
                                # LOE rbx r12 r13 r14 r15 ecx r12d r12b
..B2.11:                        # Preds ..B2.10
..LN662:
        cmpl      $8, %r12d                                     #163.3
..LN663:
        jl        ..B2.57       # Prob 10%                      #163.3
..LN664:
                                # LOE rbx r12 r13 r14 r15 ecx r12d r12b
..B2.12:                        # Preds ..B2.11
..LN665:
        movq      %rbx, %rax                                    #163.3
..LN666:
        andq      $15, %rax                                     #163.3
..LN667:
        testl     %eax, %eax                                    #163.3
..LN668:
        je        ..B2.15       # Prob 50%                      #163.3
..LN669:
                                # LOE rbx r12 r13 r14 r15 eax ecx r12d r12b
..B2.13:                        # Preds ..B2.12
..LN670:
        testb     $7, %al                                       #163.3
..LN671:
        jne       ..B2.57       # Prob 10%                      #163.3
..LN672:
                                # LOE rbx r12 r13 r14 r15 ecx r12d r12b
..B2.14:                        # Preds ..B2.13
..LN673:
        movl      $1, %eax                                      #163.3
..LN674:
                                # LOE rbx r12 r13 r14 r15 eax ecx r12d r12b
..B2.15:                        # Preds ..B2.14 ..B2.12
..LN675:
        lea       8(%rax), %edx                                 #163.3
..LN676:
        cmpl      %edx, %r12d                                   #163.3
..LN677:
        jl        ..B2.57       # Prob 10%                      #163.3
..LN678:
                                # LOE rbx r12 r13 r14 r15 eax ecx r12d r12b
..B2.16:                        # Preds ..B2.15
..LN679:
        movl      %r12d, %edi                                   #163.3
..LN680:
        xorl      %edx, %edx                                    #163.3
..LN681:
        subl      %eax, %edi                                    #163.3
..LN682:
        andl      $7, %edi                                      #163.3
..LN683:
        negl      %edi                                          #163.3
..LN684:
        movl      %eax, %eax                                    #163.3
..LN685:
        addl      %r12d, %edi                                   #163.3
..LN686:
        testq     %rax, %rax                                    #163.3
..LN687:
        jbe       ..B2.20       # Prob 0%                       #163.3
..LN688:
                                # LOE rax rdx rbx r13 r14 r15 ecx edi r12d
..B2.17:                        # Preds ..B2.16
..LN689:
        movq      16(%rsp), %r8                                 #
..LN690:
                                # LOE rax rdx rbx r8 r13 r14 r15 ecx edi r12d
..B2.18:                        # Preds ..B2.18 ..B2.17
..L87:          # optimization report
                # LOOP WAS UNROLLED BY 2
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 2.656250
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.187500
..LN691:
        movl      (%r13,%rdx,4), %esi                           #163.65
..LN692:
        imull     %ecx, %esi                                    #163.77
..LN693:
        vmovsd    (%r14,%rdx,8), %xmm0                          #163.42
..LN694:
        addl      (%r15,%rdx,4), %esi                           #163.84
..LN695:
        movslq    %esi, %rsi                                    #163.56
..LN696:
        vdivsd    (%r8,%rsi,8), %xmm0, %xmm1                    #163.56
..LN697:
        vmovsd    %xmm1, (%rbx,%rdx,8)                          #163.27
..LN698:
        incq      %rdx                                          #163.3
..LN699:
        cmpq      %rax, %rdx                                    #163.3
..LN700:
        jb        ..B2.18       # Prob 82%                      #163.3
..LN701:
                                # LOE rax rdx rbx r8 r13 r14 r15 ecx edi r12d
..B2.20:                        # Preds ..B2.18 ..B2.16
..LN702:
        vmovd     %ecx, %xmm0                                   #163.77
..LN703:
        vpbroadcastd %xmm0, %xmm1                               #163.77
..LN704:
        vpcmpeqd  %ymm0, %ymm0, %ymm0                           #163.3
..LN705:
        movslq    %edi, %rdx                                    #163.3
..LN706:
        movq      16(%rsp), %rsi                                #163.3
..LN707:
        .align    16,0x90
..LN708:
                                # LOE rax rdx rbx rsi r13 r14 r15 ecx edi r12d xmm1 ymm0
..B2.21:                        # Preds ..B2.21 ..B2.20
..L88:          # optimization report
                # LOOP WAS UNROLLED BY 2
                # LOOP WAS VECTORIZED
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 2.656250
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.187500
                # MAIN VECTOR TYPE: 32-bits floating point
..LN709:
        vmovdqu   (%r13,%rax,4), %xmm2                          #163.65
..LN710:
        vmovdqu   16(%r13,%rax,4), %xmm9                        #163.65
..LN711:
        vmovupd   (%r14,%rax,8), %ymm6                          #163.42
..LN712:
        vmovupd   32(%r14,%rax,8), %ymm13                       #163.42
..LN713:
        vpmulld   %xmm1, %xmm2, %xmm3                           #163.77
..LN714:
        vpmulld   %xmm1, %xmm9, %xmm10                          #163.77
..LN715:
        vpaddd    (%r15,%rax,4), %xmm3, %xmm4                   #163.84
..LN716:
        vpaddd    16(%r15,%rax,4), %xmm10, %xmm11               #163.84
..LN717:
        vxorpd    %ymm7, %ymm7, %ymm7                           #163.56
..LN718:
        vmovdqa   %ymm0, %ymm5                                  #163.56
..LN719:
        vxorpd    %ymm14, %ymm14, %ymm14                        #163.56
..LN720:
        vmovdqa   %ymm0, %ymm12                                 #163.56
..LN721:
        vgatherdpd %ymm5, (%rsi,%xmm4,8), %ymm7                 #163.56
..LN722:
        vgatherdpd %ymm12, (%rsi,%xmm11,8), %ymm14              #163.56
..LN723:
        vdivpd    %ymm7, %ymm6, %ymm8                           #163.56
..LN724:
        vdivpd    %ymm14, %ymm13, %ymm15                        #163.56
..LN725:
        vmovupd   %ymm8, (%rbx,%rax,8)                          #163.27
..LN726:
        vmovupd   %ymm15, 32(%rbx,%rax,8)                       #163.27
..LN727:
        addq      $8, %rax                                      #163.3
..LN728:
        cmpq      %rdx, %rax                                    #163.3
..LN729:
        jb        ..B2.21       # Prob 82%                      #163.3
..LN730:
                                # LOE rax rdx rbx rsi r13 r14 r15 ecx edi r12d xmm1 ymm0
..B2.23:                        # Preds ..B2.21 ..B2.57
..LN731:
        lea       1(%rdi), %eax                                 #163.3
..LN732:
        cmpl      %eax, %r12d                                   #163.3
..LN733:
        jb        ..B2.32       # Prob 50%                      #163.3
..LN734:
                                # LOE rbx r13 r14 r15 ecx edi r12d
..B2.24:                        # Preds ..B2.23
..LN735:
        movslq    %edi, %rax                                    #163.3
..LN736:
        negq      %rax                                          #163.3
..LN737:
        addq      56(%rsp), %rax                                #163.3
..LN738:
        cmpq      $4, %rax                                      #163.3
..LN739:
        jl        ..B2.56       # Prob 10%                      #163.3
..LN740:
                                # LOE rax rbx r13 r14 r15 ecx edi r12d
..B2.25:                        # Preds ..B2.24
..LN741:
        movslq    %edi, %rdi                                    #163.42
..LN742:
        movl      %eax, %edx                                    #163.3
..LN743:
        movq      $0, 8(%rsp)                                   #163.3
..LN744:
        andl      $-4, %edx                                     #163.3
..LN745:
        vmovd     %ecx, %xmm0                                   #163.77
..LN746:
        movq      %r15, (%rsp)                                  #163.65
..LN747:
        vpbroadcastd %xmm0, %xmm0                               #163.77
..LN748:
        lea       (%rbx,%rdi,8), %r8                            #163.27
..LN749:
        movslq    %edx, %rdx                                    #163.3
..LN750:
        lea       (%r14,%rdi,8), %r9                            #163.42
..LN751:
        movq      8(%rsp), %r11                                 #163.65
..LN752:
        lea       (%r15,%rdi,4), %r10                           #163.84
..LN753:
        movq      16(%rsp), %r15                                #163.65
..LN754:
        lea       (%r13,%rdi,4), %rsi                           #163.65
..LN755:
                                # LOE rax rdx rbx rsi r8 r9 r10 r11 r13 r14 r15 ecx edi r12d xmm0
..B2.26:                        # Preds ..B2.26 ..B2.25
..L89:          # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 1.400391
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.375000
                # MAIN VECTOR TYPE: 32-bits floating point
..LN756:
        vmovdqu   (%rsi,%r11,4), %xmm1                          #163.77
..LN757:
        vmovupd   (%r9,%r11,8), %ymm5                           #163.42
..LN758:
        vpmulld   %xmm0, %xmm1, %xmm2                           #163.77
..LN759:
        vpaddd    (%r10,%r11,4), %xmm2, %xmm3                   #163.56
..LN760:
        vxorpd    %ymm6, %ymm6, %ymm6                           #163.56
..LN761:
        vpcmpeqd  %ymm4, %ymm4, %ymm4                           #163.56
..LN762:
        vgatherdpd %ymm4, (%r15,%xmm3,8), %ymm6                 #163.56
..LN763:
        vdivpd    %ymm6, %ymm5, %ymm7                           #163.56
..LN764:
        vmovupd   %ymm7, (%r8,%r11,8)                           #163.27
..LN765:
        addq      $4, %r11                                      #163.3
..LN766:
        cmpq      %rdx, %r11                                    #163.3
..LN767:
        jb        ..B2.26       # Prob 82%                      #163.3
..LN768:
                                # LOE rax rdx rbx rsi r8 r9 r10 r11 r13 r14 r15 ecx edi r12d xmm0
..B2.27:                        # Preds ..B2.26
..LN769:
        movq      (%rsp), %r15                                  #
..LN770:
                                # LOE rax rdx rbx r13 r14 r15 ecx edi r12d
..B2.28:                        # Preds ..B2.27 ..B2.56
..LN771:
        cmpq      %rax, %rdx                                    #163.3
..LN772:
        jae       ..B2.32       # Prob 0%                       #163.3
..LN773:
                                # LOE rax rdx rbx r13 r14 r15 ecx edi r12d
..B2.29:                        # Preds ..B2.28
..LN774:
        movslq    %edi, %rdi                                    #163.42
..LN775:
        movq      16(%rsp), %r8                                 #163.65
..LN776:
        lea       (%rbx,%rdi,8), %r9                            #163.27
..LN777:
        lea       (%r14,%rdi,8), %r10                           #163.42
..LN778:
        lea       (%r15,%rdi,4), %r11                           #163.84
..LN779:
        lea       (%r13,%rdi,4), %rsi                           #163.65
..LN780:
                                # LOE rax rdx rbx rsi r8 r9 r10 r11 r13 r14 r15 ecx r12d
..B2.30:                        # Preds ..B2.30 ..B2.29
..L90:          # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.400391
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.375000
..LN781:
        movl      (%rsi,%rdx,4), %edi                           #163.65
..LN782:
        imull     %ecx, %edi                                    #163.77
..LN783:
        vmovsd    (%r10,%rdx,8), %xmm0                          #163.42
..LN784:
        addl      (%r11,%rdx,4), %edi                           #163.84
..LN785:
        movslq    %edi, %rdi                                    #163.56
..LN786:
        vdivsd    (%r8,%rdi,8), %xmm0, %xmm1                    #163.56
..LN787:
        vmovsd    %xmm1, (%r9,%rdx,8)                           #163.27
..LN788:
        incq      %rdx                                          #163.3
..LN789:
        cmpq      %rax, %rdx                                    #163.3
..LN790:
        jb        ..B2.30       # Prob 82%                      #163.3
..LN791:
                                # LOE rax rdx rbx rsi r8 r9 r10 r11 r13 r14 r15 ecx r12d
..B2.32:                        # Preds ..B2.10 ..B2.30 ..B2.23 ..B2.28
..LN792:
	.loc    1  165  is_stmt 1
        movl      %ecx, %esi                                    #165.21
..LN793:
        movl      88(%rsp), %eax                                #165.21
..LN794:
        imull     %eax, %esi                                    #165.21
..LN795:
        testl     %esi, %esi                                    #165.21
..LN796:
        jle       ..B2.35       # Prob 50%                      #165.21
..LN797:
                                # LOE rbx r13 r14 r15 eax ecx esi r12d
..B2.33:                        # Preds ..B2.32
..L91:          # optimization report
                # MEMOP WAS GENERATED FOR THIS LOOP
                # %s was not vectorized: inner loop was already vectorized
..LN798:
        cmpl      $12, %esi                                     #165.3
..LN799:
        jle       ..B2.47       # Prob 0%                       #165.3
..LN800:
                                # LOE rbx r13 r14 r15 eax ecx esi r12d
..B2.34:                        # Preds ..B2.33
..LN801:
	.loc    1  166  is_stmt 1
        movslq    %ecx, %rdx                                    #166.5
..LN802:
        xorl      %esi, %esi                                    #166.5
..LN803:
        movslq    %eax, %rax                                    #166.5
..LN804:
        shlq      $3, %rdx                                      #166.5
..LN805:
        imulq     %rax, %rdx                                    #166.5
..LN806:
        movq      48(%rsp), %rdi                                #166.5
..LN807:
        movl      %ecx, (%rsp)                                  #166.5
..LN808:
        vzeroupper                                              #166.5
..LN809:
        call      __intel_avx_rep_memset                        #166.5
..LN810:
                                # LOE rbx r13 r14 r15 r12d
..B2.71:                        # Preds ..B2.34
..LN811:
        movl      (%rsp), %ecx                                  #
..LN812:
                                # LOE rbx r13 r14 r15 ecx r12d
..B2.35:                        # Preds ..B2.53 ..B2.32 ..B2.71 ..B2.51
..LN813:
	.loc    1  168  is_stmt 1
        testl     %r12d, %r12d                                  #168.14
..LN814:
        movl      $0, %r12d                                     #168.7
..LN815:
        jle       ..B2.39       # Prob 10%                      #168.14
..LN816:
                                # LOE rbx r12 r13 r14 r15 ecx
..B2.36:                        # Preds ..B2.35
..LN817:
	.loc    1  169  is_stmt 1
        movl      64(%rsp), %edx                                #169.70
..LN818:
        movq      56(%rsp), %rsi                                #169.70
..LN819:
        movq      32(%rsp), %r8                                 #169.70
..LN820:
        movq      40(%rsp), %r9                                 #169.70
..LN821:
        movq      48(%rsp), %r10                                #169.70
..LN822:
        movq      24(%rsp), %r11                                #169.70
..LN823:
                                # LOE rbx rsi r8 r9 r10 r11 r12 r13 r14 r15 edx ecx
..B2.37:                        # Preds ..B2.37 ..B2.36
..L92:          # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN824:
        movl      (%r8,%r12,4), %edi                            #169.58
..LN825:
        imull     %edx, %edi                                    #169.70
..LN826:
        vmovsd    (%rbx,%r12,8), %xmm0                          #169.90
..LN827:
        movl      (%r13,%r12,4), %eax                           #169.14
..LN828:
        imull     %ecx, %eax                                    #169.26
..LN829:
        addl      (%r9,%r12,4), %edi                            #169.77
..LN830:
        addl      (%r15,%r12,4), %eax                           #169.33
..LN831:
	.loc    1  168  is_stmt 1
        incq      %r12                                          #168.22
..LN832:
	.loc    1  169  is_stmt 1
        movslq    %edi, %rdi                                    #169.49
..LN833:
        movslq    %eax, %rax                                    #169.5
..LN834:
        vmovsd    (%r11,%rdi,8), %xmm1                          #169.49
..LN835:
        vfmadd213sd (%r10,%rax,8), %xmm0, %xmm1                 #169.5
..LN836:
        vmovsd    %xmm1, (%r10,%rax,8)                          #169.5
..LN837:
	.loc    1  168  is_stmt 1
        cmpq      %rsi, %r12                                    #168.14
..LN838:
        jl        ..B2.37       # Prob 82%                      #168.14
..LN839:
                                # LOE rbx rsi r8 r9 r10 r11 r12 r13 r14 r15 edx ecx
..B2.39:                        # Preds ..B2.37 ..B2.35
..LN840:
	.loc    1  172  is_stmt 1
        vzeroupper                                              #172.3
..LN841:
        movq      40(%rsp), %rdi                                #172.3
..LN842:
#       free(void *)
        call      free                                          #172.3
..LN843:
                                # LOE rbx r13 r14 r15
..B2.40:                        # Preds ..B2.39
..LN844:
	.loc    1  173  is_stmt 1
        movq      32(%rsp), %rdi                                #173.3
..LN845:
#       free(void *)
        call      free                                          #173.3
..LN846:
                                # LOE rbx r13 r14 r15
..B2.41:                        # Preds ..B2.40
..LN847:
	.loc    1  174  is_stmt 1
        movq      %r15, %rdi                                    #174.3
..LN848:
#       free(void *)
        call      free                                          #174.3
..LN849:
                                # LOE rbx r13 r14
..B2.42:                        # Preds ..B2.41
..LN850:
	.loc    1  175  is_stmt 1
        movq      %r13, %rdi                                    #175.3
..LN851:
#       free(void *)
        call      free                                          #175.3
..LN852:
                                # LOE rbx r14
..B2.43:                        # Preds ..B2.42
..LN853:
	.loc    1  176  is_stmt 1
        movq      %r14, %rdi                                    #176.3
..LN854:
#       free(void *)
        call      free                                          #176.3
..LN855:
                                # LOE rbx
..B2.44:                        # Preds ..B2.43
..LN856:
	.loc    1  177  is_stmt 1
        movq      16(%rsp), %rdi                                #177.3
..LN857:
#       free(void *)
        call      free                                          #177.3
..LN858:
                                # LOE rbx
..B2.45:                        # Preds ..B2.44
..LN859:
	.loc    1  178  is_stmt 1
        movq      %rbx, %rdi                                    #178.3
..LN860:
#       free(void *)
        call      free                                          #178.3
..LN861:
                                # LOE
..B2.46:                        # Preds ..B2.45
..LN862:
	.loc    1  180  epilogue_begin  is_stmt 1
        addq      $120, %rsp                                    #180.1
	.cfi_restore 3
..LN863:
        popq      %rbx                                          #180.1
	.cfi_restore 15
..LN864:
        popq      %r15                                          #180.1
	.cfi_restore 14
..LN865:
        popq      %r14                                          #180.1
	.cfi_restore 13
..LN866:
        popq      %r13                                          #180.1
	.cfi_restore 12
..LN867:
        popq      %r12                                          #180.1
..LN868:
        movq      %rbp, %rsp                                    #180.1
..LN869:
        popq      %rbp                                          #180.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN870:
        ret                                                     #180.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN871:
                                # LOE
..B2.47:                        # Preds ..B2.33                 # Infreq
..LN872:
	.loc    1  165  is_stmt 1
        movslq    %esi, %rdx                                    #165.3
..LN873:
        cmpq      $8, %rdx                                      #165.3
..LN874:
        jl        ..B2.55       # Prob 10%                      #165.3
..LN875:
                                # LOE rdx rbx r13 r14 r15 ecx esi r12d
..B2.48:                        # Preds ..B2.47                 # Infreq
..LN876:
        andl      $-8, %esi                                     #165.3
..LN877:
        xorl      %r8d, %r8d                                    #165.3
..LN878:
	.loc    1  166  is_stmt 1
        vxorpd    %ymm0, %ymm0, %ymm0                           #166.19
..LN879:
	.loc    1  165  is_stmt 1
        movslq    %esi, %rax                                    #165.3
..LN880:
        movq      48(%rsp), %r9                                 #165.3
..LN881:
                                # LOE rax rdx rbx r8 r9 r13 r14 r15 ecx esi r12d ymm0
..B2.49:                        # Preds ..B2.49 ..B2.48         # Infreq
..L108:         # optimization report
                # LOOP WAS UNROLLED BY 2
                # LOOP WAS VECTORIZED
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 1.818359
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
                # MAIN VECTOR TYPE: 64-bits floating point
..LN882:
	.loc    1  166  is_stmt 1
        vmovupd   %ymm0, (%r9,%r8,8)                            #166.5
..LN883:
        vmovupd   %ymm0, 32(%r9,%r8,8)                          #166.5
..LN884:
	.loc    1  165  is_stmt 1
        addq      $8, %r8                                       #165.3
..LN885:
        cmpq      %rax, %r8                                     #165.3
..LN886:
        jb        ..B2.49       # Prob 82%                      #165.3
..LN887:
                                # LOE rax rdx rbx r8 r9 r13 r14 r15 ecx esi r12d ymm0
..B2.51:                        # Preds ..B2.49 ..B2.55         # Infreq
..LN888:
        xorl      %eax, %eax                                    #165.3
..LN889:
        lea       1(%rsi), %r8d                                 #165.3
..LN890:
        movslq    %r8d, %r8                                     #165.3
..LN891:
        cmpq      %r8, %rdx                                     #165.3
..LN892:
        jb        ..B2.35       # Prob 15%                      #165.3
..LN893:
                                # LOE rax rdx rbx r13 r14 r15 ecx esi r12d
..B2.52:                        # Preds ..B2.51                 # Infreq
..LN894:
        movslq    %esi, %rsi                                    #165.3
..LN895:
	.loc    1  166  is_stmt 1
        movq      48(%rsp), %r8                                 #166.5
..LN896:
	.loc    1  165  is_stmt 1
        subq      %rsi, %rdx                                    #165.3
..LN897:
	.loc    1  166  is_stmt 1
        lea       (%r8,%rsi,8), %rsi                            #166.5
..LN898:
        xorl      %r8d, %r8d                                    #166.5
..LN899:
                                # LOE rax rdx rbx rsi r8 r13 r14 r15 ecx r12d
..B2.53:                        # Preds ..B2.53 ..B2.52         # Infreq
..L109:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # %s was not vectorized: vectorization possible but seems inefficient. Use vector always directive or -vec-threshold0 to override 
                # VECTORIZATION SPEEDUP COEFFECIENT 0.972656
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 2.250000
..LN900:
        movq      %r8, (%rsi,%rax,8)                            #166.5
..LN901:
	.loc    1  165  is_stmt 1
        incq      %rax                                          #165.3
..LN902:
        cmpq      %rdx, %rax                                    #165.3
..LN903:
        jb        ..B2.53       # Prob 82%                      #165.3
..LN904:
        jmp       ..B2.35       # Prob 100%                     #165.3
..LN905:
                                # LOE rax rdx rbx rsi r8 r13 r14 r15 ecx r12d
..B2.55:                        # Preds ..B2.47                 # Infreq
..LN906:
        xorl      %esi, %esi                                    #165.3
..LN907:
        jmp       ..B2.51       # Prob 100%                     #165.3
..LN908:
                                # LOE rdx rbx r13 r14 r15 ecx esi r12d
..B2.56:                        # Preds ..B2.24                 # Infreq
..LN909:
	.loc    1  163  is_stmt 1
        xorl      %edx, %edx                                    #163.3
..LN910:
        jmp       ..B2.28       # Prob 100%                     #163.3
..LN911:
                                # LOE rax rdx rbx r13 r14 r15 ecx edi r12d
..B2.57:                        # Preds ..B2.11 ..B2.13 ..B2.15 # Infreq
..LN912:
        xorl      %edi, %edi                                    #163.3
..LN913:
        jmp       ..B2.23       # Prob 100%                     #163.3
..LN914:
        .align    16,0x90
	.cfi_endproc
..LN915:
                                # LOE rbx r13 r14 r15 ecx edi r12d
..LN916:
# mark_end;
	.type	conserve_interp,@function
	.size	conserve_interp,.-conserve_interp
..LNconserve_interp.917:
.LNconserve_interp:
	.data
# -- End  conserve_interp
	.section .rodata, "a"
	.align 8
.L_2il0floatpacket.0:
	.long	0x9ce410a0,0x4628fdb9
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0xbfe00000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x40080000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0x40180000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x00000000,0x3fe00000
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.6:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
.L_2__STRING.2:
	.long	1768060259
	.long	1886609251
	.long	1701734764
	.long	1752440890
	.long	1769152613
	.long	1864394106
	.long	1852383334
	.long	544503152
	.long	1684632167
	.long	1869116192
	.long	543452277
	.long	1629513058
	.long	1701585012
	.long	544502625
	.word	50
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,58
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1768060259
	.long	1886609251
	.long	1701734764
	.long	1919361082
	.long	540173417
	.long	1936025964
	.long	1953853216
	.long	1701079411
	.long	1769105184
	.word	12644
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,39
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.long	1768060259
	.long	1886609251
	.long	1701734764
	.long	1919361082
	.long	540107881
	.long	1847620457
	.long	1830843503
	.long	1953459823
	.long	1667853935
	.long	1668180256
	.long	1935762802
	.long	6778473
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,48
	.data
	.section .debug_opt_report, ""
..L113:
	.ascii ".itt_notify_tab\0"
	.word	258
	.word	48
	.long	22
	.long	..L114 - ..L113
	.long	48
	.long	..L115 - ..L113
	.long	368
	.long	0x00000008,0x00000000
	.long	0
	.long	0
	.long	0
	.long	0
	.quad	..L13
	.long	28
	.long	4
	.quad	..L14
	.long	28
	.long	20
	.quad	..L15
	.long	28
	.long	36
	.quad	..L16
	.long	28
	.long	52
	.quad	..L17
	.long	28
	.long	68
	.quad	..L18
	.long	28
	.long	84
	.quad	..L19
	.long	28
	.long	100
	.quad	..L37
	.long	28
	.long	116
	.quad	..L38
	.long	28
	.long	135
	.quad	..L39
	.long	28
	.long	154
	.quad	..L40
	.long	28
	.long	173
	.quad	..L41
	.long	28
	.long	192
	.quad	..L42
	.long	28
	.long	208
	.quad	..L87
	.long	28
	.long	224
	.quad	..L88
	.long	28
	.long	243
	.quad	..L89
	.long	28
	.long	262
	.quad	..L90
	.long	28
	.long	281
	.quad	..L91
	.long	28
	.long	300
	.quad	..L92
	.long	28
	.long	314
	.quad	..L108
	.long	28
	.long	330
	.quad	..L109
	.long	28
	.long	349
..L114:
	.long	1769238639
	.long	1635412333
	.long	1852795252
	.long	1885696607
	.long	1601466991
	.long	1936876918
	.long	7237481
	.long	1769238639
	.long	1635412333
	.long	1852795252
	.long	1885696607
	.long	7631471
..L115:
	.long	42078211
	.long	-2139090929
	.long	-2055176064
	.long	-2139062144
	.long	1082163632
	.long	-2004873201
	.long	-2139062144
	.long	-2139062144
	.long	1082163632
	.long	-2139090929
	.long	-2139062144
	.long	-2139062144
	.long	1082163632
	.long	-2139090929
	.long	-2139062144
	.long	-2139062144
	.long	1082163632
	.long	-2139090929
	.long	-2055176064
	.long	-2139062144
	.long	1082163632
	.long	-2004873201
	.long	-2139062144
	.long	-2139062144
	.long	1082163632
	.long	-2139090929
	.long	-2139062144
	.long	-2139062144
	.long	1082163632
	.long	-2139090926
	.long	-1988066936
	.long	-2071953280
	.long	-926515072
	.long	302177188
	.long	-2004844528
	.long	-2138472319
	.long	-2105376640
	.long	-1530345856
	.long	269615835
	.long	-2121760640
	.long	-2139062144
	.long	-1199404416
	.long	-542848894
	.long	-2146430462
	.long	-2138994560
	.long	-2139062144
	.long	-2101837688
	.long	48211144
	.long	-2139090929
	.long	-2055175544
	.long	-2139062144
	.long	1082163344
	.long	-2004873201
	.long	-2139061624
	.long	-2139062144
	.long	1082163344
	.long	-2139090926
	.long	-2055176064
	.long	-2071953280
	.long	-929726336
	.long	302160260
	.long	-2139062256
	.long	-2138734464
	.long	-2105376640
	.long	-2067229312
	.long	269615769
	.long	-2139062144
	.long	-2139062144
	.long	-796751232
	.long	-1685796903
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-640647032
	.long	43746503
	.long	-2105536499
	.long	-2139062144
	.long	-2139062144
	.long	269420488
	.long	-2139062144
	.long	-2139062144
	.long	-2119139200
	.long	269631616
	.long	-2139062144
	.long	-2139060864
	.long	-1333624192
	.long	-624637964
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-1128166264
	.long	48276167
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
.debug_info_seg:
	.4byte 0x000002af
	.2byte 0x0003
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.4byte .debug_str
//	DW_AT_name:
	.4byte .debug_str+0x37
//	DW_AT_producer:
	.4byte .debug_str+0x7c
	.4byte .debug_str+0xe8
//	DW_AT_language:
	.byte 0x01
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN0
//	DW_AT_high_pc:
	.8byte ..LNconserve_interp.917
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_subprogram:
	.byte 0x02
//	DW_AT_decl_line:
	.byte 0x3a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4b4
	.4byte .debug_str+0x4b4
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNcubic_spline.568
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x3a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_name:
	.4byte .debug_str+0x4c1
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x3a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_name:
	.4byte .debug_str+0x4c7
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x3a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x4d4
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x3a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x4da
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x3a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x4e0
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x3b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000165
//	DW_AT_name:
	.4byte .debug_str+0x4e6
//	DW_AT_location:
	.2byte 0x5901
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x3b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_AT_name:
	.4byte 0x00317079
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x3b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_AT_name:
	.4byte 0x006e7079
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3279
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00000165
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0075
//	DW_AT_type:
	.4byte 0x00000165
//	DW_AT_location:
	.2byte 0x5b01
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0070
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00676973
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6e71
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_AT_location:
	.2byte 0x6b01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6e75
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_AT_location:
	.2byte 0x6501
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0068
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0061
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_AT_location:
	.2byte 0x6d01
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0062
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_AT_location:
	.2byte 0x6e01
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006b
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_TAG_variable:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_location:
	.2byte 0x5001
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006f6c6b
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x3f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x0069686b
//	DW_AT_type:
	.4byte 0x0000014d
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x07
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x00000159
//	DW_TAG_const_type:
	.byte 0x09
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_TAG_base_type:
	.byte 0x0a
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x4cd
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x0000015e
//	DW_TAG_base_type:
	.byte 0x0a
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x4ec
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x00000176
//	DW_TAG_base_type:
	.byte 0x0a
//	DW_AT_byte_size:
	.byte 0x00
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x4fa
//	DW_TAG_subprogram:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x90
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4ff
	.4byte .debug_str+0x4ff
//	DW_AT_frame_base:
	.2byte 0x7702
	.byte 0x00
//	DW_AT_low_pc:
	.8byte ..L73
//	DW_AT_high_pc:
	.8byte ..LNconserve_interp.917
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x90
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_name:
	.4byte .debug_str+0x50f
//	DW_AT_location:
	.4byte 0x00c09103
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x90
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_name:
	.4byte .debug_str+0x516
//	DW_AT_location:
	.4byte 0x00c89103
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x90
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_name:
	.4byte .debug_str+0x51d
//	DW_AT_location:
	.4byte 0x00d09103
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x90
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_AT_name:
	.4byte .debug_str+0x524
//	DW_AT_location:
	.4byte 0x00d89103
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x90
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x510
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x91
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x517
//	DW_AT_location:
	.2byte 0x5901
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x91
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x51e
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x10
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x91
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x525
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x18
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x92
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x52b
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x20
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x92
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000154
//	DW_AT_name:
	.4byte .debug_str+0x534
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x28
//	DW_TAG_formal_parameter:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x92
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000165
//	DW_AT_name:
	.4byte .debug_str+0x53d
//	DW_AT_location:
	.2byte 0x7602
	.byte 0x30
//	DW_TAG_variable:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x94
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_TAG_variable:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x94
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x546
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_TAG_variable:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x54d
//	DW_AT_type:
	.4byte 0x000002a3
//	DW_TAG_variable:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x556
//	DW_AT_type:
	.4byte 0x000002a3
//	DW_TAG_variable:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x55f
//	DW_AT_type:
	.4byte 0x000002a3
//	DW_AT_location:
	.2byte 0x5f01
//	DW_TAG_variable:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x568
//	DW_AT_type:
	.4byte 0x000002a3
//	DW_AT_location:
	.2byte 0x5d01
//	DW_TAG_variable:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x96
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x571
//	DW_AT_type:
	.4byte 0x00000165
//	DW_AT_location:
	.2byte 0x5e01
//	DW_TAG_variable:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x96
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x57c
//	DW_AT_type:
	.4byte 0x00000165
//	DW_TAG_variable:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x96
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x585
//	DW_AT_type:
	.4byte 0x00000165
//	DW_AT_location:
	.2byte 0x5301
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x0000014d
//	DW_TAG_pointer_type:
	.byte 0x08
//	DW_AT_type:
	.4byte 0x000002ad
//	DW_TAG_const_type:
	.byte 0x09
//	DW_AT_type:
	.4byte 0x0000014d
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_line
	.section .debug_line
.debug_line_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_abbrev
	.section .debug_abbrev
.debug_abbrev_seg:
	.align 1
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x1b
	.byte 0x0e
	.byte 0x03
	.byte 0x0e
	.byte 0x25
	.byte 0x0e
	.2byte 0x7681
	.byte 0x0e
	.byte 0x13
	.byte 0x0b
	.byte 0x53
	.byte 0x0c
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x10
	.byte 0x06
	.2byte 0x0000
	.byte 0x02
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x03
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x04
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x05
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x06
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x07
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x08
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x09
	.byte 0x26
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x0a
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x0b
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x40
	.byte 0x0a
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x0c
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x0d
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_frame
	.section .debug_frame
.debug_frame_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_str
	.section .debug_str,"MS",@progbits,1
.debug_str_seg:
	.align 1
	.8byte 0x4d432f656d6f682f
	.8byte 0x656a6172702f5049
	.8byte 0x4d5449492f687365
	.8byte 0x732f32764d53452d
	.8byte 0x70346d6f6d2f6372
	.8byte 0x6c2f636578652f31
	.4byte 0x665f6269
	.2byte 0x736d
	.byte 0x00
	.8byte 0x4d432f656d6f682f
	.8byte 0x656a6172702f5049
	.8byte 0x4d5449492f687365
	.8byte 0x732f32764d53452d
	.8byte 0x70346d6f6d2f6372
	.8byte 0x68732f6372732f31
	.8byte 0x736f6d2f64657261
	.8byte 0x65746e692f636961
	.4byte 0x632e7072
	.byte 0x00
	.8byte 0x2952286c65746e49
	.8byte 0x6c65746e49204320
	.8byte 0x4320343620295228
	.8byte 0x2072656c69706d6f
	.8byte 0x6c70706120726f66
	.8byte 0x736e6f6974616369
	.8byte 0x676e696e6e757220
	.8byte 0x65746e49206e6f20
	.8byte 0x2c3436202952286c
	.8byte 0x6e6f697372655620
	.8byte 0x2e332e302e363120
	.8byte 0x6c69754220303132
	.8byte 0x3430363130322064
	.4byte 0x000a3531
	.8byte 0x2f656d6f682f492d
	.8byte 0x6172702f50494d43
	.8byte 0x49492f687365656a
	.8byte 0x32764d53452d4d54
	.8byte 0x6d6f6d2f6372732f
	.8byte 0x2f6372732f317034
	.8byte 0x6d2f646572616873
	.8byte 0x492d20636961736f
	.8byte 0x6172632f74706f2f
	.8byte 0x62696c2f65702f79
	.8byte 0x302e37312f696373
	.8byte 0x45544e492f312e39
	.8byte 0x782f302e36312f4c
	.8byte 0x6e692f34365f3638
	.8byte 0x492d206564756c63
	.8byte 0x6172632f74706f2f
	.8byte 0x74656e2f65702f79
	.8byte 0x2e342e342f666463
	.8byte 0x4e492f332e312e31
	.8byte 0x302e36312f4c4554
	.8byte 0x6564756c636e692f
	.8byte 0x2f74706f2f492d20
	.8byte 0x2f65702f79617263
	.8byte 0x2e362e372f74706d
	.8byte 0x706d2f696e672f33
	.8byte 0x65746e692d686369
	.8byte 0x692f302e36312f6c
	.8byte 0x2d206564756c636e
	.8byte 0x72632f74706f2f49
	.8byte 0x64682f65702f7961
	.8byte 0x2e30312e312f3566
	.8byte 0x45544e492f332e30
	.8byte 0x692f302e36312f4c
	.8byte 0x2d206564756c636e
	.8byte 0x72632f74706f2f49
	.8byte 0x322f6163722f7961
	.8byte 0x2e362d31312e322e
	.8byte 0x33315f302e342e30
	.8byte 0x643438675f5f322e
	.8byte 0x6972612e61373665
	.8byte 0x6564756c636e692f
	.8byte 0x2f74706f2f492d20
	.8byte 0x706c612f79617263
	.8byte 0x2d332e342e362f73
	.8byte 0x5f312e342e302e36
	.8byte 0x3239675f5f312e32
	.8byte 0x72612e3063663261
	.8byte 0x64756c636e692f69
	.8byte 0x74706f2f492d2065
	.8byte 0x70782f796172632f
	.8byte 0x2e322e322f6d656d
	.8byte 0x2e342e302e362d32
	.8byte 0x5f5f312e38315f31
	.8byte 0x3533353062333467
	.8byte 0x636e692f6972612e
	.8byte 0x2f492d206564756c
	.8byte 0x796172632f74706f
	.8byte 0x6165682d696e672f
	.8byte 0x302e352f73726564
	.8byte 0x2e302e362d31312e
	.8byte 0x5f322e375f302e34
	.8byte 0x383936333137675f
	.8byte 0x6e692f6972612e38
	.8byte 0x492d206564756c63
	.8byte 0x6172632f74706f2f
	.8byte 0x696d702f65702f79
	.8byte 0x2f32312e302e352f
	.8byte 0x206564756c636e69
	.8byte 0x632f74706f2f492d
	.8byte 0x696e67752f796172
	.8byte 0x2d34312e302e362f
	.8byte 0x5f302e342e302e36
	.8byte 0x65675f5f312e3431
	.8byte 0x612e326134626437
	.8byte 0x756c636e692f6972
	.8byte 0x706f2f492d206564
	.8byte 0x752f796172632f74
	.8byte 0x332e322f67657264
	.8byte 0x342e302e362d322e
	.8byte 0x5f322e32315f302e
	.8byte 0x653363396632675f
	.8byte 0x6e692f6972612e65
	.8byte 0x492d206564756c63
	.8byte 0x6172632f74706f2f
	.8byte 0x65645f6d6c772f79
	.8byte 0x322e312f74636574
	.8byte 0x342e302e362d312e
	.8byte 0x5f312e32325f302e
	.8byte 0x643361363264675f
	.8byte 0x6e692f6972612e63
	.8byte 0x492d206564756c63
	.8byte 0x6172632f74706f2f
	.8byte 0x322f6163726b2f79
	.8byte 0x302e362d322e322e
	.8byte 0x2e38315f312e342e
	.8byte 0x34313634675f5f33
	.8byte 0x2f6972612e336663
	.8byte 0x206564756c636e69
	.8byte 0x632f74706f2f492d
	.8byte 0x2d7373682d796172
	.8byte 0x2e382f6c65766564
	.8byte 0x6c636e692f302e30
	.8byte 0x4f43782d20656475
	.8byte 0x20325856412d4552
	.8byte 0x594152435f5f442d
	.8byte 0x435f5f442d204358
	.8byte 0x414f52425f594152
	.8byte 0x442d204c4c455744
	.8byte 0x5458594152435f5f
	.8byte 0x455455504d4f435f
	.8byte 0x545f58554e494c5f
	.8byte 0x442d205445475241
	.8byte 0x4374656e5f657375
	.8byte 0x7375442d20344644
	.8byte 0x49504d62696c5f65
	.8byte 0x4c42414e45442d20
	.8byte 0x442d2041444f5f45
	.8byte 0x4145434f5f455355
	.8byte 0x672d204347425f4e
	.8byte 0x61732d20334f2d20
	.8byte 0x73706d65742d6576
	.4byte 0x00632d20
	.8byte 0x70735f6369627563
	.4byte 0x656e696c
	.byte 0x00
	.4byte 0x657a6973
	.2byte 0x0031
	.4byte 0x657a6973
	.2byte 0x0032
	.4byte 0x62756f64
	.2byte 0x656c
	.byte 0x00
	.4byte 0x64697267
	.2byte 0x0031
	.4byte 0x64697267
	.2byte 0x0032
	.4byte 0x61746164
	.2byte 0x0031
	.4byte 0x61746164
	.2byte 0x0032
	.8byte 0x64656e6769736e75
	.4byte 0x6e6f6c20
	.2byte 0x0067
	.4byte 0x64696f76
	.byte 0x00
	.8byte 0x65767265736e6f63
	.8byte 0x00707265746e695f
	.4byte 0x735f786e
	.2byte 0x6372
	.byte 0x00
	.4byte 0x735f796e
	.2byte 0x6372
	.byte 0x00
	.4byte 0x645f786e
	.2byte 0x7473
	.byte 0x00
	.4byte 0x645f796e
	.2byte 0x7473
	.byte 0x00
	.8byte 0x6372735f6b73616d
	.byte 0x00
	.8byte 0x6372735f61746164
	.byte 0x00
	.8byte 0x7473645f61746164
	.byte 0x00
	.4byte 0x7267786e
	.2byte 0x6469
	.byte 0x00
	.8byte 0x31695f6469726778
	.byte 0x00
	.8byte 0x316a5f6469726778
	.byte 0x00
	.8byte 0x32695f6469726778
	.byte 0x00
	.8byte 0x326a5f6469726778
	.byte 0x00
	.8byte 0x72615f6469726778
	.2byte 0x6165
	.byte 0x00
	.8byte 0x616572615f747364
	.byte 0x00
	.8byte 0x6172665f61657261
	.2byte 0x0063
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.section .text
.LNDBG_TXe:
# End
