
subroutine d3readfromnc(FILE_NAME,var1,var2,var3,outvar1,outvar2,outvar3,NLONS,NLATS,NRECS,lons,lats,time)
        
use netcdf
implicit none
! This is the name of the data file we will read.
        character (len = 100) :: FILE_NAME                    
        integer :: ncid,status,j
! We are reading 4D data, a 2 x 6 x 12 lvl-lat-lon grid, with 2
! timesteps of data.
        integer,parameter :: NDIMS = 3
        integer,parameter:: NLVLS = 1
        character(len = 10),parameter :: LAY_NAME = "nb_sw"
        character(len = 10),parameter :: LAT_NAME = "lat"
        character(len = 10),parameter :: LON_NAME = "lon"
        character(len = 10),parameter:: REC_NAME = "time"
        integer :: lvl_dimid, lon_dimid, lat_dimid, rec_dimid,NRECS,NLONS,NLATS

! The start and count arrays will tell the netCDF library where to
! read our data.
        integer :: start(NDIMS), count(NDIMS)

! In addition to the latitude and longitude dimensions, we will also
! create latitude and longitude variables which will hold the actual
! latitudes and longitudes. Since they hold data about the
! coordinate system, the netCDF term for these is: "coordinate
! variables."
        real :: lats(NLATS), lons(NLONS), time(NRECS)
        integer :: lon_varid, lat_varid, time_varid

! We will read surface temperature and pressure fields. In netCDF
! terminology these are called "variables."
        character (len = 10) :: var1,var2,var3 
        integer :: var1id, var2id,var3id
        integer :: dimids(NDIMS)
! Program variables to hold the data we will read in. We will only
! need enough space to hold one timestep of data; one record.
        real,dimension(NLONS,NLATS,NRECS) :: outvar1,outvar2,outvar3
        real,dimension(NLONS,NLATS,NRECS)::outdump1,outdump2,outdump3
        !real,dimension(12,NLATS,NLONS) :: outvar1,outvar2,outvar3
        ! Loop indices
        integer :: lvl, lat, lon, rec, i
!    print *,"***Opening nc File ***", FILE_NAME, "!"
! Open the file. 
        status = nf90_open(FILE_NAME, nf90_nowrite, ncid) 
!        print *,"*** ncid = ", ncid, "!"
! Get the varids of the latitude and longitude coordinate variables.
        status = nf90_inq_varid(ncid, LAT_NAME, lat_varid)
        status = nf90_inq_varid(ncid, LON_NAME, lon_varid) 
        status = nf90_inq_varid(ncid, REC_NAME, time_varid) 
!        print *,"*** latid = ", lat_varid, "!"
!        print *,"*** lonid ", lon_varid, "!"
! Read the latitude and longitude data.
!        print *,"*** READING THE LAT AND LON DATA *** "
        status = nf90_get_var(ncid, lat_varid, lats)
        status = nf90_get_var(ncid, lon_varid, lons) 
        status = nf90_get_var(ncid, time_varid,time) 
        do lat =1,NLATS
        
!       print *,"*** lat  ", lat, " = ", lats    

        end do
        
        do lon =1,NLONS

!        print *,"***lon ", lon, " = ", lons

        end do
! Check to make sure we got what we expected.
!        do lat = 1, NLATS
!        if (lats(lat) /= START_LAT + (lat - 1) * 5.0) stop 2
!        end do
!        do lon = 1, NLONS
!        if (lons(lon) /= START_LON + (lon - 1) * 5.0) stop 2
!        end do

! Get the varids of the pressure and temperature netCDF variables.
        status = nf90_inq_varid(ncid, var1, var1id) 
        status = nf90_inq_varid(ncid, var2, var2id) 
        status = nf90_inq_varid(ncid, var3, var3id) 
!        print *,"*** variable id of pressure =  ", var1id, "!"
!        print *,"*** variable id of temperature =  ", var2id, "!"
!        print *,"*** variable id of temperature =  ", var3id, "!"
! Read 1 record of NLVLS*NLATS*NLONS values, starting at the beginning 
! of the record (the (1, 1, 1, rec) element in the netCDF file).
       count = (/NLONS, NLATS, 1/)
      ! count = (/ 12, NLONS, NLATS/)
        start = (/ 1, 1, 1/)

! Read the surface pressure and temperature data from the file, one
! record at a time.
        do rec = 1, NRECS
        start(3) = rec
     call check(nf90_get_var(ncid, var1id, outdump1,start=start,count=count)) 
        
                do j=1,180
                        do i=1,360
                                outvar1(i,j,rec)=outdump1(i,j,rec)
                        end do
                end do
        
     call check( nf90_get_var(ncid, var2id, outdump2,start,count))        
                do j=1,180
                        do i=1,360
                                outvar2(i,j,rec)=outdump2(i,j,rec)
                        end do
                end do


     call check( nf90_get_var(ncid, var3id, outdump3,start,count))

                do j=1,180
                        do i=1,360
                                outvar3(i,j,rec)=outdump3(i,j,rec)
                        end do
                end do


     end do
!     print *, "get var for var 1 executed"
!     status = nf90_get_var(ncid, var2id, outvar2,start,count) 
!     print *,"get var for var 2 executed"
!     status = nf90_get_var(ncid, var3id, outvar3,start,count) 
!     print *,"get var for var 3 executed"
           i  = 0
         do lat = 1, NLATS
           do lon = 1, NLONS
!             print *,"*** pressure ",lat," ",lon," =  ",pres_in

!              if (pres_in(lon, lat) /= SAMPLE_PRESSURE + i) stop 2
!              if (temp_in(lon, lat) /= SAMPLE_TEMP + i) stop 2
!              i = i + 1
!           end do
        end do
     ! next record
        end do
         
! Close the file. This frees up any internal netCDF resources
! associated with the file.
        status = nf90_close(ncid) 

! If we got this far, everything worked as expected. Yipee! 
!        print *,"*** SUCCESS reading example file ", FILE_NAME, "!"

        end subroutine d3readfromnc     


subroutine d4readfromnc(FILE_NAME,var1,var2,var3,outvar1,outvar2,outvar3,NLONS,NLATS,NRECS,NLAY,lons,lats,time,lay)
  
use netcdf
implicit none
! This is the name of the data file we will read.
        character (len = 100) :: FILE_NAME                    
        integer :: ncid,status,j,k
! We are reading 4D data, a 2 x 6 x 12 lvl-lat-lon grid, with 2
! timesteps of data.
        integer,parameter :: NDIMS = 4
        integer:: NLAY 
        character(len = 10),parameter :: LAY_NAME = "nb_sw"
        character(len = 10),parameter :: LAT_NAME = "lat"
        character(len = 10),parameter :: LON_NAME = "lon"
        character(len = 10),parameter:: REC_NAME = "time"
        integer :: lvl_dimid, lon_dimid, lat_dimid, rec_dimid,NRECS,NLONS,NLATS

! The start and count arrays will tell the netCDF library where to
! read our data.
        integer :: start(NDIMS), count(NDIMS)

! In addition to the latitude and longitude dimensions, we will also
! create latitude and longitude variables which will hold the actual
! latitudes and longitudes. Since they hold data about the
! coordinate system, the netCDF term for these is: "coordinate
! variables."
        real :: lats(NLATS), lons(NLONS),lay(NLAY), time(NRECS)
        integer :: lon_varid, lat_varid, lay_varid,time_varid

! We will read surface temperature and pressure fields. In netCDF
! terminology these are called "variables."
        character (len = 10) :: var1,var2,var3 
        integer :: var1id, var2id,var3id
        integer :: dimids(NDIMS)
! Program variables to hold the data we will read in. We will only
! need enough space to hold one timestep of data; one record.
        real,dimension(NLONS,NLATS,NLAY,NRECS) :: outvar1,outvar2,outvar3
        real,dimension(NLONS,NLATS,NLAY)::outdump1,outdump2,outdump3
        !real,dimension(12,NLATS,NLONS) :: outvar1,outvar2,outvar3
        ! Loop indices
        integer :: lvl, lat, lon, rec, i
    print *,"***Opening nc File ***", FILE_NAME, "!"
! Open the file. 
        status = nf90_open(FILE_NAME, nf90_nowrite, ncid) 
        print *,"*** ncid = ", ncid, "!"
! Get the varids of the latitude and longitude coordinate variables.
        status = nf90_inq_varid(ncid, LAT_NAME, lat_varid)
        status = nf90_inq_varid(ncid, LON_NAME, lon_varid) 
        status = nf90_inq_varid(ncid, LAY_NAME, lay_varid) 
        status = nf90_inq_varid(ncid, REC_NAME, time_varid) 
        print *,"*** latid = ", lat_varid, "!"
        print *,"*** lonid ", lon_varid, "!"
!! Read the latitude and longitude data.
!        print *,"*** READING THE LAT AND LON DATA *** "
        status = nf90_get_var(ncid, lat_varid, lats)
        status = nf90_get_var(ncid, lon_varid, lons) 
        status = nf90_get_var(ncid, lay_varid, lay) 
        status = nf90_get_var(ncid, time_varid,time) 
        do lat =1,NLATS
        
!       print *,"*** lat  ", lat, " = ", lats    

        end do
        
        do lon =1,NLONS

!        print *,"***lon ", lon, " = ", lons

        end do
! Check to make sure we got what we expected.
!        do lat = 1, NLATS
!        if (lats(lat) /= START_LAT + (lat - 1) * 5.0) stop 2
!        end do
!        do lon = 1, NLONS
!        if (lons(lon) /= START_LON + (lon - 1) * 5.0) stop 2
!        end do

! Get the varids of the pressure and temperature netCDF variables.
        status = nf90_inq_varid(ncid, var1, var1id) 
        status = nf90_inq_varid(ncid, var2, var2id) 
        status = nf90_inq_varid(ncid, var3, var3id) 
        print *,"*** variable id of pressure =  ", var1id, "!"
        print *,"*** variable id of temperature =  ", var2id, "!"
        print *,"*** variable id of temperature =  ", var3id, "!"
! Read 1 record of NLVLS*NLATS*NLONS values, starting at the beginning 
! of the record (the (1, 1, 1, rec) element in the netCDF file).
       count = (/NLONS, NLATS,NLAY,1  /)
      ! count = (/ 12, NLONS, NLATS/)
        start = (/ 1, 1, 1, 1/)

! Read the surface pressure and temperature data from the file, one
! record at a time.
        do rec =1, NRECS
        start(4) = rec
     call check(nf90_get_var(ncid, var1id, outdump1,start=start,count=count)) 
        
                do k=1,NLAY
                        do j=1,NLATS
                           do i=1,NLONS
                                outvar1(i,j,k,rec)=outdump1(i,j,k)
         
                           end do
                        end do
                end do
     call check( nf90_get_var(ncid, var2id, outdump2,start,count))        
        
                do k=1,NLAY
                        do j=1,NLATS
                           do i=1,NLONS
                                outvar2(i,j,k,rec)=outdump2(i,j,k)
                           end do
                        end do
                end do
 
     call check( nf90_get_var(ncid, var3id, outdump3,start,count))

        
                do k=1,NLAY
                        do j=1,NLATS
                           do i=1,NLONS
                                outvar3(i,j,k,rec)=outdump3(i,j,k)
                           end do
                        end do
                end do
 
     end do
!     print *, "get var for var 1 executed"
!     status = nf90_get_var(ncid, var2id, outvar2,start,count) 
!     print *,"get var for var 2 executed"
!     status = nf90_get_var(ncid, var3id, outvar3,start,count) 
!     print *,"get var for var 3 executed"
           i  = 0
         do lat = 1, NLATS
           do lon = 1, NLONS
!             print *,"*** pressure ",lat," ",lon," =  ",pres_in

!              if (pres_in(lon, lat) /= SAMPLE_PRESSURE + i) stop 2
!              if (temp_in(lon, lat) /= SAMPLE_TEMP + i) stop 2
!              i = i + 1
!           end do
        end do
     ! next record
        end do
         
! Close the file. This frees up any internal netCDF resources
! associated with the file.
        status = nf90_close(ncid) 

! If we got this far, everything worked as expected. Yipee! 
        print *,"*** SUCCESS reading example file ", FILE_NAME, "!"

        end subroutine d4readfromnc      
subroutine d4readfromnc_2vr(FILE_NAME,var1,var2,outvar1,outvar2,NLONS,NLATS,NRECS,NLAY,lons,lats,time,lay,LON_NAME,LAT_NAME,LAY_NAME,REC_NAME)
  
use netcdf
implicit none
! This is the name of the data file we will read.
        character (len = 100) :: FILE_NAME                    
        integer :: ncid,status,j,k
! We are reading 4D data, a 2 x 6 x 12 lvl-lat-lon grid, with 2
! timesteps of data.
        integer,parameter :: NDIMS = 4
        integer:: NLAY 
        character(len = 100):: LAY_NAME 
        character(len = 100):: LAT_NAME 
        character(len = 100):: LON_NAME 
        character(len = 100):: REC_NAME 
        integer :: lvl_dimid, lon_dimid, lat_dimid, rec_dimid,NRECS,NLONS,NLATS

! The start and count arrays will tell the netCDF library where to
! read our data.
        integer :: start(NDIMS), count(NDIMS)

! In addition to the latitude and longitude dimensions, we will also
! create latitude and longitude variables which will hold the actual
! latitudes and longitudes. Since they hold data about the
! coordinate system, the netCDF term for these is: "coordinate
! variables."
        real :: lats(NLATS), lons(NLONS),lay(NLAY), time(NRECS)
        integer :: lon_varid, lat_varid, lay_varid,time_varid

! We will read surface temperature and pressure fields. In netCDF
! terminology these are called "variables."
        character (len = 10) :: var1,var2 
        integer :: var1id, var2id
        integer :: dimids(NDIMS)
! Program variables to hold the data we will read in. We will only
! need enough space to hold one timestep of data; one record.
        real,dimension(NLONS,NLATS,NLAY,NRECS) :: outvar1,outvar2
        real,dimension(NLONS,NLATS,NLAY)::outdump1,outdump2,outdump3
        !real,dimension(12,NLATS,NLONS) :: outvar1,outvar2,outvar3
        ! Loop indices
        integer :: lvl, lat, lon, rec, i
!    print *,"***Opening nc File ***", FILE_NAME, "!"
! Open the file. 
        status = nf90_open(FILE_NAME, nf90_nowrite, ncid) 
!        print *,"*** ncid = ", ncid, "!"
! Get the varids of the latitude and longitude coordinate variables.
        status = nf90_inq_varid(ncid, LAT_NAME, lat_varid)
        status = nf90_inq_varid(ncid, LON_NAME, lon_varid) 
        status = nf90_inq_varid(ncid, LAY_NAME, lay_varid) 
        status = nf90_inq_varid(ncid, REC_NAME, time_varid) 
!        print *,"*** latid = ", lat_varid, "!"
!        print *,"*** lonid ", lon_varid, "!"
! Read the latitude and longitude data.
!        print *,"*** READING THE LAT AND LON DATA *** "
        status = nf90_get_var(ncid, lat_varid, lats)
        status = nf90_get_var(ncid, lon_varid, lons) 
        status = nf90_get_var(ncid, lay_varid, lay) 
        status = nf90_get_var(ncid, time_varid,time) 
        do lat =1,NLATS
        
!       print *,"*** lat  ", lat, " = ", lats    

        end do
        
        do lon =1,NLONS

!        print *,"***lon ", lon, " = ", lons

        end do
! Check to make sure we got what we expected.
!        do lat = 1, NLATS
!        if (lats(lat) /= START_LAT + (lat - 1) * 5.0) stop 2
!        end do
!        do lon = 1, NLONS
!        if (lons(lon) /= START_LON + (lon - 1) * 5.0) stop 2
!        end do

! Get the varids of the pressure and temperature netCDF variables.
        status = nf90_inq_varid(ncid, var1, var1id) 
        status = nf90_inq_varid(ncid, var2, var2id) 
!        print *,"*** variable id of pressure =  ", var1id, "!"
!        print *,"*** variable id of temperature =  ", var2id, "!"
! Read 1 record of NLVLS*NLATS*NLONS values, starting at the beginning 
! of the record (the (1, 1, 1, rec) element in the netCDF file).
       count = (/NLONS, NLATS,NLAY,1  /)
      ! count = (/ 12, NLONS, NLATS/)
        start = (/ 1, 1, 1, 1/)

! Read the surface pressure and temperature data from the file, one
! record at a time.
        do rec =1, NRECS
        start(4) = rec
     call check(nf90_get_var(ncid, var1id, outdump1,start=start,count=count)) 
        
                do k=1,NLAY
                        do j=1,NLATS
                           do i=1,NLONS
                                outvar1(i,j,k,rec)=outdump1(i,j,k)
         
                           end do
                        end do
                end do
     call check( nf90_get_var(ncid, var2id, outdump2,start,count))        
        
                do k=1,NLAY
                        do j=1,NLATS
                           do i=1,NLONS
                                outvar2(i,j,k,rec)=outdump2(i,j,k)
                           end do
                        end do
                end do
 
 
     end do
!     print *, "get var for var 1 executed"
!     status = nf90_get_var(ncid, var2id, outvar2,start,count) 
!     print *,"get var for var 2 executed"
!     status = nf90_get_var(ncid, var3id, outvar3,start,count) 
           i  = 0
         do lat = 1, NLATS
           do lon = 1, NLONS
!             print *,"*** pressure ",lat," ",lon," =  ",pres_in

!              if (pres_in(lon, lat) /= SAMPLE_PRESSURE + i) stop 2
!              if (temp_in(lon, lat) /= SAMPLE_TEMP + i) stop 2
!              i = i + 1
!           end do
        end do
     ! next record
        end do
         
! Close the file. This frees up any internal netCDF resources
! associated with the file.
        status = nf90_close(ncid) 

! If we got this far, everything worked as expected. Yipee! 
!        print *,"*** SUCCESS reading example file ", FILE_NAME, "!"

        end subroutine d4readfromnc_2vr      

