# Makefile created by mkmf $Id: mkmf,v 1.1.2.1 2013/12/18 17:47:54 Niki.Zadeh Exp $ 

CPPDEFS = -Dlib_mppnccp2r -Duse_libMPI

OTHERFLAGS = -I/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/exec/lib_fms

include /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/bin/mkmf.template.intel_pratyush


.DEFAULT:
	-echo $@ does not exist.
all: run_mppncc
mppnccombinep2r.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/mppnccombinep2r.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/mppnccombinep2r.c
run_mppnccp2r.o: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/run_mppnccp2r.F90
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) -c	/home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/run_mppnccp2r.F90
./mppnccombinep2r.c: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/mppnccombinep2r.c
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/mppnccombinep2r.c .
./run_mppnccp2r.F90: /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/run_mppnccp2r.F90
	cp /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/run_mppnccp2r.F90 .
SRC = /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/run_mppnccp2r.F90 /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/mppnccombinep2r.c
OBJ = run_mppnccp2r.o mppnccombinep2r.o
OFF = /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/mppnccombinep2r.c /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/src/postprocessing/run_mppncc/run_mppnccp2r.F90
clean: neat
	-rm -f .run_mppncc.cppdefs $(OBJ) run_mppncc
neat:
	-rm -f $(TMPFILES)
localize: $(OFF)
	cp $(OFF) .
TAGS: $(SRC)
	etags $(SRC)
tags: $(SRC)
	ctags $(SRC)
run_mppncc: $(OBJ) /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/exec/lib_fms/lib_fms.a
	$(LD) $(OBJ) -o run_mppncc /home/CMIP/prajeesh/IITM-ESMv2/src/mom4p1/exec/lib_fms/lib_fms.a $(LDFLAGS)
