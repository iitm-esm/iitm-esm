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
	.file "mosaic_util.c"
	.text
..TXTST0:
.L_2__routine_start_nearest_index_0:
# -- Begin  nearest_index
	.text
# mark_begin;
       .align    16,0x90
	.globl nearest_index
# --- nearest_index(double, const double *, int)
nearest_index:
# parameter 1(value): %xmm0
# parameter 2(array): %rdi
# parameter 3(ia): %esi
..B1.1:                         # Preds ..B1.0
	.cfi_startproc
..___tag_value_nearest_index.2:
..L3:
                                                          #74.1
..LN0:
	.file   1 "/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c"
	.loc    1  74  is_stmt 1
        subq      $56, %rsp                                     #74.1
	.cfi_def_cfa_offset 64
..LN1:
	.loc    1  78  prologue_end  is_stmt 1
        movl      $1, %edx                                      #78.7
..LN2:
	.loc    1  74  is_stmt 1
        movslq    %esi, %rcx                                    #74.1
..LN3:
        vmovapd   %xmm0, %xmm1                                  #74.1
..LN4:
	.loc    1  78  is_stmt 1
        cmpq      $1, %rcx                                      #78.14
..LN5:
        jle       ..B1.6        # Prob 10%                      #78.14
..LN6:
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 eax esi xmm1
..B1.2:                         # Preds ..B1.1
..LN7:
        vmovsd    %xmm1, (%rsp)                                 #
..LN8:
        movq      %r13, 8(%rsp)                                 #
	.cfi_offset 13, -56
..LN9:
        movq      %rdx, %r13                                    #
..LN10:
        movq      %r14, 16(%rsp)                                #
	.cfi_offset 14, -48
..LN11:
        movq      %rdi, %r14                                    #
..LN12:
        movq      %r15, 24(%rsp)                                #
	.cfi_offset 15, -40
..LN13:
        movq      %rcx, %r15                                    #
..LN14:
        movq      %rbx, 32(%rsp)                                #
	.cfi_offset 3, -32
..LN15:
        movl      %eax, %ebx                                    #
..LN16:
        movq      %rbp, 40(%rsp)                                #
	.cfi_offset 6, -24
..LN17:
        movl      %esi, %ebp                                    #
..LN18:
                                # LOE r12 r13 r14 r15 ebx ebp
..B1.3:                         # Preds ..B1.4 ..B1.2
..L11:          # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN19:
	.loc    1  79  is_stmt 1
        vmovsd    -8(%r14,%r13,8), %xmm0                        #79.20
..LN20:
        vcomisd   (%r14,%r13,8), %xmm0                          #79.20
..LN21:
        ja        ..B1.17       # Prob 5%                       #79.20
..LN22:
                                # LOE r12 r13 r14 r15 ebx ebp
..B1.4:                         # Preds ..B1.18 ..B1.3
..LN23:
	.loc    1  78  is_stmt 1
        incq      %r13                                          #78.18
..LN24:
        cmpq      %r15, %r13                                    #78.14
..LN25:
        jl        ..B1.3        # Prob 82%                      #78.14
..LN26:
                                # LOE r12 r13 r14 r15 ebx ebp
..B1.5:                         # Preds ..B1.4
..LN27:
        vmovsd    (%rsp), %xmm1                                 #
..LN28:
        movl      %ebx, %eax                                    #
..LN29:
        movq      8(%rsp), %r13                                 #
	.cfi_restore 13
..LN30:
        movl      %ebp, %esi                                    #
..LN31:
        movq      32(%rsp), %rbx                                #
	.cfi_restore 3
..LN32:
        movq      %r14, %rdi                                    #
..LN33:
        movq      16(%rsp), %r14                                #
	.cfi_restore 14
..LN34:
        movq      %r15, %rcx                                    #
..LN35:
        movq      24(%rsp), %r15                                #
	.cfi_restore 15
..LN36:
        movq      40(%rsp), %rbp                                #
	.cfi_restore 6
..LN37:
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax esi xmm1
..B1.6:                         # Preds ..B1.1 ..B1.5
..LN38:
	.loc    1  82  is_stmt 1
        vmovsd    (%rdi), %xmm0                                 #82.15
..LN39:
        vcomisd   %xmm1, %xmm0                                  #82.15
..LN40:
        jbe       ..B1.8        # Prob 50%                      #82.15
..LN41:
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax esi xmm1
..B1.7:                         # Preds ..B1.6
..LN42:
	.loc    1  83  is_stmt 1
        xorl      %eax, %eax                                    #83.5
..LN43:
        jmp       ..B1.16       # Prob 100%                     #83.5
..LN44:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.8:                         # Preds ..B1.6
..LN45:
	.loc    1  84  is_stmt 1
        vcomisd   -8(%rdi,%rcx,8), %xmm1                        #84.21
..LN46:
        jbe       ..B1.10       # Prob 50%                      #84.21
..LN47:
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 eax esi xmm1
..B1.9:                         # Preds ..B1.8
..LN48:
	.loc    1  85  is_stmt 1
        lea       -1(%rsi), %eax                                #85.16
..LN49:
        jmp       ..B1.16       # Prob 100%                     #85.16
..LN50:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.10:                        # Preds ..B1.8
..LN51:
	.loc    1  88  is_stmt 1
        xorl      %edx, %edx                                    #88.7
..LN52:
	.loc    1  90  is_stmt 1
        testq     %rcx, %rcx                                    #90.18
..LN53:
        jle       ..B1.16       # Prob 10%                      #90.18
..LN54:
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 eax xmm1
..B1.12:                        # Preds ..B1.10 ..B1.14
..LN55:
	.loc    1  91  is_stmt 1
        incq      %rdx                                          #91.8
..LN56:
	.loc    1  92  is_stmt 1
        vmovsd    (%rdi,%rdx,8), %xmm0                          #92.15
..LN57:
        vcomisd   %xmm1, %xmm0                                  #92.15
..LN58:
        jb        ..B1.14       # Prob 50%                      #92.15
..LN59:
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 eax xmm0 xmm1
..B1.13:                        # Preds ..B1.12
..LN60:
	.loc    1  94  is_stmt 1
        movl      %edx, %eax                                    #94.43
..LN61:
        vsubsd    %xmm1, %xmm0, %xmm0                           #94.17
..LN62:
        vsubsd    -8(%rdi,%rdx,8), %xmm1, %xmm1                 #94.31
..LN63:
	.loc    1  93  is_stmt 1
        vcomisd   %xmm1, %xmm0                                  #93.4
..LN64:
	.loc    1  94  is_stmt 1
        lea       -1(%rax), %edx                                #94.53
..LN65:
	.loc    1  93  is_stmt 1
        cmova     %edx, %eax                                    #93.4
..LN66:
        jmp       ..B1.16       # Prob 100%                     #93.4
..LN67:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B1.14:                        # Preds ..B1.12
..LN68:
	.loc    1  90  is_stmt 1
        cmpq      %rcx, %rdx                                    #90.18
..LN69:
        jl        ..B1.12       # Prob 82%                      #90.18
..LN70:
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 eax xmm1
..B1.16:                        # Preds ..B1.14 ..B1.13 ..B1.7 ..B1.9 ..B1.10
                                #      
..LN71:
	.loc    1  99  epilogue_begin  is_stmt 1
        addq      $56, %rsp                                     #99.10
	.cfi_def_cfa_offset 8
..LN72:
        ret                                                     #99.10
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 13, -56
	.cfi_offset 14, -48
	.cfi_offset 15, -40
..LN73:
                                # LOE
..B1.17:                        # Preds ..B1.3                  # Infreq
..LN74:
	.loc    1  50  is_stmt 1
        movl      $.L_2__STRING.0, %esi                         #50.3
..LN75:
        movl      $.L_2__STRING.1, %edx                         #50.3
..LN76:
        xorl      %eax, %eax                                    #50.3
..LN77:
        movq      stderr(%rip), %rdi                            #50.3
..LN78:
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #50.3
..LN79:
                                # LOE r12 r13 r14 r15 ebx ebp
..B1.18:                        # Preds ..B1.17                 # Infreq
..LN80:
	.loc    1  52  is_stmt 1
        movl      $1140850688, %edi                             #52.3
..LN81:
        movl      $-1, %esi                                     #52.3
..___tag_value_nearest_index.25:
..LN82:
#       MPI_Abort(MPI_Comm, int)
        call      MPI_Abort                                     #52.3
..___tag_value_nearest_index.26:
..LN83:
        jmp       ..B1.4        # Prob 100%                     #52.3
..LN84:
        .align    16,0x90
	.cfi_endproc
..LN85:
                                # LOE r12 r13 r14 r15 ebx ebp
..LN86:
# mark_end;
	.type	nearest_index,@function
	.size	nearest_index,.-nearest_index
..LNnearest_index.87:
.LNnearest_index:
	.data
# -- End  nearest_index
	.text
.L_2__routine_start_tokenize_1:
# -- Begin  tokenize
	.text
# mark_begin;
       .align    16,0x90
	.globl tokenize
# --- tokenize(const char *const, const char *, unsigned int, unsigned int, char *, unsigned int *const)
tokenize:
# parameter 1(string): %rdi
# parameter 2(tokens): %rsi
# parameter 3(varlen): %edx
# parameter 4(maxvar): %ecx
# parameter 5(pstring): %r8
# parameter 6(nstr): %r9
..B2.1:                         # Preds ..B2.0
	.cfi_startproc
..___tag_value_tokenize.30:
..L31:
                                                         #107.1
..LN88:
	.loc    1  107  is_stmt 1
        pushq     %r12                                          #107.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN89:
        pushq     %r13                                          #107.1
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
..LN90:
        pushq     %r14                                          #107.1
	.cfi_def_cfa_offset 32
	.cfi_offset 14, -32
..LN91:
        pushq     %r15                                          #107.1
	.cfi_def_cfa_offset 40
	.cfi_offset 15, -40
..LN92:
        pushq     %rbx                                          #107.1
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
..LN93:
        pushq     %rbp                                          #107.1
	.cfi_def_cfa_offset 56
	.cfi_offset 6, -56
..LN94:
        subq      $56, %rsp                                     #107.1
	.cfi_def_cfa_offset 112
..LN95:
        movq      %rdi, %r14                                    #107.1
..LN96:
        movl      %edx, %r15d                                   #107.1
..LN97:
	.loc    1  111  prologue_end  is_stmt 1
        xorl      %r12d, %r12d                                  #111.3
..LN98:
	.loc    1  107  is_stmt 1
        movq      %r9, %rbx                                     #107.1
..LN99:
	.loc    1  112  is_stmt 1
        movq      %r14, %rdx                                    #112.9
..LN100:
	.loc    1  107  is_stmt 1
        movl      %ecx, %ecx                                    #107.1
..LN101:
        movq      %r8, %r13                                     #107.1
..LN102:
        movq      %rcx, 40(%rsp)                                #107.1
..LN103:
        movq      %rsi, %r8                                     #107.1
..LN104:
	.loc    1  111  is_stmt 1
        xorl      %ebp, %ebp                                    #111.13
..LN105:
	.loc    1  112  is_stmt 1
        movq      %rdx, %rcx                                    #112.9
..LN106:
        andq      $-16, %rdx                                    #112.9
..LN107:
        vpxor     %xmm0, %xmm0, %xmm0                           #112.9
..LN108:
        vpcmpeqb  (%rdx), %xmm0, %xmm0                          #112.9
..LN109:
        vpmovmskb %xmm0, %eax                                   #112.9
..LN110:
        andl      $15, %ecx                                     #112.9
..LN111:
        shrl      %cl, %eax                                     #112.9
..LN112:
        bsf       %eax, %eax                                    #112.9
..LN113:
        jne       ..L46         # Prob 60%                      #112.9
..LN114:
        movq      %rdx, %rax                                    #112.9
..LN115:
        addq      %rcx, %rdx                                    #112.9
..LN116:
        call      __intel_sse4_strlen                           #112.9
..L46:                                                          #
..LN117:
                                # LOE rax rbx rbp r8 r12 r13 r14 r15
..B2.28:                        # Preds ..B2.1
..LN118:
	.loc    1  113  is_stmt 1
        movq      %r8, %rdx                                     #113.12
..LN119:
	.loc    1  112  is_stmt 1
        movq      %rax, %r9                                     #112.9
..LN120:
	.loc    1  113  is_stmt 1
        movq      %rdx, %rcx                                    #113.12
..LN121:
        andq      $-16, %rdx                                    #113.12
..LN122:
        vpxor     %xmm0, %xmm0, %xmm0                           #113.12
..LN123:
        vpcmpeqb  (%rdx), %xmm0, %xmm0                          #113.12
..LN124:
        vpmovmskb %xmm0, %eax                                   #113.12
..LN125:
        andl      $15, %ecx                                     #113.12
..LN126:
        shrl      %cl, %eax                                     #113.12
..LN127:
        bsf       %eax, %eax                                    #113.12
..LN128:
        jne       ..L47         # Prob 60%                      #113.12
..LN129:
        movq      %rdx, %rax                                    #113.12
..LN130:
        addq      %rcx, %rdx                                    #113.12
..LN131:
        call      __intel_sse4_strlen                           #113.12
..L47:                                                          #
..LN132:
                                # LOE rax rbx rbp r8 r9 r12 r13 r14 r15
..B2.27:                        # Preds ..B2.28
..LN133:
        movq      %rax, %r10                                    #113.12
..LN134:
	.loc    1  111  is_stmt 1
        xorl      %ecx, %ecx                                    #111.10
..LN135:
	.loc    1  115  is_stmt 1
        cmpb      $0, (%r14)                                    #115.19
..LN136:
        je        ..B2.23       # Prob 5%                       #115.19
..LN137:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.2:                         # Preds ..B2.30 ..B2.27
..LN138:
	.loc    1  117  is_stmt 1
        xorl      %eax, %eax                                    #117.7
..LN139:
	.loc    1  128  is_stmt 1
        movq      %r13, %r11                                    #128.6
..LN140:
	.loc    1  117  is_stmt 1
        testq     %r9, %r9                                      #117.18
..LN141:
        jbe       ..B2.14       # Prob 10%                      #117.18
..LN142:
                                # LOE rax rcx rbx rbp r8 r9 r10 r11 r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
..LN143:
        movq      %r8, 48(%rsp)                                 #
..LN144:
        movq      %r14, %r8                                     #
..LN145:
        movq      %rbx, 32(%rsp)                                #
..LN146:
        movq      %r13, %r14                                    #
..LN147:
        movq      %rax, %r13                                    #
..LN148:
        movq      %rcx, %rbx                                    #
..LN149:
        movq      %r11, %rcx                                    #
..LN150:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.4:                         # Preds ..B2.3 ..B2.12
..L48:          # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN151:
	.loc    1  118  is_stmt 1
        movb      (%r8), %al                                    #118.8
..LN152:
        cmpb      $32, %al                                      #118.21
..LN153:
        je        ..B2.12       # Prob 16%                      #118.21
..LN154:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15 al
..B2.5:                         # Preds ..B2.4
..LN155:
        cmpb      $9, %al                                       #118.41
..LN156:
        je        ..B2.12       # Prob 16%                      #118.41
..LN157:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15 al
..B2.6:                         # Preds ..B2.5
..LN158:
	.loc    1  120  is_stmt 1
        xorl      %edi, %edi                                    #120.11
..LN159:
        testq     %r10, %r10                                    #120.18
..LN160:
        jbe       ..B2.11       # Prob 10%                      #120.18
..LN161:
                                # LOE rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 al
..B2.7:                         # Preds ..B2.6
..LN162:
	.loc    1  121  is_stmt 1
        movb      (%r8), %sil                                   #121.5
..LN163:
        movq      48(%rsp), %rdx                                #121.5
..LN164:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 al sil
..B2.8:                         # Preds ..B2.9 ..B2.7
..L49:          # optimization report
                # %s was not vectorized: loop with multiple exits cannot be vectorized unless it meets search loop idiom criteria
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN165:
        cmpb      (%rdi,%rdx), %sil                             #121.18
..LN166:
        je        ..B2.17       # Prob 20%                      #121.18
..LN167:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 al sil
..B2.9:                         # Preds ..B2.8
..LN168:
	.loc    1  120  is_stmt 1
        incq      %rdi                                          #120.26
..LN169:
        cmpq      %r10, %rdi                                    #120.18
..LN170:
        jb        ..B2.8        # Prob 82%                      #120.18
..LN171:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 al sil
..B2.11:                        # Preds ..B2.9 ..B2.6
..LN172:
	.loc    1  134  is_stmt 1
        movb      %al, (%rcx,%rbp)                              #134.11
..LN173:
        incq      %rbp                                          #134.35
..LN174:
	.loc    1  135  is_stmt 1
        cmpq      %r15, %rbp                                    #135.17
..LN175:
        jae       ..B2.15       # Prob 5%                       #135.17
..LN176:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.12:                        # Preds ..B2.22 ..B2.19 ..B2.17 ..B2.29 ..B2.11
                                #       ..B2.5 ..B2.4
..LN177:
	.loc    1  117  is_stmt 1
        incq      %r13                                          #117.23
..LN178:
        incq      %r8                                           #117.23
..LN179:
        cmpq      %r9, %r13                                     #117.18
..LN180:
        jb        ..B2.4        # Prob 82%                      #117.18
..LN181:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.13:                        # Preds ..B2.12
..LN182:
        movq      32(%rsp), %rbx                                #
..LN183:
        movq      %rcx, %r11                                    #
..LN184:
                                # LOE rbx rbp r11 r12
..B2.14:                        # Preds ..B2.2 ..B2.13
..LN185:
	.loc    1  141  is_stmt 1
        incq      %r12                                          #141.13
..LN186:
	.loc    1  139  is_stmt 1
        movb      $0, (%r11,%rbp)                               #139.5
..LN187:
	.loc    1  141  is_stmt 1
        movl      %r12d, (%rbx)                                 #141.4
..LN188:
	.loc    1  143  epilogue_begin  is_stmt 1
        addq      $56, %rsp                                     #143.1
	.cfi_def_cfa_offset 56
	.cfi_restore 6
..LN189:
        popq      %rbp                                          #143.1
	.cfi_def_cfa_offset 48
	.cfi_restore 3
..LN190:
        popq      %rbx                                          #143.1
	.cfi_def_cfa_offset 40
	.cfi_restore 15
..LN191:
        popq      %r15                                          #143.1
	.cfi_def_cfa_offset 32
	.cfi_restore 14
..LN192:
        popq      %r14                                          #143.1
	.cfi_def_cfa_offset 24
	.cfi_restore 13
..LN193:
        popq      %r13                                          #143.1
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN194:
        popq      %r12                                          #143.1
	.cfi_def_cfa_offset 8
..LN195:
        ret                                                     #143.1
	.cfi_def_cfa_offset 112
	.cfi_offset 3, -48
	.cfi_offset 6, -56
	.cfi_offset 12, -16
	.cfi_offset 13, -24
	.cfi_offset 14, -32
	.cfi_offset 15, -40
..LN196:
                                # LOE
..B2.15:                        # Preds ..B2.11                 # Infreq
..LN197:
	.loc    1  50  is_stmt 1
        movl      $.L_2__STRING.0, %esi                         #50.3
..LN198:
        movl      $.L_2__STRING.4, %edx                         #50.3
..LN199:
        xorl      %eax, %eax                                    #50.3
..LN200:
        movq      stderr(%rip), %rdi                            #50.3
..LN201:
        movq      %rcx, (%rsp)                                  #50.3
..LN202:
        movq      %r8, 24(%rsp)                                 #50.3
..LN203:
        movq      %r10, 8(%rsp)                                 #50.3
..LN204:
        movq      %r9, 16(%rsp)                                 #50.3
..LN205:
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #50.3
..LN206:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.16:                        # Preds ..B2.15                 # Infreq
..LN207:
	.loc    1  52  is_stmt 1
        movl      $1140850688, %edi                             #52.3
..LN208:
        movl      $-1, %esi                                     #52.3
..___tag_value_tokenize.71:
..LN209:
#       MPI_Abort(MPI_Comm, int)
        call      MPI_Abort                                     #52.3
..___tag_value_tokenize.72:
..LN210:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.29:                        # Preds ..B2.16                 # Infreq
..LN211:
        movq      16(%rsp), %r9                                 #
..LN212:
        movq      8(%rsp), %r10                                 #
..LN213:
        movq      24(%rsp), %r8                                 #
..LN214:
        movq      (%rsp), %rcx                                  #
..LN215:
        jmp       ..B2.12       # Prob 100%                     #
..LN216:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.17:                        # Preds ..B2.8                  # Infreq
..LN217:
	.loc    1  127  is_stmt 1
        testq     %rbp, %rbp                                    #127.11
..LN218:
        je        ..B2.12       # Prob 38%                      #127.11
..LN219:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.18:                        # Preds ..B2.17                 # Infreq
..LN220:
	.loc    1  128  is_stmt 1
        incq      %r12                                          #128.17
..LN221:
        addq      %r15, %rbx                                    #128.17
..LN222:
        movb      $0, (%rcx,%rbp)                               #128.6
..LN223:
	.loc    1  129  is_stmt 1
        xorl      %ebp, %ebp                                    #129.4
..LN224:
	.loc    1  130  is_stmt 1
        cmpq      40(%rsp), %r12                                #130.15
..LN225:
        jae       ..B2.20       # Prob 5%                       #130.15
..LN226:
                                # LOE rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.19:                        # Preds ..B2.18                 # Infreq
..LN227:
	.loc    1  128  is_stmt 1
        lea       (%r14,%rbx), %rcx                             #128.6
..LN228:
        jmp       ..B2.12       # Prob 100%                     #128.6
..LN229:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.20:                        # Preds ..B2.18                 # Infreq
..LN230:
	.loc    1  50  is_stmt 1
        movl      $.L_2__STRING.0, %esi                         #50.3
..LN231:
        movl      $.L_2__STRING.3, %edx                         #50.3
..LN232:
        xorl      %eax, %eax                                    #50.3
..LN233:
        movq      stderr(%rip), %rdi                            #50.3
..LN234:
        movq      %r8, 24(%rsp)                                 #50.3
..LN235:
        movq      %r10, 8(%rsp)                                 #50.3
..LN236:
        movq      %r9, 16(%rsp)                                 #50.3
..LN237:
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #50.3
..LN238:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.21:                        # Preds ..B2.20                 # Infreq
..LN239:
	.loc    1  52  is_stmt 1
        movl      $1140850688, %edi                             #52.3
..LN240:
        movl      $-1, %esi                                     #52.3
..___tag_value_tokenize.73:
..LN241:
#       MPI_Abort(MPI_Comm, int)
        call      MPI_Abort                                     #52.3
..___tag_value_tokenize.74:
..LN242:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.22:                        # Preds ..B2.21                 # Infreq
..LN243:
        movq      16(%rsp), %r9                                 #
..LN244:
	.loc    1  128  is_stmt 1
        lea       (%r14,%rbx), %rcx                             #128.6
..LN245:
        movq      8(%rsp), %r10                                 #
..LN246:
        movq      24(%rsp), %r8                                 #
..LN247:
        jmp       ..B2.12       # Prob 100%                     #
..LN248:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..B2.23:                        # Preds ..B2.27                 # Infreq
..LN249:
	.loc    1  50  is_stmt 1
        movl      $.L_2__STRING.0, %esi                         #50.3
..LN250:
        movl      $.L_2__STRING.2, %edx                         #50.3
..LN251:
        xorl      %eax, %eax                                    #50.3
..LN252:
        movq      stderr(%rip), %rdi                            #50.3
..LN253:
        movq      %rcx, (%rsp)                                  #50.3
..LN254:
        movq      %r10, 8(%rsp)                                 #50.3
..LN255:
        movq      %r9, 16(%rsp)                                 #50.3
..LN256:
        movq      %r8, 48(%rsp)                                 #50.3
..LN257:
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #50.3
..LN258:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.24:                        # Preds ..B2.23                 # Infreq
..LN259:
	.loc    1  52  is_stmt 1
        movl      $1140850688, %edi                             #52.3
..LN260:
        movl      $-1, %esi                                     #52.3
..___tag_value_tokenize.75:
..LN261:
#       MPI_Abort(MPI_Comm, int)
        call      MPI_Abort                                     #52.3
..___tag_value_tokenize.76:
..LN262:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.30:                        # Preds ..B2.24                 # Infreq
..LN263:
        movq      48(%rsp), %r8                                 #
..LN264:
        movq      16(%rsp), %r9                                 #
..LN265:
        movq      8(%rsp), %r10                                 #
..LN266:
        movq      (%rsp), %rcx                                  #
..LN267:
        jmp       ..B2.2        # Prob 100%                     #
..LN268:
        .align    16,0x90
	.cfi_endproc
..LN269:
                                # LOE rcx rbx rbp r8 r9 r10 r12 r13 r14 r15
..LN270:
# mark_end;
	.type	tokenize,@function
	.size	tokenize,.-tokenize
..LNtokenize.271:
.LNtokenize:
	.data
	.file   2 "/opt/intel/compilers_and_libraries_2016.3.210/linux/compiler/include/stddef.h"
# -- End  tokenize
	.text
.L_2__routine_start_maxval_double_2:
# -- Begin  maxval_double
	.text
# mark_begin;
       .align    16,0x90
	.globl maxval_double
# --- maxval_double(int, const double *)
maxval_double:
# parameter 1(size): %edi
# parameter 2(data): %rsi
..B3.1:                         # Preds ..B3.0
	.cfi_startproc
..___tag_value_maxval_double.81:
..L82:
                                                         #150.1
..LN272:
	.loc    1  150  prologue_end  is_stmt 1
..LN273:
	.loc    1  154  is_stmt 1
        vmovsd    (%rsi), %xmm0                                 #154.12
..LN274:
	.loc    1  155  is_stmt 1
        cmpl      $1, %edi                                      #155.14
..LN275:
        jle       ..B3.24       # Prob 50%                      #155.14
..LN276:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.2:                         # Preds ..B3.1
..LN277:
        decl      %edi                                          #155.3
..LN278:
        cmpl      $16, %edi                                     #155.3
..LN279:
        jl        ..B3.26       # Prob 10%                      #155.3
..LN280:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.3:                         # Preds ..B3.2
..LN281:
        cmpl      $29, %edi                                     #155.3
..LN282:
        jl        ..B3.28       # Prob 10%                      #155.3
..LN283:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.4:                         # Preds ..B3.3
..LN284:
	.loc    1  156  is_stmt 1
        lea       8(%rsi), %rdx                                 #156.9
..LN285:
	.loc    1  155  is_stmt 1
        andq      $31, %rdx                                     #155.3
..LN286:
        movl      %edx, %edx                                    #155.3
..LN287:
        testl     %edx, %edx                                    #155.3
..LN288:
        je        ..B3.7        # Prob 50%                      #155.3
..LN289:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.5:                         # Preds ..B3.4
..LN290:
        testb     $7, %dl                                       #155.3
..LN291:
        jne       ..B3.26       # Prob 10%                      #155.3
..LN292:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.6:                         # Preds ..B3.5
..LN293:
        negl      %edx                                          #155.3
..LN294:
        addl      $32, %edx                                     #155.3
..LN295:
        shrl      $3, %edx                                      #155.3
..LN296:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.7:                         # Preds ..B3.6 ..B3.4
..LN297:
        lea       16(%rdx), %eax                                #155.3
..LN298:
        cmpl      %eax, %edi                                    #155.3
..LN299:
        jl        ..B3.26       # Prob 10%                      #155.3
..LN300:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B3.8:                         # Preds ..B3.7
..LN301:
        movl      %edi, %eax                                    #155.3
..LN302:
        xorl      %ecx, %ecx                                    #155.3
..LN303:
        subl      %edx, %eax                                    #155.3
..LN304:
        andl      $15, %eax                                     #155.3
..LN305:
        negl      %eax                                          #155.3
..LN306:
        addl      %edi, %eax                                    #155.3
..LN307:
        testq     %rdx, %rdx                                    #155.3
..LN308:
        jbe       ..B3.12       # Prob 9%                       #155.3
..LN309:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B3.10:                        # Preds ..B3.8 ..B3.10
..L84:          # optimization report
                # LOOP WAS UNROLLED BY 4
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 5.433594
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 1.500000
..LN310:
	.loc    1  156  is_stmt 1
        vmovapd   %xmm0, %xmm2                                  #156.5
..LN311:
        vmovsd    8(%rsi,%rcx,8), %xmm1                         #156.9
..LN312:
	.loc    1  155  is_stmt 1
        incq      %rcx                                          #155.3
..LN313:
	.loc    1  156  is_stmt 1
        vmovapd   %xmm1, %xmm0                                  #156.5
..LN314:
        vcomisd   %xmm2, %xmm0                                  #156.5
..LN315:
        ja        ..L85         # Prob 50%                      #156.5
..LN316:
        vmovaps   %xmm2, %xmm0                                  #156.5
..L85:                                                          #
..LN317:
	.loc    1  155  is_stmt 1
        cmpq      %rdx, %rcx                                    #155.3
..LN318:
        jb        ..B3.10       # Prob 82%                      #155.3
..LN319:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B3.12:                        # Preds ..B3.10 ..B3.8 ..B3.28
..LN320:
        movslq    %eax, %rcx                                    #155.3
..LN321:
	.loc    1  154  is_stmt 1
        vbroadcastsd %xmm0, %ymm0                               #154.3
..LN322:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi ymm0
..B3.13:                        # Preds ..B3.13 ..B3.12
..L86:          # optimization report
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 5.433594
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 1.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN323:
	.loc    1  156  is_stmt 1
        vmovupd   8(%rsi,%rdx,8), %ymm1                         #156.9
..LN324:
        vmovupd   72(%rsi,%rdx,8), %ymm3                        #156.9
..LN325:
        vmovupd   104(%rsi,%rdx,8), %ymm5                       #156.9
..LN326:
        vmaxpd    %ymm0, %ymm1, %ymm2                           #156.5
..LN327:
        vmovupd   40(%rsi,%rdx,8), %ymm0                        #156.9
..LN328:
        vmaxpd    %ymm2, %ymm0, %ymm4                           #156.5
..LN329:
	.loc    1  155  is_stmt 1
        addq      $16, %rdx                                     #155.3
..LN330:
	.loc    1  156  is_stmt 1
        vmaxpd    %ymm4, %ymm3, %ymm6                           #156.5
..LN331:
	.loc    1  155  is_stmt 1
        cmpq      %rcx, %rdx                                    #155.3
..LN332:
	.loc    1  156  is_stmt 1
        vmaxpd    %ymm6, %ymm5, %ymm0                           #156.5
..LN333:
	.loc    1  155  is_stmt 1
        jb        ..B3.13       # Prob 82%                      #155.3
..LN334:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi ymm0
..B3.14:                        # Preds ..B3.13
..LN335:
	.loc    1  154  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #154.3
..LN336:
        vmaxpd    %xmm1, %xmm0, %xmm2                           #154.3
..LN337:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #154.3
..LN338:
        vmaxsd    %xmm3, %xmm2, %xmm0                           #154.3
..LN339:
                                # LOE rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B3.15:                        # Preds ..B3.14 ..B3.26
..LN340:
	.loc    1  155  is_stmt 1
        lea       1(%rax), %edx                                 #155.3
..LN341:
        cmpl      %edx, %edi                                    #155.3
..LN342:
        jb        ..B3.24       # Prob 50%                      #155.3
..LN343:
                                # LOE rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B3.16:                        # Preds ..B3.15
..LN344:
        movslq    %edi, %rdi                                    #155.3
..LN345:
        movslq    %eax, %rax                                    #155.3
..LN346:
        subq      %rax, %rdi                                    #155.3
..LN347:
        cmpq      $4, %rdi                                      #155.3
..LN348:
        jl        ..B3.25       # Prob 10%                      #155.3
..LN349:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B3.17:                        # Preds ..B3.16
..LN350:
	.loc    1  156  is_stmt 1
        movslq    %eax, %rax                                    #156.9
..LN351:
	.loc    1  155  is_stmt 1
        movl      %edi, %edx                                    #155.3
..LN352:
        andl      $-4, %edx                                     #155.3
..LN353:
        xorl      %r8d, %r8d                                    #155.3
..LN354:
        movslq    %edx, %rdx                                    #155.3
..LN355:
	.loc    1  154  is_stmt 1
        vbroadcastsd %xmm0, %ymm0                               #154.3
..LN356:
	.loc    1  156  is_stmt 1
        lea       (%rsi,%rax,8), %rcx                           #156.9
..LN357:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax ymm0
..B3.18:                        # Preds ..B3.18 ..B3.17
..L87:          # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 1.753906
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 5.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN358:
        vmovupd   8(%rcx,%r8,8), %ymm1                          #156.9
..LN359:
	.loc    1  155  is_stmt 1
        addq      $4, %r8                                       #155.3
..LN360:
	.loc    1  156  is_stmt 1
        vmaxpd    %ymm0, %ymm1, %ymm0                           #156.5
..LN361:
	.loc    1  155  is_stmt 1
        cmpq      %rdx, %r8                                     #155.3
..LN362:
        jb        ..B3.18       # Prob 82%                      #155.3
..LN363:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax ymm0
..B3.19:                        # Preds ..B3.18
..LN364:
	.loc    1  154  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #154.3
..LN365:
        vmaxpd    %xmm1, %xmm0, %xmm2                           #154.3
..LN366:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #154.3
..LN367:
        vmaxsd    %xmm3, %xmm2, %xmm0                           #154.3
..LN368:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B3.20:                        # Preds ..B3.19 ..B3.25
..LN369:
	.loc    1  155  is_stmt 1
        cmpq      %rdi, %rdx                                    #155.3
..LN370:
        jae       ..B3.24       # Prob 9%                       #155.3
..LN371:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B3.21:                        # Preds ..B3.20
..LN372:
	.loc    1  156  is_stmt 1
        movslq    %eax, %rax                                    #156.9
..LN373:
        lea       (%rsi,%rax,8), %rax                           #156.9
..LN374:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B3.22:                        # Preds ..B3.22 ..B3.21
..L88:          # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.753906
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 5.500000
..LN375:
        vmovapd   %xmm0, %xmm2                                  #156.5
..LN376:
        vmovsd    8(%rax,%rdx,8), %xmm1                         #156.9
..LN377:
	.loc    1  155  is_stmt 1
        incq      %rdx                                          #155.3
..LN378:
	.loc    1  156  is_stmt 1
        vmovapd   %xmm1, %xmm0                                  #156.5
..LN379:
        vcomisd   %xmm2, %xmm0                                  #156.5
..LN380:
        ja        ..L89         # Prob 50%                      #156.5
..LN381:
        vmovaps   %xmm2, %xmm0                                  #156.5
..L89:                                                          #
..LN382:
	.loc    1  155  is_stmt 1
        cmpq      %rdi, %rdx                                    #155.3
..LN383:
        jb        ..B3.22       # Prob 82%                      #155.3
..LN384:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B3.24:                        # Preds ..B3.22 ..B3.20 ..B3.15 ..B3.1
..LN385:
	.loc    1  159  is_stmt 1
        vzeroupper                                              #159.10
..LN386:
	.loc    1  159  epilogue_begin  is_stmt 1
        ret                                                     #159.10
..LN387:
                                # LOE
..B3.25:                        # Preds ..B3.16                 # Infreq
..LN388:
	.loc    1  155  is_stmt 1
        xorl      %edx, %edx                                    #155.3
..LN389:
        jmp       ..B3.20       # Prob 100%                     #155.3
..LN390:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B3.26:                        # Preds ..B3.2 ..B3.5 ..B3.7    # Infreq
..LN391:
        xorl      %eax, %eax                                    #155.3
..LN392:
        jmp       ..B3.15       # Prob 100%                     #155.3
..LN393:
                                # LOE rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B3.28:                        # Preds ..B3.3                  # Infreq
..LN394:
        movl      %edi, %eax                                    #155.3
..LN395:
        xorl      %edx, %edx                                    #155.3
..LN396:
        andl      $-16, %eax                                    #155.3
..LN397:
        jmp       ..B3.12       # Prob 100%                     #155.3
..LN398:
        .align    16,0x90
	.cfi_endproc
..LN399:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..LN400:
# mark_end;
	.type	maxval_double,@function
	.size	maxval_double,.-maxval_double
..LNmaxval_double.401:
.LNmaxval_double:
	.data
# -- End  maxval_double
	.text
.L_2__routine_start_minval_double_3:
# -- Begin  minval_double
	.text
# mark_begin;
       .align    16,0x90
	.globl minval_double
# --- minval_double(int, const double *)
minval_double:
# parameter 1(size): %edi
# parameter 2(data): %rsi
..B4.1:                         # Preds ..B4.0
	.cfi_startproc
..___tag_value_minval_double.94:
..L95:
                                                         #169.1
..LN402:
	.loc    1  169  prologue_end  is_stmt 1
..LN403:
	.loc    1  173  is_stmt 1
        vmovsd    (%rsi), %xmm0                                 #173.12
..LN404:
	.loc    1  174  is_stmt 1
        cmpl      $1, %edi                                      #174.14
..LN405:
        jle       ..B4.24       # Prob 50%                      #174.14
..LN406:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.2:                         # Preds ..B4.1
..LN407:
        decl      %edi                                          #174.3
..LN408:
        cmpl      $16, %edi                                     #174.3
..LN409:
        jl        ..B4.26       # Prob 10%                      #174.3
..LN410:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.3:                         # Preds ..B4.2
..LN411:
        cmpl      $29, %edi                                     #174.3
..LN412:
        jl        ..B4.28       # Prob 10%                      #174.3
..LN413:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.4:                         # Preds ..B4.3
..LN414:
	.loc    1  175  is_stmt 1
        lea       8(%rsi), %rdx                                 #175.9
..LN415:
	.loc    1  174  is_stmt 1
        andq      $31, %rdx                                     #174.3
..LN416:
        movl      %edx, %edx                                    #174.3
..LN417:
        testl     %edx, %edx                                    #174.3
..LN418:
        je        ..B4.7        # Prob 50%                      #174.3
..LN419:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.5:                         # Preds ..B4.4
..LN420:
        testb     $7, %dl                                       #174.3
..LN421:
        jne       ..B4.26       # Prob 10%                      #174.3
..LN422:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.6:                         # Preds ..B4.5
..LN423:
        negl      %edx                                          #174.3
..LN424:
        addl      $32, %edx                                     #174.3
..LN425:
        shrl      $3, %edx                                      #174.3
..LN426:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.7:                         # Preds ..B4.6 ..B4.4
..LN427:
        lea       16(%rdx), %eax                                #174.3
..LN428:
        cmpl      %eax, %edi                                    #174.3
..LN429:
        jl        ..B4.26       # Prob 10%                      #174.3
..LN430:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B4.8:                         # Preds ..B4.7
..LN431:
        movl      %edi, %eax                                    #174.3
..LN432:
        xorl      %ecx, %ecx                                    #174.3
..LN433:
        subl      %edx, %eax                                    #174.3
..LN434:
        andl      $15, %eax                                     #174.3
..LN435:
        negl      %eax                                          #174.3
..LN436:
        addl      %edi, %eax                                    #174.3
..LN437:
        testq     %rdx, %rdx                                    #174.3
..LN438:
        jbe       ..B4.12       # Prob 9%                       #174.3
..LN439:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B4.10:                        # Preds ..B4.8 ..B4.10
..L97:          # optimization report
                # LOOP WAS UNROLLED BY 4
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 5.433594
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 1.500000
..LN440:
	.loc    1  175  is_stmt 1
        vmovapd   %xmm0, %xmm2                                  #175.5
..LN441:
        vmovsd    8(%rsi,%rcx,8), %xmm1                         #175.9
..LN442:
	.loc    1  174  is_stmt 1
        incq      %rcx                                          #174.3
..LN443:
	.loc    1  175  is_stmt 1
        vmovapd   %xmm1, %xmm0                                  #175.5
..LN444:
        vcomisd   %xmm0, %xmm2                                  #175.5
..LN445:
        ja        ..L98         # Prob 50%                      #175.5
..LN446:
        vmovaps   %xmm2, %xmm0                                  #175.5
..L98:                                                          #
..LN447:
	.loc    1  174  is_stmt 1
        cmpq      %rdx, %rcx                                    #174.3
..LN448:
        jb        ..B4.10       # Prob 82%                      #174.3
..LN449:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B4.12:                        # Preds ..B4.10 ..B4.8 ..B4.28
..LN450:
        movslq    %eax, %rcx                                    #174.3
..LN451:
	.loc    1  173  is_stmt 1
        vbroadcastsd %xmm0, %ymm0                               #173.3
..LN452:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi ymm0
..B4.13:                        # Preds ..B4.13 ..B4.12
..L99:          # optimization report
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 5.433594
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 1.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN453:
	.loc    1  175  is_stmt 1
        vmovupd   8(%rsi,%rdx,8), %ymm1                         #175.9
..LN454:
        vmovupd   72(%rsi,%rdx,8), %ymm3                        #175.9
..LN455:
        vmovupd   104(%rsi,%rdx,8), %ymm5                       #175.9
..LN456:
        vminpd    %ymm0, %ymm1, %ymm2                           #175.5
..LN457:
        vmovupd   40(%rsi,%rdx,8), %ymm0                        #175.9
..LN458:
        vminpd    %ymm2, %ymm0, %ymm4                           #175.5
..LN459:
	.loc    1  174  is_stmt 1
        addq      $16, %rdx                                     #174.3
..LN460:
	.loc    1  175  is_stmt 1
        vminpd    %ymm4, %ymm3, %ymm6                           #175.5
..LN461:
	.loc    1  174  is_stmt 1
        cmpq      %rcx, %rdx                                    #174.3
..LN462:
	.loc    1  175  is_stmt 1
        vminpd    %ymm6, %ymm5, %ymm0                           #175.5
..LN463:
	.loc    1  174  is_stmt 1
        jb        ..B4.13       # Prob 82%                      #174.3
..LN464:
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 eax edi ymm0
..B4.14:                        # Preds ..B4.13
..LN465:
	.loc    1  173  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #173.3
..LN466:
        vminpd    %xmm1, %xmm0, %xmm2                           #173.3
..LN467:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #173.3
..LN468:
        vminsd    %xmm3, %xmm2, %xmm0                           #173.3
..LN469:
                                # LOE rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B4.15:                        # Preds ..B4.14 ..B4.26
..LN470:
	.loc    1  174  is_stmt 1
        lea       1(%rax), %edx                                 #174.3
..LN471:
        cmpl      %edx, %edi                                    #174.3
..LN472:
        jb        ..B4.24       # Prob 50%                      #174.3
..LN473:
                                # LOE rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B4.16:                        # Preds ..B4.15
..LN474:
        movslq    %edi, %rdi                                    #174.3
..LN475:
        movslq    %eax, %rax                                    #174.3
..LN476:
        subq      %rax, %rdi                                    #174.3
..LN477:
        cmpq      $4, %rdi                                      #174.3
..LN478:
        jl        ..B4.25       # Prob 10%                      #174.3
..LN479:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B4.17:                        # Preds ..B4.16
..LN480:
	.loc    1  175  is_stmt 1
        movslq    %eax, %rax                                    #175.9
..LN481:
	.loc    1  174  is_stmt 1
        movl      %edi, %edx                                    #174.3
..LN482:
        andl      $-4, %edx                                     #174.3
..LN483:
        xorl      %r8d, %r8d                                    #174.3
..LN484:
        movslq    %edx, %rdx                                    #174.3
..LN485:
	.loc    1  173  is_stmt 1
        vbroadcastsd %xmm0, %ymm0                               #173.3
..LN486:
	.loc    1  175  is_stmt 1
        lea       (%rsi,%rax,8), %rcx                           #175.9
..LN487:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax ymm0
..B4.18:                        # Preds ..B4.18 ..B4.17
..L100:         # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 1.753906
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 5.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN488:
        vmovupd   8(%rcx,%r8,8), %ymm1                          #175.9
..LN489:
	.loc    1  174  is_stmt 1
        addq      $4, %r8                                       #174.3
..LN490:
	.loc    1  175  is_stmt 1
        vminpd    %ymm0, %ymm1, %ymm0                           #175.5
..LN491:
	.loc    1  174  is_stmt 1
        cmpq      %rdx, %r8                                     #174.3
..LN492:
        jb        ..B4.18       # Prob 82%                      #174.3
..LN493:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax ymm0
..B4.19:                        # Preds ..B4.18
..LN494:
	.loc    1  173  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #173.3
..LN495:
        vminpd    %xmm1, %xmm0, %xmm2                           #173.3
..LN496:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #173.3
..LN497:
        vminsd    %xmm3, %xmm2, %xmm0                           #173.3
..LN498:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B4.20:                        # Preds ..B4.19 ..B4.25
..LN499:
	.loc    1  174  is_stmt 1
        cmpq      %rdi, %rdx                                    #174.3
..LN500:
        jae       ..B4.24       # Prob 9%                       #174.3
..LN501:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B4.21:                        # Preds ..B4.20
..LN502:
	.loc    1  175  is_stmt 1
        movslq    %eax, %rax                                    #175.9
..LN503:
        lea       (%rsi,%rax,8), %rax                           #175.9
..LN504:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B4.22:                        # Preds ..B4.22 ..B4.21
..L101:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.753906
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 5.500000
..LN505:
        vmovapd   %xmm0, %xmm2                                  #175.5
..LN506:
        vmovsd    8(%rax,%rdx,8), %xmm1                         #175.9
..LN507:
	.loc    1  174  is_stmt 1
        incq      %rdx                                          #174.3
..LN508:
	.loc    1  175  is_stmt 1
        vmovapd   %xmm1, %xmm0                                  #175.5
..LN509:
        vcomisd   %xmm0, %xmm2                                  #175.5
..LN510:
        ja        ..L102        # Prob 50%                      #175.5
..LN511:
        vmovaps   %xmm2, %xmm0                                  #175.5
..L102:                                                         #
..LN512:
	.loc    1  174  is_stmt 1
        cmpq      %rdi, %rdx                                    #174.3
..LN513:
        jb        ..B4.22       # Prob 82%                      #174.3
..LN514:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B4.24:                        # Preds ..B4.22 ..B4.20 ..B4.15 ..B4.1
..LN515:
	.loc    1  178  is_stmt 1
        vzeroupper                                              #178.10
..LN516:
	.loc    1  178  epilogue_begin  is_stmt 1
        ret                                                     #178.10
..LN517:
                                # LOE
..B4.25:                        # Preds ..B4.16                 # Infreq
..LN518:
	.loc    1  174  is_stmt 1
        xorl      %edx, %edx                                    #174.3
..LN519:
        jmp       ..B4.20       # Prob 100%                     #174.3
..LN520:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 eax xmm0
..B4.26:                        # Preds ..B4.2 ..B4.5 ..B4.7    # Infreq
..LN521:
        xorl      %eax, %eax                                    #174.3
..LN522:
        jmp       ..B4.15       # Prob 100%                     #174.3
..LN523:
                                # LOE rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..B4.28:                        # Preds ..B4.3                  # Infreq
..LN524:
        movl      %edi, %eax                                    #174.3
..LN525:
        xorl      %edx, %edx                                    #174.3
..LN526:
        andl      $-16, %eax                                    #174.3
..LN527:
        jmp       ..B4.12       # Prob 100%                     #174.3
..LN528:
        .align    16,0x90
	.cfi_endproc
..LN529:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 eax edi xmm0
..LN530:
# mark_end;
	.type	minval_double,@function
	.size	minval_double,.-minval_double
..LNminval_double.531:
.LNminval_double:
	.data
# -- End  minval_double
	.text
.L_2__routine_start_avgval_double_4:
# -- Begin  avgval_double
	.text
# mark_begin;
       .align    16,0x90
	.globl avgval_double
# --- avgval_double(int, const double *)
avgval_double:
# parameter 1(size): %edi
# parameter 2(data): %rsi
..B5.1:                         # Preds ..B5.0
	.cfi_startproc
..___tag_value_avgval_double.107:
..L108:
                                                        #187.1
..LN532:
	.loc    1  187  prologue_end  is_stmt 1
..LN533:
	.loc    1  191  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #191.3
..LN534:
	.loc    1  192  is_stmt 1
        testl     %edi, %edi                                    #192.14
..LN535:
        jle       ..B5.23       # Prob 50%                      #192.14
..LN536:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B5.2:                         # Preds ..B5.1
..LN537:
        cmpl      $32, %edi                                     #192.3
..LN538:
        jl        ..B5.25       # Prob 10%                      #192.3
..LN539:
                                # LOE rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B5.3:                         # Preds ..B5.2
..LN540:
        movq      %rsi, %rax                                    #192.3
..LN541:
        andq      $31, %rax                                     #192.3
..LN542:
        movl      %eax, %eax                                    #192.3
..LN543:
        testl     %eax, %eax                                    #192.3
..LN544:
        je        ..B5.6        # Prob 50%                      #192.3
..LN545:
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B5.4:                         # Preds ..B5.3
..LN546:
        testb     $7, %al                                       #192.3
..LN547:
        jne       ..B5.25       # Prob 10%                      #192.3
..LN548:
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B5.5:                         # Preds ..B5.4
..LN549:
        negl      %eax                                          #192.3
..LN550:
        addl      $32, %eax                                     #192.3
..LN551:
        shrl      $3, %eax                                      #192.3
..LN552:
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B5.6:                         # Preds ..B5.5 ..B5.3
..LN553:
        lea       32(%rax), %edx                                #192.3
..LN554:
        cmpl      %edx, %edi                                    #192.3
..LN555:
        jl        ..B5.25       # Prob 10%                      #192.3
..LN556:
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edi xmm0
..B5.7:                         # Preds ..B5.6
..LN557:
        movl      %edi, %ecx                                    #192.3
..LN558:
        xorl      %edx, %edx                                    #192.3
..LN559:
        subl      %eax, %ecx                                    #192.3
..LN560:
        andl      $31, %ecx                                     #192.3
..LN561:
        negl      %ecx                                          #192.3
..LN562:
        addl      %edi, %ecx                                    #192.3
..LN563:
        testq     %rax, %rax                                    #192.3
..LN564:
        jbe       ..B5.11       # Prob 9%                       #192.3
..LN565:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.9:                         # Preds ..B5.7 ..B5.9
..L110:         # optimization report
                # LOOP WAS UNROLLED BY 8
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 3.906250
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.750000
..LN566:
        vaddsd    (%rsi,%rdx,8), %xmm0, %xmm0                   #192.25
..LN567:
        incq      %rdx                                          #192.3
..LN568:
        cmpq      %rax, %rdx                                    #192.3
..LN569:
        jb        ..B5.9        # Prob 82%                      #192.3
..LN570:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.11:                        # Preds ..B5.9 ..B5.7
..LN571:
        movslq    %ecx, %rdx                                    #192.3
..LN572:
	.loc    1  191  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #191.3
..LN573:
        vxorps    %xmm2, %xmm2, %xmm2                           #191.3
..LN574:
        vmovsd    %xmm0, %xmm1, %xmm0                           #191.3
..LN575:
        vxorpd    %ymm6, %ymm6, %ymm6                           #191.3
..LN576:
        vmovdqa   %ymm6, %ymm5                                  #191.3
..LN577:
        vmovdqa   %ymm6, %ymm4                                  #191.3
..LN578:
        vmovdqa   %ymm6, %ymm3                                  #191.3
..LN579:
        vmovdqa   %ymm6, %ymm1                                  #191.3
..LN580:
        vinsertf128 $1, %xmm2, %ymm0, %ymm7                     #191.3
..LN581:
        vmovdqa   %ymm6, %ymm2                                  #191.3
..LN582:
        vmovdqa   %ymm6, %ymm0                                  #191.3
..LN583:
        .align    16,0x90
..LN584:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi ymm0 ymm1 ymm2 ymm3 ymm4 ymm5 ymm6 ymm7
..B5.12:                        # Preds ..B5.12 ..B5.11
..L111:         # optimization report
                # LOOP WAS UNROLLED BY 8
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 3.906250
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.750000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN585:
	.loc    1  192  is_stmt 1
        vaddpd    (%rsi,%rax,8), %ymm7, %ymm7                   #192.25
..LN586:
        vaddpd    32(%rsi,%rax,8), %ymm6, %ymm6                 #192.25
..LN587:
        vaddpd    64(%rsi,%rax,8), %ymm5, %ymm5                 #192.25
..LN588:
        vaddpd    96(%rsi,%rax,8), %ymm4, %ymm4                 #192.25
..LN589:
        vaddpd    128(%rsi,%rax,8), %ymm3, %ymm3                #192.25
..LN590:
        vaddpd    160(%rsi,%rax,8), %ymm2, %ymm2                #192.25
..LN591:
        vaddpd    192(%rsi,%rax,8), %ymm1, %ymm1                #192.25
..LN592:
        vaddpd    224(%rsi,%rax,8), %ymm0, %ymm0                #192.25
..LN593:
        addq      $32, %rax                                     #192.3
..LN594:
        cmpq      %rdx, %rax                                    #192.3
..LN595:
        jb        ..B5.12       # Prob 82%                      #192.3
..LN596:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi ymm0 ymm1 ymm2 ymm3 ymm4 ymm5 ymm6 ymm7
..B5.13:                        # Preds ..B5.12
..LN597:
	.loc    1  191  is_stmt 1
        vaddpd    %ymm6, %ymm7, %ymm6                           #191.3
..LN598:
        vaddpd    %ymm4, %ymm5, %ymm4                           #191.3
..LN599:
        vaddpd    %ymm2, %ymm3, %ymm2                           #191.3
..LN600:
        vaddpd    %ymm0, %ymm1, %ymm0                           #191.3
..LN601:
        vaddpd    %ymm4, %ymm6, %ymm5                           #191.3
..LN602:
        vaddpd    %ymm0, %ymm2, %ymm1                           #191.3
..LN603:
        vaddpd    %ymm1, %ymm5, %ymm3                           #191.3
..LN604:
        vextractf128 $1, %ymm3, %xmm7                           #191.3
..LN605:
        vaddpd    %xmm7, %xmm3, %xmm8                           #191.3
..LN606:
        vunpckhpd %xmm8, %xmm8, %xmm9                           #191.3
..LN607:
        vaddsd    %xmm9, %xmm8, %xmm0                           #191.3
..LN608:
                                # LOE rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.14:                        # Preds ..B5.13 ..B5.25
..LN609:
	.loc    1  192  is_stmt 1
        lea       1(%rcx), %eax                                 #192.3
..LN610:
        cmpl      %eax, %edi                                    #192.3
..LN611:
        jb        ..B5.23       # Prob 50%                      #192.3
..LN612:
                                # LOE rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.15:                        # Preds ..B5.14
..LN613:
        movslq    %edi, %rdx                                    #192.3
..LN614:
        movslq    %ecx, %rcx                                    #192.3
..LN615:
        subq      %rcx, %rdx                                    #192.3
..LN616:
        cmpq      $4, %rdx                                      #192.3
..LN617:
        jl        ..B5.24       # Prob 10%                      #192.3
..LN618:
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.16:                        # Preds ..B5.15
..LN619:
        movslq    %ecx, %rcx                                    #192.35
..LN620:
        movl      %edx, %eax                                    #192.3
..LN621:
	.loc    1  191  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #191.3
..LN622:
	.loc    1  192  is_stmt 1
        andl      $-4, %eax                                     #192.3
..LN623:
	.loc    1  191  is_stmt 1
        vmovsd    %xmm0, %xmm1, %xmm0                           #191.3
..LN624:
        vxorps    %xmm2, %xmm2, %xmm2                           #191.3
..LN625:
	.loc    1  192  is_stmt 1
        movslq    %eax, %rax                                    #192.3
..LN626:
        xorl      %r9d, %r9d                                    #192.3
..LN627:
        lea       (%rsi,%rcx,8), %r8                            #192.35
..LN628:
	.loc    1  191  is_stmt 1
        vinsertf128 $1, %xmm2, %ymm0, %ymm0                     #191.3
..LN629:
                                # LOE rax rdx rbx rbp rsi r8 r9 r12 r13 r14 r15 ecx edi ymm0
..B5.17:                        # Preds ..B5.17 ..B5.16
..L112:         # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 2.023438
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 5.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN630:
	.loc    1  192  is_stmt 1
        vaddpd    (%r8,%r9,8), %ymm0, %ymm0                     #192.25
..LN631:
        addq      $4, %r9                                       #192.3
..LN632:
        cmpq      %rax, %r9                                     #192.3
..LN633:
        jb        ..B5.17       # Prob 82%                      #192.3
..LN634:
                                # LOE rax rdx rbx rbp rsi r8 r9 r12 r13 r14 r15 ecx edi ymm0
..B5.18:                        # Preds ..B5.17
..LN635:
	.loc    1  191  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #191.3
..LN636:
        vaddpd    %xmm1, %xmm0, %xmm2                           #191.3
..LN637:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #191.3
..LN638:
        vaddsd    %xmm3, %xmm2, %xmm0                           #191.3
..LN639:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.19:                        # Preds ..B5.18 ..B5.24
..LN640:
	.loc    1  192  is_stmt 1
        cmpq      %rdx, %rax                                    #192.3
..LN641:
        jae       ..B5.23       # Prob 9%                       #192.3
..LN642:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.20:                        # Preds ..B5.19
..LN643:
        movslq    %ecx, %rcx                                    #192.35
..LN644:
        lea       (%rsi,%rcx,8), %rcx                           #192.35
..LN645:
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 edi xmm0
..B5.21:                        # Preds ..B5.21 ..B5.20
..L113:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 2.023438
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 5.500000
..LN646:
        vaddsd    (%rcx,%rax,8), %xmm0, %xmm0                   #192.25
..LN647:
        incq      %rax                                          #192.3
..LN648:
        cmpq      %rdx, %rax                                    #192.3
..LN649:
        jb        ..B5.21       # Prob 82%                      #192.3
..LN650:
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 edi xmm0
..B5.23:                        # Preds ..B5.21 ..B5.19 ..B5.14 ..B5.1
..LN651:
	.loc    1  193  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #193.13
..LN652:
        vcvtsi2sd %edi, %xmm1, %xmm1                            #193.13
..LN653:
        vdivsd    %xmm1, %xmm0, %xmm0                           #193.3
..LN654:
	.loc    1  195  is_stmt 1
        vzeroupper                                              #195.10
..LN655:
	.loc    1  195  epilogue_begin  is_stmt 1
        ret                                                     #195.10
..LN656:
                                # LOE
..B5.24:                        # Preds ..B5.15                 # Infreq
..LN657:
	.loc    1  192  is_stmt 1
        xorl      %eax, %eax                                    #192.3
..LN658:
        jmp       ..B5.19       # Prob 100%                     #192.3
..LN659:
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..B5.25:                        # Preds ..B5.2 ..B5.4 ..B5.6    # Infreq
..LN660:
        xorl      %ecx, %ecx                                    #192.3
..LN661:
        jmp       ..B5.14       # Prob 100%                     #192.3
..LN662:
        .align    16,0x90
	.cfi_endproc
..LN663:
                                # LOE rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0
..LN664:
# mark_end;
	.type	avgval_double,@function
	.size	avgval_double,.-avgval_double
..LNavgval_double.665:
.LNavgval_double:
	.data
# -- End  avgval_double
	.text
.L_2__routine_start_latlon2xyz_5:
# -- Begin  latlon2xyz
	.text
# mark_begin;
       .align    16,0x90
	.globl latlon2xyz
# --- latlon2xyz(int, const double *, const double *, double *, double *, double *)
latlon2xyz:
# parameter 1(size): %edi
# parameter 2(lon): %rsi
# parameter 3(lat): %rdx
# parameter 4(x): %rcx
# parameter 5(y): %r8
# parameter 6(z): %r9
..B6.1:                         # Preds ..B6.0
	.cfi_startproc
..___tag_value_latlon2xyz.118:
..L119:
                                                        #205.1
..LN666:
	.loc    1  205  is_stmt 1
        subq      $72, %rsp                                     #205.1
	.cfi_def_cfa_offset 80
..LN667:
	.loc    1  208  prologue_end  is_stmt 1
        xorl      %eax, %eax                                    #208.7
..LN668:
	.loc    1  205  is_stmt 1
        movslq    %edi, %rdi                                    #205.1
..LN669:
	.loc    1  208  is_stmt 1
        testq     %rdi, %rdi                                    #208.14
..LN670:
        jle       ..B6.5        # Prob 10%                      #208.14
..LN671:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B6.2:                         # Preds ..B6.1
..LN672:
        movq      %rdi, 48(%rsp)                                #
..LN673:
        movq      %r12, 40(%rsp)                                #
	.cfi_offset 12, -40
..LN674:
        movq      %r8, %r12                                     #
..LN675:
        movq      %r13, 32(%rsp)                                #
	.cfi_offset 13, -48
..LN676:
        movq      %r9, %r13                                     #
..LN677:
        movq      %r14, 24(%rsp)                                #
	.cfi_offset 14, -56
..LN678:
        movq      %rsi, %r14                                    #
..LN679:
        movq      %r15, 16(%rsp)                                #
	.cfi_offset 15, -64
..LN680:
        movq      %rdx, %r15                                    #
..LN681:
        movq      %rbx, 8(%rsp)                                 #
	.cfi_offset 3, -72
..LN682:
        movq      %rax, %rbx                                    #
..LN683:
        movq      %rbp, (%rsp)                                  #
	.cfi_offset 6, -80
..LN684:
        movq      %rcx, %rbp                                    #
..LN685:
                                # LOE rbx rbp r12 r13 r14 r15
..B6.3:                         # Preds ..B6.8 ..B6.2
..L128:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN686:
	.loc    1  209  is_stmt 1
        vmovsd    (%r15,%rbx,8), %xmm0                          #209.12
..LN687:
        call      cos                                           #209.12
..LN688:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B6.12:                        # Preds ..B6.3
..LN689:
        vmovsd    %xmm0, 64(%rsp)                               #209.12
..LN690:
        vmovsd    (%r14,%rbx,8), %xmm0                          #209.24
..LN691:
        call      cos                                           #209.24
..LN692:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B6.11:                        # Preds ..B6.12
..LN693:
        vmulsd    64(%rsp), %xmm0, %xmm1                        #209.24
..LN694:
        lea       (%rbp,%rbx,8), %rdi                           #209.5
..LN695:
        vmovsd    %xmm1, (%rdi)                                 #209.5
..LN696:
	.loc    1  210  is_stmt 1
        vmovsd    (%r15,%rbx,8), %xmm2                          #210.12
..LN697:
        vmovapd   %xmm2, %xmm0                                  #210.12
..LN698:
        call      cos                                           #210.12
..LN699:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B6.10:                        # Preds ..B6.11
..LN700:
        vmovsd    %xmm0, 56(%rsp)                               #210.12
..LN701:
        vmovsd    (%r14,%rbx,8), %xmm0                          #210.24
..LN702:
        call      sin                                           #210.24
..LN703:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B6.9:                         # Preds ..B6.10
..LN704:
        vmulsd    56(%rsp), %xmm0, %xmm1                        #210.24
..LN705:
        lea       (%r12,%rbx,8), %rdi                           #210.5
..LN706:
        vmovsd    %xmm1, (%rdi)                                 #210.5
..LN707:
	.loc    1  211  is_stmt 1
        vmovsd    (%r15,%rbx,8), %xmm2                          #211.12
..LN708:
        vmovapd   %xmm2, %xmm0                                  #211.12
..LN709:
        call      sin                                           #211.12
..LN710:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B6.8:                         # Preds ..B6.9
..LN711:
        vmovsd    %xmm0, (%r13,%rbx,8)                          #211.5
..LN712:
	.loc    1  208  is_stmt 1
        incq      %rbx                                          #208.20
..LN713:
        cmpq      48(%rsp), %rbx                                #208.14
..LN714:
        jl        ..B6.3        # Prob 82%                      #208.14
..LN715:
                                # LOE rbx rbp r12 r13 r14 r15
..B6.4:                         # Preds ..B6.8
..LN716:
        movq      40(%rsp), %r12                                #
	.cfi_restore 12
..LN717:
        movq      32(%rsp), %r13                                #
	.cfi_restore 13
..LN718:
        movq      24(%rsp), %r14                                #
	.cfi_restore 14
..LN719:
        movq      16(%rsp), %r15                                #
	.cfi_restore 15
..LN720:
        movq      8(%rsp), %rbx                                 #
	.cfi_restore 3
..LN721:
        movq      (%rsp), %rbp                                  #
	.cfi_restore 6
..LN722:
                                # LOE rbx rbp r12 r13 r14 r15
..B6.5:                         # Preds ..B6.4 ..B6.1
..LN723:
	.loc    1  214  epilogue_begin  is_stmt 1
        addq      $72, %rsp                                     #214.1
	.cfi_def_cfa_offset 8
..LN724:
        ret                                                     #214.1
..LN725:
        .align    16,0x90
	.cfi_endproc
..LN726:
                                # LOE
..LN727:
# mark_end;
	.type	latlon2xyz,@function
	.size	latlon2xyz,.-latlon2xyz
..LNlatlon2xyz.728:
.LNlatlon2xyz:
	.data
# -- End  latlon2xyz
	.text
.L_2__routine_start_xyz2latlon_6:
# -- Begin  xyz2latlon
	.text
# mark_begin;
       .align    16,0x90
	.globl xyz2latlon
# --- xyz2latlon(int, const double *, const double *, const double *, double *, double *)
xyz2latlon:
# parameter 1(np): %edi
# parameter 2(x): %rsi
# parameter 3(y): %rdx
# parameter 4(z): %rcx
# parameter 5(lon): %r8
# parameter 6(lat): %r9
..B7.1:                         # Preds ..B7.0
	.cfi_startproc
..___tag_value_xyz2latlon.140:
..L141:
                                                        #221.1
..LN729:
	.loc    1  221  is_stmt 1
        subq      $72, %rsp                                     #221.1
	.cfi_def_cfa_offset 80
..LN730:
	.loc    1  227  prologue_end  is_stmt 1
        xorl      %eax, %eax                                    #227.7
..LN731:
	.loc    1  221  is_stmt 1
        movslq    %edi, %rdi                                    #221.1
..LN732:
	.loc    1  227  is_stmt 1
        testq     %rdi, %rdi                                    #227.14
..LN733:
        jle       ..B7.10       # Prob 10%                      #227.14
..LN734:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B7.2:                         # Preds ..B7.1
..LN735:
	.loc    1  242  is_stmt 1
        movq      %rdi, 64(%rsp)                                #242.33
..LN736:
        movq      %r12, 40(%rsp)                                #242.33
	.cfi_offset 12, -40
..LN737:
        movq      %rdx, %r12                                    #242.33
..LN738:
        movq      %r13, 32(%rsp)                                #242.33
	.cfi_offset 13, -48
..LN739:
        movq      %rcx, %r13                                    #242.33
..LN740:
        movq      %r14, 24(%rsp)                                #242.33
	.cfi_offset 14, -56
..LN741:
        movq      %r8, %r14                                     #242.33
..LN742:
        movq      %r15, 16(%rsp)                                #242.33
	.cfi_offset 15, -64
..LN743:
        movq      %r9, %r15                                     #242.33
..LN744:
        movq      %rbx, 8(%rsp)                                 #242.33
	.cfi_offset 3, -72
..LN745:
        movq      %rax, %rbx                                    #242.33
..LN746:
        movq      %rbp, (%rsp)                                  #242.33
	.cfi_offset 6, -80
..LN747:
        movq      %rsi, %rbp                                    #242.33
..LN748:
                                # LOE rbx rbp r12 r13 r14 r15
..B7.3:                         # Preds ..B7.8 ..B7.2
..L150:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN749:
	.loc    1  229  is_stmt 1
        vmovsd    (%r12,%rbx,8), %xmm3                          #229.10
..LN750:
	.loc    1  231  is_stmt 1
        vmulsd    %xmm3, %xmm3, %xmm2                           #231.26
..LN751:
	.loc    1  228  is_stmt 1
        vmovsd    (%rbp,%rbx,8), %xmm0                          #228.10
..LN752:
	.loc    1  231  is_stmt 1
        vfmadd231sd %xmm0, %xmm0, %xmm2                         #231.5
..LN753:
	.loc    1  230  is_stmt 1
        vmovsd    (%r13,%rbx,8), %xmm8                          #230.10
..LN754:
	.loc    1  236  is_stmt 1
        vmovsd    .L_2il0floatpacket.0(%rip), %xmm6             #236.31
..LN755:
	.loc    1  231  is_stmt 1
        vfmadd231sd %xmm8, %xmm8, %xmm2                         #231.5
..LN756:
        vsqrtsd   %xmm2, %xmm2, %xmm2                           #231.12
..LN757:
	.loc    1  232  is_stmt 1
        vdivsd    %xmm2, %xmm0, %xmm1                           #232.5
..LN758:
	.loc    1  233  is_stmt 1
        vdivsd    %xmm2, %xmm3, %xmm0                           #233.5
..LN759:
	.loc    1  236  is_stmt 1
        vandpd    .L_2il0floatpacket.2(%rip), %xmm1, %xmm4      #236.10
..LN760:
        vandpd    .L_2il0floatpacket.2(%rip), %xmm0, %xmm5      #236.19
..LN761:
        vaddsd    %xmm5, %xmm4, %xmm7                           #236.19
..LN762:
        vcomisd   %xmm7, %xmm6                                  #236.31
..LN763:
        jbe       ..B7.5        # Prob 50%                      #236.31
..LN764:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm8
..B7.4:                         # Preds ..B7.3
..LN765:
	.loc    1  237  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #237.8
..LN766:
        vmovsd    %xmm0, (%r14,%rbx,8)                          #237.8
..LN767:
        jmp       ..B7.6        # Prob 100%                     #237.8
..LN768:
                                # LOE rbx rbp r12 r13 r14 r15 xmm2 xmm8
..B7.5:                         # Preds ..B7.3
..LN769:
	.loc    1  239  is_stmt 1
        vmovsd    %xmm2, 48(%rsp)                               #239.17
..LN770:
        vmovsd    %xmm8, 56(%rsp)                               #239.17
..LN771:
        call      atan2                                         #239.17
..LN772:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B7.13:                        # Preds ..B7.5
..LN773:
        vmovsd    56(%rsp), %xmm8                               #
..LN774:
        vmovsd    48(%rsp), %xmm2                               #
..LN775:
        vmovsd    %xmm0, (%r14,%rbx,8)                          #239.8
..LN776:
                                # LOE rbx rbp r12 r13 r14 r15 xmm2 xmm8
..B7.6:                         # Preds ..B7.4 ..B7.13
..LN777:
	.loc    1  240  is_stmt 1
        vdivsd    %xmm2, %xmm8, %xmm0                           #240.15
..LN778:
        call      asin                                          #240.15
..LN779:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B7.14:                        # Preds ..B7.6
..LN780:
        vmovsd    %xmm0, (%r15,%rbx,8)                          #240.6
..LN781:
	.loc    1  242  is_stmt 1
        vmovsd    (%r14,%rbx,8), %xmm0                          #242.11
..LN782:
        vxorpd    %xmm1, %xmm1, %xmm1                           #242.20
..LN783:
        vcomisd   %xmm0, %xmm1                                  #242.20
..LN784:
        jbe       ..B7.8        # Prob 50%                      #242.20
..LN785:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B7.7:                         # Preds ..B7.14
..LN786:
        vaddsd    .L_2il0floatpacket.1(%rip), %xmm0, %xmm0      #242.43
..LN787:
        vmovsd    %xmm0, (%r14,%rbx,8)                          #242.24
..LN788:
                                # LOE rbx rbp r12 r13 r14 r15
..B7.8:                         # Preds ..B7.14 ..B7.7
..LN789:
	.loc    1  227  is_stmt 1
        incq      %rbx                                          #227.18
..LN790:
        cmpq      64(%rsp), %rbx                                #227.14
..LN791:
        jl        ..B7.3        # Prob 82%                      #227.14
..LN792:
                                # LOE rbx rbp r12 r13 r14 r15
..B7.9:                         # Preds ..B7.8
..LN793:
        movq      40(%rsp), %r12                                #
	.cfi_restore 12
..LN794:
        movq      32(%rsp), %r13                                #
	.cfi_restore 13
..LN795:
        movq      24(%rsp), %r14                                #
	.cfi_restore 14
..LN796:
        movq      16(%rsp), %r15                                #
	.cfi_restore 15
..LN797:
        movq      8(%rsp), %rbx                                 #
	.cfi_restore 3
..LN798:
        movq      (%rsp), %rbp                                  #
	.cfi_restore 6
..LN799:
                                # LOE rbx rbp r12 r13 r14 r15
..B7.10:                        # Preds ..B7.9 ..B7.1
..LN800:
	.loc    1  245  epilogue_begin  is_stmt 1
        addq      $72, %rsp                                     #245.1
	.cfi_def_cfa_offset 8
..LN801:
        ret                                                     #245.1
..LN802:
        .align    16,0x90
	.cfi_endproc
..LN803:
                                # LOE
..LN804:
# mark_end;
	.type	xyz2latlon,@function
	.size	xyz2latlon,.-xyz2latlon
..LNxyz2latlon.805:
.LNxyz2latlon:
	.data
# -- End  xyz2latlon
	.text
.L_2__routine_start_box_area_7:
# -- Begin  box_area
	.text
# mark_begin;
       .align    16,0x90
	.globl box_area
# --- box_area(double, double, double, double)
box_area:
# parameter 1(ll_lon): %xmm0
# parameter 2(ll_lat): %xmm1
# parameter 3(ur_lon): %xmm2
# parameter 4(ur_lat): %xmm3
..B8.1:                         # Preds ..B8.0
	.cfi_startproc
..___tag_value_box_area.162:
..L163:
                                                        #252.1
..LN806:
	.loc    1  252  is_stmt 1
        subq      $24, %rsp                                     #252.1
	.cfi_def_cfa_offset 32
..LN807:
	.loc    1  253  prologue_end  is_stmt 1
        vsubsd    %xmm0, %xmm2, %xmm4                           #253.22
..LN808:
	.loc    1  256  is_stmt 1
        vcomisd   .L_2il0floatpacket.3(%rip), %xmm4             #256.18
..LN809:
        vsubsd    .L_2il0floatpacket.1(%rip), %xmm4, %xmm6      #256.28
..LN810:
        ja        ..L166        # Prob 50%                      #256.18
..LN811:
        vmovaps   %xmm4, %xmm6                                  #256.18
..L166:                                                         #
..LN812:
	.loc    1  257  is_stmt 1
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm5             #257.11
..LN813:
	.loc    1  259  is_stmt 1
        vmovapd   %xmm3, %xmm0                                  #259.15
..LN814:
	.loc    1  257  is_stmt 1
        vcomisd   %xmm6, %xmm5                                  #257.18
..LN815:
        vaddsd    .L_2il0floatpacket.1(%rip), %xmm6, %xmm7      #257.28
..LN816:
        ja        ..L167        # Prob 50%                      #257.18
..LN817:
        vmovaps   %xmm6, %xmm7                                  #257.18
..L167:                                                         #
..LN818:
	.loc    1  252  is_stmt 1
        vmovsd    %xmm1, (%rsp)                                 #252.1
..LN819:
	.loc    1  257  is_stmt 1
        vmovsd    %xmm7, 16(%rsp)                               #257.18
..LN820:
	.loc    1  259  is_stmt 1
        call      sin                                           #259.15
..LN821:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B8.5:                         # Preds ..B8.1
..LN822:
        vmovsd    %xmm0, 8(%rsp)                                #259.15
..LN823:
        vmovsd    (%rsp), %xmm0                                 #259.27
..LN824:
        call      sin                                           #259.27
..LN825:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B8.4:                         # Preds ..B8.5
..LN826:
        vmovapd   %xmm0, %xmm1                                  #259.27
..LN827:
        vmovsd    8(%rsp), %xmm0                                #259.27
..LN828:
        vmovsd    .L_2il0floatpacket.5(%rip), %xmm5             #259.40
..LN829:
        vsubsd    %xmm1, %xmm0, %xmm2                           #259.27
..LN830:
        vmulsd    16(%rsp), %xmm2, %xmm3                        #259.27
..LN831:
        vmulsd    %xmm5, %xmm3, %xmm4                           #259.40
..LN832:
        vmulsd    %xmm5, %xmm4, %xmm0                           #259.47
..LN833:
	.loc    1  259  epilogue_begin  is_stmt 1
        addq      $24, %rsp                                     #259.47
	.cfi_def_cfa_offset 8
..LN834:
        ret                                                     #259.47
..LN835:
        .align    16,0x90
	.cfi_endproc
..LN836:
                                # LOE
..LN837:
# mark_end;
	.type	box_area,@function
	.size	box_area,.-box_area
..LNbox_area.838:
.LNbox_area:
	.data
# -- End  box_area
	.text
.L_2__routine_start_poly_area_8:
# -- Begin  poly_area
	.text
# mark_begin;
       .align    16,0x90
	.globl poly_area
# --- poly_area(const double *, const double *, int)
poly_area:
# parameter 1(x): %rdi
# parameter 2(y): %rsi
# parameter 3(n): %edx
..B9.1:                         # Preds ..B9.0
	.cfi_startproc
..___tag_value_poly_area.173:
..L174:
                                                        #272.1
..LN839:
	.loc    1  272  is_stmt 1
        subq      $88, %rsp                                     #272.1
	.cfi_def_cfa_offset 96
..LN840:
        movl      %edx, %r8d                                    #272.1
..LN841:
	.loc    1  276  prologue_end  is_stmt 1
        xorl      %ecx, %ecx                                    #276.8
..LN842:
	.loc    1  273  is_stmt 1
        vxorpd    %xmm5, %xmm5, %xmm5                           #273.15
..LN843:
	.loc    1  276  is_stmt 1
        xorl      %edx, %edx                                    #276.8
..LN844:
	.loc    1  273  is_stmt 1
        vmovapd   %xmm5, %xmm6                                  #273.15
..LN845:
	.loc    1  276  is_stmt 1
        testl     %r8d, %r8d                                    #276.14
..LN846:
        jle       ..B9.9        # Prob 10%                      #276.14
..LN847:
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d xmm5 xmm6
..B9.2:                         # Preds ..B9.1
..LN848:
        movslq    %r8d, %rax                                    #276.3
..LN849:
	.loc    1  284  is_stmt 1
        vmovsd    %xmm6, 56(%rsp)                               #284.30
..LN850:
        movq      %r12, 40(%rsp)                                #284.30
	.cfi_offset 12, -56
..LN851:
        movq      %rsi, %r12                                    #284.30
..LN852:
        movq      %r13, 32(%rsp)                                #284.30
	.cfi_offset 13, -64
..LN853:
        movl      %r8d, %r13d                                   #284.30
..LN854:
        movq      %r14, 24(%rsp)                                #284.30
	.cfi_offset 14, -72
..LN855:
        movq      %rdx, %r14                                    #284.30
..LN856:
        movq      %r15, 16(%rsp)                                #284.30
	.cfi_offset 15, -80
..LN857:
        movq      %rcx, %r15                                    #284.30
..LN858:
        movq      %rbx, 8(%rsp)                                 #284.30
	.cfi_offset 3, -88
..LN859:
        movq      %rax, %rbx                                    #284.30
..LN860:
        movq      %rbp, (%rsp)                                  #284.30
	.cfi_offset 6, -96
..LN861:
        movq      %rdi, %rbp                                    #284.30
..LN862:
                                # LOE rbx rbp r12 r14 r15 r13d
..B9.3:                         # Preds ..B9.7 ..B9.2
..L183:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN863:
	.loc    1  277  is_stmt 1
        movl      %r15d, %eax                                   #277.22
..LN864:
        incl      %eax                                          #277.17
..LN865:
        cltd                                                    #277.22
..LN866:
        idivl     %r13d                                         #277.22
..LN867:
	.loc    1  284  is_stmt 1
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm2             #284.30
..LN868:
	.loc    1  286  is_stmt 1
        vxorpd    %xmm6, %xmm6, %xmm6                           #286.13
..LN869:
	.loc    1  277  is_stmt 1
        movslq    %edx, %rdx                                    #277.22
..LN870:
	.loc    1  285  is_stmt 1
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm3             #285.20
..LN871:
	.loc    1  283  is_stmt 1
        vmovsd    (%r14,%r12), %xmm7                            #283.12
..LN872:
	.loc    1  278  is_stmt 1
        vmovsd    (%rbp,%rdx,8), %xmm0                          #278.18
..LN873:
        vsubsd    (%r14,%rbp), %xmm0, %xmm1                     #278.24
..LN874:
	.loc    1  284  is_stmt 1
        vcomisd   .L_2il0floatpacket.3(%rip), %xmm1             #284.20
..LN875:
        vsubsd    %xmm2, %xmm1, %xmm4                           #284.30
..LN876:
        ja        ..L184        # Prob 50%                      #284.20
..LN877:
        vmovaps   %xmm1, %xmm4                                  #284.20
..L184:                                                         #
..LN878:
	.loc    1  285  is_stmt 1
        vcomisd   %xmm4, %xmm3                                  #285.20
..LN879:
        vaddsd    %xmm2, %xmm4, %xmm5                           #285.30
..LN880:
        ja        ..L185        # Prob 50%                      #285.20
..LN881:
        vmovaps   %xmm4, %xmm5                                  #285.20
..L185:                                                         #
..LN882:
	.loc    1  282  is_stmt 1
        vmovsd    (%r12,%rdx,8), %xmm0                          #282.12
..LN883:
	.loc    1  285  is_stmt 1
        vmovsd    %xmm5, 80(%rsp)                               #285.20
..LN884:
	.loc    1  286  is_stmt 1
        vucomisd  %xmm6, %xmm5                                  #286.13
..LN885:
        jp        ..B9.4        # Prob 0%                       #286.13
..LN886:
        je        ..B9.7        # Prob 16%                      #286.13
..LN887:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0 xmm7
..B9.4:                         # Preds ..B9.3
..LN888:
	.loc    1  288  is_stmt 1
        vmovsd    .L_2il0floatpacket.0(%rip), %xmm2             #288.28
..LN889:
        vsubsd    %xmm7, %xmm0, %xmm1                           #288.20
..LN890:
        vandpd    .L_2il0floatpacket.2(%rip), %xmm1, %xmm3      #288.10
..LN891:
        vmovsd    %xmm1, 72(%rsp)                               #288.20
..LN892:
        vcomisd   %xmm3, %xmm2                                  #288.28
..LN893:
        jbe       ..B9.6        # Prob 50%                      #288.28
..LN894:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0 xmm7
..B9.5:                         # Preds ..B9.4
..LN895:
	.loc    1  289  is_stmt 1
        vaddsd    %xmm7, %xmm0, %xmm0                           #289.18
..LN896:
        vmulsd    .L_2il0floatpacket.6(%rip), %xmm0, %xmm0      #289.18
..LN897:
        call      sin                                           #289.18
..LN898:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0
..B9.12:                        # Preds ..B9.5
..LN899:
        vmovsd    56(%rsp), %xmm1                               #289.7
..LN900:
        vfnmadd231sd 80(%rsp), %xmm0, %xmm1                     #289.7
..LN901:
        vmovsd    %xmm1, 56(%rsp)                               #289.7
..LN902:
        jmp       ..B9.7        # Prob 100%                     #289.7
..LN903:
                                # LOE rbx rbp r12 r14 r15 r13d
..B9.6:                         # Preds ..B9.4
..LN904:
	.loc    1  296  is_stmt 1
        vmovsd    %xmm7, 64(%rsp)                               #296.19
..LN905:
        call      cos                                           #296.19
..LN906:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0
..B9.14:                        # Preds ..B9.6
..LN907:
        vmovsd    64(%rsp), %xmm7                               #
..LN908:
        vmovsd    %xmm0, 48(%rsp)                               #296.19
..LN909:
        vmovapd   %xmm7, %xmm0                                  #296.29
..LN910:
        call      cos                                           #296.29
..LN911:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0
..B9.13:                        # Preds ..B9.14
..LN912:
        vmovapd   %xmm0, %xmm1                                  #296.29
..LN913:
        vmovsd    48(%rsp), %xmm0                               #296.29
..LN914:
        vsubsd    %xmm1, %xmm0, %xmm2                           #296.29
..LN915:
        vmulsd    80(%rsp), %xmm2, %xmm3                        #296.29
..LN916:
        vdivsd    72(%rsp), %xmm3, %xmm4                        #296.46
..LN917:
        vaddsd    56(%rsp), %xmm4, %xmm5                        #296.7
..LN918:
        vmovsd    %xmm5, 56(%rsp)                               #296.7
..LN919:
                                # LOE rbx rbp r12 r14 r15 r13d
..B9.7:                         # Preds ..B9.12 ..B9.13 ..B9.3
..LN920:
	.loc    1  276  is_stmt 1
        incq      %r15                                          #276.16
..LN921:
        addq      $8, %r14                                      #276.16
..LN922:
        cmpq      %rbx, %r15                                    #276.14
..LN923:
        jl        ..B9.3        # Prob 82%                      #276.14
..LN924:
                                # LOE rbx rbp r12 r14 r15 r13d
..B9.8:                         # Preds ..B9.7
..LN925:
        vmovsd    56(%rsp), %xmm6                               #
..LN926:
        movq      40(%rsp), %r12                                #
	.cfi_restore 12
..LN927:
        movq      32(%rsp), %r13                                #
	.cfi_restore 13
..LN928:
        movq      24(%rsp), %r14                                #
	.cfi_restore 14
..LN929:
        movq      16(%rsp), %r15                                #
	.cfi_restore 15
..LN930:
        movq      8(%rsp), %rbx                                 #
	.cfi_restore 3
..LN931:
        movq      (%rsp), %rbp                                  #
	.cfi_restore 6
..LN932:
                                # LOE rbx rbp r12 r13 r14 r15 xmm6
..B9.9:                         # Preds ..B9.8 ..B9.1
..LN933:
	.loc    1  300  is_stmt 1
        vmulsd    .L_2il0floatpacket.7(%rip), %xmm6, %xmm0      #300.22
..LN934:
	.loc    1  300  epilogue_begin  is_stmt 1
        addq      $88, %rsp                                     #300.22
	.cfi_def_cfa_offset 8
..LN935:
        ret                                                     #300.22
..LN936:
        .align    16,0x90
	.cfi_endproc
..LN937:
                                # LOE
..LN938:
# mark_end;
	.type	poly_area,@function
	.size	poly_area,.-poly_area
..LNpoly_area.939:
.LNpoly_area:
	.data
# -- End  poly_area
	.text
.L_2__routine_start_poly_area_no_adjust_9:
# -- Begin  poly_area_no_adjust
	.text
# mark_begin;
       .align    16,0x90
	.globl poly_area_no_adjust
# --- poly_area_no_adjust(const double *, const double *, int)
poly_area_no_adjust:
# parameter 1(x): %rdi
# parameter 2(y): %rsi
# parameter 3(n): %edx
..B10.1:                        # Preds ..B10.0
	.cfi_startproc
..___tag_value_poly_area_no_adjust.198:
..L199:
                                                        #305.1
..LN940:
	.loc    1  305  is_stmt 1
        subq      $88, %rsp                                     #305.1
	.cfi_def_cfa_offset 96
..LN941:
        movl      %edx, %r8d                                    #305.1
..LN942:
	.loc    1  309  prologue_end  is_stmt 1
        xorl      %ecx, %ecx                                    #309.8
..LN943:
	.loc    1  306  is_stmt 1
        vxorpd    %xmm2, %xmm2, %xmm2                           #306.15
..LN944:
	.loc    1  309  is_stmt 1
        xorl      %edx, %edx                                    #309.8
..LN945:
	.loc    1  306  is_stmt 1
        vmovapd   %xmm2, %xmm3                                  #306.15
..LN946:
	.loc    1  309  is_stmt 1
        testl     %r8d, %r8d                                    #309.14
..LN947:
        jle       ..B10.9       # Prob 10%                      #309.14
..LN948:
                                # LOE rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d xmm2 xmm3
..B10.2:                        # Preds ..B10.1
..LN949:
        movslq    %r8d, %rax                                    #309.3
..LN950:
        vmovsd    %xmm3, 56(%rsp)                               #309.3
..LN951:
        movq      %r12, 40(%rsp)                                #309.3
	.cfi_offset 12, -56
..LN952:
        movq      %rsi, %r12                                    #309.3
..LN953:
        movq      %r13, 32(%rsp)                                #309.3
	.cfi_offset 13, -64
..LN954:
        movl      %r8d, %r13d                                   #309.3
..LN955:
        movq      %r14, 24(%rsp)                                #309.3
	.cfi_offset 14, -72
..LN956:
        movq      %rdx, %r14                                    #309.3
..LN957:
        movq      %r15, 16(%rsp)                                #309.3
	.cfi_offset 15, -80
..LN958:
        movq      %rcx, %r15                                    #309.3
..LN959:
        movq      %rbx, 8(%rsp)                                 #309.3
	.cfi_offset 3, -88
..LN960:
        movq      %rax, %rbx                                    #309.3
..LN961:
        movq      %rbp, (%rsp)                                  #309.3
	.cfi_offset 6, -96
..LN962:
        movq      %rdi, %rbp                                    #309.3
..LN963:
                                # LOE rbx rbp r12 r14 r15 r13d
..B10.3:                        # Preds ..B10.7 ..B10.2
..L208:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN964:
	.loc    1  310  is_stmt 1
        movl      %r15d, %eax                                   #310.22
..LN965:
        incl      %eax                                          #310.17
..LN966:
        cltd                                                    #310.22
..LN967:
        idivl     %r13d                                         #310.22
..LN968:
	.loc    1  316  is_stmt 1
        vxorpd    %xmm2, %xmm2, %xmm2                           #316.13
..LN969:
	.loc    1  310  is_stmt 1
        movslq    %edx, %rdx                                    #310.22
..LN970:
	.loc    1  315  is_stmt 1
        vmovsd    (%r14,%r12), %xmm4                            #315.12
..LN971:
	.loc    1  311  is_stmt 1
        vmovsd    (%rbp,%rdx,8), %xmm0                          #311.18
..LN972:
        vsubsd    (%r14,%rbp), %xmm0, %xmm1                     #311.24
..LN973:
        vmovsd    %xmm1, 80(%rsp)                               #311.24
..LN974:
	.loc    1  314  is_stmt 1
        vmovsd    (%r12,%rdx,8), %xmm0                          #314.12
..LN975:
	.loc    1  316  is_stmt 1
        vucomisd  %xmm2, %xmm1                                  #316.13
..LN976:
        jp        ..B10.4       # Prob 0%                       #316.13
..LN977:
        je        ..B10.7       # Prob 16%                      #316.13
..LN978:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0 xmm4
..B10.4:                        # Preds ..B10.3
..LN979:
	.loc    1  318  is_stmt 1
        vmovsd    .L_2il0floatpacket.0(%rip), %xmm2             #318.28
..LN980:
        vsubsd    %xmm4, %xmm0, %xmm1                           #318.20
..LN981:
        vandpd    .L_2il0floatpacket.2(%rip), %xmm1, %xmm3      #318.10
..LN982:
        vmovsd    %xmm1, 72(%rsp)                               #318.20
..LN983:
        vcomisd   %xmm3, %xmm2                                  #318.28
..LN984:
        jbe       ..B10.6       # Prob 50%                      #318.28
..LN985:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0 xmm4
..B10.5:                        # Preds ..B10.4
..LN986:
	.loc    1  319  is_stmt 1
        vaddsd    %xmm4, %xmm0, %xmm0                           #319.18
..LN987:
        vmulsd    .L_2il0floatpacket.6(%rip), %xmm0, %xmm0      #319.18
..LN988:
        call      sin                                           #319.18
..LN989:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0
..B10.12:                       # Preds ..B10.5
..LN990:
        vmovsd    56(%rsp), %xmm1                               #319.7
..LN991:
        vfnmadd231sd 80(%rsp), %xmm0, %xmm1                     #319.7
..LN992:
        vmovsd    %xmm1, 56(%rsp)                               #319.7
..LN993:
        jmp       ..B10.7       # Prob 100%                     #319.7
..LN994:
                                # LOE rbx rbp r12 r14 r15 r13d
..B10.6:                        # Preds ..B10.4
..LN995:
	.loc    1  321  is_stmt 1
        vmovsd    %xmm4, 64(%rsp)                               #321.19
..LN996:
        call      cos                                           #321.19
..LN997:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0
..B10.14:                       # Preds ..B10.6
..LN998:
        vmovsd    64(%rsp), %xmm4                               #
..LN999:
        vmovsd    %xmm0, 48(%rsp)                               #321.19
..LN1000:
        vmovapd   %xmm4, %xmm0                                  #321.29
..LN1001:
        call      cos                                           #321.29
..LN1002:
                                # LOE rbx rbp r12 r14 r15 r13d xmm0
..B10.13:                       # Preds ..B10.14
..LN1003:
        vmovapd   %xmm0, %xmm1                                  #321.29
..LN1004:
        vmovsd    48(%rsp), %xmm0                               #321.29
..LN1005:
        vsubsd    %xmm1, %xmm0, %xmm2                           #321.29
..LN1006:
        vmulsd    80(%rsp), %xmm2, %xmm3                        #321.29
..LN1007:
        vdivsd    72(%rsp), %xmm3, %xmm4                        #321.46
..LN1008:
        vaddsd    56(%rsp), %xmm4, %xmm5                        #321.7
..LN1009:
        vmovsd    %xmm5, 56(%rsp)                               #321.7
..LN1010:
                                # LOE rbx rbp r12 r14 r15 r13d
..B10.7:                        # Preds ..B10.12 ..B10.13 ..B10.3
..LN1011:
	.loc    1  309  is_stmt 1
        incq      %r15                                          #309.16
..LN1012:
        addq      $8, %r14                                      #309.16
..LN1013:
        cmpq      %rbx, %r15                                    #309.14
..LN1014:
        jl        ..B10.3       # Prob 82%                      #309.14
..LN1015:
                                # LOE rbx rbp r12 r14 r15 r13d
..B10.8:                        # Preds ..B10.7
..LN1016:
        vmovsd    56(%rsp), %xmm3                               #
..LN1017:
        movq      40(%rsp), %r12                                #
	.cfi_restore 12
..LN1018:
        movq      32(%rsp), %r13                                #
	.cfi_restore 13
..LN1019:
        movq      24(%rsp), %r14                                #
	.cfi_restore 14
..LN1020:
        movq      16(%rsp), %r15                                #
	.cfi_restore 15
..LN1021:
        movq      8(%rsp), %rbx                                 #
	.cfi_restore 3
..LN1022:
        movq      (%rsp), %rbp                                  #
	.cfi_restore 6
..LN1023:
                                # LOE rbx rbp r12 r13 r14 r15 xmm3
..B10.9:                        # Preds ..B10.8 ..B10.1
..LN1024:
	.loc    1  323  is_stmt 1
        vmulsd    .L_2il0floatpacket.7(%rip), %xmm3, %xmm0      #323.22
..LN1025:
	.loc    1  323  epilogue_begin  is_stmt 1
        addq      $88, %rsp                                     #323.22
	.cfi_def_cfa_offset 8
..LN1026:
        ret                                                     #323.22
..LN1027:
        .align    16,0x90
	.cfi_endproc
..LN1028:
                                # LOE
..LN1029:
# mark_end;
	.type	poly_area_no_adjust,@function
	.size	poly_area_no_adjust,.-poly_area_no_adjust
..LNpoly_area_no_adjust.1030:
.LNpoly_area_no_adjust:
	.data
# -- End  poly_area_no_adjust
	.text
.L_2__routine_start_delete_vtx_10:
# -- Begin  delete_vtx
	.text
# mark_begin;
       .align    16,0x90
	.globl delete_vtx
# --- delete_vtx(double *, double *, int, int)
delete_vtx:
# parameter 1(x): %rdi
# parameter 2(y): %rsi
# parameter 3(n): %edx
# parameter 4(n_del): %ecx
..B11.1:                        # Preds ..B11.0
	.cfi_startproc
..___tag_value_delete_vtx.221:
..L222:
                                                        #328.1
..LN1031:
	.loc    1  328  prologue_end  is_stmt 1
        movl      %edx, %r9d                                    #328.1
..LN1032:
        movl      %ecx, %r8d                                    #328.1
..LN1033:
	.loc    1  329  is_stmt 1
        lea       -1(%r9), %eax                                 #329.17
..LN1034:
        cmpl      %eax, %r8d                                    #329.17
..LN1035:
        jge       ..B11.8       # Prob 50%                      #329.17
..LN1036:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax r8d r9d
..B11.2:                        # Preds ..B11.1
..LN1037:
        subl      %r8d, %r9d                                    #329.3
..LN1038:
        movl      $1, %r10d                                     #329.3
..LN1039:
        xorl      %ecx, %ecx                                    #329.3
..LN1040:
        lea       -1(%r9), %edx                                 #329.3
..LN1041:
        movl      %edx, %r11d                                   #329.3
..LN1042:
        shrl      $31, %r11d                                    #329.3
..LN1043:
        lea       -1(%r9,%r11), %r11d                           #329.3
..LN1044:
        sarl      $1, %r11d                                     #329.3
..LN1045:
        testl     %r11d, %r11d                                  #329.3
..LN1046:
        jbe       ..B11.6       # Prob 9%                       #329.3
..LN1047:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax edx ecx r8d r10d r11d
..B11.3:                        # Preds ..B11.2
..LN1048:
	.loc    1  330  is_stmt 1
        movslq    %r8d, %r8                                     #330.16
..LN1049:
        movq      %rbx, -24(%rsp)                               #330.16
..LN1050:
        movq      %rbp, -16(%rsp)                               #330.16
..LN1051:
	.loc    1  331  is_stmt 1
        lea       (%rsi,%r8,8), %r10                            #331.16
..LN1052:
	.loc    1  330  is_stmt 1
        lea       (%rdi,%r8,8), %r9                             #330.16
	.cfi_offset 3, -32
	.cfi_offset 6, -24
..LN1053:
                                # LOE rsi rdi r9 r10 r12 r13 r14 r15 eax edx ecx r8d r11d
..B11.4:                        # Preds ..B11.4 ..B11.3
..L226:         # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1054:
        lea       (%rcx,%rcx), %ebx                             #330.16
..LN1055:
        movslq    %ebx, %rbx                                    #330.16
..LN1056:
	.loc    1  329  is_stmt 1
        incl      %ecx                                          #329.3
..LN1057:
	.loc    1  330  is_stmt 1
        movq      8(%r9,%rbx,8), %rbp                           #330.16
..LN1058:
        movq      %rbp, (%r9,%rbx,8)                            #330.5
..LN1059:
	.loc    1  331  is_stmt 1
        movq      8(%r10,%rbx,8), %rbp                          #331.16
..LN1060:
        movq      %rbp, (%r10,%rbx,8)                           #331.5
..LN1061:
	.loc    1  330  is_stmt 1
        movq      16(%r9,%rbx,8), %rbp                          #330.16
..LN1062:
        movq      %rbp, 8(%r9,%rbx,8)                           #330.5
..LN1063:
	.loc    1  331  is_stmt 1
        movq      16(%r10,%rbx,8), %rbp                         #331.16
..LN1064:
        movq      %rbp, 8(%r10,%rbx,8)                          #331.5
..LN1065:
	.loc    1  329  is_stmt 1
        cmpl      %r11d, %ecx                                   #329.3
..LN1066:
        jb        ..B11.4       # Prob 63%                      #329.3
..LN1067:
                                # LOE rsi rdi r9 r10 r12 r13 r14 r15 eax edx ecx r8d r11d
..B11.5:                        # Preds ..B11.4
..LN1068:
        movq      -24(%rsp), %rbx                               #
	.cfi_restore 3
..LN1069:
	.loc    1  330  is_stmt 1
        lea       1(%rcx,%rcx), %r10d                           #330.5
..LN1070:
        movq      -16(%rsp), %rbp                               #
	.cfi_restore 6
..LN1071:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax edx r8d r10d
..B11.6:                        # Preds ..B11.5 ..B11.2
..LN1072:
	.loc    1  329  is_stmt 1
        lea       -1(%r10), %ecx                                #329.3
..LN1073:
        cmpl      %ecx, %edx                                    #329.3
..LN1074:
        jbe       ..B11.8       # Prob 9%                       #329.3
..LN1075:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 eax r8d r10d
..B11.7:                        # Preds ..B11.6
..L229:         # optimization report
                # REMAINDER LOOP
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1076:
	.loc    1  330  is_stmt 1
        movslq    %r8d, %r8                                     #330.16
..LN1077:
        movslq    %r10d, %r10                                   #330.16
..LN1078:
	.loc    1  329  is_stmt 1
        addq      %r10, %r8                                     #329.3
..LN1079:
	.loc    1  330  is_stmt 1
        movq      (%rdi,%r8,8), %rdx                            #330.16
..LN1080:
        movq      %rdx, -8(%rdi,%r8,8)                          #330.5
..LN1081:
	.loc    1  331  is_stmt 1
        movq      (%rsi,%r8,8), %rdi                            #331.16
..LN1082:
        movq      %rdi, -8(%rsi,%r8,8)                          #331.5
..LN1083:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B11.8:                        # Preds ..B11.6 ..B11.1 ..B11.7
..LN1084:
	.loc    1  334  epilogue_begin  is_stmt 1
        ret                                                     #334.13
..LN1085:
        .align    16,0x90
	.cfi_endproc
..LN1086:
                                # LOE
..LN1087:
# mark_end;
	.type	delete_vtx,@function
	.size	delete_vtx,.-delete_vtx
..LNdelete_vtx.1088:
.LNdelete_vtx:
	.data
# -- End  delete_vtx
	.text
.L_2__routine_start_insert_vtx_11:
# -- Begin  insert_vtx
	.text
# mark_begin;
       .align    16,0x90
	.globl insert_vtx
# --- insert_vtx(double *, double *, int, int, double, double)
insert_vtx:
# parameter 1(x): %rdi
# parameter 2(y): %rsi
# parameter 3(n): %edx
# parameter 4(n_ins): %ecx
# parameter 5(lon_in): %xmm0
# parameter 6(lat_in): %xmm1
..B12.1:                        # Preds ..B12.0
	.cfi_startproc
..___tag_value_insert_vtx.234:
..L235:
                                                        #338.1
..LN1089:
	.loc    1  338  is_stmt 1
        pushq     %rbp                                          #338.1
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
..LN1090:
	.loc    1  341  prologue_end  is_stmt 1
        lea       -1(%rdx), %r8d                                #341.8
..LN1091:
	.loc    1  338  is_stmt 1
        movq      %rdi, %rax                                    #338.1
..LN1092:
	.loc    1  341  is_stmt 1
        cmpl      %r8d, %ecx                                    #341.17
..LN1093:
        jg        ..B12.8       # Prob 50%                      #341.17
..LN1094:
                                # LOE rax rbx rsi r12 r13 r14 r15 edx ecx xmm0 xmm1
..B12.2:                        # Preds ..B12.1
..LN1095:
        movl      %edx, %r9d                                    #341.3
..LN1096:
        xorl      %r11d, %r11d                                  #341.3
..LN1097:
        subl      %ecx, %r9d                                    #341.3
..LN1098:
        movl      $1, %ebp                                      #341.3
..LN1099:
        movl      %r9d, %r10d                                   #341.3
..LN1100:
	.loc    1  342  is_stmt 1
        xorl      %r8d, %r8d                                    #342.5
..LN1101:
	.loc    1  341  is_stmt 1
        shrl      $31, %r10d                                    #341.3
..LN1102:
        addl      %r9d, %r10d                                   #341.3
..LN1103:
        sarl      $1, %r10d                                     #341.3
..LN1104:
        testl     %r10d, %r10d                                  #341.3
..LN1105:
        jbe       ..B12.6       # Prob 9%                       #341.3
..LN1106:
                                # LOE rax rbx rsi r12 r13 r14 r15 edx ecx ebp r8d r9d r10d r11d xmm0 xmm1
..B12.3:                        # Preds ..B12.2
..LN1107:
	.loc    1  342  is_stmt 1
        movslq    %edx, %rdx                                    #342.14
..LN1108:
        movq      %r15, -16(%rsp)                               #342.14
..LN1109:
        movq      %rbx, -8(%rsp)                                #342.14
..LN1110:
	.loc    1  343  is_stmt 1
        lea       (%rsi,%rdx,8), %rdi                           #343.14
	.cfi_offset 3, -24
	.cfi_offset 15, -32
..LN1111:
	.loc    1  342  is_stmt 1
        lea       (%rax,%rdx,8), %rbp                           #342.14
..LN1112:
                                # LOE rax rbp rsi rdi r12 r13 r14 edx ecx r8d r9d r10d r11d xmm0 xmm1
..B12.4:                        # Preds ..B12.4 ..B12.3
..L241:         # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1113:
	.loc    1  341  is_stmt 1
        incl      %r11d                                         #341.3
..LN1114:
	.loc    1  342  is_stmt 1
        movslq    %r8d, %rbx                                    #342.14
..LN1115:
	.loc    1  341  is_stmt 1
        addl      $-2, %r8d                                     #341.3
..LN1116:
	.loc    1  342  is_stmt 1
        movq      -8(%rbp,%rbx,8), %r15                         #342.14
..LN1117:
        movq      %r15, (%rbp,%rbx,8)                           #342.5
..LN1118:
	.loc    1  343  is_stmt 1
        movq      -8(%rdi,%rbx,8), %r15                         #343.14
..LN1119:
        movq      %r15, (%rdi,%rbx,8)                           #343.5
..LN1120:
	.loc    1  342  is_stmt 1
        movq      -16(%rbp,%rbx,8), %r15                        #342.14
..LN1121:
        movq      %r15, -8(%rbp,%rbx,8)                         #342.5
..LN1122:
	.loc    1  343  is_stmt 1
        movq      -16(%rdi,%rbx,8), %r15                        #343.14
..LN1123:
        movq      %r15, -8(%rdi,%rbx,8)                         #343.5
..LN1124:
	.loc    1  341  is_stmt 1
        cmpl      %r10d, %r11d                                  #341.3
..LN1125:
        jb        ..B12.4       # Prob 63%                      #341.3
..LN1126:
                                # LOE rax rbp rsi rdi r12 r13 r14 edx ecx r8d r9d r10d r11d xmm0 xmm1
..B12.5:                        # Preds ..B12.4
..LN1127:
        movq      -16(%rsp), %r15                               #
	.cfi_restore 15
..LN1128:
	.loc    1  342  is_stmt 1
        lea       1(%r11,%r11), %ebp                            #342.5
..LN1129:
        movq      -8(%rsp), %rbx                                #
	.cfi_restore 3
..LN1130:
                                # LOE rax rbx rsi r12 r13 r14 r15 edx ecx ebp r9d xmm0 xmm1
..B12.6:                        # Preds ..B12.5 ..B12.2
..LN1131:
	.loc    1  341  is_stmt 1
        lea       -1(%rbp), %edi                                #341.3
..LN1132:
        cmpl      %edi, %r9d                                    #341.3
..LN1133:
        jbe       ..B12.8       # Prob 9%                       #341.3
..LN1134:
                                # LOE rax rbx rsi r12 r13 r14 r15 edx ecx ebp xmm0 xmm1
..B12.7:                        # Preds ..B12.6
..L244:         # optimization report
                # REMAINDER LOOP
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1135:
	.loc    1  342  is_stmt 1
        movslq    %edx, %r9                                     #342.14
..LN1136:
        movslq    %ebp, %rbp                                    #342.14
..LN1137:
        subq      %rbp, %r9                                     #342.14
..LN1138:
        movq      (%rax,%r9,8), %rdi                            #342.14
..LN1139:
        movq      %rdi, 8(%rax,%r9,8)                           #342.5
..LN1140:
	.loc    1  343  is_stmt 1
        movq      (%rsi,%r9,8), %r8                             #343.14
..LN1141:
        movq      %r8, 8(%rsi,%r9,8)                            #343.5
..LN1142:
                                # LOE rax rbx rsi r12 r13 r14 r15 edx ecx xmm0 xmm1
..B12.8:                        # Preds ..B12.6 ..B12.1 ..B12.7
..LN1143:
	.loc    1  346  is_stmt 1
        movslq    %ecx, %rcx                                    #346.3
..LN1144:
	.loc    1  348  is_stmt 1
        incl      %edx                                          #348.13
..LN1145:
	.loc    1  346  is_stmt 1
        vmovsd    %xmm0, (%rax,%rcx,8)                          #346.3
..LN1146:
	.loc    1  348  is_stmt 1
        movl      %edx, %eax                                    #348.13
..LN1147:
	.loc    1  347  is_stmt 1
        vmovsd    %xmm1, (%rsi,%rcx,8)                          #347.3
	.cfi_restore 6
..LN1148:
	.loc    1  348  epilogue_begin  is_stmt 1
        popq      %rbp                                          #348.13
	.cfi_def_cfa_offset 8
..LN1149:
        ret                                                     #348.13
..LN1150:
        .align    16,0x90
	.cfi_endproc
..LN1151:
                                # LOE
..LN1152:
# mark_end;
	.type	insert_vtx,@function
	.size	insert_vtx,.-insert_vtx
..LNinsert_vtx.1153:
.LNinsert_vtx:
	.data
# -- End  insert_vtx
	.text
.L_2__routine_start_v_print_12:
# -- Begin  v_print
	.text
# mark_begin;
       .align    16,0x90
	.globl v_print
# --- v_print(double *, double *, int)
v_print:
# parameter 1(x): %rdi
# parameter 2(y): %rsi
# parameter 3(n): %edx
..B13.1:                        # Preds ..B13.0
	.cfi_startproc
..___tag_value_v_print.251:
..L252:
                                                        #352.1
..LN1154:
	.loc    1  352  is_stmt 1
        subq      $40, %rsp                                     #352.1
	.cfi_def_cfa_offset 48
..LN1155:
	.loc    1  355  prologue_end  is_stmt 1
        xorl      %eax, %eax                                    #355.8
..LN1156:
	.loc    1  352  is_stmt 1
        movslq    %edx, %rdx                                    #352.1
..LN1157:
	.loc    1  355  is_stmt 1
        testq     %rdx, %rdx                                    #355.14
..LN1158:
        jle       ..B13.6       # Prob 10%                      #355.14
..LN1159:
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B13.2:                        # Preds ..B13.1
..LN1160:
        movq      %r12, 24(%rsp)                                #
	.cfi_offset 12, -24
..LN1161:
        movq      %rax, %r12                                    #
..LN1162:
        movq      %r13, 16(%rsp)                                #
	.cfi_offset 13, -32
..LN1163:
        movq      %rdx, %r13                                    #
..LN1164:
        movq      %r14, 8(%rsp)                                 #
	.cfi_offset 14, -40
..LN1165:
        movq      %rdi, %r14                                    #
..LN1166:
        movq      %r15, (%rsp)                                  #
	.cfi_offset 15, -48
..LN1167:
        movq      %rsi, %r15                                    #
..LN1168:
                                # LOE rbx rbp r12 r13 r14 r15
..B13.3:                        # Preds ..B13.4 ..B13.2
..L259:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1169:
        movl      $.L_2__STRING.5, %edi                         #355.21
..LN1170:
        movl      $2, %eax                                      #355.21
..LN1171:
        vmovsd    (%r14,%r12,8), %xmm0                          #355.21
..LN1172:
        vmovsd    (%r15,%r12,8), %xmm1                          #355.21
..___tag_value_v_print.260:
..LN1173:
#       printf(const char *__restrict__, ...)
        call      printf                                        #355.21
..___tag_value_v_print.261:
..LN1174:
                                # LOE rbx rbp r12 r13 r14 r15
..B13.4:                        # Preds ..B13.3
..LN1175:
        incq      %r12                                          #355.16
..LN1176:
        cmpq      %r13, %r12                                    #355.14
..LN1177:
        jl        ..B13.3       # Prob 82%                      #355.14
..LN1178:
                                # LOE rbx rbp r12 r13 r14 r15
..B13.5:                        # Preds ..B13.4
..LN1179:
        movq      24(%rsp), %r12                                #
	.cfi_restore 12
..LN1180:
        movq      16(%rsp), %r13                                #
	.cfi_restore 13
..LN1181:
        movq      8(%rsp), %r14                                 #
	.cfi_restore 14
..LN1182:
        movq      (%rsp), %r15                                  #
	.cfi_restore 15
..LN1183:
                                # LOE rbx rbp r12 r13 r14 r15
..B13.6:                        # Preds ..B13.5 ..B13.1
..LN1184:
	.loc    1  356  epilogue_begin  is_stmt 1
        addq      $40, %rsp                                     #356.1
	.cfi_def_cfa_offset 8
..LN1185:
        ret                                                     #356.1
..LN1186:
        .align    16,0x90
	.cfi_endproc
..LN1187:
                                # LOE
..LN1188:
# mark_end;
	.type	v_print,@function
	.size	v_print,.-v_print
..LNv_print.1189:
.LNv_print:
	.data
# -- End  v_print
	.text
.L_2__routine_start_fix_lon_13:
# -- Begin  fix_lon
	.text
# mark_begin;
       .align    16,0x90
	.globl fix_lon
# --- fix_lon(double *, double *, int, double)
fix_lon:
# parameter 1(x): %rdi
# parameter 2(y): %rsi
# parameter 3(n): %edx
# parameter 4(tlon): %xmm0
..B14.1:                        # Preds ..B14.0
	.cfi_startproc
..___tag_value_fix_lon.271:
..L272:
                                                        #359.1
..LN1190:
	.loc    1  359  prologue_end  is_stmt 1
        movl      %edx, %ecx                                    #359.1
..LN1191:
	.loc    1  371  is_stmt 1
        xorl      %r8d, %r8d                                    #371.8
..LN1192:
	.loc    1  359  is_stmt 1
        movq      %rsi, %r9                                     #359.1
..LN1193:
        vmovapd   %xmm0, %xmm1                                  #359.1
..LN1194:
	.loc    1  371  is_stmt 1
        xorl      %esi, %esi                                    #371.10
..LN1195:
        testl     %ecx, %ecx                                    #371.14
..LN1196:
        jle       ..B14.16      # Prob 15%                      #371.14
..LN1197:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 ecx esi r8d xmm1
..B14.2:                        # Preds ..B14.1
..LN1198:
        vmovsd    .L_2il0floatpacket.8(%rip), %xmm0             #371.38
..LN1199:
        movq      %r12, -32(%rsp)                               #371.38
..LN1200:
        movq      %r13, -40(%rsp)                               #371.38
..LN1201:
        movq      %r14, -48(%rsp)                               #371.38
..LN1202:
        movq      %r15, -56(%rsp)                               #371.38
..LN1203:
        movq      %rbx, -24(%rsp)                               #371.38
	.cfi_offset 3, -32
	.cfi_offset 12, -40
	.cfi_offset 13, -48
	.cfi_offset 14, -56
	.cfi_offset 15, -64
..LN1204:
                                # LOE rbp rdi r9 ecx esi r8d xmm0 xmm1
..B14.3:                        # Preds ..B14.14 ..B14.2
..L279:         # optimization report
                # %s was not vectorized: loop control variable %s was found, but loop iteration count cannot be computed before executing the loop
..LN1205:
	.loc    1  372  is_stmt 1
        lea       -1(%rsi), %r13d                               #372.31
..LN1206:
	.loc    1  371  is_stmt 1
        movslq    %r8d, %rbx                                    #371.31
..LN1207:
	.loc    1  372  is_stmt 1
        lea       1(%r8), %r14d                                 #372.31
..LN1208:
	.loc    1  371  is_stmt 1
        lea       (%r9,%rbx,8), %r10                            #371.31
..LN1209:
        vmovsd    (%r10), %xmm2                                 #371.31
..LN1210:
        lea       (,%rbx,8), %r12                               #371.31
..LN1211:
        vandpd    .L_2il0floatpacket.2(%rip), %xmm2, %xmm3      #371.26
..LN1212:
        vcomisd   %xmm0, %xmm3                                  #371.38
..LN1213:
        jb        ..B14.14      # Prob 50%                      #371.38
..LN1214:
                                # LOE rbx rbp rdi r9 r10 r12 ecx esi r8d r13d r14d xmm0 xmm1 xmm2
..B14.4:                        # Preds ..B14.3
..LN1215:
	.loc    1  372  is_stmt 1
        movl      %r14d, %eax                                   #372.34
..LN1216:
        cltd                                                    #372.34
..LN1217:
        idivl     %ecx                                          #372.34
..LN1218:
        movl      %edx, %r11d                                   #372.34
..LN1219:
	.loc    1  371  is_stmt 1
        lea       -1(%rcx,%r8), %eax                            #371.3
..LN1220:
	.loc    1  372  is_stmt 1
        cltd                                                    #372.21
..LN1221:
        idivl     %ecx                                          #372.21
..LN1222:
	.loc    1  374  is_stmt 1
        movslq    %edx, %rdx                                    #374.9
..LN1223:
        vmovsd    (%r9,%rdx,8), %xmm3                           #374.9
..LN1224:
        vucomisd  %xmm2, %xmm3                                  #374.16
..LN1225:
        jp        ..B14.5       # Prob 0%                       #374.16
..LN1226:
        je        ..B14.99      # Prob 16%                      #374.16
..LN1227:
                                # LOE rbx rbp rdi r9 r10 r12 ecx esi r8d r11d r13d r14d xmm0 xmm1 xmm2
..B14.5:                        # Preds ..B14.4
..LN1228:
	.loc    1  377  is_stmt 1
        movslq    %r11d, %r11                                   #377.31
..LN1229:
        vmovsd    (%r9,%r11,8), %xmm3                           #377.31
..LN1230:
        vucomisd  %xmm2, %xmm3                                  #377.38
..LN1231:
        jp        ..B14.6       # Prob 0%                       #377.38
..LN1232:
        je        ..B14.14      # Prob 40%                      #377.38
..LN1233:
                                # LOE rbx rbp rdi r9 r12 ecx esi r8d r13d r14d xmm0 xmm1 xmm2
..B14.6:                        # Preds ..B14.5
..LN1234:
	.loc    1  378  is_stmt 1
        movq      (%rdi,%r12), %r11                             #378.36
..LN1235:
	.loc    1  341  is_stmt 1
        lea       -1(%rcx), %r14d                               #341.12
..LN1236:
        cmpl      %r8d, %r14d                                   #341.17
..LN1237:
        jl        ..B14.13      # Prob 50%                      #341.17
..LN1238:
                                # LOE rbx rbp rdi r9 r11 ecx esi r8d r14d xmm0 xmm1 xmm2
..B14.7:                        # Preds ..B14.6
..LN1239:
        xorl      %r12d, %r12d                                  #341.3
..LN1240:
        lea       -1(%rsi,%rcx), %r10d                          #341.8
..LN1241:
        movl      $1, %edx                                      #341.3
..LN1242:
        lea       1(%r10), %r15d                                #341.3
..LN1243:
        movl      %r15d, %r13d                                  #341.3
..LN1244:
        shrl      $31, %r13d                                    #341.3
..LN1245:
        lea       1(%r10,%r13), %eax                            #341.3
..LN1246:
	.loc    1  342  is_stmt 1
        xorl      %r13d, %r13d                                  #342.5
..LN1247:
	.loc    1  341  is_stmt 1
        sarl      $1, %eax                                      #341.3
..LN1248:
        testl     %eax, %eax                                    #341.3
..LN1249:
        jbe       ..B14.11      # Prob 10%                      #341.3
..LN1250:
                                # LOE rbx rbp rdi r9 r11 eax edx ecx esi r8d r12d r13d r14d r15d xmm0 xmm1 xmm2
..B14.8:                        # Preds ..B14.7
..LN1251:
	.loc    1  342  is_stmt 1
        movslq    %r14d, %r14                                   #342.14
..LN1252:
        movq      %r9, -16(%rsp)                                #342.14
..LN1253:
        movl      %ecx, -8(%rsp)                                #342.14
..LN1254:
	.loc    1  343  is_stmt 1
        lea       (%r9,%r14,8), %rdx                            #343.14
..LN1255:
	.loc    1  342  is_stmt 1
        lea       (%rdi,%r14,8), %r10                           #342.14
..LN1256:
                                # LOE rdx rbx rbp rdi r10 r11 eax esi r8d r12d r13d r14d r15d xmm0 xmm1 xmm2
..B14.9:                        # Preds ..B14.9 ..B14.8
..L280:         # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1257:
	.loc    1  341  is_stmt 1
        incl      %r12d                                         #341.3
..LN1258:
	.loc    1  342  is_stmt 1
        movslq    %r13d, %rcx                                   #342.14
..LN1259:
	.loc    1  341  is_stmt 1
        addl      $-2, %r13d                                    #341.3
..LN1260:
	.loc    1  342  is_stmt 1
        movq      (%r10,%rcx,8), %r9                            #342.14
..LN1261:
        movq      %r9, 8(%r10,%rcx,8)                           #342.5
..LN1262:
	.loc    1  343  is_stmt 1
        movq      (%rdx,%rcx,8), %r9                            #343.14
..LN1263:
        movq      %r9, 8(%rdx,%rcx,8)                           #343.5
..LN1264:
	.loc    1  342  is_stmt 1
        movq      -8(%r10,%rcx,8), %r9                          #342.14
..LN1265:
        movq      %r9, (%r10,%rcx,8)                            #342.5
..LN1266:
	.loc    1  343  is_stmt 1
        movq      -8(%rdx,%rcx,8), %r9                          #343.14
..LN1267:
        movq      %r9, (%rdx,%rcx,8)                            #343.5
..LN1268:
	.loc    1  341  is_stmt 1
        cmpl      %eax, %r12d                                   #341.3
..LN1269:
        jb        ..B14.9       # Prob 64%                      #341.3
..LN1270:
                                # LOE rdx rbx rbp rdi r10 r11 eax esi r8d r12d r13d r14d r15d xmm0 xmm1 xmm2
..B14.10:                       # Preds ..B14.9
..LN1271:
        movq      -16(%rsp), %r9                                #
..LN1272:
	.loc    1  342  is_stmt 1
        lea       1(%r12,%r12), %edx                            #342.5
..LN1273:
        movl      -8(%rsp), %ecx                                #
..LN1274:
                                # LOE rbx rbp rdi r9 r11 edx ecx esi r8d r14d r15d xmm0 xmm1 xmm2
..B14.11:                       # Preds ..B14.10 ..B14.7
..LN1275:
	.loc    1  341  is_stmt 1
        lea       -1(%rdx), %r10d                               #341.3
..LN1276:
        cmpl      %r10d, %r15d                                  #341.3
..LN1277:
        jbe       ..B14.13      # Prob 10%                      #341.3
..LN1278:
                                # LOE rbx rbp rdi r9 r11 edx ecx esi r8d r14d xmm0 xmm1 xmm2
..B14.12:                       # Preds ..B14.11
..LN1279:
	.loc    1  342  is_stmt 1
        movslq    %r14d, %r14                                   #342.14
..LN1280:
        movslq    %edx, %rdx                                    #342.14
..LN1281:
        subq      %rdx, %r14                                    #342.14
..LN1282:
        movq      8(%rdi,%r14,8), %r10                          #342.14
..LN1283:
        movq      %r10, 16(%rdi,%r14,8)                         #342.5
..LN1284:
	.loc    1  343  is_stmt 1
        movq      8(%r9,%r14,8), %r12                           #343.14
..LN1285:
        movq      %r12, 16(%r9,%r14,8)                          #343.5
..LN1286:
                                # LOE rbx rbp rdi r9 r11 ecx esi r8d xmm0 xmm1 xmm2
..B14.13:                       # Preds ..B14.6 ..B14.11 ..B14.12
..LN1287:
	.loc    1  346  is_stmt 1
        movq      %r11, (%rdi,%rbx,8)                           #346.3
..LN1288:
	.loc    1  348  is_stmt 1
        incl      %ecx                                          #348.13
..LN1289:
	.loc    1  347  is_stmt 1
        vmovsd    %xmm2, (%r9,%rbx,8)                           #347.3
..LN1290:
	.loc    1  371  is_stmt 1
        lea       -2(%rsi), %r13d                               #371.17
..LN1291:
        lea       2(%r8), %r14d                                 #371.17
..LN1292:
                                # LOE rbp rdi r9 ecx r13d r14d xmm0 xmm1
..B14.14:                       # Preds ..B14.99 ..B14.3 ..B14.13 ..B14.5 ..B14.107
                                #      
..LN1293:
        movl      %r13d, %esi                                   #371.17
..LN1294:
        movl      %r14d, %r8d                                   #371.17
..LN1295:
        cmpl      %ecx, %r14d                                   #371.14
..LN1296:
        jl        ..B14.3       # Prob 82%                      #371.14
..LN1297:
                                # LOE rbp rdi r9 ecx esi r8d xmm0 xmm1
..B14.15:                       # Preds ..B14.14
..LN1298:
        movq      -32(%rsp), %r12                               #
	.cfi_restore 12
..LN1299:
        movq      -40(%rsp), %r13                               #
	.cfi_restore 13
..LN1300:
        movq      -48(%rsp), %r14                               #
	.cfi_restore 14
..LN1301:
        movq      -56(%rsp), %r15                               #
	.cfi_restore 15
..LN1302:
        movq      -24(%rsp), %rbx                               #
	.cfi_restore 3
..LN1303:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 ecx xmm1
..B14.16:                       # Preds ..B14.15 ..B14.1
..LN1304:
	.loc    1  384  is_stmt 1
        xorl      %r8d, %r8d                                    #384.3
..LN1305:
        testl     %ecx, %ecx                                    #384.14
..LN1306:
        jle       ..B14.97      # Prob 9%                       #384.14
..LN1307:
                                # LOE rbx rbp rdi r8 r9 r12 r13 r14 r15 ecx xmm1
..B14.17:                       # Preds ..B14.16
..LN1308:
        movslq    %ecx, %r10                                    #384.3
..LN1309:
        vmovsd    .L_2il0floatpacket.8(%rip), %xmm0             #384.38
..LN1310:
                                # LOE rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0 xmm1
..B14.18:                       # Preds ..B14.23 ..B14.17
..L286:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1311:
        vmovsd    (%r9,%r8,8), %xmm3                            #384.31
..LN1312:
        vandpd    .L_2il0floatpacket.2(%rip), %xmm3, %xmm2      #384.26
..LN1313:
        vcomisd   %xmm0, %xmm2                                  #384.38
..LN1314:
        jb        ..B14.23      # Prob 50%                      #384.38
..LN1315:
                                # LOE rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0 xmm1 xmm3
..B14.19:                       # Preds ..B14.18
..LN1316:
	.loc    1  385  is_stmt 1
        movl      %r8d, %esi                                    #385.21
..LN1317:
        lea       -1(%rcx,%rsi), %eax                           #385.18
..LN1318:
        cltd                                                    #385.21
..LN1319:
        idivl     %ecx                                          #385.21
..LN1320:
        movslq    %edx, %rdx                                    #385.21
..LN1321:
	.loc    1  387  is_stmt 1
        vmovsd    (%r9,%rdx,8), %xmm2                           #387.9
..LN1322:
        vucomisd  %xmm3, %xmm2                                  #387.16
..LN1323:
        jp        ..B14.20      # Prob 0%                       #387.16
..LN1324:
        je        ..B14.21      # Prob 16%                      #387.16
..LN1325:
                                # LOE rdx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx esi xmm0 xmm1 xmm3
..B14.20:                       # Preds ..B14.19
..LN1326:
        movq      (%rdi,%rdx,8), %rdx                           #387.29
..LN1327:
        movq      %rdx, (%rdi,%r8,8)                            #387.22
..LN1328:
	.loc    1  388  is_stmt 1
        vmovsd    (%r9,%r8,8), %xmm3                            #388.16
..LN1329:
                                # LOE rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx esi xmm0 xmm1 xmm3
..B14.21:                       # Preds ..B14.20 ..B14.19
..LN1330:
	.loc    1  385  is_stmt 1
        incl      %esi                                          #385.31
..LN1331:
        movl      %esi, %eax                                    #385.34
..LN1332:
        cltd                                                    #385.34
..LN1333:
        idivl     %ecx                                          #385.34
..LN1334:
        movslq    %edx, %rdx                                    #385.34
..LN1335:
	.loc    1  388  is_stmt 1
        vmovsd    (%r9,%rdx,8), %xmm2                           #388.9
..LN1336:
        vucomisd  %xmm3, %xmm2                                  #388.16
..LN1337:
        jp        ..B14.22      # Prob 0%                       #388.16
..LN1338:
        je        ..B14.23      # Prob 16%                      #388.16
..LN1339:
                                # LOE rdx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0 xmm1
..B14.22:                       # Preds ..B14.21
..LN1340:
        movq      (%rdi,%rdx,8), %rdx                           #388.29
..LN1341:
        movq      %rdx, (%rdi,%r8,8)                            #388.22
..LN1342:
                                # LOE rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0 xmm1
..B14.23:                       # Preds ..B14.18 ..B14.21 ..B14.22
..LN1343:
	.loc    1  384  is_stmt 1
        incq      %r8                                           #384.3
..LN1344:
        cmpq      %r10, %r8                                     #384.3
..LN1345:
        jb        ..B14.18      # Prob 81%                      #384.3
..LN1346:
                                # LOE rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 ecx xmm0 xmm1
..B14.25:                       # Preds ..B14.23 ..B14.97
..LN1347:
	.loc    1  391  is_stmt 1
        vmovsd    (%rdi), %xmm5                                 #391.19
..LN1348:
	.loc    1  392  is_stmt 1
        cmpl      $1, %ecx                                      #392.14
..LN1349:
        jle       ..B14.41      # Prob 50%                      #392.14
..LN1350:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx xmm1 xmm5
..B14.26:                       # Preds ..B14.25
..LN1351:
	.loc    1  395  is_stmt 1
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm0             #395.19
..LN1352:
	.loc    1  392  is_stmt 1
        lea       -1(%rcx), %edx                                #392.3
..LN1353:
        movl      %edx, %esi                                    #392.3
..LN1354:
        movl      $1, %r9d                                      #392.3
..LN1355:
        shrl      $31, %esi                                     #392.3
..LN1356:
        xorl      %r8d, %r8d                                    #392.3
..LN1357:
        lea       -1(%rcx,%rsi), %esi                           #392.3
..LN1358:
        sarl      $1, %esi                                      #392.3
..LN1359:
        testl     %esi, %esi                                    #392.3
..LN1360:
        jbe       ..B14.36      # Prob 9%                       #392.3
..LN1361:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d r9d xmm0 xmm1 xmm5
..B14.27:                       # Preds ..B14.26
..LN1362:
	.loc    1  396  is_stmt 1
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm3             #396.20
..LN1363:
	.loc    1  392  is_stmt 1
        vmovapd   %xmm5, %xmm4                                  #392.3
..LN1364:
	.loc    1  395  is_stmt 1
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm2             #395.36
..LN1365:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B14.28:                       # Preds ..B14.34 ..B14.27
..L287:         # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1366:
	.loc    1  393  is_stmt 1
        lea       (%r8,%r8), %r9d                               #393.17
..LN1367:
        movslq    %r9d, %r9                                     #393.17
..LN1368:
        vmovsd    8(%rdi,%r9,8), %xmm6                          #393.17
..LN1369:
        vsubsd    %xmm4, %xmm6, %xmm6                           #393.22
..LN1370:
	.loc    1  395  is_stmt 1
        vcomisd   %xmm6, %xmm0                                  #395.19
..LN1371:
        jbe       ..B14.30      # Prob 38%                      #395.19
..LN1372:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B14.29:                       # Preds ..B14.28
..LN1373:
        vaddsd    %xmm2, %xmm6, %xmm7                           #395.36
..LN1374:
        jmp       ..B14.31      # Prob 100%                     #395.36
..LN1375:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm7
..B14.30:                       # Preds ..B14.28
..LN1376:
	.loc    1  396  is_stmt 1
        vcomisd   %xmm3, %xmm6                                  #396.26
..LN1377:
        vsubsd    %xmm2, %xmm6, %xmm7                           #396.36
..LN1378:
        ja        ..L288        # Prob 50%                      #396.26
..LN1379:
        vmovaps   %xmm6, %xmm7                                  #396.26
..L288:                                                         #
..LN1380:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm7
..B14.31:                       # Preds ..B14.29 ..B14.30
..LN1381:
	.loc    1  397  is_stmt 1
        vaddsd    %xmm7, %xmm4, %xmm6                           #397.31
..LN1382:
	.loc    1  393  is_stmt 1
        vmovsd    16(%rdi,%r9,8), %xmm4                         #393.17
..LN1383:
	.loc    1  397  is_stmt 1
        vmovsd    %xmm6, 8(%rdi,%r9,8)                          #397.15
..LN1384:
	.loc    1  393  is_stmt 1
        vsubsd    %xmm6, %xmm4, %xmm4                           #393.22
..LN1385:
	.loc    1  397  is_stmt 1
        vaddsd    %xmm6, %xmm5, %xmm7                           #397.5
..LN1386:
	.loc    1  395  is_stmt 1
        vcomisd   %xmm4, %xmm0                                  #395.19
..LN1387:
        jbe       ..B14.33      # Prob 38%                      #395.19
..LN1388:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm4 xmm6 xmm7
..B14.32:                       # Preds ..B14.31
..LN1389:
        vaddsd    %xmm2, %xmm4, %xmm5                           #395.36
..LN1390:
        jmp       ..B14.34      # Prob 100%                     #395.36
..LN1391:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm5 xmm6 xmm7
..B14.33:                       # Preds ..B14.31
..LN1392:
	.loc    1  396  is_stmt 1
        vcomisd   %xmm3, %xmm4                                  #396.26
..LN1393:
        vsubsd    %xmm2, %xmm4, %xmm5                           #396.36
..LN1394:
        ja        ..L289        # Prob 50%                      #396.26
..LN1395:
        vmovaps   %xmm4, %xmm5                                  #396.26
..L289:                                                         #
..LN1396:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm5 xmm6 xmm7
..B14.34:                       # Preds ..B14.32 ..B14.33
..LN1397:
	.loc    1  392  is_stmt 1
        incl      %r8d                                          #392.3
..LN1398:
	.loc    1  397  is_stmt 1
        vaddsd    %xmm5, %xmm6, %xmm4                           #397.31
..LN1399:
        vmovsd    %xmm4, 16(%rdi,%r9,8)                         #397.15
..LN1400:
        vaddsd    %xmm4, %xmm7, %xmm5                           #397.5
..LN1401:
	.loc    1  392  is_stmt 1
        cmpl      %esi, %r8d                                    #392.3
..LN1402:
        jb        ..B14.28      # Prob 63%                      #392.3
..LN1403:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx esi r8d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5
..B14.35:                       # Preds ..B14.34
..LN1404:
	.loc    1  393  is_stmt 1
        lea       1(%r8,%r8), %r9d                              #393.22
..LN1405:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx ecx r9d xmm0 xmm1 xmm5
..B14.36:                       # Preds ..B14.26 ..B14.35
..LN1406:
	.loc    1  392  is_stmt 1
        lea       -1(%r9), %esi                                 #392.3
..LN1407:
        cmpl      %esi, %edx                                    #392.3
..LN1408:
        jbe       ..B14.42      # Prob 9%                       #392.3
..LN1409:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx r9d xmm0 xmm1 xmm5
..B14.37:                       # Preds ..B14.36
..L290:         # optimization report
                # REMAINDER LOOP
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1410:
	.loc    1  393  is_stmt 1
        movslq    %r9d, %r9                                     #393.17
..LN1411:
        vmovsd    -8(%rdi,%r9,8), %xmm4                         #393.22
..LN1412:
        vmovsd    (%rdi,%r9,8), %xmm2                           #393.17
..LN1413:
        vsubsd    %xmm4, %xmm2, %xmm2                           #393.22
..LN1414:
	.loc    1  395  is_stmt 1
        vcomisd   %xmm2, %xmm0                                  #395.19
..LN1415:
        jbe       ..B14.39      # Prob 38%                      #395.19
..LN1416:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 ecx xmm0 xmm1 xmm2 xmm4 xmm5
..B14.38:                       # Preds ..B14.37
..LN1417:
        vaddsd    .L_2il0floatpacket.1(%rip), %xmm2, %xmm3      #395.36
..LN1418:
        jmp       ..B14.40      # Prob 100%                     #395.36
..LN1419:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 ecx xmm0 xmm1 xmm3 xmm4 xmm5
..B14.39:                       # Preds ..B14.37
..LN1420:
	.loc    1  396  is_stmt 1
        vcomisd   .L_2il0floatpacket.3(%rip), %xmm2             #396.26
..LN1421:
        vsubsd    .L_2il0floatpacket.1(%rip), %xmm2, %xmm3      #396.36
..LN1422:
        ja        ..L291        # Prob 50%                      #396.26
..LN1423:
        vmovaps   %xmm2, %xmm3                                  #396.26
..L291:                                                         #
..LN1424:
                                # LOE rbx rbp rdi r9 r12 r13 r14 r15 ecx xmm0 xmm1 xmm3 xmm4 xmm5
..B14.40:                       # Preds ..B14.38 ..B14.39
..LN1425:
	.loc    1  397  is_stmt 1
        vaddsd    %xmm4, %xmm3, %xmm2                           #397.31
..LN1426:
        vmovsd    %xmm2, (%rdi,%r9,8)                           #397.15
..LN1427:
        vaddsd    %xmm2, %xmm5, %xmm5                           #397.5
..LN1428:
        jmp       ..B14.42      # Prob 100%                     #397.5
..LN1429:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx xmm0 xmm1 xmm5
..B14.41:                       # Preds ..B14.25
..LN1430:
	.loc    1  401  is_stmt 1
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm0             #401.17
..LN1431:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx xmm0 xmm1 xmm5
..B14.42:                       # Preds ..B14.40 ..B14.36 ..B14.41
..LN1432:
	.loc    1  400  is_stmt 1
        vxorpd    %xmm2, %xmm2, %xmm2                           #400.15
..LN1433:
        vcvtsi2sd %ecx, %xmm2, %xmm2                            #400.15
..LN1434:
        vdivsd    %xmm2, %xmm5, %xmm3                           #400.15
..LN1435:
        vsubsd    %xmm1, %xmm3, %xmm1                           #400.19
..LN1436:
	.loc    1  401  is_stmt 1
        vcomisd   %xmm1, %xmm0                                  #401.17
..LN1437:
        jbe       ..B14.65      # Prob 50%                      #401.17
..LN1438:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx xmm1
..B14.43:                       # Preds ..B14.42
..LN1439:
        testl     %ecx, %ecx                                    #401.35
..LN1440:
        jle       ..B14.88      # Prob 50%                      #401.35
..LN1441:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx
..B14.44:                       # Preds ..B14.43
..LN1442:
        cmpl      $16, %ecx                                     #401.24
..LN1443:
        jl        ..B14.90      # Prob 10%                      #401.24
..LN1444:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx
..B14.45:                       # Preds ..B14.44
..LN1445:
        movq      %rdi, %rsi                                    #401.24
..LN1446:
        andq      $31, %rsi                                     #401.24
..LN1447:
        movl      %esi, %esi                                    #401.24
..LN1448:
        testl     %esi, %esi                                    #401.24
..LN1449:
        je        ..B14.48      # Prob 50%                      #401.24
..LN1450:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.46:                       # Preds ..B14.45
..LN1451:
        testl     $7, %esi                                      #401.24
..LN1452:
        jne       ..B14.90      # Prob 10%                      #401.24
..LN1453:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.47:                       # Preds ..B14.46
..LN1454:
        negl      %esi                                          #401.24
..LN1455:
        addl      $32, %esi                                     #401.24
..LN1456:
        shrl      $3, %esi                                      #401.24
..LN1457:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.48:                       # Preds ..B14.47 ..B14.45
..LN1458:
        lea       16(%rsi), %edx                                #401.24
..LN1459:
        cmpl      %edx, %ecx                                    #401.24
..LN1460:
        jl        ..B14.90      # Prob 10%                      #401.24
..LN1461:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.49:                       # Preds ..B14.48
..LN1462:
        movl      %ecx, %r8d                                    #401.24
..LN1463:
        xorl      %edx, %edx                                    #401.24
..LN1464:
        subl      %esi, %r8d                                    #401.24
..LN1465:
        andl      $15, %r8d                                     #401.24
..LN1466:
        negl      %r8d                                          #401.24
..LN1467:
        addl      %ecx, %r8d                                    #401.24
..LN1468:
        testq     %rsi, %rsi                                    #401.24
..LN1469:
        jbe       ..B14.53      # Prob 10%                      #401.24
..LN1470:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.50:                       # Preds ..B14.49
..LN1471:
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #401.51
..LN1472:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d xmm0
..B14.51:                       # Preds ..B14.51 ..B14.50
..L292:         # optimization report
                # LOOP WAS UNROLLED BY 4
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 5.652344
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.500000
..LN1473:
        vaddsd    (%rdi,%rdx,8), %xmm0, %xmm1                   #401.43
..LN1474:
        vmovsd    %xmm1, (%rdi,%rdx,8)                          #401.43
..LN1475:
        incq      %rdx                                          #401.24
..LN1476:
        cmpq      %rsi, %rdx                                    #401.24
..LN1477:
        jb        ..B14.51      # Prob 82%                      #401.24
..LN1478:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d xmm0
..B14.53:                       # Preds ..B14.51 ..B14.49
..LN1479:
        vmovupd   .L_2il0floatpacket.10(%rip), %ymm0            #401.51
..LN1480:
        movslq    %r8d, %rdx                                    #401.24
..LN1481:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d ymm0
..B14.54:                       # Preds ..B14.54 ..B14.53
..L293:         # optimization report
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 5.652344
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN1482:
        vaddpd    (%rdi,%rsi,8), %ymm0, %ymm1                   #401.43
..LN1483:
        vaddpd    32(%rdi,%rsi,8), %ymm0, %ymm2                 #401.43
..LN1484:
        vaddpd    64(%rdi,%rsi,8), %ymm0, %ymm3                 #401.43
..LN1485:
        vaddpd    96(%rdi,%rsi,8), %ymm0, %ymm4                 #401.43
..LN1486:
        vmovupd   %ymm1, (%rdi,%rsi,8)                          #401.43
..LN1487:
        vmovupd   %ymm2, 32(%rdi,%rsi,8)                        #401.43
..LN1488:
        vmovupd   %ymm3, 64(%rdi,%rsi,8)                        #401.43
..LN1489:
        vmovupd   %ymm4, 96(%rdi,%rsi,8)                        #401.43
..LN1490:
        addq      $16, %rsi                                     #401.24
..LN1491:
        cmpq      %rdx, %rsi                                    #401.24
..LN1492:
        jb        ..B14.54      # Prob 82%                      #401.24
..LN1493:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d ymm0
..B14.56:                       # Preds ..B14.54 ..B14.90
..LN1494:
        lea       1(%r8), %edx                                  #401.24
..LN1495:
        cmpl      %edx, %ecx                                    #401.24
..LN1496:
        jb        ..B14.88      # Prob 50%                      #401.24
..LN1497:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx r8d
..B14.57:                       # Preds ..B14.56
..LN1498:
        movslq    %ecx, %rsi                                    #401.24
..LN1499:
        movslq    %r8d, %r8                                     #401.24
..LN1500:
        subq      %r8, %rsi                                     #401.24
..LN1501:
        cmpq      $4, %rsi                                      #401.24
..LN1502:
        jl        ..B14.89      # Prob 10%                      #401.24
..LN1503:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.58:                       # Preds ..B14.57
..LN1504:
        movslq    %r8d, %r8                                     #401.43
..LN1505:
        movl      %esi, %edx                                    #401.24
..LN1506:
        andl      $-4, %edx                                     #401.24
..LN1507:
        xorl      %r10d, %r10d                                  #401.24
..LN1508:
        movslq    %edx, %rdx                                    #401.24
..LN1509:
        vmovupd   .L_2il0floatpacket.9(%rip), %ymm0             #401.51
..LN1510:
        lea       (%rdi,%r8,8), %r9                             #401.43
..LN1511:
                                # LOE rdx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 ecx r8d ymm0
..B14.59:                       # Preds ..B14.59 ..B14.58
..L294:         # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 2.015625
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 2.000000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN1512:
        addq      $4, %r10                                      #401.24
..LN1513:
        vaddpd    (%r9), %ymm0, %ymm1                           #401.43
..LN1514:
        vmovupd   %ymm1, (%r9)                                  #401.43
..LN1515:
        addq      $32, %r9                                      #401.24
..LN1516:
        cmpq      %rdx, %r10                                    #401.24
..LN1517:
        jb        ..B14.59      # Prob 82%                      #401.24
..LN1518:
                                # LOE rdx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 ecx r8d ymm0
..B14.61:                       # Preds ..B14.59 ..B14.89
..LN1519:
        cmpq      %rsi, %rdx                                    #401.24
..LN1520:
        jae       ..B14.88      # Prob 10%                      #401.24
..LN1521:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.62:                       # Preds ..B14.61
..LN1522:
        movslq    %r8d, %r8                                     #401.43
..LN1523:
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #401.51
..LN1524:
        lea       (%rdi,%r8,8), %rdi                            #401.43
..LN1525:
        lea       (%rdi,%rdx,8), %rdi                           #401.43
..LN1526:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx xmm0
..B14.63:                       # Preds ..B14.63 ..B14.62
..L295:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 2.015625
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 2.000000
..LN1527:
        incq      %rdx                                          #401.24
..LN1528:
        vaddsd    (%rdi), %xmm0, %xmm1                          #401.43
..LN1529:
        vmovsd    %xmm1, (%rdi)                                 #401.43
..LN1530:
        addq      $8, %rdi                                      #401.24
..LN1531:
        cmpq      %rsi, %rdx                                    #401.24
..LN1532:
        jb        ..B14.63      # Prob 82%                      #401.24
..LN1533:
        jmp       ..B14.88      # Prob 100%                     #401.24
..LN1534:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx xmm0
..B14.65:                       # Preds ..B14.42
..LN1535:
	.loc    1  402  is_stmt 1
        vcomisd   .L_2il0floatpacket.3(%rip), %xmm1             #402.18
..LN1536:
        jbe       ..B14.88      # Prob 50%                      #402.18
..LN1537:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx
..B14.66:                       # Preds ..B14.65
..LN1538:
        testl     %ecx, %ecx                                    #402.35
..LN1539:
        jle       ..B14.88      # Prob 50%                      #402.35
..LN1540:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx
..B14.67:                       # Preds ..B14.66
..LN1541:
        cmpl      $16, %ecx                                     #402.24
..LN1542:
        jl        ..B14.94      # Prob 10%                      #402.24
..LN1543:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx
..B14.68:                       # Preds ..B14.67
..LN1544:
        movq      %rdi, %rsi                                    #402.24
..LN1545:
        andq      $31, %rsi                                     #402.24
..LN1546:
        movl      %esi, %esi                                    #402.24
..LN1547:
        testl     %esi, %esi                                    #402.24
..LN1548:
        je        ..B14.71      # Prob 50%                      #402.24
..LN1549:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.69:                       # Preds ..B14.68
..LN1550:
        testl     $7, %esi                                      #402.24
..LN1551:
        jne       ..B14.94      # Prob 10%                      #402.24
..LN1552:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.70:                       # Preds ..B14.69
..LN1553:
        negl      %esi                                          #402.24
..LN1554:
        addl      $32, %esi                                     #402.24
..LN1555:
        shrl      $3, %esi                                      #402.24
..LN1556:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.71:                       # Preds ..B14.70 ..B14.68
..LN1557:
        lea       16(%rsi), %edx                                #402.24
..LN1558:
        cmpl      %edx, %ecx                                    #402.24
..LN1559:
        jl        ..B14.94      # Prob 10%                      #402.24
..LN1560:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx
..B14.72:                       # Preds ..B14.71
..LN1561:
        movl      %ecx, %r8d                                    #402.24
..LN1562:
        xorl      %edx, %edx                                    #402.24
..LN1563:
        subl      %esi, %r8d                                    #402.24
..LN1564:
        andl      $15, %r8d                                     #402.24
..LN1565:
        negl      %r8d                                          #402.24
..LN1566:
        addl      %ecx, %r8d                                    #402.24
..LN1567:
        testq     %rsi, %rsi                                    #402.24
..LN1568:
        jbe       ..B14.76      # Prob 10%                      #402.24
..LN1569:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.73:                       # Preds ..B14.72
..LN1570:
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #402.51
..LN1571:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d xmm0
..B14.74:                       # Preds ..B14.74 ..B14.73
..L296:         # optimization report
                # LOOP WAS UNROLLED BY 4
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 5.652344
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.500000
..LN1572:
        vmovsd    (%rdi,%rdx,8), %xmm1                          #402.43
..LN1573:
        vsubsd    %xmm0, %xmm1, %xmm2                           #402.43
..LN1574:
        vmovsd    %xmm2, (%rdi,%rdx,8)                          #402.43
..LN1575:
        incq      %rdx                                          #402.24
..LN1576:
        cmpq      %rsi, %rdx                                    #402.24
..LN1577:
        jb        ..B14.74      # Prob 82%                      #402.24
..LN1578:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d xmm0
..B14.76:                       # Preds ..B14.74 ..B14.72
..LN1579:
        vmovupd   .L_2il0floatpacket.10(%rip), %ymm0            #402.51
..LN1580:
        movslq    %r8d, %rdx                                    #402.24
..LN1581:
        .align    16,0x90
..LN1582:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d ymm0
..B14.77:                       # Preds ..B14.77 ..B14.76
..L297:         # optimization report
                # LOOP WAS UNROLLED BY 4
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 5.652344
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.500000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN1583:
        vmovupd   (%rdi,%rsi,8), %ymm1                          #402.43
..LN1584:
        vmovupd   32(%rdi,%rsi,8), %ymm3                        #402.43
..LN1585:
        vmovupd   64(%rdi,%rsi,8), %ymm5                        #402.43
..LN1586:
        vmovupd   96(%rdi,%rsi,8), %ymm7                        #402.43
..LN1587:
        vsubpd    %ymm0, %ymm1, %ymm2                           #402.43
..LN1588:
        vsubpd    %ymm0, %ymm3, %ymm4                           #402.43
..LN1589:
        vsubpd    %ymm0, %ymm5, %ymm6                           #402.43
..LN1590:
        vsubpd    %ymm0, %ymm7, %ymm8                           #402.43
..LN1591:
        vmovupd   %ymm2, (%rdi,%rsi,8)                          #402.43
..LN1592:
        vmovupd   %ymm4, 32(%rdi,%rsi,8)                        #402.43
..LN1593:
        vmovupd   %ymm6, 64(%rdi,%rsi,8)                        #402.43
..LN1594:
        vmovupd   %ymm8, 96(%rdi,%rsi,8)                        #402.43
..LN1595:
        addq      $16, %rsi                                     #402.24
..LN1596:
        cmpq      %rdx, %rsi                                    #402.24
..LN1597:
        jb        ..B14.77      # Prob 82%                      #402.24
..LN1598:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d ymm0
..B14.79:                       # Preds ..B14.77 ..B14.94
..LN1599:
        lea       1(%r8), %edx                                  #402.24
..LN1600:
        cmpl      %edx, %ecx                                    #402.24
..LN1601:
        jb        ..B14.88      # Prob 50%                      #402.24
..LN1602:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx r8d
..B14.80:                       # Preds ..B14.79
..LN1603:
        movslq    %ecx, %rsi                                    #402.24
..LN1604:
        movslq    %r8d, %r8                                     #402.24
..LN1605:
        subq      %r8, %rsi                                     #402.24
..LN1606:
        cmpq      $4, %rsi                                      #402.24
..LN1607:
        jl        ..B14.93      # Prob 10%                      #402.24
..LN1608:
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.81:                       # Preds ..B14.80
..LN1609:
        movslq    %r8d, %r8                                     #402.43
..LN1610:
        movl      %esi, %edx                                    #402.24
..LN1611:
        andl      $-4, %edx                                     #402.24
..LN1612:
        xorl      %r10d, %r10d                                  #402.24
..LN1613:
        movslq    %edx, %rdx                                    #402.24
..LN1614:
        vmovupd   .L_2il0floatpacket.9(%rip), %ymm0             #402.51
..LN1615:
        lea       (%rdi,%r8,8), %r9                             #402.43
..LN1616:
                                # LOE rdx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 ecx r8d ymm0
..B14.82:                       # Preds ..B14.82 ..B14.81
..L298:         # optimization report
                # LOOP WAS VECTORIZED
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 2.015625
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 2.000000
                # MAIN VECTOR TYPE: 64-bits floating point
..LN1617:
        addq      $4, %r10                                      #402.24
..LN1618:
        vmovupd   (%r9), %ymm1                                  #402.43
..LN1619:
        vsubpd    %ymm0, %ymm1, %ymm2                           #402.43
..LN1620:
        vmovupd   %ymm2, (%r9)                                  #402.43
..LN1621:
        addq      $32, %r9                                      #402.24
..LN1622:
        cmpq      %rdx, %r10                                    #402.24
..LN1623:
        jb        ..B14.82      # Prob 82%                      #402.24
..LN1624:
                                # LOE rdx rbx rbp rsi rdi r9 r10 r12 r13 r14 r15 ecx r8d ymm0
..B14.84:                       # Preds ..B14.82 ..B14.93
..LN1625:
        cmpq      %rsi, %rdx                                    #402.24
..LN1626:
        jae       ..B14.88      # Prob 10%                      #402.24
..LN1627:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.85:                       # Preds ..B14.84
..LN1628:
        movslq    %r8d, %r8                                     #402.43
..LN1629:
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #402.51
..LN1630:
        lea       (%rdi,%r8,8), %rdi                            #402.43
..LN1631:
        lea       (%rdi,%rdx,8), %rdi                           #402.43
..LN1632:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx xmm0
..B14.86:                       # Preds ..B14.86 ..B14.85
..L299:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 2.015625
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 2.000000
..LN1633:
        incq      %rdx                                          #402.24
..LN1634:
        vmovsd    (%rdi), %xmm1                                 #402.43
..LN1635:
        vsubsd    %xmm0, %xmm1, %xmm2                           #402.43
..LN1636:
        vmovsd    %xmm2, (%rdi)                                 #402.43
..LN1637:
        addq      $8, %rdi                                      #402.24
..LN1638:
        cmpq      %rsi, %rdx                                    #402.24
..LN1639:
        jb        ..B14.86      # Prob 82%                      #402.24
..LN1640:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx xmm0
..B14.88:                       # Preds ..B14.86 ..B14.63 ..B14.61 ..B14.56 ..B14.79
                                #       ..B14.84 ..B14.43 ..B14.65 ..B14.66
..LN1641:
	.loc    1  410  is_stmt 1
        vzeroupper                                              #410.10
..LN1642:
        movl      %ecx, %eax                                    #410.10
..LN1643:
	.loc    1  410  epilogue_begin  is_stmt 1
        ret                                                     #410.10
..LN1644:
                                # LOE
..B14.89:                       # Preds ..B14.57                # Infreq
..LN1645:
	.loc    1  401  is_stmt 1
        xorl      %edx, %edx                                    #401.24
..LN1646:
        jmp       ..B14.61      # Prob 100%                     #401.24
..LN1647:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.90:                       # Preds ..B14.44 ..B14.46 ..B14.48 # Infreq
..LN1648:
        xorl      %r8d, %r8d                                    #401.24
..LN1649:
        jmp       ..B14.56      # Prob 100%                     #401.24
..LN1650:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx r8d
..B14.93:                       # Preds ..B14.80                # Infreq
..LN1651:
	.loc    1  402  is_stmt 1
        xorl      %edx, %edx                                    #402.24
..LN1652:
        jmp       ..B14.84      # Prob 100%                     #402.24
..LN1653:
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx r8d
..B14.94:                       # Preds ..B14.67 ..B14.69 ..B14.71 # Infreq
..LN1654:
        xorl      %r8d, %r8d                                    #402.24
..LN1655:
        jmp       ..B14.79      # Prob 100%                     #402.24
..LN1656:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx r8d
..B14.97:                       # Preds ..B14.16                # Infreq
..LN1657:
	.loc    1  391  is_stmt 1
        jne       ..B14.25      # Prob 72%                      #391.7
..LN1658:
                                # LOE rbx rbp rdi r12 r13 r14 r15 ecx xmm1
..B14.98:                       # Preds ..B14.97                # Infreq
..LN1659:
        xorl      %eax, %eax                                    #391.36
..LN1660:
	.loc    1  391  epilogue_begin  is_stmt 1
        ret                                                     #391.36
	.cfi_offset 3, -32
	.cfi_offset 12, -40
	.cfi_offset 13, -48
	.cfi_offset 14, -56
	.cfi_offset 15, -64
..LN1661:
                                # LOE
..B14.99:                       # Preds ..B14.4                 # Infreq
..LN1662:
	.loc    1  374  is_stmt 1
        movslq    %r11d, %r11                                   #374.24
..LN1663:
        vmovsd    (%r9,%r11,8), %xmm3                           #374.24
..LN1664:
        vucomisd  %xmm2, %xmm3                                  #374.31
..LN1665:
        jne       ..B14.14      # Prob 94%                      #374.31
..LN1666:
        jp        ..B14.14      # Prob 0%                       #374.31
..LN1667:
                                # LOE rbx rbp rdi r9 r10 ecx esi r8d r13d r14d xmm0 xmm1
..B14.100:                      # Preds ..B14.99                # Infreq
..LN1668:
	.loc    1  329  is_stmt 1
        lea       -1(%rcx), %r13d                               #329.17
..LN1669:
        cmpl      %r13d, %r8d                                   #329.17
..LN1670:
        jge       ..B14.107     # Prob 50%                      #329.17
..LN1671:
                                # LOE rbx rbp rdi r9 r10 ecx esi r8d r13d xmm0 xmm1
..B14.101:                      # Preds ..B14.100               # Infreq
..LN1672:
        movl      $1, %edx                                      #329.3
..LN1673:
	.loc    1  371  is_stmt 1
        lea       (%rcx,%rsi), %r11d                            #371.3
..LN1674:
	.loc    1  329  is_stmt 1
        xorl      %r12d, %r12d                                  #329.3
..LN1675:
        lea       -1(%rcx,%rsi), %ecx                           #329.3
..LN1676:
        movl      %ecx, %eax                                    #329.3
..LN1677:
        shrl      $31, %eax                                     #329.3
..LN1678:
        lea       -1(%r11,%rax), %r11d                          #329.3
..LN1679:
        sarl      $1, %r11d                                     #329.3
..LN1680:
        testl     %r11d, %r11d                                  #329.3
..LN1681:
        jbe       ..B14.105     # Prob 10%                      #329.3
..LN1682:
                                # LOE rbx rbp rdi r9 r10 edx ecx esi r8d r11d r12d r13d xmm0 xmm1
..B14.102:                      # Preds ..B14.101               # Infreq
..LN1683:
	.loc    1  330  is_stmt 1
        lea       (%rdi,%rbx,8), %rdx                           #330.16
..LN1684:
                                # LOE rdx rbx rbp rdi r9 r10 ecx esi r8d r11d r12d r13d xmm0 xmm1
..B14.103:                      # Preds ..B14.103 ..B14.102     # Infreq
..L307:         # optimization report
                # LOOP WAS UNROLLED BY 2
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN1685:
        lea       (%r12,%r12), %eax                             #330.16
..LN1686:
        movslq    %eax, %rax                                    #330.16
..LN1687:
	.loc    1  329  is_stmt 1
        incl      %r12d                                         #329.3
..LN1688:
	.loc    1  330  is_stmt 1
        movq      8(%rdx,%rax,8), %r14                          #330.16
..LN1689:
        movq      %r14, (%rdx,%rax,8)                           #330.5
..LN1690:
	.loc    1  331  is_stmt 1
        movq      8(%r10,%rax,8), %r15                          #331.16
..LN1691:
        movq      %r15, (%r10,%rax,8)                           #331.5
..LN1692:
	.loc    1  330  is_stmt 1
        movq      16(%rdx,%rax,8), %r14                         #330.16
..LN1693:
        movq      %r14, 8(%rdx,%rax,8)                          #330.5
..LN1694:
	.loc    1  331  is_stmt 1
        movq      16(%r10,%rax,8), %r15                         #331.16
..LN1695:
        movq      %r15, 8(%r10,%rax,8)                          #331.5
..LN1696:
	.loc    1  329  is_stmt 1
        cmpl      %r11d, %r12d                                  #329.3
..LN1697:
        jb        ..B14.103     # Prob 64%                      #329.3
..LN1698:
                                # LOE rdx rbx rbp rdi r9 r10 ecx esi r8d r11d r12d r13d xmm0 xmm1
..B14.104:                      # Preds ..B14.103               # Infreq
..LN1699:
	.loc    1  330  is_stmt 1
        lea       1(%r12,%r12), %edx                            #330.5
..LN1700:
                                # LOE rbx rbp rdi r9 edx ecx esi r8d r13d xmm0 xmm1
..B14.105:                      # Preds ..B14.104 ..B14.101     # Infreq
..LN1701:
	.loc    1  329  is_stmt 1
        lea       -1(%rdx), %eax                                #329.3
..LN1702:
        cmpl      %eax, %ecx                                    #329.3
..LN1703:
        jbe       ..B14.107     # Prob 10%                      #329.3
..LN1704:
                                # LOE rbx rbp rdi r9 edx esi r8d r13d xmm0 xmm1
..B14.106:                      # Preds ..B14.105               # Infreq
..LN1705:
	.loc    1  330  is_stmt 1
        movslq    %edx, %rdx                                    #330.16
..LN1706:
	.loc    1  329  is_stmt 1
        addq      %rdx, %rbx                                    #329.3
..LN1707:
	.loc    1  330  is_stmt 1
        movq      (%rdi,%rbx,8), %rax                           #330.16
..LN1708:
        movq      %rax, -8(%rdi,%rbx,8)                         #330.5
..LN1709:
	.loc    1  331  is_stmt 1
        movq      (%r9,%rbx,8), %rcx                            #331.16
..LN1710:
        movq      %rcx, -8(%r9,%rbx,8)                          #331.5
..LN1711:
                                # LOE rbp rdi r9 esi r8d r13d xmm0 xmm1
..B14.107:                      # Preds ..B14.105 ..B14.100 ..B14.106 # Infreq
..LN1712:
	.loc    1  375  is_stmt 1
        movl      %r13d, %ecx                                   #375.7
..LN1713:
	.loc    1  371  is_stmt 1
        movl      %esi, %r13d                                   #371.17
..LN1714:
        movl      %r8d, %r14d                                   #371.17
..LN1715:
        jmp       ..B14.14      # Prob 100%                     #371.17
..LN1716:
        .align    16,0x90
	.cfi_endproc
..LN1717:
                                # LOE rbp rdi r9 ecx r13d r14d xmm0 xmm1
..LN1718:
# mark_end;
	.type	fix_lon,@function
	.size	fix_lon,.-fix_lon
..LNfix_lon.1719:
.LNfix_lon:
	.data
# -- End  fix_lon
	.text
.L_2__routine_start_great_circle_distance_14:
# -- Begin  great_circle_distance
	.text
# mark_begin;
       .align    16,0x90
	.globl great_circle_distance
# --- great_circle_distance(double *, double *)
great_circle_distance:
# parameter 1(p1): %rdi
# parameter 2(p2): %rsi
..B15.1:                        # Preds ..B15.0
	.cfi_startproc
..___tag_value_great_circle_distance.311:
..L312:
                                                        #421.1
..LN1720:
	.loc    1  421  is_stmt 1
        pushq     %r12                                          #421.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN1721:
        pushq     %rbp                                          #421.1
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
..LN1722:
        subq      $24, %rsp                                     #421.1
	.cfi_def_cfa_offset 48
..LN1723:
        movq      %rsi, %r12                                    #421.1
..LN1724:
        movq      %rdi, %rbp                                    #421.1
..LN1725:
	.loc    1  427  prologue_end  is_stmt 1
        vmovsd    8(%r12), %xmm1                                #427.36
..LN1726:
        vmovsd    8(%rbp), %xmm0                                #427.30
..LN1727:
        vmovsd    %xmm0, 16(%rsp)                               #427.30
..LN1728:
        vsubsd    %xmm1, %xmm0, %xmm2                           #427.25
..LN1729:
        vmulsd    .L_2il0floatpacket.6(%rip), %xmm2, %xmm0      #427.25
..LN1730:
        vmovsd    %xmm1, 8(%rsp)                                #427.36
..LN1731:
        call      sin                                           #427.25
..LN1732:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B15.8:                        # Preds ..B15.1
..LN1733:
        vmovsd    %xmm0, (%rsp)                                 #427.25
..LN1734:
	.loc    1  428  is_stmt 1
        vmovsd    16(%rsp), %xmm0                               #428.32
..LN1735:
        call      cos                                           #428.32
..LN1736:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B15.7:                        # Preds ..B15.8
..LN1737:
        vmovsd    %xmm0, 16(%rsp)                               #428.32
..LN1738:
        vmovsd    8(%rsp), %xmm0                                #428.43
..LN1739:
        call      cos                                           #428.43
..LN1740:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B15.6:                        # Preds ..B15.7
..LN1741:
        vmovsd    %xmm0, 8(%rsp)                                #428.43
..LN1742:
        vmovsd    (%rbp), %xmm0                                 #428.55
..LN1743:
        vsubsd    (%r12), %xmm0, %xmm1                          #428.55
..LN1744:
        vmulsd    .L_2il0floatpacket.6(%rip), %xmm1, %xmm0      #428.55
..LN1745:
        call      sin                                           #428.55
..LN1746:
                                # LOE rbx r13 r14 r15 xmm0
..B15.5:                        # Preds ..B15.6
..LN1747:
	.loc    1  427  is_stmt 1
        vmovsd    (%rsp), %xmm2                                 #427.13
..LN1748:
	.loc    1  428  is_stmt 1
        vmovapd   %xmm0, %xmm1                                  #428.55
..LN1749:
	.loc    1  427  is_stmt 1
        vmovsd    16(%rsp), %xmm0                               #427.13
..LN1750:
        vmulsd    8(%rsp), %xmm0, %xmm0                         #427.13
..LN1751:
        vmulsd    %xmm1, %xmm1, %xmm3                           #427.13
..LN1752:
        vmulsd    %xmm2, %xmm2, %xmm4                           #427.13
..LN1753:
        vfmadd213sd %xmm4, %xmm3, %xmm0                         #427.13
..LN1754:
        vsqrtsd   %xmm0, %xmm0, %xmm0                           #427.13
..LN1755:
        call      asin                                          #427.13
..LN1756:
                                # LOE rbx r13 r14 r15 xmm0
..B15.4:                        # Preds ..B15.5
..LN1757:
        vaddsd    %xmm0, %xmm0, %xmm1                           #427.13
..LN1758:
	.loc    1  429  is_stmt 1
        vmulsd    .L_2il0floatpacket.5(%rip), %xmm1, %xmm0      #429.17
..LN1759:
	.loc    1  430  epilogue_begin  is_stmt 1
        addq      $24, %rsp                                     #430.10
	.cfi_def_cfa_offset 24
	.cfi_restore 6
..LN1760:
        popq      %rbp                                          #430.10
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN1761:
        popq      %r12                                          #430.10
	.cfi_def_cfa_offset 8
..LN1762:
        ret                                                     #430.10
..LN1763:
        .align    16,0x90
	.cfi_endproc
..LN1764:
                                # LOE
..LN1765:
# mark_end;
	.type	great_circle_distance,@function
	.size	great_circle_distance,.-great_circle_distance
..LNgreat_circle_distance.1766:
.LNgreat_circle_distance:
	.data
# -- End  great_circle_distance
	.text
.L_2__routine_start_spherical_angle_15:
# -- Begin  spherical_angle
	.text
# mark_begin;
       .align    16,0x90
	.globl spherical_angle
# --- spherical_angle(const double *, const double *, const double *)
spherical_angle:
# parameter 1(v1): %rdi
# parameter 2(v2): %rsi
# parameter 3(v3): %rdx
..B16.1:                        # Preds ..B16.0
	.cfi_startproc
..___tag_value_spherical_angle.329:
..L330:
                                                        #446.1
..LN1767:
	.loc    1  446  is_stmt 1
        pushq     %rsi                                          #446.1
	.cfi_def_cfa_offset 16
..LN1768:
	.loc    1  451  prologue_end  is_stmt 1
        vmovsd    16(%rdi), %xmm4                               #451.22
..LN1769:
        vmovsd    8(%rsi), %xmm5                                #451.28
..LN1770:
        vmulsd    %xmm5, %xmm4, %xmm6                           #451.28
..LN1771:
        vmovsd    16(%rsi), %xmm2                               #451.14
..LN1772:
        vmovsd    8(%rdi), %xmm9                                #451.8
..LN1773:
	.loc    1  452  is_stmt 1
        vmovsd    (%rdi), %xmm3                                 #452.22
..LN1774:
	.loc    1  455  is_stmt 1
        vmovsd    16(%rdx), %xmm7                               #455.14
..LN1775:
	.loc    1  451  is_stmt 1
        vfmsub231sd %xmm9, %xmm2, %xmm6                         #451.3
..LN1776:
	.loc    1  452  is_stmt 1
        vmulsd    %xmm3, %xmm2, %xmm2                           #452.28
..LN1777:
	.loc    1  456  is_stmt 1
        vmulsd    %xmm7, %xmm3, %xmm8                           #456.28
..LN1778:
	.loc    1  455  is_stmt 1
        vmovsd    8(%rdx), %xmm11                               #455.28
..LN1779:
	.loc    1  456  is_stmt 1
        vmovsd    (%rdx), %xmm10                                #456.14
..LN1780:
	.loc    1  452  is_stmt 1
        vmovsd    (%rsi), %xmm1                                 #452.14
..LN1781:
        vfmsub231sd %xmm4, %xmm1, %xmm2                         #452.3
..LN1782:
	.loc    1  453  is_stmt 1
        vmulsd    %xmm1, %xmm9, %xmm0                           #453.28
..LN1783:
	.loc    1  455  is_stmt 1
        vmulsd    %xmm11, %xmm4, %xmm1                          #455.28
..LN1784:
	.loc    1  456  is_stmt 1
        vfmsub213sd %xmm8, %xmm10, %xmm4                        #456.3
..LN1785:
	.loc    1  457  is_stmt 1
        vmulsd    %xmm10, %xmm9, %xmm12                         #457.28
..LN1786:
	.loc    1  453  is_stmt 1
        vfmsub213sd %xmm0, %xmm3, %xmm5                         #453.3
..LN1787:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm2, %xmm2, %xmm13                          #460.25
..LN1788:
	.loc    1  455  is_stmt 1
        vfmsub231sd %xmm9, %xmm7, %xmm1                         #455.3
..LN1789:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm4, %xmm4, %xmm14                          #460.45
..LN1790:
	.loc    1  457  is_stmt 1
        vfmsub213sd %xmm12, %xmm11, %xmm3                       #457.3
..LN1791:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm6, %xmm6, %xmm13                        #460.3
..LN1792:
	.loc    1  461  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #461.3
..LN1793:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm1, %xmm1, %xmm14                        #460.3
..LN1794:
        vfmadd231sd %xmm5, %xmm5, %xmm13                        #460.3
..LN1795:
        vfmadd231sd %xmm3, %xmm3, %xmm14                        #460.3
..LN1796:
        vmulsd    %xmm14, %xmm13, %xmm15                        #460.51
..LN1797:
        vsqrtsd   %xmm15, %xmm15, %xmm15                        #460.9
..LN1798:
	.loc    1  461  is_stmt 1
        vcomisd   %xmm0, %xmm15                                 #461.13
..LN1799:
        jbe       ..B16.4       # Prob 50%                      #461.13
..LN1800:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm15
..B16.2:                        # Preds ..B16.1
..LN1801:
	.loc    1  462  is_stmt 1
        vmulsd    %xmm4, %xmm2, %xmm0                           #462.13
..LN1802:
        vfmadd213sd %xmm0, %xmm1, %xmm6                         #462.13
..LN1803:
        vfmadd213sd %xmm6, %xmm3, %xmm5                         #462.13
..LN1804:
        vdivsd    %xmm15, %xmm5, %xmm0                          #462.13
..LN1805:
        call      acos                                          #462.13
..LN1806:
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B16.4:                        # Preds ..B16.1 ..B16.2
..LN1807:
	.loc    1  467  epilogue_begin  is_stmt 1
        popq      %rcx                                          #467.10
	.cfi_def_cfa_offset 8
..LN1808:
        ret                                                     #467.10
..LN1809:
        .align    16,0x90
	.cfi_endproc
..LN1810:
                                # LOE
..LN1811:
# mark_end;
	.type	spherical_angle,@function
	.size	spherical_angle,.-spherical_angle
..LNspherical_angle.1812:
.LNspherical_angle:
	.data
# -- End  spherical_angle
	.text
.L_2__routine_start_spherical_excess_area_16:
# -- Begin  spherical_excess_area
	.text
# mark_begin;
       .align    16,0x90
	.globl spherical_excess_area
# --- spherical_excess_area(const double *, const double *, const double *, const double *, double)
spherical_excess_area:
# parameter 1(p_ll): %rdi
# parameter 2(p_ul): %rsi
# parameter 3(p_lr): %rdx
# parameter 4(p_ur): %rcx
# parameter 5(radius): %xmm0
..B17.1:                        # Preds ..B17.0
	.cfi_startproc
..___tag_value_spherical_excess_area.338:
..L339:
                                                        #478.1
..LN1813:
	.loc    1  478  is_stmt 1
        pushq     %rbp                                          #478.1
	.cfi_def_cfa_offset 16
..LN1814:
        movq      %rsp, %rbp                                    #478.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN1815:
        pushq     %r12                                          #478.1
..LN1816:
        pushq     %r13                                          #478.1
..LN1817:
        pushq     %r14                                          #478.1
..LN1818:
        pushq     %r15                                          #478.1
..LN1819:
        subq      $144, %rsp                                    #478.1
	.cfi_offset 12, -24
	.cfi_offset 13, -32
	.cfi_offset 14, -40
	.cfi_offset 15, -48
..LN1820:
        movq      %rdi, %r12                                    #478.1
..LN1821:
        vmovsd    %xmm0, -152(%rbp)                             #478.1
..LN1822:
        movq      %rcx, %r15                                    #478.1
..LN1823:
        movq      %rdx, %r13                                    #478.1
..LN1824:
        movq      %rsi, %r14                                    #478.1
..LN1825:
	.loc    1  209  prologue_end  is_stmt 1
        vmovsd    8(%r12), %xmm0                                #209.12
..LN1826:
        call      __libm_sse2_sincos                            #209.12
..LN1827:
                                # LOE rbx r12 r13 r14 r15 xmm0 xmm1
..B17.21:                       # Preds ..B17.1
..LN1828:
        vmovsd    %xmm0, -128(%rbp)                             #209.12
..LN1829:
        vmovsd    %xmm1, -176(%rbp)                             #209.12
..LN1830:
        vmovsd    (%r12), %xmm0                                 #209.24
..LN1831:
        call      __libm_sse2_sincos                            #209.24
..LN1832:
                                # LOE rbx r13 r14 r15 xmm0 xmm1
..B17.20:                       # Preds ..B17.21
..LN1833:
        vmovsd    -176(%rbp), %xmm2                             #209.24
..LN1834:
        vmovapd   %xmm0, %xmm3                                  #209.24
..LN1835:
        vmulsd    %xmm1, %xmm2, %xmm0                           #209.24
..LN1836:
	.loc    1  210  is_stmt 1
        vmulsd    %xmm3, %xmm2, %xmm4                           #210.24
..LN1837:
	.loc    1  209  is_stmt 1
        vmovsd    %xmm0, -144(%rbp)                             #209.24
..LN1838:
	.loc    1  210  is_stmt 1
        vmovsd    %xmm4, -136(%rbp)                             #210.24
..LN1839:
	.loc    1  209  is_stmt 1
        vmovsd    8(%r13), %xmm0                                #209.12
..LN1840:
        call      __libm_sse2_sincos                            #209.12
..LN1841:
                                # LOE rbx r13 r14 r15 xmm0 xmm1
..B17.19:                       # Preds ..B17.20
..LN1842:
        vmovsd    %xmm0, -56(%rbp)                              #209.12
..LN1843:
        vmovsd    %xmm1, -168(%rbp)                             #209.12
..LN1844:
        vmovsd    (%r13), %xmm0                                 #209.24
..LN1845:
        call      __libm_sse2_sincos                            #209.24
..LN1846:
                                # LOE rbx r14 r15 xmm0 xmm1
..B17.18:                       # Preds ..B17.19
..LN1847:
        vmovsd    -168(%rbp), %xmm2                             #209.24
..LN1848:
        vmovapd   %xmm0, %xmm3                                  #209.24
..LN1849:
        vmulsd    %xmm1, %xmm2, %xmm0                           #209.24
..LN1850:
	.loc    1  210  is_stmt 1
        vmulsd    %xmm3, %xmm2, %xmm4                           #210.24
..LN1851:
	.loc    1  209  is_stmt 1
        vmovsd    %xmm0, -176(%rbp)                             #209.24
..LN1852:
	.loc    1  210  is_stmt 1
        vmovsd    %xmm4, -72(%rbp)                              #210.24
..LN1853:
	.loc    1  209  is_stmt 1
        vmovsd    8(%r14), %xmm0                                #209.12
..LN1854:
        call      __libm_sse2_sincos                            #209.12
..LN1855:
                                # LOE rbx r14 r15 xmm0 xmm1
..B17.17:                       # Preds ..B17.18
..LN1856:
        vmovsd    %xmm0, -104(%rbp)                             #209.12
..LN1857:
        vmovsd    %xmm1, -168(%rbp)                             #209.12
..LN1858:
        vmovsd    (%r14), %xmm0                                 #209.24
..LN1859:
        call      __libm_sse2_sincos                            #209.24
..LN1860:
                                # LOE rbx r15 xmm0 xmm1
..B17.16:                       # Preds ..B17.17
..LN1861:
        vmovsd    -168(%rbp), %xmm5                             #209.24
..LN1862:
	.loc    1  451  is_stmt 1
        vmovsd    -72(%rbp), %xmm2                              #451.28
..LN1863:
	.loc    1  461  is_stmt 1
        vxorpd    %xmm15, %xmm15, %xmm15                        #461.3
..LN1864:
	.loc    1  451  is_stmt 1
        vmovsd    -128(%rbp), %xmm10                            #451.28
..LN1865:
        vmovsd    -56(%rbp), %xmm4                              #451.3
..LN1866:
	.loc    1  209  is_stmt 1
        vmulsd    %xmm1, %xmm5, %xmm6                           #209.24
..LN1867:
	.loc    1  210  is_stmt 1
        vmulsd    %xmm0, %xmm5, %xmm0                           #210.24
..LN1868:
	.loc    1  451  is_stmt 1
        vmulsd    %xmm2, %xmm10, %xmm5                          #451.28
..LN1869:
	.loc    1  452  is_stmt 1
        vmovsd    -144(%rbp), %xmm1                             #452.28
..LN1870:
        vmulsd    %xmm1, %xmm4, %xmm3                           #452.28
..LN1871:
	.loc    1  453  is_stmt 1
        vmulsd    %xmm1, %xmm2, %xmm8                           #453.14
..LN1872:
	.loc    1  455  is_stmt 1
        vmulsd    %xmm0, %xmm10, %xmm2                          #455.28
..LN1873:
	.loc    1  451  is_stmt 1
        vmovsd    -136(%rbp), %xmm11                            #451.3
..LN1874:
	.loc    1  452  is_stmt 1
        vmovsd    -176(%rbp), %xmm7                             #452.3
..LN1875:
	.loc    1  451  is_stmt 1
        vfmsub231sd %xmm11, %xmm4, %xmm5                        #451.3
..LN1876:
	.loc    1  452  is_stmt 1
        vmovapd   %xmm10, %xmm4                                 #452.3
..LN1877:
	.loc    1  455  is_stmt 1
        vmovsd    -104(%rbp), %xmm9                             #455.3
..LN1878:
	.loc    1  452  is_stmt 1
        vmovsd    %xmm3, -48(%rbp)                              #452.28
..LN1879:
	.loc    1  209  is_stmt 1
        vmovsd    %xmm6, -112(%rbp)                             #209.24
..LN1880:
	.loc    1  210  is_stmt 1
        vmovsd    %xmm0, -88(%rbp)                              #210.24
..LN1881:
	.loc    1  452  is_stmt 1
        vfmsub213sd %xmm3, %xmm7, %xmm4                         #452.3
..LN1882:
	.loc    1  453  is_stmt 1
        vmovapd   %xmm11, %xmm3                                 #453.3
..LN1883:
        vfnmadd213sd %xmm8, %xmm7, %xmm3                        #453.3
..LN1884:
	.loc    1  456  is_stmt 1
        vmulsd    %xmm9, %xmm1, %xmm7                           #456.28
..LN1885:
	.loc    1  455  is_stmt 1
        vfmsub231sd %xmm11, %xmm9, %xmm2                        #455.3
..LN1886:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm4, %xmm4, %xmm12                          #460.25
..LN1887:
	.loc    1  456  is_stmt 1
        vfmsub231sd %xmm10, %xmm6, %xmm7                        #456.3
..LN1888:
	.loc    1  457  is_stmt 1
        vmulsd    %xmm6, %xmm11, %xmm6                          #457.28
..LN1889:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm5, %xmm5, %xmm12                        #460.9
..LN1890:
        vmulsd    %xmm7, %xmm7, %xmm13                          #460.45
..LN1891:
	.loc    1  457  is_stmt 1
        vfmsub231sd %xmm1, %xmm0, %xmm6                         #457.3
..LN1892:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm3, %xmm3, %xmm12                        #460.9
..LN1893:
	.loc    1  453  is_stmt 1
        vmovsd    %xmm8, -40(%rbp)                              #453.14
..LN1894:
	.loc    1  461  is_stmt 1
        vmovsd    %xmm15, -120(%rbp)                            #461.3
..LN1895:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm2, %xmm2, %xmm13                        #460.9
..LN1896:
        vfmadd231sd %xmm6, %xmm6, %xmm13                        #460.9
..LN1897:
        vmulsd    %xmm13, %xmm12, %xmm14                        #460.51
..LN1898:
        vsqrtsd   %xmm14, %xmm14, %xmm14                        #460.9
..LN1899:
	.loc    1  461  is_stmt 1
        vcomisd   %xmm15, %xmm14                                #461.13
..LN1900:
        jbe       ..B17.3       # Prob 50%                      #461.13
..LN1901:
                                # LOE rbx r15 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm14 xmm15 ymm15 zmm15
..B17.2:                        # Preds ..B17.16
..LN1902:
	.loc    1  462  is_stmt 1
        vmulsd    %xmm7, %xmm4, %xmm0                           #462.13
..LN1903:
        vfmadd213sd %xmm0, %xmm2, %xmm5                         #462.13
..LN1904:
        vfmadd213sd %xmm5, %xmm6, %xmm3                         #462.13
..LN1905:
        vdivsd    %xmm14, %xmm3, %xmm0                          #462.13
..LN1906:
        call      acos                                          #462.13
..LN1907:
                                # LOE rbx r15 xmm0
..B17.22:                       # Preds ..B17.2
..LN1908:
        vmovsd    %xmm0, -96(%rbp)                              #462.13
..LN1909:
        jmp       ..B17.4       # Prob 100%                     #462.13
..LN1910:
                                # LOE rbx r15
..B17.3:                        # Preds ..B17.16
..LN1911:
	.loc    1  465  is_stmt 1
        vmovapd   %xmm15, %xmm0                                 #465.5
..LN1912:
        vmovsd    %xmm0, -96(%rbp)                              #465.5
..LN1913:
                                # LOE rbx r15
..B17.4:                        # Preds ..B17.22 ..B17.3
..LN1914:
	.loc    1  209  is_stmt 1
        vmovsd    8(%r15), %xmm0                                #209.12
..LN1915:
        call      __libm_sse2_sincos                            #209.12
..LN1916:
                                # LOE rbx r15 xmm0 xmm1
..B17.24:                       # Preds ..B17.4
..LN1917:
        vmovsd    %xmm0, -64(%rbp)                              #209.12
..LN1918:
        vmovsd    %xmm1, -168(%rbp)                             #209.12
..LN1919:
        vmovsd    (%r15), %xmm0                                 #209.24
..LN1920:
        call      __libm_sse2_sincos                            #209.24
..LN1921:
                                # LOE rbx xmm0 xmm1
..B17.23:                       # Preds ..B17.24
..LN1922:
        vmovsd    -168(%rbp), %xmm4                             #209.24
..LN1923:
	.loc    1  210  is_stmt 1
        vmulsd    %xmm0, %xmm4, %xmm5                           #210.24
..LN1924:
	.loc    1  209  is_stmt 1
        vmulsd    %xmm1, %xmm4, %xmm9                           #209.24
..LN1925:
	.loc    1  451  is_stmt 1
        vmovsd    -56(%rbp), %xmm7                              #451.28
..LN1926:
        vmulsd    %xmm5, %xmm7, %xmm4                           #451.28
..LN1927:
	.loc    1  452  is_stmt 1
        vmovapd   %xmm7, %xmm0                                  #452.3
..LN1928:
	.loc    1  456  is_stmt 1
        vmovsd    -176(%rbp), %xmm6                             #456.3
..LN1929:
	.loc    1  451  is_stmt 1
        vmovsd    -72(%rbp), %xmm12                             #451.3
..LN1930:
        vmovsd    -64(%rbp), %xmm8                              #451.3
..LN1931:
	.loc    1  453  is_stmt 1
        vmovapd   %xmm12, %xmm1                                 #453.3
..LN1932:
	.loc    1  451  is_stmt 1
        vfmsub231sd %xmm12, %xmm8, %xmm4                        #451.3
..LN1933:
	.loc    1  452  is_stmt 1
        vmulsd    %xmm6, %xmm8, %xmm8                           #452.28
..LN1934:
	.loc    1  456  is_stmt 1
        vmovsd    -48(%rbp), %xmm2                              #456.3
..LN1935:
        vmovsd    -128(%rbp), %xmm11                            #456.3
..LN1936:
	.loc    1  457  is_stmt 1
        vmovsd    -40(%rbp), %xmm3                              #457.3
..LN1937:
        vmovsd    -136(%rbp), %xmm10                            #457.3
..LN1938:
	.loc    1  210  is_stmt 1
        vmovsd    %xmm5, -80(%rbp)                              #210.24
..LN1939:
	.loc    1  456  is_stmt 1
        vfnmadd231sd %xmm6, %xmm11, %xmm2                       #456.3
..LN1940:
	.loc    1  457  is_stmt 1
        vfmsub231sd %xmm6, %xmm10, %xmm3                        #457.3
..LN1941:
	.loc    1  453  is_stmt 1
        vmulsd    %xmm6, %xmm5, %xmm5                           #453.14
..LN1942:
	.loc    1  452  is_stmt 1
        vfmsub213sd %xmm8, %xmm9, %xmm0                         #452.3
..LN1943:
	.loc    1  455  is_stmt 1
        vmulsd    %xmm10, %xmm7, %xmm6                          #455.28
..LN1944:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm2, %xmm2, %xmm14                          #460.45
..LN1945:
	.loc    1  453  is_stmt 1
        vfnmadd213sd %xmm5, %xmm9, %xmm1                        #453.3
..LN1946:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm0, %xmm0, %xmm13                          #460.25
..LN1947:
	.loc    1  455  is_stmt 1
        vfmsub231sd %xmm12, %xmm11, %xmm6                       #455.3
..LN1948:
	.loc    1  456  is_stmt 1
        vmovsd    %xmm2, -48(%rbp)                              #456.3
..LN1949:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm4, %xmm4, %xmm13                        #460.9
..LN1950:
        vfmadd231sd %xmm6, %xmm6, %xmm14                        #460.9
..LN1951:
	.loc    1  457  is_stmt 1
        vmovsd    %xmm3, -40(%rbp)                              #457.3
..LN1952:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm1, %xmm1, %xmm13                        #460.9
..LN1953:
        vfmadd231sd %xmm3, %xmm3, %xmm14                        #460.9
..LN1954:
        vmulsd    %xmm14, %xmm13, %xmm15                        #460.51
..LN1955:
        vsqrtsd   %xmm15, %xmm15, %xmm15                        #460.9
..LN1956:
	.loc    1  461  is_stmt 1
        vcomisd   -120(%rbp), %xmm15                            #461.13
..LN1957:
        jbe       ..B17.6       # Prob 50%                      #461.13
..LN1958:
                                # LOE rbx xmm0 xmm1 xmm4 xmm5 xmm6 xmm8 xmm9 xmm15
..B17.5:                        # Preds ..B17.23
..LN1959:
	.loc    1  462  is_stmt 1
        vmulsd    -48(%rbp), %xmm0, %xmm2                       #462.13
..LN1960:
        vfmadd213sd %xmm2, %xmm6, %xmm4                         #462.13
..LN1961:
        vmovsd    %xmm8, -168(%rbp)                             #462.13
..LN1962:
        vmovsd    %xmm5, -160(%rbp)                             #462.13
..LN1963:
        vmovsd    %xmm9, -176(%rbp)                             #462.13
..LN1964:
        vfmadd132sd -40(%rbp), %xmm4, %xmm1                     #462.13
..LN1965:
        vdivsd    %xmm15, %xmm1, %xmm0                          #462.13
..LN1966:
        call      acos                                          #462.13
..LN1967:
                                # LOE rbx xmm0
..B17.25:                       # Preds ..B17.5
..LN1968:
        vmovsd    -176(%rbp), %xmm9                             #
..LN1969:
        vmovsd    -160(%rbp), %xmm5                             #
..LN1970:
        vmovsd    -168(%rbp), %xmm8                             #
..LN1971:
        vmovsd    %xmm0, -48(%rbp)                              #462.13
..LN1972:
        jmp       ..B17.7       # Prob 100%                     #462.13
..LN1973:
                                # LOE rbx xmm5 xmm8 xmm9
..B17.6:                        # Preds ..B17.23
..LN1974:
	.loc    1  465  is_stmt 1
        vmovsd    -120(%rbp), %xmm0                             #465.5
..LN1975:
        vmovsd    %xmm0, -48(%rbp)                              #465.5
..LN1976:
                                # LOE rbx xmm5 xmm8 xmm9
..B17.7:                        # Preds ..B17.25 ..B17.6
..LN1977:
	.loc    1  457  is_stmt 1
        vmovsd    -72(%rbp), %xmm1                              #457.3
..LN1978:
	.loc    1  455  is_stmt 1
        vmovsd    -64(%rbp), %xmm6                              #455.28
..LN1979:
	.loc    1  457  is_stmt 1
        vfmsub231sd %xmm9, %xmm1, %xmm5                         #457.3
..LN1980:
	.loc    1  455  is_stmt 1
        vmulsd    %xmm1, %xmm6, %xmm1                           #455.28
..LN1981:
	.loc    1  456  is_stmt 1
        vmovsd    -56(%rbp), %xmm0                              #456.3
..LN1982:
	.loc    1  455  is_stmt 1
        vmovsd    -80(%rbp), %xmm4                              #455.3
..LN1983:
	.loc    1  451  is_stmt 1
        vmovsd    -88(%rbp), %xmm2                              #451.28
..LN1984:
	.loc    1  456  is_stmt 1
        vfnmadd231sd %xmm9, %xmm0, %xmm8                        #456.3
..LN1985:
	.loc    1  455  is_stmt 1
        vfmsub231sd %xmm4, %xmm0, %xmm1                         #455.3
..LN1986:
	.loc    1  451  is_stmt 1
        vmulsd    %xmm2, %xmm6, %xmm0                           #451.28
..LN1987:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm8, %xmm8, %xmm11                          #460.45
..LN1988:
	.loc    1  451  is_stmt 1
        vmovsd    -104(%rbp), %xmm7                             #451.3
..LN1989:
        vfmsub231sd %xmm4, %xmm7, %xmm0                         #451.3
..LN1990:
	.loc    1  452  is_stmt 1
        vmulsd    %xmm9, %xmm7, %xmm7                           #452.28
..LN1991:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm1, %xmm1, %xmm11                        #460.9
..LN1992:
	.loc    1  452  is_stmt 1
        vmovsd    -112(%rbp), %xmm3                             #452.3
..LN1993:
        vfmsub231sd %xmm6, %xmm3, %xmm7                         #452.3
..LN1994:
	.loc    1  453  is_stmt 1
        vmulsd    %xmm9, %xmm2, %xmm6                           #453.14
..LN1995:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm5, %xmm5, %xmm11                        #460.9
..LN1996:
        vmulsd    %xmm7, %xmm7, %xmm10                          #460.25
..LN1997:
	.loc    1  453  is_stmt 1
        vfmsub231sd %xmm4, %xmm3, %xmm6                         #453.3
..LN1998:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm0, %xmm0, %xmm10                        #460.9
..LN1999:
	.loc    1  453  is_stmt 1
        vxorpd    .L_2il0floatpacket.11(%rip), %xmm6, %xmm3     #453.28
..LN2000:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm3, %xmm3, %xmm10                        #460.9
..LN2001:
        vmulsd    %xmm11, %xmm10, %xmm12                        #460.51
..LN2002:
        vsqrtsd   %xmm12, %xmm12, %xmm12                        #460.9
..LN2003:
	.loc    1  461  is_stmt 1
        vcomisd   -120(%rbp), %xmm12                            #461.13
..LN2004:
        jbe       ..B17.9       # Prob 50%                      #461.13
..LN2005:
                                # LOE rbx xmm0 xmm1 xmm3 xmm5 xmm6 xmm7 xmm8 xmm9 xmm12
..B17.8:                        # Preds ..B17.7
..LN2006:
	.loc    1  462  is_stmt 1
        vmulsd    %xmm8, %xmm7, %xmm2                           #462.13
..LN2007:
        vfmadd213sd %xmm2, %xmm1, %xmm0                         #462.13
..LN2008:
        vmovsd    %xmm9, -176(%rbp)                             #462.13
..LN2009:
        vmovsd    %xmm7, -168(%rbp)                             #462.13
..LN2010:
        vmovsd    %xmm6, -160(%rbp)                             #462.13
..LN2011:
        vfmadd213sd %xmm0, %xmm5, %xmm3                         #462.13
..LN2012:
        vdivsd    %xmm12, %xmm3, %xmm0                          #462.13
..LN2013:
        call      acos                                          #462.13
..LN2014:
                                # LOE rbx xmm0
..B17.26:                       # Preds ..B17.8
..LN2015:
        vmovsd    -160(%rbp), %xmm6                             #
..LN2016:
        vmovapd   %xmm0, %xmm5                                  #462.13
..LN2017:
        vmovsd    -168(%rbp), %xmm7                             #
..LN2018:
        vmovsd    -176(%rbp), %xmm9                             #
..LN2019:
        jmp       ..B17.10      # Prob 100%                     #
..LN2020:
                                # LOE rbx xmm5 xmm6 xmm7 xmm9
..B17.9:                        # Preds ..B17.7
..LN2021:
	.loc    1  465  is_stmt 1
        vmovsd    -120(%rbp), %xmm5                             #465.5
..LN2022:
                                # LOE rbx xmm5 xmm6 xmm7 xmm9
..B17.10:                       # Preds ..B17.26 ..B17.9
..LN2023:
	.loc    1  211  is_stmt 1
        vmovsd    -104(%rbp), %xmm3                             #211.5
..LN2024:
	.loc    1  210  is_stmt 1
        vmovsd    -80(%rbp), %xmm2                              #210.5
..LN2025:
	.loc    1  451  is_stmt 1
        vmulsd    %xmm2, %xmm3, %xmm2                           #451.28
..LN2026:
	.loc    1  211  is_stmt 1
        vmovsd    -64(%rbp), %xmm0                              #211.5
..LN2027:
	.loc    1  501  is_stmt 1
        vmovsd    -112(%rbp), %xmm4                             #501.31
..LN2028:
	.loc    1  210  is_stmt 1
        vmovsd    -88(%rbp), %xmm9                              #210.5
..LN2029:
	.loc    1  211  is_stmt 1
        vmovsd    -128(%rbp), %xmm8                             #211.5
..LN2030:
	.loc    1  451  is_stmt 1
        vfmsub231sd %xmm9, %xmm0, %xmm2                         #451.3
..LN2031:
	.loc    1  452  is_stmt 1
        vxorpd    .L_2il0floatpacket.11(%rip), %xmm7, %xmm0     #452.28
..LN2032:
	.loc    1  503  is_stmt 1
        vmovsd    -144(%rbp), %xmm10                            #503.31
..LN2033:
	.loc    1  210  is_stmt 1
        vmovsd    -136(%rbp), %xmm11                            #210.5
..LN2034:
	.loc    1  456  is_stmt 1
        vmulsd    %xmm8, %xmm4, %xmm7                           #456.28
..LN2035:
	.loc    1  455  is_stmt 1
        vmulsd    %xmm11, %xmm3, %xmm1                          #455.28
..LN2036:
	.loc    1  457  is_stmt 1
        vmulsd    %xmm10, %xmm9, %xmm12                         #457.28
..LN2037:
	.loc    1  456  is_stmt 1
        vfmsub213sd %xmm7, %xmm10, %xmm3                        #456.3
..LN2038:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm0, %xmm0, %xmm13                          #460.25
..LN2039:
	.loc    1  455  is_stmt 1
        vfmsub231sd %xmm9, %xmm8, %xmm1                         #455.3
..LN2040:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm3, %xmm3, %xmm14                          #460.45
..LN2041:
        vfmadd231sd %xmm2, %xmm2, %xmm13                        #460.9
..LN2042:
	.loc    1  457  is_stmt 1
        vfmsub213sd %xmm12, %xmm11, %xmm4                       #457.3
..LN2043:
	.loc    1  460  is_stmt 1
        vfmadd231sd %xmm1, %xmm1, %xmm14                        #460.9
..LN2044:
        vfmadd231sd %xmm6, %xmm6, %xmm13                        #460.9
..LN2045:
        vfmadd231sd %xmm4, %xmm4, %xmm14                        #460.9
..LN2046:
	.loc    1  456  is_stmt 1
        vmovsd    %xmm3, -104(%rbp)                             #456.3
..LN2047:
	.loc    1  457  is_stmt 1
        vmovsd    %xmm4, -112(%rbp)                             #457.3
..LN2048:
	.loc    1  460  is_stmt 1
        vmulsd    %xmm14, %xmm13, %xmm15                        #460.51
..LN2049:
        vsqrtsd   %xmm15, %xmm15, %xmm15                        #460.9
..LN2050:
	.loc    1  461  is_stmt 1
        vcomisd   -120(%rbp), %xmm15                            #461.13
..LN2051:
        jbe       ..B17.13      # Prob 50%                      #461.13
..LN2052:
                                # LOE rbx xmm0 xmm1 xmm2 xmm5 xmm6 xmm15
..B17.11:                       # Preds ..B17.10
..LN2053:
	.loc    1  462  is_stmt 1
        vmulsd    -104(%rbp), %xmm0, %xmm3                      #462.13
..LN2054:
        vfmadd213sd %xmm3, %xmm1, %xmm2                         #462.13
..LN2055:
        vmovsd    %xmm5, -176(%rbp)                             #462.13
..LN2056:
        vfmadd132sd -112(%rbp), %xmm2, %xmm6                    #462.13
..LN2057:
        vdivsd    %xmm15, %xmm6, %xmm0                          #462.13
..LN2058:
        call      acos                                          #462.13
..LN2059:
                                # LOE rbx xmm0
..B17.27:                       # Preds ..B17.11
..LN2060:
        vmovsd    -176(%rbp), %xmm5                             #
..LN2061:
        vmovsd    %xmm0, -120(%rbp)                             #462.13
..LN2062:
                                # LOE rbx xmm5
..B17.13:                       # Preds ..B17.10 ..B17.27
..LN2063:
	.loc    1  506  is_stmt 1
        vmovsd    -96(%rbp), %xmm1                              #506.39
..LN2064:
        vmovsd    -152(%rbp), %xmm0                             #506.50
..LN2065:
        vmulsd    %xmm0, %xmm0, %xmm4                           #506.50
..LN2066:
        vsubsd    .L_2il0floatpacket.1(%rip), %xmm1, %xmm2      #506.39
..LN2067:
        vaddsd    -48(%rbp), %xmm2, %xmm3                       #506.18
..LN2068:
        vaddsd    %xmm5, %xmm3, %xmm5                           #506.25
..LN2069:
        vaddsd    -120(%rbp), %xmm5, %xmm6                      #506.32
..LN2070:
        vmulsd    %xmm6, %xmm4, %xmm0                           #506.58
..LN2071:
	.loc    1  508  epilogue_begin  is_stmt 1
        lea       -32(%rbp), %rsp                               #508.10
	.cfi_restore 15
..LN2072:
        popq      %r15                                          #508.10
	.cfi_restore 14
..LN2073:
        popq      %r14                                          #508.10
	.cfi_restore 13
..LN2074:
        popq      %r13                                          #508.10
	.cfi_restore 12
..LN2075:
        popq      %r12                                          #508.10
..LN2076:
	.loc    1  508  epilogue_begin  is_stmt 1
        popq      %rbp                                          #508.10
	.cfi_restore 6
..LN2077:
        ret                                                     #508.10
..LN2078:
        .align    16,0x90
	.cfi_endproc
..LN2079:
                                # LOE
..LN2080:
# mark_end;
	.type	spherical_excess_area,@function
	.size	spherical_excess_area,.-spherical_excess_area
..LNspherical_excess_area.2081:
.LNspherical_excess_area:
	.data
# -- End  spherical_excess_area
	.text
.L_2__routine_start_vect_cross_17:
# -- Begin  vect_cross
	.text
# mark_begin;
       .align    16,0x90
	.globl vect_cross
# --- vect_cross(const double *, const double *, double *)
vect_cross:
# parameter 1(p1): %rdi
# parameter 2(p2): %rsi
# parameter 3(e): %rdx
..B18.1:                        # Preds ..B18.0
	.cfi_startproc
..___tag_value_vect_cross.359:
..L360:
                                                        #519.1
..LN2082:
	.loc    1  519  prologue_end  is_stmt 1
..LN2083:
	.loc    1  521  is_stmt 1
        vmovsd    16(%rdi), %xmm0                               #521.24
..LN2084:
        vmulsd    8(%rsi), %xmm0, %xmm1                         #521.30
..LN2085:
        vmovsd    8(%rdi), %xmm2                                #521.10
..LN2086:
        vfmsub132sd 16(%rsi), %xmm1, %xmm2                      #521.3
..LN2087:
        vmovsd    %xmm2, (%rdx)                                 #521.3
..LN2088:
	.loc    1  522  is_stmt 1
        vmovsd    (%rdi), %xmm3                                 #522.24
..LN2089:
        vmulsd    16(%rsi), %xmm3, %xmm4                        #522.30
..LN2090:
        vmovsd    16(%rdi), %xmm5                               #522.10
..LN2091:
        vfmsub132sd (%rsi), %xmm4, %xmm5                        #522.3
..LN2092:
        vmovsd    %xmm5, 8(%rdx)                                #522.3
..LN2093:
	.loc    1  523  is_stmt 1
        vmovsd    8(%rdi), %xmm6                                #523.24
..LN2094:
        vmulsd    (%rsi), %xmm6, %xmm7                          #523.30
..LN2095:
        vmovsd    (%rdi), %xmm8                                 #523.10
..LN2096:
        vfmsub132sd 8(%rsi), %xmm7, %xmm8                       #523.3
..LN2097:
        vmovsd    %xmm8, 16(%rdx)                               #523.3
..LN2098:
	.loc    1  525  epilogue_begin  is_stmt 1
        ret                                                     #525.1
..LN2099:
        .align    16,0x90
	.cfi_endproc
..LN2100:
                                # LOE
..LN2101:
# mark_end;
	.type	vect_cross,@function
	.size	vect_cross,.-vect_cross
..LNvect_cross.2102:
.LNvect_cross:
	.data
# -- End  vect_cross
	.text
.L_2__routine_start_normalize_vect_18:
# -- Begin  normalize_vect
	.text
# mark_begin;
       .align    16,0x90
	.globl normalize_vect
# --- normalize_vect(double *)
normalize_vect:
# parameter 1(e): %rdi
..B19.1:                        # Preds ..B19.0
..L370:         # optimization report
                # LOOP WAS UNROLLED AND JAMMED BY 1
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 1.238281
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.171875
..L369:         # optimization report
                # LOOP WAS UNROLLED BY 1
                # LOOP WAS VECTORIZED
                # VECTORIZATION HAS UNALIGNED MEMORY REFERENCES
                # VECTORIZATION SPEEDUP COEFFECIENT 1.238281
                # LOOP HAS ONE VECTOR ITERATION
                # VECTOR LENGTH 2
                # NORMALIZED VECTORIZATION OVERHEAD 0.171875
                # MAIN VECTOR TYPE: 64-bits floating point
	.cfi_startproc
..___tag_value_normalize_vect.366:
..L367:
                                                        #531.1
..LN2103:
	.loc    1  531  prologue_end  is_stmt 1
..LN2104:
	.loc    1  535  is_stmt 1
        vmovsd    16(%rdi), %xmm6                               #535.43
..LN2105:
        vmulsd    %xmm6, %xmm6, %xmm0                           #535.43
..LN2106:
        vmovsd    8(%rdi), %xmm1                                #535.29
..LN2107:
	.loc    1  536  is_stmt 1
        vfmadd213sd %xmm0, %xmm1, %xmm1                         #536.3
..LN2108:
	.loc    1  535  is_stmt 1
        vmovsd    (%rdi), %xmm2                                 #535.10
..LN2109:
	.loc    1  536  is_stmt 1
        vfmadd213sd %xmm1, %xmm2, %xmm2                         #536.3
..LN2110:
        vsqrtsd   %xmm2, %xmm2, %xmm2                           #536.10
..LN2111:
	.loc    1  538  is_stmt 1
        vmovupd   (%rdi), %xmm3                                 #538.22
..LN2112:
	.loc    1  536  is_stmt 1
        vmovddup  %xmm2, %xmm4                                  #536.3
..LN2113:
	.loc    1  538  is_stmt 1
        vdivpd    %xmm4, %xmm3, %xmm5                           #538.22
..LN2114:
        vmovupd   %xmm5, (%rdi)                                 #538.22
..LN2115:
        vdivsd    %xmm2, %xmm6, %xmm7                           #538.22
..LN2116:
        vmovsd    %xmm7, 16(%rdi)                               #538.22
..LN2117:
	.loc    1  539  epilogue_begin  is_stmt 1
        ret                                                     #539.1
..LN2118:
        .align    16,0x90
	.cfi_endproc
..LN2119:
                                # LOE
..LN2120:
# mark_end;
	.type	normalize_vect,@function
	.size	normalize_vect,.-normalize_vect
..LNnormalize_vect.2121:
.LNnormalize_vect:
	.data
# -- End  normalize_vect
	.text
.L_2__routine_start_unit_vect_latlon_19:
# -- Begin  unit_vect_latlon
	.text
# mark_begin;
       .align    16,0x90
	.globl unit_vect_latlon
# --- unit_vect_latlon(int, const double *, const double *, double *, double *)
unit_vect_latlon:
# parameter 1(size): %edi
# parameter 2(lon): %rsi
# parameter 3(lat): %rdx
# parameter 4(vlon): %rcx
# parameter 5(vlat): %r8
..B20.1:                        # Preds ..B20.0
	.cfi_startproc
..___tag_value_unit_vect_latlon.375:
..L376:
                                                        #549.1
..LN2122:
	.loc    1  549  is_stmt 1
        subq      $88, %rsp                                     #549.1
	.cfi_def_cfa_offset 96
..LN2123:
        movl      %edi, %r11d                                   #549.1
..LN2124:
	.loc    1  553  prologue_end  is_stmt 1
        xorl      %edi, %edi                                    #553.9
..LN2125:
        xorl      %r9d, %r9d                                    #553.7
..LN2126:
        xorl      %r10d, %r10d                                  #553.9
..LN2127:
        xorl      %eax, %eax                                    #553.9
..LN2128:
        testl     %r11d, %r11d                                  #553.14
..LN2129:
        jle       ..B20.5       # Prob 10%                      #553.14
..LN2130:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 r9d r11d
..B20.2:                        # Preds ..B20.1
..LN2131:
        movl      %r11d, 48(%rsp)                               #
..LN2132:
        movq      %rcx, 56(%rsp)                                #
..LN2133:
        movq      %r12, 40(%rsp)                                #
	.cfi_offset 12, -56
..LN2134:
        movq      %rdx, %r12                                    #
..LN2135:
        movq      %r13, 32(%rsp)                                #
	.cfi_offset 13, -64
..LN2136:
        movq      %r8, %r13                                     #
..LN2137:
        movq      %r14, 24(%rsp)                                #
	.cfi_offset 14, -72
..LN2138:
        movq      %rdi, %r14                                    #
..LN2139:
        movq      %r15, 16(%rsp)                                #
	.cfi_offset 15, -80
..LN2140:
        movl      %r9d, %r15d                                   #
..LN2141:
        movq      %rbx, 8(%rsp)                                 #
	.cfi_offset 3, -88
..LN2142:
        movq      %rax, %rbx                                    #
..LN2143:
        movq      %rbp, (%rsp)                                  #
	.cfi_offset 6, -96
..LN2144:
        movq      %rsi, %rbp                                    #
..LN2145:
                                # LOE rbx rbp r12 r13 r14 r15d
..B20.3:                        # Preds ..B20.3 ..B20.2
..L385:         # optimization report
                # %s was not vectorized: vector dependence prevents vectorization%s
                # VECTOR TRIP COUNT IS ESTIMATED CONSTANT
..LN2146:
        incl      %r15d                                         #553.20
..LN2147:
	.loc    1  554  is_stmt 1
        vmovsd    (%rbp,%r14,8), %xmm0                          #554.15
..LN2148:
        call      __libm_sse2_sincos                            #554.15
..LN2149:
	.loc    1  556  is_stmt 1
        vmovsd    (%r12,%r14,8), %xmm2                          #556.15
..LN2150:
	.loc    1  554  is_stmt 1
        vmovsd    %xmm0, 64(%rsp)                               #554.15
..LN2151:
        vmovsd    %xmm1, 72(%rsp)                               #554.15
..LN2152:
	.loc    1  556  is_stmt 1
        vmovsd    (%r12,%r14,8), %xmm0                          #556.15
..LN2153:
	.loc    1  553  is_stmt 1
        incq      %r14                                          #553.20
..LN2154:
	.loc    1  556  is_stmt 1
        call      __libm_sse2_sincos                            #556.15
..LN2155:
	.loc    1  559  is_stmt 1
        vmovsd    64(%rsp), %xmm4                               #559.18
..LN2156:
	.loc    1  563  is_stmt 1
        lea       (%r13,%rbx,8), %r11                           #563.5
..LN2157:
        vmovsd    72(%rsp), %xmm7                               #563.5
..LN2158:
	.loc    1  564  is_stmt 1
        vmulsd    %xmm4, %xmm0, %xmm5                           #564.5
..LN2159:
	.loc    1  563  is_stmt 1
        vmulsd    %xmm0, %xmm7, %xmm3                           #563.5
..LN2160:
	.loc    1  559  is_stmt 1
        movq      56(%rsp), %rcx                                #559.5
..LN2161:
        vxorpd    .L_2il0floatpacket.11(%rip), %xmm4, %xmm6     #559.18
..LN2162:
	.loc    1  564  is_stmt 1
        vxorpd    .L_2il0floatpacket.11(%rip), %xmm5, %xmm8     #564.5
..LN2163:
	.loc    1  563  is_stmt 1
        vxorpd    .L_2il0floatpacket.11(%rip), %xmm3, %xmm9     #563.5
..LN2164:
	.loc    1  559  is_stmt 1
        lea       (%rcx,%rbx,8), %r10                           #559.5
..LN2165:
        vmovsd    %xmm6, (%r10)                                 #559.5
..LN2166:
	.loc    1  560  is_stmt 1
        vmovsd    %xmm7, 8(%r10)                                #560.5
..LN2167:
	.loc    1  561  is_stmt 1
        movq      $0, 16(%r10)                                  #561.5
..LN2168:
	.loc    1  564  is_stmt 1
        vmovsd    %xmm8, 8(%r11)                                #564.5
..LN2169:
	.loc    1  565  is_stmt 1
        vmovsd    %xmm1, 16(%r11)                               #565.5
..LN2170:
	.loc    1  553  is_stmt 1
        addq      $3, %rbx                                      #553.20
..LN2171:
	.loc    1  563  is_stmt 1
        vmovsd    %xmm9, (%r11)                                 #563.5
..LN2172:
	.loc    1  553  is_stmt 1
        cmpl      48(%rsp), %r15d                               #553.14
..LN2173:
        jl        ..B20.3       # Prob 82%                      #553.14
..LN2174:
                                # LOE rbx rbp r12 r13 r14 r15d
..B20.4:                        # Preds ..B20.3
..LN2175:
        movq      40(%rsp), %r12                                #
	.cfi_restore 12
..LN2176:
        movq      32(%rsp), %r13                                #
	.cfi_restore 13
..LN2177:
        movq      24(%rsp), %r14                                #
	.cfi_restore 14
..LN2178:
        movq      16(%rsp), %r15                                #
	.cfi_restore 15
..LN2179:
        movq      8(%rsp), %rbx                                 #
	.cfi_restore 3
..LN2180:
        movq      (%rsp), %rbp                                  #
	.cfi_restore 6
..LN2181:
                                # LOE rbx rbp r12 r13 r14 r15
..B20.5:                        # Preds ..B20.4 ..B20.1
..LN2182:
	.loc    1  567  epilogue_begin  is_stmt 1
        addq      $88, %rsp                                     #567.1
	.cfi_def_cfa_offset 8
..LN2183:
        ret                                                     #567.1
..LN2184:
        .align    16,0x90
	.cfi_endproc
..LN2185:
                                # LOE
..LN2186:
# mark_end;
	.type	unit_vect_latlon,@function
	.size	unit_vect_latlon,.-unit_vect_latlon
..LNunit_vect_latlon.2187:
.LNunit_vect_latlon:
	.data
# -- End  unit_vect_latlon
	.text
.L_2__routine_start_error_handler_20:
# -- Begin  error_handler
	.text
# mark_begin;
       .align    16,0x90
	.globl error_handler
# --- error_handler(const char *)
error_handler:
# parameter 1(msg): %rdi
..B21.1:                        # Preds ..B21.0
	.cfi_startproc
..___tag_value_error_handler.398:
..L399:
                                                        #49.1
..LN2188:
	.loc    1  49  is_stmt 1
        pushq     %rsi                                          #49.1
	.cfi_def_cfa_offset 16
..LN2189:
	.loc    1  49  prologue_end  is_stmt 1
        movq      %rdi, %rdx                                    #49.1
..LN2190:
	.loc    1  50  is_stmt 1
        movl      $.L_2__STRING.0, %esi                         #50.3
..LN2191:
        xorl      %eax, %eax                                    #50.3
..LN2192:
        movq      stderr(%rip), %rdi                            #50.3
..LN2193:
#       fprintf(FILE *__restrict__, const char *__restrict__, ...)
        call      fprintf                                       #50.3
..LN2194:
                                # LOE rbx rbp r12 r13 r14 r15
..B21.2:                        # Preds ..B21.1
..LN2195:
	.loc    1  52  is_stmt 1
        movl      $1140850688, %edi                             #52.3
..LN2196:
        movl      $-1, %esi                                     #52.3
..LN2197:
	.loc    1  52  epilogue_begin  is_stmt 1
        addq      $8, %rsp                                      #52.3
	.cfi_def_cfa_offset 8
..LN2198:
#       MPI_Abort(MPI_Comm, int)
        jmp       MPI_Abort                                     #52.3
..LN2199:
        .align    16,0x90
	.cfi_endproc
..LN2200:
                                # LOE
..LN2201:
# mark_end;
	.type	error_handler,@function
	.size	error_handler,.-error_handler
..LNerror_handler.2202:
.LNerror_handler:
	.data
# -- End  error_handler
	.section .rodata, "a"
	.align 32
.L_2il0floatpacket.9:
	.long	0x54442d18,0x401921fb,0x54442d18,0x401921fb,0x54442d18,0x401921fb,0x54442d18,0x401921fb
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,32
	.align 32
.L_2il0floatpacket.10:
	.long	0x54442d18,0x401921fb,0x54442d18,0x401921fb,0x54442d18,0x401921fb,0x54442d18,0x401921fb
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,32
	.align 16
.L_2il0floatpacket.2:
	.long	0xffffffff,0x7fffffff,0x00000000,0x00000000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,16
	.align 16
.L_2il0floatpacket.11:
	.long	0x00000000,0x80000000,0x00000000,0x00000000
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,16
	.align 8
.L_2il0floatpacket.0:
	.long	0xd9d7bdbb,0x3ddb7cdf
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.align 8
.L_2il0floatpacket.1:
	.long	0x54442d18,0x401921fb
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x54442d18,0x400921fb
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x54442d18,0xc00921fb
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x00000000,0x41584dae
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.6:
	.long	0x00000000,0x3fe00000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,8
	.align 8
.L_2il0floatpacket.7:
	.long	0x91122000,0x42c27541
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.align 8
.L_2il0floatpacket.8:
	.long	0x47d4b30d,0x3ff921fa
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
.L_2__STRING.0:
	.long	1096040774
	.long	1917132876
	.long	980578162
	.long	175318304
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,17
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1918985582
	.long	1601467237
	.long	1701080681
	.long	1629502072
	.long	2036429426
	.long	1937075488
	.long	1700929652
	.long	1852796192
	.long	1852798063
	.long	1818321769
	.long	1763735916
	.long	1701995374
	.long	1852404577
	.word	103
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,54
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	1869771333
	.long	1919295602
	.long	1948282223
	.long	1852140399
	.long	979729001
	.long	1836412448
	.long	544367970
	.long	1981834863
	.long	1634300513
	.long	1936026722
	.long	1668834592
	.long	1935959397
	.long	1835625504
	.word	29801
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,55
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	1869771333
	.long	1919295602
	.long	1948282223
	.long	1852140399
	.long	979729001
	.long	762278944
	.long	1882023266
	.long	1702064737
	.long	1953701988
	.long	1735289202
	.long	544434464
	.long	1953525093
	.word	121
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,50
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.long	808592672
	.long	538976359
	.long	1731211813
	.word	10
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,14
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
.L_2__STRING.4:
	.long	1869771365
	.long	1919295602
	.long	1948282223
	.long	1852140399
	.long	979729001
	.long	1918989856
	.long	1818386793
	.long	1634607205
	.long	1814062445
	.long	1952935525
	.long	2019893352
	.long	1684366691
	.long	1768693875
	.long	544500077
	.long	1769108836
	.long	1948280686
	.long	1852140399
	.long	1952545385
	.long	7237481
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,76
	.data
	.section .debug_opt_report, ""
..L406:
	.ascii ".itt_notify_tab\0"
	.word	258
	.word	48
	.long	42
	.long	..L407 - ..L406
	.long	48
	.long	..L408 - ..L406
	.long	724
	.long	0x00000008,0x00000000
	.long	0
	.long	0
	.long	0
	.long	0
	.quad	..L11
	.long	28
	.long	4
	.quad	..L48
	.long	28
	.long	20
	.quad	..L49
	.long	28
	.long	36
	.quad	..L84
	.long	28
	.long	52
	.quad	..L86
	.long	28
	.long	71
	.quad	..L87
	.long	28
	.long	90
	.quad	..L88
	.long	28
	.long	109
	.quad	..L97
	.long	28
	.long	128
	.quad	..L99
	.long	28
	.long	147
	.quad	..L100
	.long	28
	.long	166
	.quad	..L101
	.long	28
	.long	185
	.quad	..L110
	.long	28
	.long	204
	.quad	..L111
	.long	28
	.long	223
	.quad	..L112
	.long	28
	.long	242
	.quad	..L113
	.long	28
	.long	261
	.quad	..L128
	.long	28
	.long	280
	.quad	..L150
	.long	28
	.long	296
	.quad	..L183
	.long	28
	.long	312
	.quad	..L208
	.long	28
	.long	328
	.quad	..L226
	.long	28
	.long	344
	.quad	..L229
	.long	28
	.long	360
	.quad	..L241
	.long	28
	.long	376
	.quad	..L244
	.long	28
	.long	392
	.quad	..L259
	.long	28
	.long	408
	.quad	..L279
	.long	28
	.long	424
	.quad	..L280
	.long	28
	.long	438
	.quad	..L286
	.long	28
	.long	454
	.quad	..L287
	.long	28
	.long	470
	.quad	..L290
	.long	28
	.long	486
	.quad	..L292
	.long	28
	.long	502
	.quad	..L293
	.long	28
	.long	521
	.quad	..L294
	.long	28
	.long	540
	.quad	..L295
	.long	28
	.long	559
	.quad	..L296
	.long	28
	.long	578
	.quad	..L297
	.long	28
	.long	597
	.quad	..L298
	.long	28
	.long	616
	.quad	..L299
	.long	28
	.long	635
	.quad	..L307
	.long	28
	.long	654
	.quad	..L370
	.long	28
	.long	670
	.quad	..L369
	.long	28
	.long	689
	.quad	..L385
	.long	28
	.long	708
..L407:
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
..L408:
	.long	42078211
	.long	-2139090929
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
	.long	1082164976
	.long	-2139090926
	.long	-1988067200
	.long	-2071953280
	.long	-925435776
	.long	302178180
	.long	-2139062256
	.long	-2138472320
	.long	-2105376640
	.long	-2067212552
	.long	269615839
	.long	-2139062144
	.long	-2139062144
	.long	-1602057600
	.long	-488323088
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-257916792
	.long	48424135
	.long	-2139090926
	.long	-1988067200
	.long	-2071953280
	.long	-925435776
	.long	302178180
	.long	-2139062256
	.long	-2138472320
	.long	-2105376640
	.long	-2067212552
	.long	269615839
	.long	-2139062144
	.long	-2139062144
	.long	-1602057600
	.long	-488323088
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-257916792
	.long	48424135
	.long	-2139090926
	.long	-1853849472
	.long	-2071953280
	.long	-927104896
	.long	302177668
	.long	-2139062256
	.long	-2137948032
	.long	-2138931072
	.long	-2067219072
	.long	269615837
	.long	-2139062144
	.long	-2139062144
	.long	-528315776
	.long	-488322944
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-2132770680
	.long	48424136
	.long	-2139090929
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
	.long	-2139090931
	.long	-2139062144
	.long	-2139062144
	.long	269420284
	.long	-2139062144
	.long	-2139060864
	.long	-2119139200
	.long	269435008
	.long	-2139062144
	.long	-2139062144
	.long	-2119139200
	.long	269435008
	.long	-2139062144
	.long	-2139060864
	.long	-2119139200
	.long	269435008
	.long	-2139060096
	.long	-2139062144
	.long	-2119139200
	.long	269631616
	.long	-2139062144
	.long	-2139059840
	.long	-1199537024
	.long	-595277606
	.long	-2146430462
	.long	-2139062144
	.long	-2139062135
	.long	-625442686
	.long	48006344
	.long	-2139090926
	.long	-2139062144
	.long	-1971289984
	.long	-931086206
	.long	302178436
	.long	-2139062256
	.long	-2139062144
	.long	-2138537856
	.long	-2067234624
	.long	269615840
	.long	-2139062144
	.long	-2139059840
	.long	-1199537024
	.long	-595277606
	.long	-2146430462
	.long	-2139062144
	.long	-2139062135
	.long	-625442686
	.long	48006344
	.long	-2139090926
	.long	-2139062144
	.long	-1971289984
	.long	-931086206
	.long	302178436
	.long	-2139062256
	.long	-2139062144
	.long	-2138537856
	.long	-2067234624
	.long	269419232
	.long	-2139062144
	.long	-2139060864
	.long	-2119139200
	.long	269631616
	.long	-2139062144
	.long	-2139061312
	.long	-1602189184
	.long	-656177201
	.long	-2146430462
	.long	-2139062144
	.long	-2139062141
	.long	-811564414
	.long	47768519
	.long	-2139090929
	.long	-2139062144
	.long	-2139062144
	.long	1082163632
	.section .note.GNU-stack, ""
	.file   3 "/usr/include/stdio.h"
	.file   4 "/usr/include/libio.h"
	.file   5 "/usr/include/bits/types.h"
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
.debug_info_seg:
	.4byte 0x00001431
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
	.4byte .debug_str+0x81
	.4byte .debug_str+0xed
//	DW_AT_language:
	.byte 0x01
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte 0x0000000000000000
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x1e0
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4e5
	.4byte .debug_str+0x4e5
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x0000010b
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_abstract_origin:
	.4byte 0x00000035
//	DW_AT_low_pc:
	.8byte ..L399
//	DW_AT_high_pc:
	.8byte ..LNerror_handler.2202
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_AT_name:
	.4byte 0x0067736d
//	DW_AT_location:
	.2byte 0x5501
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x49
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4b9
	.4byte .debug_str+0x4b9
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNnearest_index.87
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x49
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x4ce
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x49
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x4d4
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x49
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x6169
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x4b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4c1
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x4b
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x4c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4da
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_inlined_subroutine:
	.byte 0x0b
//	DW_AT_low_pc:
	.8byte ..LN74
//	DW_AT_high_pc:
	.8byte ..LNnearest_index.87
//	DW_AT_abstract_origin:
	.4byte 0x00000035
//	DW_AT_call_line:
	.byte 0x50
//	DW_AT_call_column:
	.byte 0x07
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_AT_name:
	.4byte 0x0067736d
	.byte 0x00
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x4c7
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x00000106
//	DW_TAG_const_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x00000110
//	DW_TAG_const_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x00000115
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x01
//	DW_AT_encoding:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x4f3
//	DW_TAG_subprogram:
	.byte 0x10
//	DW_AT_decl_line:
	.byte 0x69
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x4f8
	.4byte .debug_str+0x4f8
//	DW_AT_low_pc:
	.8byte ..L31
//	DW_AT_high_pc:
	.8byte ..LNtokenize.271
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x69
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000241
//	DW_AT_name:
	.4byte .debug_str+0x501
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x69
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_AT_name:
	.4byte .debug_str+0x508
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x69
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000246
//	DW_AT_name:
	.4byte .debug_str+0x51c
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x6a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000246
//	DW_AT_name:
	.4byte .debug_str+0x523
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x6a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_AT_name:
	.4byte .debug_str+0x52a
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x6a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000252
//	DW_AT_name:
	.4byte .debug_str+0x532
//	DW_AT_location:
	.2byte 0x5901
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x6c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000025c
//	DW_AT_location:
	.2byte 0x5d01
//	DW_TAG_variable:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x6c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006a
//	DW_AT_type:
	.4byte 0x0000025c
//	DW_AT_location:
	.2byte 0x5601
//	DW_TAG_variable:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0x6c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x54c
//	DW_AT_type:
	.4byte 0x0000025c
//	DW_AT_location:
	.2byte 0x5c01
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x6c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006e656c
//	DW_AT_type:
	.4byte 0x0000025c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x6c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x551
//	DW_AT_type:
	.4byte 0x0000025c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x6d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x558
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x6d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_inlined_subroutine:
	.byte 0x0b
//	DW_AT_low_pc:
	.8byte ..LN230
//	DW_AT_high_pc:
	.8byte ..LN244
//	DW_AT_abstract_origin:
	.4byte 0x00000035
//	DW_AT_call_line:
	.byte 0x82
//	DW_AT_call_column:
	.byte 0x17
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_AT_name:
	.4byte 0x0067736d
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x0b
//	DW_AT_low_pc:
	.8byte ..LN197
//	DW_AT_high_pc:
	.8byte ..LN217
//	DW_AT_abstract_origin:
	.4byte 0x00000035
//	DW_AT_call_line:
	.byte 0x87
//	DW_AT_call_column:
	.byte 0x1a
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_AT_name:
	.4byte 0x0067736d
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x0b
//	DW_AT_low_pc:
	.8byte ..LN249
//	DW_AT_high_pc:
	.8byte ..LNtokenize.271
//	DW_AT_abstract_origin:
	.4byte 0x00000035
//	DW_AT_call_line:
	.byte 0x73
//	DW_AT_call_column:
	.byte 0x15
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_AT_name:
	.4byte 0x0067736d
	.byte 0x00
	.byte 0x00
//	DW_TAG_const_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x0000010b
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x50f
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x00000115
//	DW_TAG_const_type:
	.byte 0x0f
//	DW_AT_type:
	.4byte 0x00000257
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x00000246
//	DW_TAG_typedef:
	.byte 0x13
//	DW_AT_decl_line:
	.byte 0x2c
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_name:
	.4byte .debug_str+0x537
//	DW_AT_type:
	.4byte 0x00000267
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x53e
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x55e
	.4byte .debug_str+0x55e
//	DW_AT_low_pc:
	.8byte ..L82
//	DW_AT_high_pc:
	.8byte ..LNmaxval_double.401
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x95
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x571
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x97
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x98
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x576
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0xa8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x57d
	.4byte .debug_str+0x57d
//	DW_AT_low_pc:
	.8byte ..L95
//	DW_AT_high_pc:
	.8byte ..LNminval_double.531
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xa8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xa8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x571
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xaa
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xab
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x58b
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0xba
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x592
	.4byte .debug_str+0x592
//	DW_AT_low_pc:
	.8byte ..L108
//	DW_AT_high_pc:
	.8byte ..LNavgval_double.665
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xba
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xba
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x571
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xbd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5a0
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x10
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5a7
	.4byte .debug_str+0x5a7
//	DW_AT_low_pc:
	.8byte ..L119
//	DW_AT_high_pc:
	.8byte ..LNlatlon2xyz.728
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_AT_location:
	.2byte 0x5901
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5a7
	.4byte .debug_str+0x5a7
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x00000101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x00000101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x10
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5b2
	.4byte .debug_str+0x5b2
//	DW_AT_low_pc:
	.8byte ..L141
//	DW_AT_high_pc:
	.8byte ..LNxyz2latlon.805
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x706e
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x007a
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_formal_parameter:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xdc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_AT_location:
	.2byte 0x5901
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xdf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7878
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xdf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7979
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xdf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a7a
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xe0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5bd
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xe0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5c2
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xe1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5c7
	.4byte .debug_str+0x5c7
//	DW_AT_low_pc:
	.8byte ..L163
//	DW_AT_high_pc:
	.8byte ..LNbox_area.838
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x5d0
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x5d7
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x5de
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_formal_parameter:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x5e5
//	DW_AT_location:
	.2byte 0x6401
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xfd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7864
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xfe
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5cb
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x010f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5ec
	.4byte .debug_str+0x5ec
//	DW_AT_low_pc:
	.8byte ..L174
//	DW_AT_high_pc:
	.8byte ..LNpoly_area.939
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x010f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x010f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x010f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0111
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5cb
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6701
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0112
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_lexical_block:
	.byte 0x18
//	DW_AT_decl_line:
	.2byte 0x0114
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN849
//	DW_AT_high_pc:
	.8byte ..LN920
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0115
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7069
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0116
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7864
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0117
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5f6
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0117
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5fb
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0118
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7964
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0118
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00746164
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x600
	.4byte .debug_str+0x600
//	DW_AT_low_pc:
	.8byte ..L199
//	DW_AT_high_pc:
	.8byte ..LNpoly_area_no_adjust.1030
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0132
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5cb
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0133
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_lexical_block:
	.byte 0x18
//	DW_AT_decl_line:
	.2byte 0x0135
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN964
//	DW_AT_high_pc:
	.8byte ..LN1011
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0136
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7069
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x0137
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7864
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0138
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5f6
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0138
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5fb
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6501
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x614
	.4byte .debug_str+0x614
//	DW_AT_low_pc:
	.8byte ..L222
//	DW_AT_high_pc:
	.8byte ..LNdelete_vtx.1088
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x61f
//	DW_AT_location:
	.2byte 0x5201
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x614
	.4byte .debug_str+0x614
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x625
	.4byte .debug_str+0x625
//	DW_AT_low_pc:
	.8byte ..L235
//	DW_AT_high_pc:
	.8byte ..LNinsert_vtx.1153
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x630
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x636
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x63d
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0153
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x625
	.4byte .debug_str+0x625
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1c
//	DW_AT_decl_line:
	.2byte 0x015f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x644
	.4byte .debug_str+0x644
//	DW_AT_low_pc:
	.8byte ..L252
//	DW_AT_high_pc:
	.8byte ..LNv_print.1189
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x015f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x015f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x015f
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0161
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x0166
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x64c
	.4byte .debug_str+0x64c
//	DW_AT_low_pc:
	.8byte ..L272
//	DW_AT_high_pc:
	.8byte ..LNfix_lon.1719
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0166
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0166
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0166
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0166
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x5b8
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x0168
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x654
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x0168
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7864
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x0169
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0169
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6e6e
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x0169
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x65a
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_lexical_block:
	.byte 0x18
//	DW_AT_decl_line:
	.2byte 0x0173
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN1205
//	DW_AT_high_pc:
	.8byte ..LN1713
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0174
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6d69
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0174
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7069
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg
//	DW_AT_entry_pc:
	.8byte ..LN1668
//	DW_AT_abstract_origin:
	.4byte 0x000006cb
//	DW_AT_call_line:
	.2byte 0x0177
//	DW_AT_call_column:
	.byte 0x0c
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_TAG_formal_parameter:
	.byte 0x20
//	DW_AT_decl_line:
	.2byte 0x0147
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x61f
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x21
//	DW_AT_low_pc:
	.8byte ..LN1235
//	DW_AT_high_pc:
	.8byte ..LN1290
//	DW_AT_abstract_origin:
	.4byte 0x0000076f
//	DW_AT_call_line:
	.2byte 0x017a
//	DW_AT_call_column:
	.byte 0x0c
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.2byte 0x006e
//	DW_TAG_formal_parameter:
	.byte 0x20
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x630
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x636
//	DW_AT_location:
	.2byte 0x5b01
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0151
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x63d
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x0153
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_location:
	.2byte 0x5e01
	.byte 0x00
	.byte 0x00
//	DW_TAG_lexical_block:
	.byte 0x18
//	DW_AT_decl_line:
	.2byte 0x0180
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN1316
//	DW_AT_high_pc:
	.8byte ..LN1343
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0181
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6d69
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0181
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7069
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_lexical_block:
	.byte 0x18
//	DW_AT_decl_line:
	.2byte 0x0188
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN1351
//	DW_AT_high_pc:
	.8byte ..LN1430
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0189
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7864
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x01a4
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x65f
	.4byte .debug_str+0x65f
//	DW_AT_low_pc:
	.8byte ..L312
//	DW_AT_high_pc:
	.8byte ..LNgreat_circle_distance.1766
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x01a4
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x3170
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x01a4
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x3270
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01a6
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5bd
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01a6
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x675
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x67a
	.4byte .debug_str+0x67a
//	DW_AT_low_pc:
	.8byte ..L330
//	DW_AT_high_pc:
	.8byte ..LNspherical_angle.1812
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3176
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3276
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3376
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x01bf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x684
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7870
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7970
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a70
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6601
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7871
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7971
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a71
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6401
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00646464
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x9002
	.byte 0x20
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1b
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x67a
	.4byte .debug_str+0x67a
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x00000101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x00000101
//	DW_TAG_formal_parameter:
	.byte 0x04
//	DW_AT_type:
	.4byte 0x00000101
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x14
//	DW_AT_decl_line:
	.2byte 0x01dc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x68a
	.4byte .debug_str+0x68a
//	DW_AT_low_pc:
	.8byte ..L339
//	DW_AT_high_pc:
	.8byte ..LNspherical_excess_area.2081
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x01dc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x6a0
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x01dc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x6a5
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x01dd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x6aa
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x01dd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte .debug_str+0x6af
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x01dd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_name:
	.4byte .debug_str+0x6b4
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01df
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x5cb
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01df
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6bb
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01df
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6c0
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01df
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6c5
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01df
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6ca
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01e0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3176
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00001090
//	DW_AT_location:
	.4byte 0x7ed07603
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01e0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3276
	.byte 0x00
//	DW_AT_type:
	.4byte 0x00001099
//	DW_AT_location:
	.4byte 0x7ed07603
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01e0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x3376
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000010a2
//	DW_AT_location:
	.4byte 0x7ed07603
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x30
//	DW_AT_entry_pc:
	.8byte ..LN2025
//	DW_AT_abstract_origin:
	.4byte 0x00000aa4
//	DW_AT_call_line:
	.2byte 0x01f8
//	DW_AT_call_column:
	.byte 0x0a
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3176
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3276
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3376
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01bf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x684
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7870
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7970
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a70
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7871
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7971
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6401
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a71
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6501
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00646464
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x70
//	DW_AT_entry_pc:
	.8byte ..LN2029
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01f7
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0xa0
//	DW_AT_entry_pc:
	.8byte ..LN2024
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01f6
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0xd0
//	DW_AT_entry_pc:
	.8byte ..LN2023
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01f5
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x21
//	DW_AT_low_pc:
	.8byte ..LN1977
//	DW_AT_high_pc:
	.8byte ..LN2023
//	DW_AT_abstract_origin:
	.4byte 0x00000aa4
//	DW_AT_call_line:
	.2byte 0x01f2
//	DW_AT_call_column:
	.byte 0x0a
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3176
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3276
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3376
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x01bf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x684
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6601
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7870
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7970
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a70
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7871
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6201
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7971
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6901
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a71
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6601
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00646464
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x100
//	DW_AT_entry_pc:
	.8byte ..LN1925
//	DW_AT_abstract_origin:
	.4byte 0x00000aa4
//	DW_AT_call_line:
	.2byte 0x01ec
//	DW_AT_call_column:
	.byte 0x0a
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3176
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3276
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3376
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x01bf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x684
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7870
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6501
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7970
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a70
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7871
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6701
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7971
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a71
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6401
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00646464
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x130
//	DW_AT_entry_pc:
	.8byte ..LN1914
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01ea
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x160
//	DW_AT_entry_pc:
	.8byte ..LN1862
//	DW_AT_abstract_origin:
	.4byte 0x00000aa4
//	DW_AT_call_line:
	.2byte 0x01e6
//	DW_AT_call_column:
	.byte 0x0a
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3176
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3276
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x1f
//	DW_AT_decl_line:
	.2byte 0x01bd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3376
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x01bf
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x684
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x9002
	.byte 0x20
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7870
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6601
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7970
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a70
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7871
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6301
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7971
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7a71
	.byte 0x00
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6701
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x01c0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00646464
//	DW_AT_type:
	.4byte 0x000000fa
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x1e
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x1a0
//	DW_AT_entry_pc:
	.8byte ..LN1853
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01e5
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x21
//	DW_AT_low_pc:
	.8byte ..LN1839
//	DW_AT_high_pc:
	.8byte ..LN1853
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01e4
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x21
//	DW_AT_low_pc:
	.8byte ..LN1825
//	DW_AT_high_pc:
	.8byte ..LN1839
//	DW_AT_abstract_origin:
	.4byte 0x000003d4
//	DW_AT_call_line:
	.2byte 0x01e3
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0078
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0079
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xcc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x007a
//	DW_TAG_variable:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0xce
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x23
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_byte_size:
	.byte 0x18
//	DW_TAG_subrange_type:
	.byte 0x24
//	DW_AT_upper_bound:
	.byte 0x02
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x23
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_byte_size:
	.byte 0x18
//	DW_TAG_subrange_type:
	.byte 0x24
//	DW_AT_upper_bound:
	.byte 0x02
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x23
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_byte_size:
	.byte 0x18
//	DW_TAG_subrange_type:
	.byte 0x24
//	DW_AT_upper_bound:
	.byte 0x02
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1c
//	DW_AT_decl_line:
	.2byte 0x0206
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6cf
	.4byte .debug_str+0x6cf
//	DW_AT_low_pc:
	.8byte ..L360
//	DW_AT_high_pc:
	.8byte ..LNvect_cross.2102
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0206
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3170
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0206
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.2byte 0x3270
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0206
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0065
//	DW_AT_location:
	.2byte 0x5101
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1c
//	DW_AT_decl_line:
	.2byte 0x0212
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6da
	.4byte .debug_str+0x6da
//	DW_AT_low_pc:
	.8byte ..L367
//	DW_AT_high_pc:
	.8byte ..LNnormalize_vect.2121
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0212
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.2byte 0x0065
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x0214
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6e9
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x17
//	DW_AT_decl_line:
	.2byte 0x0215
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006b
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x1c
//	DW_AT_decl_line:
	.2byte 0x0224
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x6ee
	.4byte .debug_str+0x6ee
//	DW_AT_low_pc:
	.8byte ..L376
//	DW_AT_high_pc:
	.8byte ..LNunit_vect_latlon.2187
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0224
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x56c
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0224
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x006e6f6c
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_formal_parameter:
	.byte 0x15
//	DW_AT_decl_line:
	.2byte 0x0224
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000101
//	DW_AT_name:
	.4byte 0x0074616c
//	DW_AT_location:
	.2byte 0x5101
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0224
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.4byte .debug_str+0x6ff
//	DW_AT_location:
	.2byte 0x5201
//	DW_TAG_formal_parameter:
	.byte 0x1a
//	DW_AT_decl_line:
	.2byte 0x0224
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x000003cf
//	DW_AT_name:
	.4byte .debug_str+0x704
//	DW_AT_location:
	.2byte 0x5801
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x0226
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x709
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0226
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x711
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6801
//	DW_TAG_variable:
	.byte 0x16
//	DW_AT_decl_line:
	.2byte 0x0226
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x719
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_variable:
	.byte 0x1d
//	DW_AT_decl_line:
	.2byte 0x0226
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x721
//	DW_AT_type:
	.4byte 0x000000fa
//	DW_TAG_variable:
	.byte 0x19
//	DW_AT_decl_line:
	.2byte 0x0227
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x006e
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_location:
	.2byte 0x5f01
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x25
//	DW_AT_decl_line:
	.byte 0xaa
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x729
//	DW_AT_type:
	.4byte 0x000011e3
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x000011e8
//	DW_TAG_structure_type:
	.byte 0x26
//	DW_AT_decl_line:
	.byte 0xf5
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_byte_size:
	.byte 0xd8
//	DW_AT_name:
	.4byte .debug_str+0x730
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xf6
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x739
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x740
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xfc
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x74d
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xfd
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x75a
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xfe
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x20
//	DW_AT_name:
	.4byte .debug_str+0x768
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xff
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x28
//	DW_AT_name:
	.4byte .debug_str+0x777
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0100
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x30
//	DW_AT_name:
	.4byte .debug_str+0x785
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0101
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x38
//	DW_AT_name:
	.4byte .debug_str+0x793
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0102
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x40
//	DW_AT_name:
	.4byte .debug_str+0x7a0
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0104
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x48
//	DW_AT_name:
	.4byte .debug_str+0x7ac
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0105
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x50
//	DW_AT_name:
	.4byte .debug_str+0x7ba
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0106
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x58
//	DW_AT_name:
	.4byte .debug_str+0x7ca
//	DW_AT_type:
	.4byte 0x0000024d
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0108
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x60
//	DW_AT_name:
	.4byte .debug_str+0x7f3
//	DW_AT_type:
	.4byte 0x000013aa
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x010a
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x68
//	DW_AT_name:
	.4byte .debug_str+0x7fc
//	DW_AT_type:
	.4byte 0x000011e3
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x010c
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x70
//	DW_AT_name:
	.4byte .debug_str+0x803
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0110
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x74
//	DW_AT_name:
	.4byte .debug_str+0x80b
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0112
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x78
//	DW_AT_name:
	.4byte .debug_str+0x81b
//	DW_AT_type:
	.4byte 0x000013e2
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0116
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01802303
//	DW_AT_name:
	.4byte .debug_str+0x836
//	DW_AT_type:
	.4byte 0x000013f4
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0117
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01822303
//	DW_AT_name:
	.4byte .debug_str+0x842
//	DW_AT_type:
	.4byte 0x00000115
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0118
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01832303
//	DW_AT_name:
	.4byte .debug_str+0x851
//	DW_AT_type:
	.4byte 0x000013fb
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x011c
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01882303
//	DW_AT_name:
	.4byte .debug_str+0x86b
//	DW_AT_type:
	.4byte 0x00001404
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0125
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01902303
//	DW_AT_name:
	.4byte .debug_str+0x81f
//	DW_AT_type:
	.4byte 0x0000141b
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x012e
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01982303
//	DW_AT_name:
	.4byte .debug_str+0x87b
//	DW_AT_type:
	.4byte 0x00001426
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x012f
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01a02303
//	DW_AT_name:
	.4byte .debug_str+0x882
//	DW_AT_type:
	.4byte 0x00001426
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01a82303
//	DW_AT_name:
	.4byte .debug_str+0x889
//	DW_AT_type:
	.4byte 0x00001426
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0131
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01b02303
//	DW_AT_name:
	.4byte .debug_str+0x890
//	DW_AT_type:
	.4byte 0x00001426
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0132
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01b82303
//	DW_AT_name:
	.4byte .debug_str+0x897
//	DW_AT_type:
	.4byte 0x0000025c
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0134
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01c02303
//	DW_AT_name:
	.4byte .debug_str+0x89e
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x28
//	DW_AT_decl_line:
	.2byte 0x0136
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.4byte 0x01c42303
//	DW_AT_name:
	.4byte .debug_str+0x8a4
//	DW_AT_type:
	.4byte 0x0000142b
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x000013af
//	DW_TAG_structure_type:
	.byte 0x26
//	DW_AT_decl_line:
	.byte 0xa0
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_byte_size:
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x7d7
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x7e2
//	DW_AT_type:
	.4byte 0x000013aa
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xa2
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x7e8
//	DW_AT_type:
	.4byte 0x000011e3
//	DW_TAG_member:
	.byte 0x27
//	DW_AT_decl_line:
	.byte 0xa6
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x7ee
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_typedef:
	.byte 0x13
//	DW_AT_decl_line:
	.byte 0x83
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x813
//	DW_AT_type:
	.4byte 0x000013ed
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x547
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x02
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x827
//	DW_TAG_array_type:
	.byte 0x23
//	DW_AT_type:
	.4byte 0x00000115
//	DW_AT_byte_size:
	.byte 0x01
//	DW_TAG_subrange_type:
	.byte 0x24
//	DW_AT_upper_bound:
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x00001409
//	DW_TAG_typedef:
	.byte 0x13
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x85b
//	DW_AT_type:
	.4byte 0x00001414
//	DW_TAG_base_type:
	.byte 0x0d
//	DW_AT_byte_size:
	.byte 0x00
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x866
//	DW_TAG_typedef:
	.byte 0x13
//	DW_AT_decl_line:
	.byte 0x84
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x871
//	DW_AT_type:
	.4byte 0x000013ed
//	DW_TAG_pointer_type:
	.byte 0x0e
//	DW_AT_type:
	.4byte 0x00001414
//	DW_TAG_array_type:
	.byte 0x23
//	DW_AT_type:
	.4byte 0x00000115
//	DW_AT_byte_size:
	.byte 0x14
//	DW_TAG_subrange_type:
	.byte 0x24
//	DW_AT_upper_bound:
	.byte 0x13
	.byte 0x00
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
	.byte 0x55
	.byte 0x06
	.byte 0x10
	.byte 0x06
	.2byte 0x0000
	.byte 0x02
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x03
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x3c
	.byte 0x0c
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x3f
	.byte 0x0c
	.byte 0x20
	.byte 0x0b
	.2byte 0x0000
	.byte 0x04
	.byte 0x05
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x05
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x31
	.byte 0x13
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.2byte 0x0000
	.byte 0x06
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
	.byte 0x07
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
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
	.byte 0x08
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
	.byte 0x09
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
	.byte 0x0a
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
	.byte 0x0b
	.byte 0x1d
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x0b
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x0c
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
	.2byte 0x0000
	.byte 0x0d
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x0e
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x0f
	.byte 0x26
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x10
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
	.byte 0x11
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
	.byte 0x12
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
	.byte 0x13
	.byte 0x16
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
	.byte 0x14
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
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
	.byte 0x15
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x16
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x17
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x18
	.byte 0x0b
	.byte 0x01
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.2byte 0x0000
	.byte 0x19
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x1a
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x1b
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x3c
	.byte 0x0c
	.byte 0x49
	.byte 0x13
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x3f
	.byte 0x0c
	.byte 0x20
	.byte 0x0b
	.2byte 0x0000
	.byte 0x1c
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x05
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
	.byte 0x1d
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x1e
	.byte 0x1d
	.byte 0x01
	.byte 0x55
	.byte 0x06
	.byte 0x52
	.byte 0x01
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x05
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x1f
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x20
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x21
	.byte 0x1d
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x05
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x22
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
	.2byte 0x0000
	.byte 0x23
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x24
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x25
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
	.byte 0x3c
	.byte 0x0c
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x26
	.byte 0x13
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x0b
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x27
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x0a
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x28
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x0a
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
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
	.8byte 0x61736f6d2f636961
	.8byte 0x2e6c6974755f6369
	.2byte 0x0063
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
	.8byte 0x5f7473657261656e
	.4byte 0x65646e69
	.2byte 0x0078
	.4byte 0x62756f64
	.2byte 0x656c
	.byte 0x00
	.4byte 0x756c6176
	.2byte 0x0065
	.4byte 0x61727261
	.2byte 0x0079
	.8byte 0x696f675f7065656b
	.2byte 0x676e
	.byte 0x00
	.8byte 0x61685f726f727265
	.4byte 0x656c646e
	.2byte 0x0072
	.4byte 0x72616863
	.byte 0x00
	.8byte 0x657a696e656b6f74
	.byte 0x00
	.4byte 0x69727473
	.2byte 0x676e
	.byte 0x00
	.4byte 0x656b6f74
	.2byte 0x736e
	.byte 0x00
	.8byte 0x64656e6769736e75
	.4byte 0x746e6920
	.byte 0x00
	.4byte 0x6c726176
	.2byte 0x6e65
	.byte 0x00
	.4byte 0x7678616d
	.2byte 0x7261
	.byte 0x00
	.8byte 0x00676e6972747370
	.4byte 0x7274736e
	.byte 0x00
	.4byte 0x657a6973
	.2byte 0x745f
	.byte 0x00
	.8byte 0x64656e6769736e75
	.4byte 0x6e6f6c20
	.2byte 0x0067
	.4byte 0x7261766e
	.byte 0x00
	.4byte 0x6b6f746e
	.2byte 0x6e65
	.byte 0x00
	.4byte 0x6e756f66
	.2byte 0x0064
	.8byte 0x645f6c617678616d
	.4byte 0x6c62756f
	.2byte 0x0065
	.4byte 0x657a6973
	.byte 0x00
	.4byte 0x61746164
	.byte 0x00
	.4byte 0x7678616d
	.2byte 0x6c61
	.byte 0x00
	.8byte 0x645f6c61766e696d
	.4byte 0x6c62756f
	.2byte 0x0065
	.4byte 0x766e696d
	.2byte 0x6c61
	.byte 0x00
	.8byte 0x645f6c6176677661
	.4byte 0x6c62756f
	.2byte 0x0065
	.4byte 0x76677661
	.2byte 0x6c61
	.byte 0x00
	.8byte 0x78326e6f6c74616c
	.2byte 0x7a79
	.byte 0x00
	.8byte 0x6c74616c327a7978
	.2byte 0x6e6f
	.byte 0x00
	.4byte 0x74736964
	.byte 0x00
	.4byte 0x706e6973
	.byte 0x00
	.8byte 0x616572615f786f62
	.byte 0x00
	.4byte 0x6c5f6c6c
	.2byte 0x6e6f
	.byte 0x00
	.4byte 0x6c5f6c6c
	.2byte 0x7461
	.byte 0x00
	.4byte 0x6c5f7275
	.2byte 0x6e6f
	.byte 0x00
	.4byte 0x6c5f7275
	.2byte 0x7461
	.byte 0x00
	.8byte 0x6572615f796c6f70
	.2byte 0x0061
	.4byte 0x3174616c
	.byte 0x00
	.4byte 0x3274616c
	.byte 0x00
	.8byte 0x6572615f796c6f70
	.8byte 0x6a64615f6f6e5f61
	.4byte 0x00747375
	.8byte 0x765f6574656c6564
	.2byte 0x7874
	.byte 0x00
	.4byte 0x65645f6e
	.2byte 0x006c
	.8byte 0x765f747265736e69
	.2byte 0x7874
	.byte 0x00
	.4byte 0x6e695f6e
	.2byte 0x0073
	.4byte 0x5f6e6f6c
	.2byte 0x6e69
	.byte 0x00
	.4byte 0x5f74616c
	.2byte 0x6e69
	.byte 0x00
	.8byte 0x00746e6972705f76
	.8byte 0x006e6f6c5f786966
	.4byte 0x75735f78
	.2byte 0x006d
	.4byte 0x656c6f70
	.byte 0x00
	.8byte 0x69635f7461657267
	.8byte 0x7369645f656c6372
	.4byte 0x636e6174
	.2byte 0x0065
	.4byte 0x61746562
	.byte 0x00
	.8byte 0x6163697265687073
	.8byte 0x00656c676e615f6c
	.8byte 0x6163697265687073
	.8byte 0x7373656378655f6c
	.4byte 0x6572615f
	.2byte 0x0061
	.4byte 0x6c6c5f70
	.byte 0x00
	.4byte 0x6c755f70
	.byte 0x00
	.4byte 0x726c5f70
	.byte 0x00
	.4byte 0x72755f70
	.byte 0x00
	.4byte 0x69646172
	.2byte 0x7375
	.byte 0x00
	.4byte 0x31676e61
	.byte 0x00
	.4byte 0x32676e61
	.byte 0x00
	.4byte 0x33676e61
	.byte 0x00
	.4byte 0x34676e61
	.byte 0x00
	.8byte 0x6f72635f74636576
	.2byte 0x7373
	.byte 0x00
	.8byte 0x7a696c616d726f6e
	.4byte 0x65765f65
	.2byte 0x7463
	.byte 0x00
	.4byte 0x746f6470
	.byte 0x00
	.8byte 0x6365765f74696e75
	.8byte 0x6e6f6c74616c5f74
	.byte 0x00
	.4byte 0x6e6f6c76
	.byte 0x00
	.4byte 0x74616c76
	.byte 0x00
	.8byte 0x006e6f6c5f6e6973
	.8byte 0x006e6f6c5f736f63
	.8byte 0x0074616c5f6e6973
	.8byte 0x0074616c5f736f63
	.4byte 0x65647473
	.2byte 0x7272
	.byte 0x00
	.8byte 0x454c49465f4f495f
	.byte 0x00
	.4byte 0x616c665f
	.2byte 0x7367
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7274705f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x746972775f4f495f
	.4byte 0x61625f65
	.2byte 0x6573
	.byte 0x00
	.8byte 0x746972775f4f495f
	.4byte 0x74705f65
	.2byte 0x0072
	.8byte 0x746972775f4f495f
	.4byte 0x6e655f65
	.2byte 0x0064
	.8byte 0x5f6675625f4f495f
	.4byte 0x65736162
	.byte 0x00
	.8byte 0x5f6675625f4f495f
	.4byte 0x00646e65
	.8byte 0x657661735f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x6b6361625f4f495f
	.8byte 0x00657361625f7075
	.8byte 0x657661735f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x6b72616d5f4f495f
	.2byte 0x7265
	.byte 0x00
	.4byte 0x78656e5f
	.2byte 0x0074
	.4byte 0x7562735f
	.2byte 0x0066
	.4byte 0x736f705f
	.byte 0x00
	.8byte 0x7372656b72616d5f
	.byte 0x00
	.4byte 0x6168635f
	.2byte 0x6e69
	.byte 0x00
	.8byte 0x006f6e656c69665f
	.8byte 0x00327367616c665f
	.8byte 0x00745f66666f5f5f
	.8byte 0x66666f5f646c6f5f
	.4byte 0x00746573
	.8byte 0x64656e6769736e75
	.4byte 0x6f687320
	.2byte 0x7472
	.byte 0x00
	.8byte 0x6c6f635f7275635f
	.4byte 0x006e6d75
	.8byte 0x5f656c626174765f
	.4byte 0x7366666f
	.2byte 0x7465
	.byte 0x00
	.8byte 0x756274726f68735f
	.2byte 0x0066
	.8byte 0x6b636f6c5f4f495f
	.2byte 0x745f
	.byte 0x00
	.4byte 0x64696f76
	.byte 0x00
	.4byte 0x636f6c5f
	.2byte 0x006b
	.8byte 0x5f343666666f5f5f
	.2byte 0x0074
	.4byte 0x61705f5f
	.2byte 0x3164
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3264
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3364
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3464
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3564
	.byte 0x00
	.4byte 0x646f6d5f
	.2byte 0x0065
	.8byte 0x32646573756e755f
	.byte 0x00
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
// -- Begin DWARF2 SEGMENT .debug_ranges
	.section .debug_ranges
.debug_ranges_seg:
	.align 1
	.8byte ..LN1668
	.8byte ..LN1673
	.8byte ..LN1674
	.8byte ..LN1712
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN2025
	.8byte ..LN2026
	.8byte ..LN2030
	.8byte ..LN2032
	.8byte ..LN2034
	.8byte ..LN2063
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN2029
	.8byte ..LN2030
	.8byte ..LN2033
	.8byte ..LN2034
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN2024
	.8byte ..LN2025
	.8byte ..LN2026
	.8byte ..LN2027
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN2023
	.8byte ..LN2024
	.8byte ..LN2028
	.8byte ..LN2029
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN1925
	.8byte ..LN1938
	.8byte ..LN1939
	.8byte ..LN1977
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN1914
	.8byte ..LN1925
	.8byte ..LN1938
	.8byte ..LN1939
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN1862
	.8byte ..LN1866
	.8byte ..LN1868
	.8byte ..LN1879
	.8byte ..LN1881
	.8byte ..LN1914
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN1853
	.8byte ..LN1862
	.8byte ..LN1866
	.8byte ..LN1868
	.8byte ..LN1879
	.8byte ..LN1881
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN0
	.8byte ..LNerror_handler.2202
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.section .text
.LNDBG_TXe:
# End
