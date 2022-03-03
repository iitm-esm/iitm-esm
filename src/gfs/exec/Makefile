# Makefile created by mkmf $Id: mkmf,v 1.1.2.1 2009/12/17 00:41:15 nnz Exp $ 

include /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/bin/mkmf.template

CPPDEFS = -Duse_netCDF -Duse_libMPI -DENABLE_ODA -Dfms_interp

.DEFAULT:
	-echo $@ does not exist.
all: atm.exe
affinity.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/affinity.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/affinity.c
albedo_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/albedo_mod.f90 error_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/albedo_mod.f90
atm.comm.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/atm.comm.f machine.o physcons_v.o cmp.comm.o mpi_def.o layout1.o ocean_mod.o interpred_mod.o land_model_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/atm.comm.f
bafrio.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bafrio.f
	$(FC) $(FFLAGS)  $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bafrio.f
bfilt_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bfilt_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bfilt_def.f
byteswap.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/byteswap.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/clib.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/byteswap.c
check.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/check.f90
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/check.f90
cmp.comm.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cmp.comm.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cmp.comm.f
cnvcld_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cnvcld_v.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cnvcld_v.f
compns.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/compns.f namelist_def.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/compns.f
constants.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/constants/constants.F90
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/constants/constants.F90
coordinate_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/coordinate_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/coordinate_def.f
create_xgrid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.h                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.c
damp_speed.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/damp_speed.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/damp_speed.f
data_override.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/data_override.f90 resol_def.o layout1.o time_manager.o nc_io_mod.o time_interp.o error_mod.o interpred_mod.o stringfunc.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/data_override.f90
date_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/date_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/date_def.f
dcyc2_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.f
dcyc2_v.pre.rad.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.pre.rad.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.pre.rad.f
deldifs.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs.f resol_def.o layout1.o coordinate_def.o deldifs_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs.f
deldifs_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs_def.f
delnpe.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpe.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpe.f
delnpo.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpo.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpo.f
dezouv.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dezouv.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dezouv.f
diag_axis.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_axis.F90 mpp_domains.o fms.o diag_data.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_axis.F90
diag_data.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h time_manager.o mpp_domains.o mpp_io.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_data.F90
diag_grid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h constants.o fms.o mpp.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_grid.F90
diag_manager.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_manager.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h time_manager.o mpp_io.o mpp.o fms.o diag_axis.o diag_util.o diag_data.o diag_table.o          \
diag_output.o diag_grid.o constants.o mpp_domains.o fms_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_manager.F90
diag_output.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_output.F90 mpp_io.o mpp_domains.o mpp.o diag_axis.o diag_data.o time_manager.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_output.F90
diag_table.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_table.F90 mpp_io.o mpp.o fms.o time_manager.o constants.o diag_data.o diag_util.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_table.F90
diag_tools.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/diag_tools.f90 machine.o resol_def.o coordinate_def.o layout1.o physcons_v.o gg_def.o mpi_def.o spectralgridconv.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/diag_tools.f90
diag_util.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_util.F90 diag_data.o diag_axis.o diag_output.o diag_grid.o fms.o fms_io.o mpp_domains.o time_manager.o mpp_io.o mpp.o constants.o interpred_mod.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_util.F90
digifilt.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/digifilt.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o sfc_var_mod.o dotstep_sicdif.o time_manager.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/digifilt.f
dotstep_sicdif.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dotstep_sicdif.f90 output_manager_fms.o diag_tools.o layout1.o physcons_v.o data_override.o time_manager.o land_model_mod.o ocean_mod.o cmp.comm.o spectralgridconv.o wrtout.o                  \
radiation_aerosol_mod.o error_mod.o gloopb_call.gbphys.o resol_def.o gg_def.o vert_def.o date_def.o namelist_def.o mpi_def.o sfc_var_mod.o gloopr.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dotstep_sicdif.f90
dozeuv.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dozeuv.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dozeuv.f
epslon.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/epslon.f resol_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/epslon.f
error_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/error_mod.f90 mpi_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/error_mod.f90
fftpack.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fftpack.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fftpack.f
filtr1eo.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr1eo.f resol_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr1eo.f
filtr2eo.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr2eo.f resol_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr2eo.f
fix_fields.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fix_fields.f machine.o funcphys_v.o progtm_module.o resol_def.o namelist_def.o layout1.o sfc_var_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fix_fields.f
fms.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms.F90 mpp.o mpp_domains.o mpp_io.o fms_io.o memutils.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms.F90
fms_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_2d.inc                                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_3d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_4d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/write_data.inc mpp_io.o mpp_domains.o mpp.o platform.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms_io.F90
four2fln.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2fln.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2fln.f
four2flnio.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2flnio.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2flnio.f
four2grid_thread.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2grid_thread.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2grid_thread.f
funcphys_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/funcphys_v.f90 machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/funcphys_v.f90
gather_times.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gather_times.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gather_times.f
gbphys_adv_hyb_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc.f machine.o resol_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc.f
gbphys_adv_hyb_gc_h-new.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc_h-new.f machine.o resol_def.o coordinate_def.o tracer_const_h-new.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc_h-new.f
gbphys_call.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_call.f90 time_manager.o gbphys_v.o resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o tracer_const_h-new.o rascnvv2_v.o physcons_v.o sfc_var_mod.o        \
land_model_mod.o ocean_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_call.f90
gbphys_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_v.f90 output_manager_fms.o surface_mod.o ocean_mod.o land_model_mod.o error_mod.o time_manager.o resol_def.o funcphys_v.o physcons_v.o machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_v.f90
gcycle_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gcycle_v.f machine.o physcons_v.o resol_def.o sfc_var_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gcycle_v.f
get_am_bm_hyb.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb.f machine.o resol_def.o namelist_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb.f
get_am_bm_hyb_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb_gc.f machine.o resol_def.o namelist_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb_gc.f
get_cd_hyb.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb.f machine.o resol_def.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb.f
get_cd_hyb_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb_gc.f machine.o resol_def.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb_gc.f
get_lats_node_shuff_a_fix.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_a_fix.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_a_fix.f
get_lats_node_shuff_r_fix.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_r_fix.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_r_fix.f
get_ls_node.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_ls_node.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_ls_node.f
get_namgfs.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_namgfs.f90 gfs_internalstate_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_namgfs.f90
get_prs_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_prs_v.f machine.o resol_def.o namelist_def.o physcons_v.o tracer_const_h-new.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_prs_v.f
getcon.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getcon.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getcon.f
getysk.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk.f resol_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk.f
getysk_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk_gc.f resol_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk_gc.f
gfidi_hyb.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb.f machine.o resol_def.o namelist_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb.f
gfidi_hyb_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc.f machine.o resol_def.o namelist_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc.f
gfidi_hyb_gc_h-new.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc_h-new.f machine.o resol_def.o namelist_def.o coordinate_def.o tracer_const_h-new.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc_h-new.f
gfidi_sig.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_sig.f machine.o resol_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_sig.f
gfs_initialize_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_initialize_mod.f90 machine.o gfsio_module.o diag_tools.o data_override.o interpred_mod.o land_model_mod.o ocean_mod.o date_def.o error_mod.o albedo_mod.o radiation_gases.o mpp.o       \
dotstep_sicdif.o output_manager_fms.o grrad.o atm.comm.o gfs_internalstate_mod.o time_manager.o resol_def.o reduce_lons_grid_module.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_initialize_mod.f90
gfs_internalstate_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_internalstate_mod.f90 namelist_mod.o machine.o layout1.o gg_def.o vert_def.o sig_io.o date_def.o namelist_def.o namelist_soilveg.o mpi_def.o semi_lag_def.o coordinate_def.o         \
tracer_const_h-new.o matrix_sig_def.o rascnvv2_v.o resol_def.o sfc_var_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_internalstate_mod.f90
gfs_run_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_run_mod.f90 gfs_internalstate_mod.o time_manager.o namelist_def.o vert_def.o mpi_def.o layout1.o date_def.o resol_def.o dotstep_sicdif.o error_mod.o land_model_mod.o wrtout.o                 \
output_manager_fms.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_run_mod.f90
gfs_standalone.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_standalone.f90 atm.comm.o gfs_internalstate_mod.o gfs_initialize_mod.o gfs_run_mod.o time_manager.o cmp.comm.o date_def.o mpp.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_standalone.f90
gfsio_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_def.f machine.o gfsio_module.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_def.f
gfsio_module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_module.f90
	$(FC) $(FFLAGS)  $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_module.f90
gg_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gg_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gg_def.f
glats.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/glats.f resol_def.o machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/glats.f
gloopa_opt.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopa_opt.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o mpi_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopa_opt.f
gloopb_call.gbphys.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopb_call.gbphys.f90 land_model_mod.o ocean_mod.o time_manager.o gbphys_call.o resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o bfilt_def.o           \
rascnvv2_v.o physcons_v.o sfc_var_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopb_call.gbphys.f90
gloopr.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopr.f90 output_manager_fms.o grrad.o machine.o funcphys_v.o physcons_v.o radiation_astronomy.o resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o                  \
tracer_const_h-new.o land_model_mod.o ocean_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopr.f90
gozrineo.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gozrineo.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gozrineo.f
gradient.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient.F90 mpp.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient.F90
gradient_c2l.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.c
gribit.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gribit.f machine.o namelist_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gribit.f
grid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/grid.F90 mpp.o constants.o fms.o fms_io.o mosaic.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/grid.F90
grid_collect.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_collect.f resol_def.o wrtout.o layout1.o mpi_def.o gfsio_module.o namelist_def.o vert_def.o gfsio_def.o coordinate_def.o sig_io.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_collect.f
grid_to_spec.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_to_spec.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o tracer_const_h-new.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_to_spec.f
grrad.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grrad.f machine.o physcons_v.o funcphys_v.o radiation_astronomy.o radiation_gases.o radiation_aerosols.o radiation_surface.o radiation_clouds.o radsw_param.o radsw_main.o radlw_param.o radlw_main.o    \
output_manager_fms.o albedo_mod.o error_mod.o layout1.o time_manager.o radiation_aerosol_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grrad.f
gscond_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gscond_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gscond_v.f
gsmddrive_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gsmddrive_v.f machine.o module_bfmicrophysics.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gsmddrive_v.f
gwdc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdc.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdc.f
gwdps_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdps_v.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdps_v.f
horiz_interp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp.F90 fms.o mpp.o constants.o horiz_interp_type.o horiz_interp_conserve.o horiz_interp_bilinear.o horiz_interp_bicubic.o horiz_interp_spherical.o mpp_io.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp.F90
horiz_interp_bicubic.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bicubic.F90 mpp.o fms.o horiz_interp_type.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bicubic.F90
horiz_interp_bilinear.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bilinear.F90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bilinear.F90
horiz_interp_conserve.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_conserve.F90 mpp.o fms.o fms_io.o constants.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_conserve.F90
horiz_interp_spherical.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_spherical.F90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_spherical.F90
horiz_interp_type.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_type.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_type.F90
hyb2press.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press.f machine.o resol_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press.f
hyb2press_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press_gc.f machine.o resol_def.o namelist_def.o vert_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press_gc.f
hyb2sig.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2sig.f machine.o resol_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2sig.f
ifshuff.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ifshuff.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ifshuff.f
impadj_hyb.locl.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl.f resol_def.o layout1.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl.f
impadj_hyb.locl_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl_gc.f resol_def.o layout1.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl_gc.f
impadj_sig.locl.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_sig.locl.f resol_def.o layout1.o matrix_sig_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_sig.locl.f
info.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/info.f resol_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/info.f
interp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.h                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.c
interpred_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/interpred_mod.F90 layout1.o resol_def.o physcons_v.o error_mod.o horiz_interp.o diag_data.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/interpred_mod.F90
iounitdef.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/iounitdef.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/iounitdef.f
land_model_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/land_model_mod.f90 resol_def.o layout1.o nc_io_mod.o error_mod.o interpred_mod.o mpi_def.o machine.o funcphys_v.o physcons_v.o ocean_mod.o time_manager.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/land_model_mod.f90
lats_shuff.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lats_shuff.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lats_shuff.f
layout1.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/layout1.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/layout1.f
lon_lat_para.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lon_lat_para.f machine.o resol_def.o layout1.o gg_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lon_lat_para.f
lrgsclr_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lrgsclr_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lrgsclr_v.f
machine.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/machine.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/machine.f
matrix_sig_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/matrix_sig_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/matrix_sig_def.f
memuse.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memuse.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memuse.c
memutils.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memutils.F90 mpp.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memutils.F90
module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module.f
module_bfmicrophysics.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module_bfmicrophysics.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module_bfmicrophysics.f
moninp1_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp1_v.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp1_v.f
moninp_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp_v.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp_v.f
moninq1_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq1_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq1_v.f
moninq_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq_v.f
mosaic.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic.F90
mosaic_util.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.c
mpi_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_def.f
mpi_more.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_more.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_more.f
mpi_quit.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_quit.f mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_quit.f
mpp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/system_clock.h                                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_mpi.inc                                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_s.h                              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_s.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm.inc                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit.inc                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum.inc                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_mpi.h                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_nocomm.h                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_int.h                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_scalar.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_gather.h mpp_parameter.o mpp_data.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp.F90
mpp_data.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_sma.inc                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_nocomm.inc mpp_parameter.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_data.F90
mpp_domains.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_define_nest_domains.inc                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_define.inc                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D_nonblock.h      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update.h               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_check.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_checkV.h                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_nest_domains.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nest.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_redistribute.h             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_reduce.inc                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_reduce.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum_tl.h                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_field.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_global_field.h mpp_parameter.o mpp_data.o mpp.o mpp_memutils.o mpp_pset.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_domains.F90
mpp_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_util.inc                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_connect.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_read.inc                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_read_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_write.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write_2Ddecomp.h                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write.h mpp_parameter.o mpp.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_io.F90
mpp_memutils.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_memutils.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_memutils.F90
mpp_parameter.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_parameter.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_parameter.F90
mpp_pset.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_pset.F90
mpp_utilities.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_utilities.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_utilities.F90
mstadb_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstadb_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstadb_v.f
mstcnv_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstcnv_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstcnv_v.f
namelist_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_def.f
namelist_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_mod.f90
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_mod.f90
namelist_soilveg.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_soilveg.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_soilveg.f
nc_io_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/nc_io_mod.f90 time_manager.o error_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/nc_io_mod.f90
nsclock.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/nsclock.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/nsclock.c
ocean_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ocean_mod.f90 resol_def.o layout1.o mpi_def.o machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ocean_mod.f90
omegas.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegas.f machine.o resol_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegas.f
omegtes.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes.f machine.o resol_def.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes.f
omegtes_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes_gc.f machine.o resol_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes_gc.f
output_manager_fms.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/output_manager_fms.f90 diag_manager.o time_manager.o constants.o resol_def.o layout1.o error_mod.o interpred_mod.o diag_data.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/output_manager_fms.f90
ozinterp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozinterp.f machine.o resol_def.o layout1.o gg_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozinterp.f
ozphys_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozphys_v.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozphys_v.f
para_fixio_w.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/para_fixio_w.f resol_def.o layout1.o sfcio_module.o sfc_var_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/para_fixio_w.f
physcons_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/physcons_v.f90 machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/physcons_v.f90
platform.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/platform/platform.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/platform/platform.F90
pln2eo.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/pln2eo.f resol_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/pln2eo.f
precpd_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/precpd_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/precpd_v.f
progt2_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progt2_v.f machine.o progtm_module.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progt2_v.f
progtm_module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progtm_module.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progtm_module.f
radiation_aerosol_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosol_mod.f90 layout1.o resol_def.o radsw_param.o radlw_param.o data_override.o error_mod.o physcons_v.o output_manager_fms.o time_manager.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosol_mod.f90
radiation_aerosols.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosols.f machine.o physcons_v.o iounitdef.o radsw_param.o radlw_param.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosols.f
radiation_astronomy.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_astronomy.f machine.o physcons_v.o iounitdef.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_astronomy.f
radiation_clouds.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_clouds.f machine.o physcons_v.o module_bfmicrophysics.o iounitdef.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_clouds.f
radiation_gases.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_gases.f machine.o funcphys_v.o physcons_v.o resol_def.o iounitdef.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_gases.f
radiation_surface.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_surface.f machine.o physcons_v.o iounitdef.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_surface.f
radlw_datatb.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_datatb.f machine.o radlw_param.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_datatb.f
radlw_main.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_main.f machine.o physcons_v.o radlw_param.o radlw_datatb.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_main.f
radlw_param.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_param.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_param.f
radsw_datatb.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_datatb.f machine.o radsw_param.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_datatb.f
radsw_main.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_main.f machine.o physcons_v.o radsw_param.o radsw_datatb.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_main.f
radsw_param.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_param.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_param.f
rascnvv2_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rascnvv2_v.f machine.o physcons_v.o funcphys_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rascnvv2_v.f
read_fix.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/read_fix.f resol_def.o layout1.o mpi_def.o sfcio_module.o sfc_var_mod.o namelist_soilveg.o physcons_v.o machine.o wrtout.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/read_fix.f
read_mosaic.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h                                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.c
readfromnc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/readfromnc.f90
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/readfromnc.f90
redist_lats_a.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_a.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_a.f
redist_lats_r_b_fix.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_r_b_fix.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_r_b_fix.f
reduce_lons_grid_module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/reduce_lons_grid_module.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/reduce_lons_grid_module.f
resol_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/resol_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/resol_def.f
rms_spect.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rms_spect.f resol_def.o layout1.o namelist_def.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rms_spect.f
sascnv_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnv_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnv_v.f
sascnvn_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnvn_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnvn_v.f
semi_lag_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/semi_lag_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/semi_lag_def.f
set_local_lnt2_lonr_latr.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_local_lnt2_lonr_latr.f90 gfs_internalstate_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_local_lnt2_lonr_latr.f90
set_soilveg.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_soilveg.f namelist_soilveg.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_soilveg.f
setlats.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setlats.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setlats.f
setsig.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setsig.f machine.o resol_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setsig.f
sfc_diag.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_diag.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_diag.f
sfc_land.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_land.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_land.f
sfc_var_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_var_mod.f90 machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_var_mod.f90
sfcio_module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcio_module.f90
	$(FC) $(FFLAGS)  $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcio_module.f90
sfcsub.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcsub.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcsub.f
sflx.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sflx.f machine.o physcons_v.o namelist_soilveg.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sflx.f
shalcnv_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcnv_v.f machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcnv_v.f
shalcv_v.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v.f
shalcv_v_opr.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v_opr.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v_opr.f
shuffle_grid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shuffle_grid.f machine.o resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shuffle_grid.f
sicdif_hyb.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb.f resol_def.o layout1.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb.f
sicdif_hyb_gc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb_gc.f resol_def.o layout1.o coordinate_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb_gc.f
sicdif_sig.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_sig.f resol_def.o layout1.o matrix_sig_def.o machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_sig.f
sig2press.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig2press.f machine.o resol_def.o coordinate_def.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig2press.f
sig_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig_io.f resol_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig_io.f
sigio_module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_module.f90
	$(FC) $(FFLAGS)  $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_module.f90
sigio_r_module.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_r_module.f90 sigio_module.o
	$(FC) $(FFLAGS)  $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_r_module.f90
sortrx.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sortrx.f
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sortrx.f
spect_fields.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_fields.f resol_def.o layout1.o gg_def.o vert_def.o namelist_def.o gfsio_module.o gfsio_def.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_fields.f
spect_send.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_send.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_send.f
spect_to_grid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_to_grid.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o tracer_const_h-new.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_to_grid.f
spect_tv_enthalpy_ps.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_tv_enthalpy_ps.f resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o tracer_const_h-new.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_tv_enthalpy_ps.f
spect_write.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_write.f resol_def.o layout1.o coordinate_def.o sig_io.o namelist_def.o mpi_def.o sigio_module.o sigio_r_module.o tracer_const_h-new.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_write.f
spectralgridconv.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spectralgridconv.f90 resol_def.o layout1.o gg_def.o vert_def.o date_def.o namelist_def.o coordinate_def.o tracer_const_h-new.o physcons_v.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spectralgridconv.f90
starttimeget.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/starttimeget.f90
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/starttimeget.f90
stringfunc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/stringfunc.f90
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/stringfunc.f90
sumder2.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumder2.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumder2.f
sumfln.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumfln.f resol_def.o layout1.o mpi_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumfln.f
surface_mod.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/surface_mod.f90 machine.o funcphys_v.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/surface_mod.f90
test_fms_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/test_fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h mpp.o mpp_domains.o mpp_io.o fms_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/test_fms_io.F90
test_mpp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp.F90
test_mpp_domains.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h mpp.o mpp_domains.o mpp_memutils.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_domains.F90
test_mpp_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h mpp.o mpp_domains.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_io.F90
test_mpp_pset.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h mpp.o mpp_pset.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -r8 $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_pset.F90
threadloc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/threadloc.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/threadloc.c
tiles.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tiles.f atm.comm.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tiles.f
time_interp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_interp.f90 time_manager.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_interp.f90
time_manager.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_manager.f90
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_manager.f90
tracer_const_h-new.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tracer_const_h-new.f machine.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tracer_const_h-new.f
treadeo.gfsio.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.gfsio.f resol_def.o layout1.o coordinate_def.o sig_io.o namelist_def.o vert_def.o mpi_def.o physcons_v.o gfsio_module.o gfsio_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.gfsio.f
treadeo.io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.io.f resol_def.o layout1.o coordinate_def.o sig_io.o namelist_def.o vert_def.o mpi_def.o physcons_v.o sigio_module.o sigio_r_module.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.io.f
triseori.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/triseori.f resol_def.o layout1.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/triseori.f
twriteeo.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/twriteeo.f resol_def.o layout1.o coordinate_def.o sig_io.o namelist_def.o mpi_def.o sigio_module.o sigio_r_module.o tracer_const_h-new.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/twriteeo.f
uveodz.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uveodz.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uveodz.f
uvoedz.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uvoedz.f resol_def.o layout1.o physcons_v.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uvoedz.f
ver_sig.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ver_sig.f machine.o resol_def.o physcons_v.o namelist_def.o matrix_sig_def.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ver_sig.f
vert_def.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/vert_def.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/vert_def.f
wrtout.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtout.f machine.o resol_def.o gfsio_module.o gfsio_def.o layout1.o sig_io.o namelist_def.o mpi_def.o sigio_module.o sigio_r_module.o sfc_var_mod.o time_manager.o sfcio_module.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtout.f
wrtsfc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtsfc.f machine.o resol_def.o layout1.o sig_io.o namelist_def.o sfc_var_mod.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtsfc.f
ysminv.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ysminv.f machine.o
	$(FC) $(FFLAGS) -r8 $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ysminv.f
./hyb2press.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press.f .
./mpp_sum_nocomm.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_nocomm.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_nocomm.h .
./mpp_error_a_s.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_s.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_s.h .
./mpp_memutils.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_memutils.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_memutils.F90 .
./dezouv.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dezouv.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dezouv.f .
./mpp_reduce_nocomm.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_nocomm.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_nocomm.h .
./gfs_run_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_run_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_run_mod.f90 .
./mpp_comm_nocomm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_nocomm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_nocomm.inc .
./mpp_util_mpi.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_mpi.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_mpi.inc .
./radiation_aerosols.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosols.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosols.f .
./physcons_v.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/physcons_v.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/physcons_v.f90 .
./treadeo.io.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.io.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.io.f .
./constant.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h .
./fix_fields.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fix_fields.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fix_fields.f .
./surface_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/surface_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/surface_mod.f90 .
./mstcnv_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstcnv_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstcnv_v.f .
./mpp_io_write.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_write.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_write.inc .
./get_lats_node_shuff_r_fix.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_r_fix.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_r_fix.f .
./treadeo.gfsio.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.gfsio.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.gfsio.f .
./mpp_transmit_mpi.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_mpi.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_mpi.h .
./mpp_io_read.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_read.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_read.inc .
./ysminv.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ysminv.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ysminv.f .
./mpp_write.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write.h .
./mpp_reduce_sma.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_sma.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_sma.h .
./mpp_write_2Ddecomp.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write_2Ddecomp.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write_2Ddecomp.h .
./sumder2.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumder2.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumder2.f .
./progtm_module.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progtm_module.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progtm_module.f .
./dcyc2_v.pre.rad.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.pre.rad.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.pre.rad.f .
./gozrineo.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gozrineo.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gozrineo.f .
./filtr2eo.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr2eo.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr2eo.f .
./gfs_standalone.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_standalone.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_standalone.f90 .
./test_fms_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/test_fms_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/test_fms_io.F90 .
./diag_util.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_util.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_util.F90 .
./gfs_initialize_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_initialize_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_initialize_mod.f90 .
./data_override.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/data_override.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/data_override.f90 .
./shalcv_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v.f .
./mpp_io_connect.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_connect.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_connect.inc .
./gcycle_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gcycle_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gcycle_v.f .
./mpp_chksum_int.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_int.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_int.h .
./mpp_reduce_mpi.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_mpi.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_mpi.h .
./clib.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/clib.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/clib.h .
./get_namgfs.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_namgfs.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_namgfs.f90 .
./gfidi_hyb_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc.f .
./spect_send.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_send.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_send.f .
./ozinterp.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozinterp.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozinterp.f .
./radlw_param.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_param.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_param.f .
./impadj_sig.locl.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_sig.locl.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_sig.locl.f .
./compns.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/compns.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/compns.f .
./gather_times.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gather_times.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gather_times.f .
./mpp_sum_mpi.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_mpi.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_mpi.h .
./mpp_pset.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_pset.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_pset.F90 .
./bfilt_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bfilt_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bfilt_def.f .
./mpp_util.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util.inc .
./impadj_hyb.locl_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl_gc.f .
./shalcnv_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcnv_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcnv_v.f .
./mpp_data.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_data.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_data.F90 .
./grrad.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grrad.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grrad.f .
./uveodz.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uveodz.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uveodz.f .
./spect_write.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_write.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_write.f .
./test_mpp_pset.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_pset.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_pset.F90 .
./mstadb_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstadb_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstadb_v.f .
./info.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/info.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/info.f .
./sfc_diag.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_diag.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_diag.f .
./mpp_chksum_scalar.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_scalar.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_scalar.h .
./horiz_interp_spherical.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_spherical.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_spherical.F90 .
./sigio_module.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_module.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_module.f90 .
./horiz_interp_bilinear.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bilinear.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bilinear.F90 .
./gribit.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gribit.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gribit.f .
./gradient_c2l.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.c .
./mpp_domains.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_domains.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_domains.F90 .
./mpp_do_checkV.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_checkV.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_checkV.h .
./epslon.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/epslon.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/epslon.f .
./four2fln.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2fln.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2fln.f .
./namelist_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_def.f .
./lrgsclr_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lrgsclr_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lrgsclr_v.f .
./mpp_comm_sma.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_sma.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_sma.inc .
./radiation_clouds.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_clouds.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_clouds.f .
./dotstep_sicdif.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dotstep_sicdif.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dotstep_sicdif.f90 .
./moninp_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp_v.f .
./radsw_param.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_param.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_param.f .
./lon_lat_para.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lon_lat_para.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lon_lat_para.f .
./byteswap.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/byteswap.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/byteswap.c .
./mpp_sum.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum.inc .
./sfc_var_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_var_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_var_mod.f90 .
./diag_manager.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_manager.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_manager.F90 .
./matrix_sig_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/matrix_sig_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/matrix_sig_def.f .
./horiz_interp_conserve.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_conserve.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_conserve.F90 .
./mpp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp.F90 .
./mpp_do_update_nonblock.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nonblock.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nonblock.h .
./create_xgrid.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.h .
./set_local_lnt2_lonr_latr.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_local_lnt2_lonr_latr.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_local_lnt2_lonr_latr.f90 .
./ver_sig.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ver_sig.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ver_sig.f .
./get_lats_node_shuff_a_fix.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_a_fix.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_a_fix.f .
./create_xgrid.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.c .
./radsw_main.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_main.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_main.f .
./affinity.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/affinity.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/affinity.c .
./nc_io_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/nc_io_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/nc_io_mod.f90 .
./mpp_update_domains2D.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D.h .
./machine.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/machine.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/machine.f .
./mpp_global_reduce.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_reduce.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_reduce.h .
./diag_data.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_data.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_data.F90 .
./twriteeo.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/twriteeo.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/twriteeo.f .
./radsw_datatb.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_datatb.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_datatb.f .
./test_mpp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp.F90 .
./mpp_update_nest_domains.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_nest_domains.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_nest_domains.h .
./sicdif_hyb.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb.f .
./resol_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/resol_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/resol_def.f .
./gsmddrive_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gsmddrive_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gsmddrive_v.f .
./gloopr.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopr.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopr.f90 .
./set_soilveg.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_soilveg.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_soilveg.f .
./funcphys_v.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/funcphys_v.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/funcphys_v.f90 .
./lats_shuff.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lats_shuff.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lats_shuff.f .
./diag_table.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_table.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_table.F90 .
./atm.comm.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/atm.comm.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/atm.comm.f .
./check.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/check.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/check.f90 .
./gfidi_sig.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_sig.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_sig.f .
./read_fix.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/read_fix.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/read_fix.f .
./gradient.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient.F90 .
./vert_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/vert_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/vert_def.f .
./getysk.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk.f .
./read_mosaic.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.h .
./albedo_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/albedo_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/albedo_mod.f90 .
./semi_lag_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/semi_lag_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/semi_lag_def.f .
./gbphys_adv_hyb_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc.f .
./moninq_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq_v.f .
./mpp_do_update.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update.h .
./mpp_transmit_sma.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_sma.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_sma.h .
./get_am_bm_hyb_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb_gc.f .
./grid_collect.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_collect.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_collect.f .
./gbphys_call.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_call.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_call.f90 .
./mpp_utilities.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_utilities.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_utilities.F90 .
./sascnv_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnv_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnv_v.f .
./mpp_domains_misc.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_misc.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_misc.inc .
./moninq1_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq1_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq1_v.f .
./radiation_surface.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_surface.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_surface.f .
./tracer_const_h-new.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tracer_const_h-new.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tracer_const_h-new.f .
./digifilt.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/digifilt.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/digifilt.f .
./mpp_util_nocomm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_nocomm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_nocomm.inc .
./impadj_hyb.locl.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl.f .
./mosaic.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic.F90 .
./mpp_transmit_nocomm.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_nocomm.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_nocomm.h .
./hyb2press_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press_gc.f .
./radiation_gases.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_gases.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_gases.f .
./layout1.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/layout1.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/layout1.f .
./sfcsub.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcsub.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcsub.f .
./fftpack.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fftpack.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fftpack.f .
./fms_platform.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h .
./wrtsfc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtsfc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtsfc.f .
./mpp_gather.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_gather.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_gather.h .
./mosaic_util.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h .
./damp_speed.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/damp_speed.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/damp_speed.f .
./delnpo.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpo.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpo.f .
./mpp_global_field.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_field.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_field.h .
./sumfln.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumfln.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumfln.f .
./fms_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms_io.F90 .
./four2grid_thread.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2grid_thread.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2grid_thread.f .
./mpp_read_2Ddecomp.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_read_2Ddecomp.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_read_2Ddecomp.h .
./threadloc.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/threadloc.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/threadloc.c .
./para_fixio_w.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/para_fixio_w.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/para_fixio_w.f .
./platform.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/platform/platform.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/platform/platform.F90 .
./time_manager.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_manager.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_manager.f90 .
./mpp_define_nest_domains.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_define_nest_domains.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_define_nest_domains.inc .
./mpp_do_update_nest.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nest.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nest.h .
./mpp_error_s_a.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_a.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_a.h .
./cmp.comm.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cmp.comm.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cmp.comm.f .
./radlw_datatb.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_datatb.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_datatb.f .
./getysk_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk_gc.f .
./bafrio.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bafrio.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bafrio.f .
./get_cd_hyb_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb_gc.f .
./mpp_domains_comm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_comm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_comm.inc .
./mpp_global_sum_tl.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum_tl.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum_tl.h .
./grid_to_spec.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_to_spec.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_to_spec.f .
./interp.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.c .
./write_data.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/write_data.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/write_data.inc .
./dcyc2_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.f .
./deldifs.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs.f .
./mpp_data_mpi.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_mpi.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_mpi.inc .
./horiz_interp_bicubic.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bicubic.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bicubic.F90 .
./pln2eo.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/pln2eo.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/pln2eo.f .
./radiation_aerosol_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosol_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosol_mod.f90 .
./mpp_parameter.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_parameter.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_parameter.F90 .
./mpp_global_sum.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum.h .
./coordinate_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/coordinate_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/coordinate_def.f .
./gfidi_hyb.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb.f .
./get_am_bm_hyb.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb.f .
./mpp_update_domains2D_nonblock.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D_nonblock.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D_nonblock.h .
./mpp_do_get_boundary.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_get_boundary.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_get_boundary.h .
./mpp_domains_define.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_define.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_define.inc .
./get_prs_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_prs_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_prs_v.f .
./stringfunc.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/stringfunc.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/stringfunc.f90 .
./wrtout.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtout.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtout.f .
./fms.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms.F90 .
./read_data_4d.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_4d.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_4d.inc .
./omegtes.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes.f .
./mpp_do_updateV.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV.h .
./ocean_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ocean_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ocean_mod.f90 .
./redist_lats_a.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_a.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_a.f .
./gg_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gg_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gg_def.f .
./shalcv_v_opr.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v_opr.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v_opr.f .
./sflx.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sflx.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sflx.f .
./diag_axis.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_axis.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_axis.F90 .
./mpp_util_sma.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_sma.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_sma.inc .
./spect_tv_enthalpy_ps.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_tv_enthalpy_ps.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_tv_enthalpy_ps.f .
./rascnvv2_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rascnvv2_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rascnvv2_v.f .
./glats.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/glats.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/glats.f .
./gfsio_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_def.f .
./mpi_quit.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_quit.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_quit.f .
./setsig.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setsig.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setsig.f .
./hyb2sig.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2sig.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2sig.f .
./get_cd_hyb.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb.f .
./mpp_do_global_field.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_global_field.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_global_field.h .
./tiles.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tiles.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tiles.f .
./filtr1eo.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr1eo.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr1eo.f .
./read_data_3d.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_3d.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_3d.inc .
./gwdc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdc.f .
./mpp_sum_sma.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_sma.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_sma.h .
./moninp1_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp1_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp1_v.f .
./mpp_domains_reduce.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_reduce.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_reduce.inc .
./iounitdef.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/iounitdef.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/iounitdef.f .
./mpp_chksum.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum.h .
./mpp_error_a_a.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_a.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_a.h .
./diag_tools.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/diag_tools.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/diag_tools.f90 .
./module.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module.f .
./rms_spect.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rms_spect.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rms_spect.f .
./mpp_data_nocomm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_nocomm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_nocomm.inc .
./sigio_r_module.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_r_module.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_r_module.f90 .
./sascnvn_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnvn_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnvn_v.f .
./grid.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/grid.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/grid.F90 .
./omegtes_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes_gc.f .
./starttimeget.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/starttimeget.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/starttimeget.f90 .
./horiz_interp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp.F90 .
./mosaic_util.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.c .
./horiz_interp_type.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_type.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_type.F90 .
./deldifs_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs_def.f .
./gfsio_module.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_module.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_module.f90 .
./mpp_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_io.F90 .
./output_manager_fms.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/output_manager_fms.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/output_manager_fms.f90 .
./readfromnc.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/readfromnc.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/readfromnc.f90 .
./precpd_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/precpd_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/precpd_v.f .
./mpp_data_sma.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_sma.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_sma.inc .
./namelist_soilveg.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_soilveg.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_soilveg.f .
./triseori.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/triseori.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/triseori.f .
./cnvcld_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cnvcld_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cnvcld_v.f .
./memutils.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memutils.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memutils.F90 .
./time_interp.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_interp.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_interp.f90 .
./mpi_more.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_more.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_more.f .
./nsclock.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/nsclock.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/nsclock.c .
./mpp_comm_mpi.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_mpi.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_mpi.inc .
./memuse.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memuse.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memuse.c .
./mpp_transmit.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit.inc .
./mpp_domains_util.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_util.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_util.inc .
./get_ls_node.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_ls_node.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_ls_node.f .
./constants.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/constants/constants.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/constants/constants.F90 .
./diag_grid.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_grid.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_grid.F90 .
./read_mosaic.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.c .
./redist_lats_r_b_fix.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_r_b_fix.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_r_b_fix.f .
./date_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/date_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/date_def.f .
./spect_to_grid.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_to_grid.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_to_grid.f .
./gscond_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gscond_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gscond_v.f .
./sfcio_module.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcio_module.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcio_module.f90 .
./ozphys_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozphys_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozphys_v.f .
./gfs_internalstate_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_internalstate_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_internalstate_mod.f90 .
./reduce_lons_grid_module.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/reduce_lons_grid_module.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/reduce_lons_grid_module.f .
./gbphys_adv_hyb_gc_h-new.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc_h-new.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc_h-new.f .
./mpp_do_check.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_check.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_check.h .
./land_model_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/land_model_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/land_model_mod.f90 .
./mpi_def.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_def.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_def.f .
./sig2press.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig2press.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig2press.f .
./spect_fields.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_fields.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_fields.f .
./mpp_do_updateV_nonblock.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV_nonblock.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV_nonblock.h .
./radiation_astronomy.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_astronomy.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_astronomy.f .
./spectralgridconv.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spectralgridconv.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spectralgridconv.f90 .
./progt2_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progt2_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progt2_v.f .
./getcon.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getcon.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getcon.f .
./interpred_mod.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/interpred_mod.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/interpred_mod.F90 .
./shuffle_grid.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shuffle_grid.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shuffle_grid.f .
./error_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/error_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/error_mod.f90 .
./module_bfmicrophysics.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module_bfmicrophysics.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module_bfmicrophysics.f .
./sicdif_hyb_gc.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb_gc.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb_gc.f .
./read_data_2d.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_2d.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_2d.inc .
./test_mpp_domains.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_domains.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_domains.F90 .
./sfc_land.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_land.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_land.f .
./gfidi_hyb_gc_h-new.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc_h-new.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc_h-new.f .
./gwdps_v.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdps_v.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdps_v.f .
./gloopa_opt.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopa_opt.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopa_opt.f .
./ifshuff.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ifshuff.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ifshuff.f .
./uvoedz.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uvoedz.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uvoedz.f .
./dozeuv.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dozeuv.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dozeuv.f .
./mpp_do_redistribute.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_redistribute.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_redistribute.h .
./sortrx.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sortrx.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sortrx.f .
./gbphys_v.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_v.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_v.f90 .
./omegas.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegas.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegas.f .
./test_mpp_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_io.F90 .
./delnpe.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpe.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpe.f .
./four2flnio.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2flnio.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2flnio.f .
./diag_output.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_output.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_output.F90 .
./radlw_main.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_main.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_main.f .
./mpp_comm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm.inc .
./setlats.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setlats.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setlats.f .
./mpp_io_util.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_util.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_util.inc .
./gradient_c2l.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.h .
./sig_io.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig_io.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig_io.f .
./interp.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.h .
./mpp_io_misc.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_misc.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_misc.inc .
./mpp_error_s_s.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_s.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_s.h .
./system_clock.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/system_clock.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/system_clock.h .
./namelist_mod.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_mod.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_mod.f90 .
./sicdif_sig.f: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_sig.f
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_sig.f .
./gloopb_call.gbphys.f90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopb_call.gbphys.f90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopb_call.gbphys.f90 .
./mpp_get_boundary.h: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_get_boundary.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_get_boundary.h .
SRC = /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_util.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_prs_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_to_spec.f                                                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopb_call.gbphys.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fftpack.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtout.f                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gather_times.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uveodz.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_manager.f90                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/nc_io_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.pre.rad.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gscond_v.f          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_output.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_call.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.c                                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/platform/platform.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp1_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstadb_v.f        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_to_grid.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setlats.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/iounitdef.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/twriteeo.f                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_surface.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uvoedz.f                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr1eo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstcnv_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_sig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gcycle_v.f                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/atm.comm.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/coordinate_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_soilveg.f              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_param.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/vert_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press_gc.f                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_interp.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memuse.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozphys_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/land_model_mod.f90           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq1_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/test_fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig_io.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_internalstate_mod.f90        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2fln.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_a_fix.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopa_opt.f   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rms_spect.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_r_fix.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/funcphys_v.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/date_def.f          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr2eo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_v.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/byteswap.c                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/damp_speed.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/read_fix.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bicubic.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.f   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcsub.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bafrio.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_soilveg.f                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpe.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_datatb.f            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/constants/constants.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_main.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gsmddrive_v.f           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcnv_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dozeuv.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2grid_thread.f                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/matrix_sig_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/data_override.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/stringfunc.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.io.f             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progt2_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_fields.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_sig.f                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gg_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_tv_enthalpy_ps.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/layout1.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnv_v.f                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ver_sig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dezouv.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/semi_lag_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/surface_mod.f90                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ysminv.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_def.f              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/info.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_gases.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_diag.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_land.f                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/check.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/resol_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/digifilt.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumder2.f                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/compns.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_standalone.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_namgfs.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v.f                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/reduce_lons_grid_module.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_var_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/triseori.f     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gozrineo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopr.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rascnvv2_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_more.f                              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_spherical.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_main.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press.f                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memutils.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_r_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/physcons_v.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module.f          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl_gc.f                                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tracer_const_h-new.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sortrx.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/machine.f                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_param.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/starttimeget.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/albedo_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shuffle_grid.f               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/epslon.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/error_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_utilities.F90                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_send.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/pln2eo.f                                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_conserve.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spectralgridconv.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_a.f                                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/output_manager_fms.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lon_lat_para.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tiles.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_ls_node.f                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegas.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_datatb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/diag_tools.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes.f                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progtm_module.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_sig.locl.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_io.F90        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_table.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setsig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumfln.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient.F90        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_axis.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/affinity.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtsfc.f     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/readfromnc.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2flnio.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig2press.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dotstep_sicdif.f90                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_local_lnt2_lonr_latr.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/para_fixio_w.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getcon.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs.f             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cmp.comm.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc_h-new.f                                                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ocean_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_r_b_fix.f                                                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.gfsio.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lrgsclr_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/precpd_v.f                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bfilt_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnvn_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2sig.f                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lats_shuff.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosols.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sflx.f                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_parameter.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gribit.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cnvcld_v.f               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_clouds.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdps_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/grid.F90                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc_h-new.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_collect.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_run_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/nsclock.c         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/threadloc.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bilinear.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_manager.F90                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_initialize_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_quit.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grrad.f                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_astronomy.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_memutils.F90                                                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosol_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v_opr.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ifshuff.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms.F90            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcio_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozinterp.f             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/glats.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fix_fields.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_type.F90                                                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_write.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb_gc.f                                                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module_bfmicrophysics.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/interpred_mod.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms_io.F90                                                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_checkV.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm.inc                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_scalar.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_nocomm.inc                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum.inc                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_read_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_field.h                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_s.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/system_clock.h                                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_gather.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_sma.inc                                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h                                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_global_field.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update.h                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_sma.inc                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_reduce.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util.inc                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_redistribute.h                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_3d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_get_boundary.h                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_define.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_nest_domains.h \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_check.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write_2Ddecomp.h                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_reduce.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum.h                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/clib.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_int.h                                                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_2d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_connect.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_4d.inc                                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_mpi.inc                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_s.h                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_define_nest_domains.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_sma.inc                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nest.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_read.inc                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_mpi.inc                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_write.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/write_data.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_util.inc                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum_tl.h                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.h
OBJ = diag_util.o get_prs_v.o grid_to_spec.o gloopb_call.gbphys.o fftpack.o namelist_mod.o wrtout.o mosaic.o gather_times.o uveodz.o time_manager.o gradient_c2l.o nc_io_mod.o dcyc2_v.pre.rad.o gscond_v.o diag_output.o gbphys_call.o interp.o platform.o    \
mosaic_util.o moninp1_v.o mstadb_v.o spect_to_grid.o setlats.o iounitdef.o twriteeo.o moninp_v.o omegtes_gc.o radiation_surface.o uvoedz.o filtr1eo.o mstcnv_v.o gfidi_sig.o gcycle_v.o namelist_def.o atm.comm.o coordinate_def.o namelist_soilveg.o          \
radsw_param.o get_am_bm_hyb.o vert_def.o hyb2press_gc.o time_interp.o memuse.o ozphys_v.o land_model_mod.o moninq1_v.o test_fms_io.o sig_io.o gfs_internalstate_mod.o four2fln.o test_mpp_io.o get_lats_node_shuff_a_fix.o gloopa_opt.o rms_spect.o            \
get_lats_node_shuff_r_fix.o funcphys_v.o date_def.o filtr2eo.o getysk_gc.o gbphys_v.o byteswap.o damp_speed.o read_fix.o horiz_interp_bicubic.o dcyc2_v.o sicdif_hyb_gc.o sfcsub.o bafrio.o set_soilveg.o delnpe.o create_xgrid.o sigio_module.o               \
radsw_datatb.o constants.o get_cd_hyb.o radsw_main.o gsmddrive_v.o shalcnv_v.o getysk.o dozeuv.o four2grid_thread.o matrix_sig_def.o data_override.o stringfunc.o treadeo.io.o progt2_v.o gbphys_adv_hyb_gc.o spect_fields.o sicdif_sig.o gg_def.o             \
spect_tv_enthalpy_ps.o layout1.o sascnv_v.o ver_sig.o dezouv.o semi_lag_def.o surface_mod.o read_mosaic.o ysminv.o mpp_domains.o mpi_def.o info.o radiation_gases.o sfc_diag.o sfc_land.o check.o resol_def.o digifilt.o sumder2.o compns.o gfs_standalone.o   \
get_namgfs.o shalcv_v.o reduce_lons_grid_module.o mpp_data.o sfc_var_mod.o triseori.o gozrineo.o gloopr.o rascnvv2_v.o mpi_more.o horiz_interp_spherical.o radlw_main.o hyb2press.o memutils.o sigio_r_module.o physcons_v.o module.o test_mpp_domains.o       \
get_cd_hyb_gc.o impadj_hyb.locl_gc.o gfidi_hyb_gc.o tracer_const_h-new.o sortrx.o machine.o radlw_param.o starttimeget.o albedo_mod.o shuffle_grid.o delnpo.o epslon.o error_mod.o mpp_utilities.o spect_send.o diag_grid.o pln2eo.o horiz_interp_conserve.o   \
spectralgridconv.o redist_lats_a.o output_manager_fms.o lon_lat_para.o tiles.o get_ls_node.o omegas.o radlw_datatb.o diag_tools.o omegtes.o progtm_module.o impadj_sig.locl.o test_mpp.o mpp_io.o diag_table.o setsig.o sumfln.o gradient.o diag_axis.o        \
affinity.o mpp_pset.o wrtsfc.o readfromnc.o four2flnio.o sig2press.o dotstep_sicdif.o set_local_lnt2_lonr_latr.o para_fixio_w.o getcon.o deldifs.o cmp.comm.o moninq_v.o gbphys_adv_hyb_gc_h-new.o horiz_interp.o ocean_mod.o redist_lats_r_b_fix.o            \
treadeo.gfsio.o lrgsclr_v.o gfsio_def.o precpd_v.o bfilt_def.o deldifs_def.o sascnvn_v.o hyb2sig.o lats_shuff.o gwdc.o radiation_aerosols.o sflx.o mpp_parameter.o impadj_hyb.locl.o gribit.o cnvcld_v.o mpp.o radiation_clouds.o gwdps_v.o grid.o             \
gfidi_hyb_gc_h-new.o grid_collect.o gfs_run_mod.o nsclock.o threadloc.o horiz_interp_bilinear.o diag_manager.o gfs_initialize_mod.o gfsio_module.o mpi_quit.o grrad.o radiation_astronomy.o sicdif_hyb.o mpp_memutils.o radiation_aerosol_mod.o shalcv_v_opr.o \
ifshuff.o fms.o gfidi_hyb.o test_mpp_pset.o sfcio_module.o ozinterp.o glats.o fix_fields.o horiz_interp_type.o diag_data.o spect_write.o get_am_bm_hyb_gc.o module_bfmicrophysics.o interpred_mod.o fms_io.o
OFF = /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_s.h                                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_memutils.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dezouv.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_nocomm.h                                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_run_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_mpi.inc                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosols.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/physcons_v.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.io.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/constant.h        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fix_fields.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/surface_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstcnv_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_write.inc      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_r_fix.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/treadeo.gfsio.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_mpi.h                                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_read.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ysminv.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write.h                                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_write_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumder2.f                                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progtm_module.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.pre.rad.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gozrineo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr2eo.f                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_standalone.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/test_fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_util.F90                                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_initialize_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/data_override.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v.f                                                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_connect.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gcycle_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_int.h                                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_reduce_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/clib.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_namgfs.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc.f         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_send.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozinterp.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_param.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_sig.locl.f                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/compns.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gather_times.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_pset.F90       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bfilt_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcnv_v.f     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grrad.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uveodz.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_write.f                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mstadb_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/info.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_diag.f                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum_scalar.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_spherical.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_module.f90                              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bilinear.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gribit.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.c                                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_checkV.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/epslon.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2fln.f      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lrgsclr_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_sma.inc                                                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_clouds.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dotstep_sicdif.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_param.f             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lon_lat_para.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/byteswap.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_var_mod.f90         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_manager.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/matrix_sig_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_conserve.F90                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.h                                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_local_lnt2_lonr_latr.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ver_sig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_lats_node_shuff_a_fix.f                                                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/create_xgrid.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_main.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/affinity.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/nc_io_mod.f90          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/machine.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_reduce.h                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/twriteeo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radsw_datatb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp.F90    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_nest_domains.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/resol_def.f                                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gsmddrive_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopr.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/set_soilveg.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/funcphys_v.f90                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/lats_shuff.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_table.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/atm.comm.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/check.f90             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_sig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/read_fix.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/vert_def.f                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/albedo_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/semi_lag_def.f               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update.h                                                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_collect.f                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_call.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_utilities.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnv_v.f                                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninq1_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_surface.f                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tracer_const_h-new.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/digifilt.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_nocomm.inc                                                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/impadj_hyb.locl.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit_nocomm.h                                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2press_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_gases.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/layout1.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcsub.f                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/fftpack.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtsfc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_gather.h       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/damp_speed.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpo.f                                                                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_field.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sumfln.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms_io.F90                                                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2grid_thread.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_read_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/threadloc.c                                                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/para_fixio_w.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/platform/platform.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_manager.f90                                                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_define_nest_domains.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_update_nest.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_a.h                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cmp.comm.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_datatb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getysk_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/bafrio.f                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum_tl.h                                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/grid_to_spec.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/write_data.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dcyc2_v.f              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_bicubic.F90                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/pln2eo.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_aerosol_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_parameter.F90                                                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_global_sum.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/coordinate_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_am_bm_hyb.f \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_update_domains2D_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_define.inc     \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_prs_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/stringfunc.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/wrtout.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/fms.F90                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_4d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV.h                                                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ocean_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_a.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gg_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shalcv_v_opr.f                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sflx.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_axis.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_util_sma.inc                                                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_tv_enthalpy_ps.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rascnvv2_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/glats.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_def.f                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_quit.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setsig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/hyb2sig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_cd_hyb.f                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_global_field.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/tiles.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/filtr1eo.f                                                                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_3d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_sum_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/moninp1_v.f        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_reduce.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/iounitdef.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_chksum.h                                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_a_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/diag_tools.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/rms_spect.f           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sigio_r_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sascnvn_v.f                                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegtes_gc.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/starttimeget.f90                                                                          \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/mosaic_util.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/horiz_interp/horiz_interp_type.F90                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/deldifs_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfsio_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/output_manager_fms.f90      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/readfromnc.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/precpd_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_data_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_soilveg.f \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/triseori.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/cnvcld_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memutils.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/time_interp.f90               \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_more.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/nsclock.c /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/memutils/memuse.c \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_transmit.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_domains_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/get_ls_node.f                                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/constants/constants.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/read_mosaic.c                                              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/redist_lats_r_b_fix.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/date_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_to_grid.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gscond_v.f                \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfcio_module.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ozphys_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfs_internalstate_mod.f90                                                                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/reduce_lons_grid_module.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_adv_hyb_gc_h-new.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_check.h                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/land_model_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/mpi_def.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig2press.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spect_fields.f                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_updateV_nonblock.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radiation_astronomy.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/spectralgridconv.f90                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/progt2_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/getcon.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/interpred_mod.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/shuffle_grid.f                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/error_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/module_bfmicrophysics.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_hyb_gc.f                                                                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/fms/read_data_2d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sfc_land.f                                                              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gfidi_hyb_gc_h-new.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gwdps_v.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopa_opt.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/ifshuff.f                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/uvoedz.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/dozeuv.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_do_redistribute.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sortrx.f              \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gbphys_v.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/omegas.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/test_mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/delnpe.f                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/four2flnio.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/diag_manager/diag_output.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/radlw_main.f                                                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/setlats.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_util.inc                                                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/gradient_c2l.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sig_io.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mosaic/interp.h                                                                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_io_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_error_s_s.h /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/system_clock.h                                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/namelist_mod.f90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/sicdif_sig.f /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/model/gloopb_call.gbphys.f90                                                                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/shared/mpp/include/mpp_get_boundary.h
clean: neat
	-rm -f .atm.exe.cppdefs $(OBJ) atm.exe
neat:
	-rm -f $(TMPFILES)
localize: $(OFF)
	cp $(OFF) .
TAGS: $(SRC)
	etags $(SRC)
tags: $(SRC)
	ctags $(SRC)
atm.exe: $(OBJ) 
	$(LD) $(OBJ) -o atm.exe  $(LDFLAGS)
