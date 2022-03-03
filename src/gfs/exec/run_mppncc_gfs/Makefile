# Makefile created by mkmf $Id: mkmf,v 1.1.2.1 2013/12/18 17:47:54 Niki.Zadeh Exp $ 

CPPDEFS = -Dlib_mppnccp2r -Duse_libMPI

OTHERFLAGS = -I/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/exec/lib_fms

include /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/bin/mkmf.template


.DEFAULT:
	-echo $@ does not exist.
all: run_mppncc_gfs
mppnccombine_gfs.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/mppnccombine_gfs.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/mppnccombine_gfs.c
run_mppnccp2r.o: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/run_mppnccp2r.F90
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/run_mppnccp2r.F90
./run_mppnccp2r.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/run_mppnccp2r.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/run_mppnccp2r.F90 .
./mppnccombine_gfs.c: /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/mppnccombine_gfs.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/mppnccombine_gfs.c .
SRC = /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/run_mppnccp2r.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/mppnccombine_gfs.c
OBJ = run_mppnccp2r.o mppnccombine_gfs.o
OFF = /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/run_mppnccp2r.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/run_mppncc_gfs/mppnccombine_gfs.c
clean: neat
	-rm -f .run_mppncc_gfs.cppdefs $(OBJ) run_mppncc_gfs
neat:
	-rm -f $(TMPFILES)
localize: $(OFF)
	cp $(OFF) .
TAGS: $(SRC)
	etags $(SRC)
tags: $(SRC)
	ctags $(SRC)
run_mppncc_gfs: $(OBJ) /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/exec/lib_fms/lib_fms.a
	$(LD) $(OBJ) -o run_mppncc_gfs /home/CMIP/prajeesh/IITM-ESMv2/src/gfs/exec/lib_fms/lib_fms.a $(LDFLAGS)
