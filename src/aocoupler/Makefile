SHELL=  /bin/sh
#NETCDF = /gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/
FFLAGS  = -g -traceback -O3 -free -r8 -i4 -fp-model precise -convert big_endian -FR -assume byterecl -fpconstant
F77=ftn
PROG=coupler
                                                                               
$(PROG).exe:	coupler_module.o $(PROG).o
	$(F77) $(FFLAGS) -L$(NETCDF)/lib -lnetcdf -lnetcdff write_debug_nc.o coupler_module.o $(PROG).o -o $(PROG).exe

coupler_module.o:	coupler_module.f write_debug_nc.o
	$(F77) $(FFLAGS) -c coupler_module.f

$(PROG).o:	$(PROG).f
	$(F77) $(FFLAGS) -c $(PROG).f

write_debug_nc.o: write_debug_nc.f90
	$(F77) $(FFLAGS) -I$(NETCDF)/include -c write_debug_nc.f90

clean:
	rm -f *.o *.mod $(PROG).exe
