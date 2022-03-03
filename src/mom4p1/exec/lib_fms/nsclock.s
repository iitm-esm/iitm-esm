	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 16.0.3.210 Build 20160415";
# mark_description "-I/opt/cray/pe/libsci/17.09.1/INTEL/16.0/x86_64/include -I/opt/cray/pe/netcdf/4.4.1.1.3/INTEL/16.0/include -";
# mark_description "I/opt/cray/pe/mpt/7.6.3/gni/mpich-intel/16.0/include -I/opt/cray/pe/hdf5/1.10.0.3/INTEL/16.0/include -I/opt/";
# mark_description "cray/rca/2.2.11-6.0.4.0_13.2__g84de67a.ari/include -I/opt/cray/alps/6.4.3-6.0.4.1_2.1__g92a2fc0.ari/include ";
# mark_description "-I/opt/cray/xpmem/2.2.2-6.0.4.1_18.1__g43b0535.ari/include -I/opt/cray/gni-headers/5.0.11-6.0.4.0_7.2__g7136";
# mark_description "988.ari/include -I/opt/cray/pe/pmi/5.0.12/include -I/opt/cray/ugni/6.0.14-6.0.4.0_14.1__ge7db4a2.ari/include";
# mark_description " -I/opt/cray/udreg/2.3.2-6.0.4.0_12.2__g2f9c3ee.ari/include -I/opt/cray/wlm_detect/1.2.1-6.0.4.0_22.1__gd26a";
# mark_description "3dc.ari/include -I/opt/cray/krca/2.2.2-6.0.4.1_18.3__g4614cf3.ari/include -I/opt/cray-hss-devel/8.0.0/includ";
# mark_description "e -xCORE-AVX2 -D__CRAYXC -D__CRAY_BROADWELL -D__CRAYXT_COMPUTE_LINUX_TARGET -Duse_netCDF4 -Duse_libMPI -DENA";
# mark_description "BLE_ODA -DUSE_OCEAN_BGC -g -O3 -save-temps -c";
	.file "nsclock.c"
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
.debug_info_seg:
	.4byte 0x0000001a
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
	.4byte .debug_str+0x7a
	.4byte .debug_str+0xe6
//	DW_AT_language:
	.byte 0x01
//	DW_AT_use_UTF8:
	.byte 0x01
// -- Begin DWARF2 SEGMENT .debug_abbrev
	.section .debug_abbrev
.debug_abbrev_seg:
	.align 1
	.byte 0x01
	.byte 0x11
	.byte 0x00
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
	.2byte 0x0000
	.byte 0x00
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
	.8byte 0x70706d2f64657261
	.8byte 0x6b636f6c63736e2f
	.2byte 0x632e
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
	.8byte 0x632f74706f2f492d
	.8byte 0x6c2f65702f796172
	.8byte 0x37312f6963736269
	.8byte 0x4e492f312e39302e
	.8byte 0x302e36312f4c4554
	.8byte 0x2f34365f3638782f
	.8byte 0x206564756c636e69
	.8byte 0x632f74706f2f492d
	.8byte 0x6e2f65702f796172
	.8byte 0x2e342f6664637465
	.8byte 0x2f332e312e312e34
	.8byte 0x36312f4c45544e49
	.8byte 0x756c636e692f302e
	.8byte 0x706f2f492d206564
	.8byte 0x702f796172632f74
	.8byte 0x2e372f74706d2f65
	.8byte 0x2f696e672f332e36
	.8byte 0x6e692d686369706d
	.8byte 0x302e36312f6c6574
	.8byte 0x6564756c636e692f
	.8byte 0x2f74706f2f492d20
	.8byte 0x2f65702f79617263
	.8byte 0x312e312f35666468
	.8byte 0x4e492f332e302e30
	.8byte 0x302e36312f4c4554
	.8byte 0x6564756c636e692f
	.8byte 0x2f74706f2f492d20
	.8byte 0x6163722f79617263
	.8byte 0x2d31312e322e322f
	.8byte 0x5f302e342e302e36
	.8byte 0x38675f5f322e3331
	.8byte 0x612e613736656434
	.8byte 0x756c636e692f6972
	.8byte 0x706f2f492d206564
	.8byte 0x612f796172632f74
	.8byte 0x2e342e362f73706c
	.8byte 0x2e342e302e362d33
	.8byte 0x675f5f312e325f31
	.8byte 0x2e30636632613239
	.8byte 0x6c636e692f697261
	.8byte 0x6f2f492d20656475
	.8byte 0x2f796172632f7470
	.8byte 0x2e322f6d656d7078
	.8byte 0x2e302e362d322e32
	.8byte 0x312e38315f312e34
	.8byte 0x3530623334675f5f
	.8byte 0x692f6972612e3533
	.8byte 0x2d206564756c636e
	.8byte 0x72632f74706f2f49
	.8byte 0x682d696e672f7961
	.8byte 0x352f737265646165
	.8byte 0x2e362d31312e302e
	.8byte 0x2e375f302e342e30
	.8byte 0x36333137675f5f32
	.8byte 0x2f6972612e383839
	.8byte 0x206564756c636e69
	.8byte 0x632f74706f2f492d
	.8byte 0x702f65702f796172
	.8byte 0x312e302e352f696d
	.8byte 0x64756c636e692f32
	.8byte 0x74706f2f492d2065
	.8byte 0x67752f796172632f
	.8byte 0x312e302e362f696e
	.8byte 0x2e342e302e362d34
	.8byte 0x5f5f312e34315f30
	.8byte 0x3261346264376567
	.8byte 0x636e692f6972612e
	.8byte 0x2f492d206564756c
	.8byte 0x796172632f74706f
	.8byte 0x322f67657264752f
	.8byte 0x302e362d322e332e
	.8byte 0x2e32315f302e342e
	.8byte 0x63396632675f5f32
	.8byte 0x2f6972612e656533
	.8byte 0x206564756c636e69
	.8byte 0x632f74706f2f492d
	.8byte 0x5f6d6c772f796172
	.8byte 0x312f746365746564
	.8byte 0x302e362d312e322e
	.8byte 0x2e32325f302e342e
	.8byte 0x61363264675f5f31
	.8byte 0x2f6972612e636433
	.8byte 0x206564756c636e69
	.8byte 0x632f74706f2f492d
	.8byte 0x6163726b2f796172
	.8byte 0x362d322e322e322f
	.8byte 0x315f312e342e302e
	.8byte 0x3634675f5f332e38
	.8byte 0x72612e3366633431
	.8byte 0x64756c636e692f69
	.8byte 0x74706f2f492d2065
	.8byte 0x73682d796172632f
	.8byte 0x2f6c657665642d73
	.8byte 0x6e692f302e302e38
	.8byte 0x782d206564756c63
	.8byte 0x5856412d45524f43
	.8byte 0x52435f5f442d2032
	.8byte 0x5f442d2043585941
	.8byte 0x52425f594152435f
	.8byte 0x204c4c455744414f
	.8byte 0x594152435f5f442d
	.8byte 0x55504d4f435f5458
	.8byte 0x58554e494c5f4554
	.8byte 0x205445475241545f
	.8byte 0x656e5f657375442d
	.8byte 0x442d203446444374
	.8byte 0x4d62696c5f657375
	.8byte 0x414e45442d204950
	.8byte 0x2041444f5f454c42
	.8byte 0x434f5f455355442d
	.8byte 0x204347425f4e4145
	.8byte 0x2d20334f2d20672d
	.8byte 0x6d65742d65766173
	.4byte 0x2d207370
	.2byte 0x0063
	.section .text
.LNDBG_TXe:
# End
