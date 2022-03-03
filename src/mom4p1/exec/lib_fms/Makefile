# Makefile created by mkmf $Id: mkmf,v 1.1.2.1 2013/12/18 17:47:54 Niki.Zadeh Exp $ 

CPPDEFS = -Duse_netCDF4 -Duse_libMPI -DENABLE_ODA -DUSE_OCEAN_BGC


include /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/bin/mkmf.template.intel_pratyush


.DEFAULT:
	-echo $@ does not exist.
all: lib_fms.a
axis_utils.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/axis_utils/axis_utils.F90 mpp_io.o mpp.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/axis_utils/axis_utils.F90
constants.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/constants/constants.F90
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/constants/constants.F90
create_xgrid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.h                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.c
data_override.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/data_override/data_override.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h platform.o constants.o mpp_io.o mpp.o horiz_interp.o time_interp_external.o  \
fms_io.o fms.o axis_utils.o mpp_domains.o time_manager.o diag_manager.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/data_override/data_override.F90
diag_axis.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_axis.F90 mpp_domains.o fms.o diag_data.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_axis.F90
diag_data.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h time_manager.o mpp_domains.o mpp_io.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_data.F90
diag_grid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h constants.o fms.o mpp.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_grid.F90
diag_manager.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_manager.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h time_manager.o mpp_io.o fms.o mpp.o diag_axis.o diag_util.o diag_data.o         \
diag_output.o diag_grid.o constants.o mpp_domains.o fms_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_manager.F90
diag_output.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_output.F90 mpp_io.o mpp_domains.o mpp.o diag_axis.o diag_data.o time_manager.o fms.o platform.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_output.F90
diag_util.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_util.F90 diag_data.o diag_axis.o diag_output.o diag_grid.o fms.o fms_io.o mpp_domains.o time_manager.o mpp_io.o mpp.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_util.F90
fms.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms.F90 mpp.o mpp_domains.o mpp_io.o fms_io.o memutils.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms.F90
fms_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_2d.inc                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_3d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_4d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/write_data.inc mpp_io.o mpp_domains.o mpp.o       \
platform.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms_io.F90
get_cal_time.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/get_cal_time.F90 fms.o time_manager.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/get_cal_time.F90
gradient.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient.F90 mpp.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient.F90
gradient_c2l.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.c
grid.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/grid.F90 constants.o fms.o mosaic.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/grid.F90
horiz_interp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp.F90 fms.o mpp.o constants.o horiz_interp_type.o horiz_interp_conserve.o horiz_interp_bilinear.o horiz_interp_bicubic.o horiz_interp_spherical.o mpp_io.o        \
mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp.F90
horiz_interp_bicubic.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bicubic.F90 mpp.o fms.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bicubic.F90
horiz_interp_bilinear.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bilinear.F90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bilinear.F90
horiz_interp_conserve.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_conserve.F90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_conserve.F90
horiz_interp_spherical.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_spherical.F90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_spherical.F90
horiz_interp_type.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_type.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_type.F90
interp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.h                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c
memuse.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memuse.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memuse.c
memutils.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memutils.F90 mpp.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memutils.F90
mosaic.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic.F90
mosaic_util.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c
mpp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/system_clock.h                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_mpi.inc              \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_s.h         \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_s.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm.inc                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit.inc        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum.inc                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_mpi.h        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_nocomm.h     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_int.h       \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_scalar.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum.h mpp_parameter.o mpp_data.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp.F90
mpp_data.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_sma.inc                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_nocomm.inc mpp_parameter.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_data.F90
mpp_domains.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_util.inc      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_define.inc                                                                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_update_domains2D.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_update.h \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_updateV.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_check.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_checkV.h             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_redistribute.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_get_boundary.h                                                                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_reduce.inc                                                                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_reduce.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum_tl.h    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_field.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_global_field.h mpp_parameter.o mpp_data.o mpp.o mpp_memutils.o mpp_pset.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_domains.F90
mpp_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_util.inc                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_connect.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_read.inc          \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_read_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_write.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write_2Ddecomp.h   \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write.h mpp_parameter.o mpp.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_io.F90
mpp_memutils.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_memutils.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_memutils.F90
mpp_parameter.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_parameter.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_parameter.F90
mpp_pset.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_pset.F90
mpp_utilities.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_utilities.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_utilities.F90
nsclock.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/nsclock.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/nsclock.c
platform.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/platform/platform.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/platform/platform.F90
read_mosaic.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.c
test_fms_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/test_fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o mpp_domains.o mpp_io.o fms_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/test_fms_io.F90
test_mpp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp.F90
test_mpp_domains.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o mpp_domains.o mpp_memutils.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_domains.F90
test_mpp_io.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o mpp_domains.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_io.F90
test_mpp_pset.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o mpp_pset.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_pset.F90
threadloc.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/threadloc.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/threadloc.c
time_interp.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp.F90 time_manager.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp.F90
time_interp_external.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp_external.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h mpp.o mpp_io.o time_manager.o get_cal_time.o mpp_domains.o       \
time_interp.o axis_utils.o fms.o platform.o horiz_interp.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp_external.F90
time_manager.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/time_manager.F90 constants.o fms.o fms_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/time_manager.F90
./mpp_sum_mpi.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_mpi.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_mpi.h .
./mpp_utilities.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_utilities.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_utilities.F90 .
./fms_platform.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h .
./data_override.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/data_override/data_override.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/data_override/data_override.F90 .
./mpp_do_checkV.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_checkV.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_checkV.h .
./memutils.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memutils.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memutils.F90 .
./mpp_sum.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum.inc .
./mpp_memutils.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_memutils.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_memutils.F90 .
./mpp_reduce_nocomm.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_nocomm.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_nocomm.h .
./mpp_get_boundary.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_get_boundary.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_get_boundary.h .
./fms.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms.F90 .
./diag_data.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_data.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_data.F90 .
./mpp_do_update.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_update.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_update.h .
./get_cal_time.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/get_cal_time.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/get_cal_time.F90 .
./mpp_domains_comm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_comm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_comm.inc .
./diag_output.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_output.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_output.F90 .
./test_mpp_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_io.F90 .
./mpp_error_a_s.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_s.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_s.h .
./mpp_transmit_mpi.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_mpi.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_mpi.h .
./mpp_util_nocomm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_nocomm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_nocomm.inc .
./mpp_io_write.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_write.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_write.inc .
./mpp_util_sma.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_sma.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_sma.inc .
./mpp_io_util.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_util.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_util.inc .
./test_mpp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp.F90 .
./interp.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.h .
./mpp_domains_misc.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_misc.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_misc.inc .
./mpp_chksum_scalar.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_scalar.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_scalar.h .
./time_interp_external.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp_external.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp_external.F90 .
./mpp_comm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm.inc .
./mpp_global_sum_tl.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum_tl.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum_tl.h .
./constants.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/constants/constants.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/constants/constants.F90 .
./time_manager.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/time_manager.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/time_manager.F90 .
./mpp_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_io.F90 .
./test_fms_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/test_fms_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/test_fms_io.F90 .
./mpp_pset.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_pset.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_pset.F90 .
./mpp_domains_define.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_define.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_define.inc .
./mpp_domains.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_domains.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_domains.F90 .
./mpp_chksum.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum.h .
./mosaic.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic.F90 .
./mpp_error_a_a.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_a.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_a.h .
./mpp_domains_util.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_util.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_util.inc .
./mpp_write_2Ddecomp.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write_2Ddecomp.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write_2Ddecomp.h .
./horiz_interp_conserve.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_conserve.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_conserve.F90 .
./axis_utils.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/axis_utils/axis_utils.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/axis_utils/axis_utils.F90 .
./read_data_4d.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_4d.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_4d.inc .
./constant.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h .
./diag_grid.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_grid.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_grid.F90 .
./mosaic_util.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c .
./create_xgrid.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.c .
./mpp_global_reduce.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_reduce.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_reduce.h .
./mpp_reduce_sma.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_sma.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_sma.h .
./create_xgrid.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.h .
./gradient.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient.F90 .
./fms_io.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms_io.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms_io.F90 .
./write_data.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/write_data.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/write_data.inc .
./mpp_util.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util.inc .
./mpp_io_misc.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_misc.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_misc.inc .
./mpp_chksum_int.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_int.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_int.h .
./gradient_c2l.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.h .
./read_mosaic.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.c .
./mpp_comm_sma.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_sma.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_sma.inc .
./mpp_do_global_field.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_global_field.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_global_field.h .
./horiz_interp_bilinear.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bilinear.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bilinear.F90 .
./mpp_sum_sma.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_sma.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_sma.h .
./diag_axis.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_axis.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_axis.F90 .
./diag_manager.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_manager.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_manager.F90 .
./mpp_global_field.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_field.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_field.h .
./read_mosaic.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.h .
./gradient_c2l.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.c .
./grid.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/grid.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/grid.F90 .
./mpp_parameter.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_parameter.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_parameter.F90 .
./test_mpp_domains.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_domains.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_domains.F90 .
./mpp_transmit_sma.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_sma.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_sma.h .
./mpp_write.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write.h .
./test_mpp_pset.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_pset.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_pset.F90 .
./system_clock.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/system_clock.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/system_clock.h .
./horiz_interp_spherical.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_spherical.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_spherical.F90 .
./mpp_do_check.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_check.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_check.h .
./time_interp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp.F90 .
./mpp_do_updateV.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_updateV.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_updateV.h .
./mpp_data.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_data.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_data.F90 .
./mpp_update_domains2D.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_update_domains2D.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_update_domains2D.h .
./mpp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp.F90 .
./mpp_io_read.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_read.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_read.inc .
./threadloc.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/threadloc.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/threadloc.c .
./mpp_reduce_mpi.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_mpi.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_mpi.h .
./mpp_util_mpi.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_mpi.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_mpi.inc .
./mpp_transmit.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit.inc .
./memuse.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memuse.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memuse.c .
./platform.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/platform/platform.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/platform/platform.F90 .
./mpp_domains_reduce.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_reduce.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_reduce.inc .
./mpp_sum_nocomm.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_nocomm.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_nocomm.h .
./mpp_data_nocomm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_nocomm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_nocomm.inc .
./horiz_interp_bicubic.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bicubic.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bicubic.F90 .
./mpp_io_connect.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_connect.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_connect.inc .
./mpp_data_sma.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_sma.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_sma.inc .
./read_data_2d.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_2d.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_2d.inc .
./mpp_comm_nocomm.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_nocomm.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_nocomm.inc .
./nsclock.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/nsclock.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/nsclock.c .
./mosaic_util.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h .
./mpp_read_2Ddecomp.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_read_2Ddecomp.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_read_2Ddecomp.h .
./mpp_global_sum.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum.h .
./mpp_error_s_a.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_a.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_a.h .
./mpp_do_get_boundary.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_get_boundary.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_get_boundary.h .
./mpp_comm_mpi.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_mpi.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_mpi.inc .
./read_data_3d.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_3d.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_3d.inc .
./horiz_interp_type.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_type.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_type.F90 .
./diag_util.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_util.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_util.F90 .
./mpp_do_redistribute.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_redistribute.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_redistribute.h .
./mpp_data_mpi.inc: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_mpi.inc
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_mpi.inc .
./interp.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c .
./horiz_interp.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp.F90 .
./mpp_transmit_nocomm.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_nocomm.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_nocomm.h .
./mpp_error_s_s.h: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_s.h
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_s.h .
SRC = /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bilinear.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/axis_utils/axis_utils.F90 \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/data_override/data_override.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp.F90                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_util.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.c                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/time_manager.F90                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_manager.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/constants/constants.F90                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memuse.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp.F90                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/threadloc.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/platform/platform.F90                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_type.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_spherical.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_io.F90       \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bicubic.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/nsclock.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_pset.F90                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_utilities.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_conserve.F90                                                                                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp_external.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/test_fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memutils.F90                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/get_cal_time.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_axis.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_pset.F90                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_parameter.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp.F90                             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_memutils.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_output.F90                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms.F90                                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_sma.inc       \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_connect.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_2d.inc             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_read_2Ddecomp.h               \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_get_boundary.h      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_3d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_redistribute.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_mpi.inc             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_s.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_global_field.h \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_field.h                   \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/system_clock.h               \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_update_domains2D.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_updateV.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_check.h      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_read.inc           \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_reduce.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm.inc        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_scalar.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_misc.inc                                                                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum_tl.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_define.inc     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_util.inc   \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_4d.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.h                                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_reduce.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_misc.inc        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/write_data.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.h                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_int.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_mpi.h             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_checkV.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum.inc                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_update.h      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_s.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_mpi.h     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_write.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_util.inc        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.h
OBJ = test_mpp_domains.o horiz_interp_bilinear.o axis_utils.o data_override.o read_mosaic.o mpp.o mpp_domains.o diag_util.o gradient_c2l.o diag_data.o create_xgrid.o time_manager.o mosaic_util.o diag_manager.o constants.o memuse.o test_mpp.o              \
time_interp.o threadloc.o test_mpp_io.o platform.o horiz_interp_type.o horiz_interp_spherical.o mpp_io.o horiz_interp_bicubic.o nsclock.o mpp_pset.o mpp_utilities.o horiz_interp_conserve.o time_interp_external.o test_fms_io.o memutils.o get_cal_time.o    \
diag_axis.o interp.o mosaic.o gradient.o test_mpp_pset.o grid.o mpp_parameter.o horiz_interp.o mpp_memutils.o diag_grid.o diag_output.o fms_io.o mpp_data.o fms.o
OFF = /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_utilities.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/include/fms_platform.h                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/data_override/data_override.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_checkV.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memutils.F90               \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_memutils.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_nocomm.h                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_data.F90                           \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_update.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/get_cal_time.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_comm.inc      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_output.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_s.h                    \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_mpi.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_write.inc     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp.F90                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_misc.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_scalar.h                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp_external.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum_tl.h   \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/constants/constants.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_manager/time_manager.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_io.F90                            \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/test_fms_io.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_define.inc                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic.F90                                  \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_a_a.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write_2Ddecomp.h   \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_conserve.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/axis_utils/axis_utils.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_4d.inc           \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/constant.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.c                               \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_reduce.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_sma.h              \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/create_xgrid.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/fms_io.F90                                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/write_data.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_misc.inc                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_chksum_int.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.c                         \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_global_field.h                                                                                       \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bilinear.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_axis.F90     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_manager.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_field.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/read_mosaic.h               \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/gradient_c2l.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/grid.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_parameter.F90                                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_domains.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_sma.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_write.h                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/test_mpp_pset.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/system_clock.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_spherical.F90        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_check.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/time_interp/time_interp.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_updateV.h             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp_data.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_update_domains2D.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/mpp.F90                                 \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_read.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/threadloc.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_reduce_mpi.h                        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_util_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/memutils/memuse.c                     \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/platform/platform.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_domains_reduce.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_sum_nocomm.h           \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_bicubic.F90                                                                                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_io_connect.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_sma.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_2d.inc                \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_nocomm.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/nsclock.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/mosaic_util.h                              \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_read_2Ddecomp.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_global_sum.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_a.h        \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_get_boundary.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_comm_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/fms/read_data_3d.inc             \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp_type.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/diag_manager/diag_util.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_do_redistribute.h \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_data_mpi.inc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mosaic/interp.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/horiz_interp/horiz_interp.F90                      \
/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_transmit_nocomm.h /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/shared/mpp/include/mpp_error_s_s.h
clean: neat
	-rm -f .lib_fms.a.cppdefs $(OBJ) lib_fms.a
neat:
	-rm -f $(TMPFILES)
localize: $(OFF)
	cp $(OFF) .
TAGS: $(SRC)
	etags $(SRC)
tags: $(SRC)
	ctags $(SRC)
lib_fms.a: $(OBJ)
	$(AR) $(ARFLAGS) lib_fms.a $(OBJ)
