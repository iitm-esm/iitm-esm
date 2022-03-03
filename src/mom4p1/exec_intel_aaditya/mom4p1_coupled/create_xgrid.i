# 1 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
# 1 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/exec_intel_aaditya/mom4p1_coupled//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
# 29 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
# 1 "/usr/include/stdlib.h" 1 3 4
# 25 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 361 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 373 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 374 "/usr/include/sys/cdefs.h" 2 3 4
# 362 "/usr/include/features.h" 2 3 4
# 385 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4



# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 5 "/usr/include/gnu/stubs.h" 2 3 4




# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 2 3 4
# 386 "/usr/include/features.h" 2 3 4
# 26 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 211 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 323 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 3 4
typedef int wchar_t;
# 34 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/bits/waitflags.h" 1 3 4
# 43 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/bits/waitstatus.h" 1 3 4
# 65 "/usr/include/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/endian.h" 1 3 4
# 38 "/usr/include/endian.h" 2 3 4
# 61 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/byteswap.h" 1 3 4
# 28 "/usr/include/bits/byteswap.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/byteswap.h" 2 3 4
# 62 "/usr/include/endian.h" 2 3 4
# 66 "/usr/include/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 44 "/usr/include/stdlib.h" 2 3 4
# 68 "/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
# 96 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 140 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__)) ;




extern double atof (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (__const char *__nptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;

# 277 "/usr/include/stdlib.h" 3 4

extern __inline double
__attribute__ ((__nothrow__)) atof (__const char *__nptr)
{
  return strtod (__nptr, (char **) ((void *)0));
}
extern __inline int
__attribute__ ((__nothrow__)) atoi (__const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void *)0), 10);
}
extern __inline long int
__attribute__ ((__nothrow__)) atol (__const char *__nptr)
{
  return strtol (__nptr, (char **) ((void *)0), 10);
}




__extension__ extern __inline long long int
__attribute__ ((__nothrow__)) atoll (__const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void *)0), 10);
}

# 311 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__)) ;


extern long int a64l (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/sys/types.h" 1 3 4
# 28 "/usr/include/sys/types.h" 3 4


# 1 "/usr/include/bits/types.h" 1 3 4
# 28 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 131 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 132 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 31 "/usr/include/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 61 "/usr/include/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 99 "/usr/include/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 133 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 58 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 74 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 92 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 104 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 134 "/usr/include/sys/types.h" 2 3 4
# 147 "/usr/include/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 148 "/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 195 "/usr/include/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 220 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/sys/select.h" 1 3 4
# 31 "/usr/include/sys/select.h" 3 4
# 1 "/usr/include/bits/select.h" 1 3 4
# 23 "/usr/include/bits/select.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/select.h" 2 3 4
# 32 "/usr/include/sys/select.h" 2 3 4


# 1 "/usr/include/bits/sigset.h" 1 3 4
# 24 "/usr/include/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 35 "/usr/include/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
# 45 "/usr/include/sys/select.h" 2 3 4

# 1 "/usr/include/bits/time.h" 1 3 4
# 75 "/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 47 "/usr/include/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 67 "/usr/include/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 99 "/usr/include/sys/select.h" 3 4

# 109 "/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 121 "/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);



# 221 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/sysmacros.h" 1 3 4
# 30 "/usr/include/sys/sysmacros.h" 3 4
__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__));


__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_major (unsigned long long int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}

__extension__ extern __inline unsigned int
__attribute__ ((__nothrow__)) gnu_dev_minor (unsigned long long int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}

__extension__ extern __inline unsigned long long int
__attribute__ ((__nothrow__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}
# 224 "/usr/include/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 271 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/pthreadtypes.h" 2 3 4
# 50 "/usr/include/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;



typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 76 "/usr/include/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    int __spins;
    __pthread_list_t __list;
# 101 "/usr/include/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;
  } __data;
# 187 "/usr/include/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 272 "/usr/include/sys/types.h" 2 3 4



# 321 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__));







extern double drand48 (void) __attribute__ ((__nothrow__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__));



# 1 "/usr/include/alloca.h" 1 3 4
# 25 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 26 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__));






# 498 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




extern void abort (void) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 531 "/usr/include/stdlib.h" 3 4





extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
# 554 "/usr/include/stdlib.h" 3 4






extern void _Exit (int __status) __attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));






extern char *getenv (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;




extern char *__secure_getenv (__const char *__name)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern int putenv (char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (__const char *__name, __const char *__value, int __replace)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__));
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 620 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 642 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 663 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 712 "/usr/include/stdlib.h" 3 4





extern int system (__const char *__command) ;

# 734 "/usr/include/stdlib.h" 3 4
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__)) ;






typedef int (*__compar_fn_t) (__const void *, __const void *);
# 752 "/usr/include/stdlib.h" 3 4



extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 771 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__)) __attribute__ ((__const__)) ;

# 808 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (3, 4, 5)));







extern int mblen (__const char *__s, size_t __n) __attribute__ ((__nothrow__)) ;


extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__)) ;


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__)) ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__));

extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__));








extern int rpmatch (__const char *__response) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 896 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *__const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 948 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 964 "/usr/include/stdlib.h" 3 4

# 30 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 30 "/usr/include/stdio.h" 3 4




# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 35 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 65 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 75 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 83 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
# 33 "/usr/include/libio.h" 2 3 4
# 53 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 54 "/usr/include/libio.h" 2 3 4
# 170 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 180 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 203 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 271 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 319 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 328 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 364 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 416 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 460 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__));
# 490 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__));
# 76 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 109 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;




# 161 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 162 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;









extern int remove (__const char *__filename) __attribute__ ((__nothrow__));

extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__));




extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) __attribute__ ((__nothrow__));








extern FILE *tmpfile (void) ;
# 208 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__)) ;
# 226 "/usr/include/stdio.h" 3 4
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 251 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 265 "/usr/include/stdio.h" 3 4






extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) ;




extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 294 "/usr/include/stdio.h" 3 4

# 305 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__)) ;
# 318 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes)
  __attribute__ ((__nothrow__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__));








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 416 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;




extern int scanf (__const char *__restrict __format, ...) ;

extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__));
# 447 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, __const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (__const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (__const char *__restrict __s, __const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf")

                          __attribute__ ((__nothrow__));
# 467 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 498 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (__const char *__restrict __s, __const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf")



     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 526 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 554 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 565 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 598 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;






extern char *gets (char *__s) ;

# 660 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);





extern int puts (__const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;

# 732 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream) ;








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 768 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 787 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
# 810 "/usr/include/stdio.h" 3 4

# 819 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;








extern void perror (__const char *__s);






# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 27 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern __const char *__const sys_errlist[];
# 849 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__)) ;
# 868 "/usr/include/stdio.h" 3 4
extern FILE *popen (__const char *__command, __const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
# 908 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__));
# 929 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio.h" 1 3 4
# 36 "/usr/include/bits/stdio.h" 3 4
extern __inline int
vprintf (__const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}



extern __inline int
getchar (void)
{
  return _IO_getc (stdin);
}




extern __inline int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline int
putchar (int __c)
{
  return _IO_putc (__c, stdout);
}




extern __inline int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}
# 125 "/usr/include/bits/stdio.h" 3 4
extern __inline int
__attribute__ ((__nothrow__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}


extern __inline int
__attribute__ ((__nothrow__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}
# 930 "/usr/include/stdio.h" 2 3 4
# 938 "/usr/include/stdio.h" 3 4

# 31 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c" 2
# 1 "/usr/include/math.h" 1 3 4
# 30 "/usr/include/math.h" 3 4




# 1 "/usr/include/bits/huge_val.h" 1 3 4
# 35 "/usr/include/math.h" 2 3 4

# 1 "/usr/include/bits/huge_valf.h" 1 3 4
# 37 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/bits/huge_vall.h" 1 3 4
# 38 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/bits/inf.h" 1 3 4
# 41 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/bits/nan.h" 1 3 4
# 44 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/bits/mathdef.h" 1 3 4
# 26 "/usr/include/bits/mathdef.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 27 "/usr/include/bits/mathdef.h" 2 3 4




typedef float float_t;
typedef double double_t;
# 48 "/usr/include/math.h" 2 3 4
# 71 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4


extern double acos (double __x) __attribute__ ((__nothrow__)); extern double __acos (double __x) __attribute__ ((__nothrow__));

extern double asin (double __x) __attribute__ ((__nothrow__)); extern double __asin (double __x) __attribute__ ((__nothrow__));

extern double atan (double __x) __attribute__ ((__nothrow__)); extern double __atan (double __x) __attribute__ ((__nothrow__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__));


extern double cos (double __x) __attribute__ ((__nothrow__)); extern double __cos (double __x) __attribute__ ((__nothrow__));

extern double sin (double __x) __attribute__ ((__nothrow__)); extern double __sin (double __x) __attribute__ ((__nothrow__));

extern double tan (double __x) __attribute__ ((__nothrow__)); extern double __tan (double __x) __attribute__ ((__nothrow__));




extern double cosh (double __x) __attribute__ ((__nothrow__)); extern double __cosh (double __x) __attribute__ ((__nothrow__));

extern double sinh (double __x) __attribute__ ((__nothrow__)); extern double __sinh (double __x) __attribute__ ((__nothrow__));

extern double tanh (double __x) __attribute__ ((__nothrow__)); extern double __tanh (double __x) __attribute__ ((__nothrow__));

# 87 "/usr/include/bits/mathcalls.h" 3 4


extern double acosh (double __x) __attribute__ ((__nothrow__)); extern double __acosh (double __x) __attribute__ ((__nothrow__));

extern double asinh (double __x) __attribute__ ((__nothrow__)); extern double __asinh (double __x) __attribute__ ((__nothrow__));

extern double atanh (double __x) __attribute__ ((__nothrow__)); extern double __atanh (double __x) __attribute__ ((__nothrow__));







extern double exp (double __x) __attribute__ ((__nothrow__)); extern double __exp (double __x) __attribute__ ((__nothrow__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__));


extern double log (double __x) __attribute__ ((__nothrow__)); extern double __log (double __x) __attribute__ ((__nothrow__));


extern double log10 (double __x) __attribute__ ((__nothrow__)); extern double __log10 (double __x) __attribute__ ((__nothrow__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__));

# 127 "/usr/include/bits/mathcalls.h" 3 4


extern double expm1 (double __x) __attribute__ ((__nothrow__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__));


extern double log1p (double __x) __attribute__ ((__nothrow__)); extern double __log1p (double __x) __attribute__ ((__nothrow__));


extern double logb (double __x) __attribute__ ((__nothrow__)); extern double __logb (double __x) __attribute__ ((__nothrow__));






extern double exp2 (double __x) __attribute__ ((__nothrow__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__));


extern double log2 (double __x) __attribute__ ((__nothrow__)); extern double __log2 (double __x) __attribute__ ((__nothrow__));








extern double pow (double __x, double __y) __attribute__ ((__nothrow__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__));


extern double sqrt (double __x) __attribute__ ((__nothrow__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__));





extern double hypot (double __x, double __y) __attribute__ ((__nothrow__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__));






extern double cbrt (double __x) __attribute__ ((__nothrow__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__));








extern double ceil (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__));




extern int __isinf (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int isinf (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int finite (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__));



extern double significand (double __x) __attribute__ ((__nothrow__)); extern double __significand (double __x) __attribute__ ((__nothrow__));





extern double copysign (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));






extern double nan (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __nan (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int __isnan (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern int isnan (double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern double j0 (double) __attribute__ ((__nothrow__)); extern double __j0 (double) __attribute__ ((__nothrow__));
extern double j1 (double) __attribute__ ((__nothrow__)); extern double __j1 (double) __attribute__ ((__nothrow__));
extern double jn (int, double) __attribute__ ((__nothrow__)); extern double __jn (int, double) __attribute__ ((__nothrow__));
extern double y0 (double) __attribute__ ((__nothrow__)); extern double __y0 (double) __attribute__ ((__nothrow__));
extern double y1 (double) __attribute__ ((__nothrow__)); extern double __y1 (double) __attribute__ ((__nothrow__));
extern double yn (int, double) __attribute__ ((__nothrow__)); extern double __yn (int, double) __attribute__ ((__nothrow__));






extern double erf (double) __attribute__ ((__nothrow__)); extern double __erf (double) __attribute__ ((__nothrow__));
extern double erfc (double) __attribute__ ((__nothrow__)); extern double __erfc (double) __attribute__ ((__nothrow__));
extern double lgamma (double) __attribute__ ((__nothrow__)); extern double __lgamma (double) __attribute__ ((__nothrow__));






extern double tgamma (double) __attribute__ ((__nothrow__)); extern double __tgamma (double) __attribute__ ((__nothrow__));





extern double gamma (double) __attribute__ ((__nothrow__)); extern double __gamma (double) __attribute__ ((__nothrow__));






extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__));







extern double rint (double __x) __attribute__ ((__nothrow__)); extern double __rint (double __x) __attribute__ ((__nothrow__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern double remainder (double __x, double __y) __attribute__ ((__nothrow__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__));



extern int ilogb (double __x) __attribute__ ((__nothrow__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__));




extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__));



extern double round (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__));






extern long int lrint (double __x) __attribute__ ((__nothrow__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__));
extern long long int llrint (double __x) __attribute__ ((__nothrow__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__));



extern long int lround (double __x) __attribute__ ((__nothrow__)); extern long int __lround (double __x) __attribute__ ((__nothrow__));
extern long long int llround (double __x) __attribute__ ((__nothrow__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__));



extern int __fpclassify (double __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__));








extern double scalb (double __x, double __n) __attribute__ ((__nothrow__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__));
# 72 "/usr/include/math.h" 2 3 4
# 94 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4


extern float acosf (float __x) __attribute__ ((__nothrow__)); extern float __acosf (float __x) __attribute__ ((__nothrow__));

extern float asinf (float __x) __attribute__ ((__nothrow__)); extern float __asinf (float __x) __attribute__ ((__nothrow__));

extern float atanf (float __x) __attribute__ ((__nothrow__)); extern float __atanf (float __x) __attribute__ ((__nothrow__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__));


extern float cosf (float __x) __attribute__ ((__nothrow__)); extern float __cosf (float __x) __attribute__ ((__nothrow__));

extern float sinf (float __x) __attribute__ ((__nothrow__)); extern float __sinf (float __x) __attribute__ ((__nothrow__));

extern float tanf (float __x) __attribute__ ((__nothrow__)); extern float __tanf (float __x) __attribute__ ((__nothrow__));




extern float coshf (float __x) __attribute__ ((__nothrow__)); extern float __coshf (float __x) __attribute__ ((__nothrow__));

extern float sinhf (float __x) __attribute__ ((__nothrow__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__));

extern float tanhf (float __x) __attribute__ ((__nothrow__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__));

# 87 "/usr/include/bits/mathcalls.h" 3 4


extern float acoshf (float __x) __attribute__ ((__nothrow__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__));

extern float asinhf (float __x) __attribute__ ((__nothrow__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__));

extern float atanhf (float __x) __attribute__ ((__nothrow__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__));







extern float expf (float __x) __attribute__ ((__nothrow__)); extern float __expf (float __x) __attribute__ ((__nothrow__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__));


extern float logf (float __x) __attribute__ ((__nothrow__)); extern float __logf (float __x) __attribute__ ((__nothrow__));


extern float log10f (float __x) __attribute__ ((__nothrow__)); extern float __log10f (float __x) __attribute__ ((__nothrow__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__));

# 127 "/usr/include/bits/mathcalls.h" 3 4


extern float expm1f (float __x) __attribute__ ((__nothrow__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__));


extern float log1pf (float __x) __attribute__ ((__nothrow__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__));


extern float logbf (float __x) __attribute__ ((__nothrow__)); extern float __logbf (float __x) __attribute__ ((__nothrow__));






extern float exp2f (float __x) __attribute__ ((__nothrow__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__));


extern float log2f (float __x) __attribute__ ((__nothrow__)); extern float __log2f (float __x) __attribute__ ((__nothrow__));








extern float powf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__));





extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__));






extern float cbrtf (float __x) __attribute__ ((__nothrow__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__));








extern float ceilf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__));




extern int __isinff (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int isinff (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int finitef (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__));



extern float significandf (float __x) __attribute__ ((__nothrow__)); extern float __significandf (float __x) __attribute__ ((__nothrow__));





extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));






extern float nanf (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __nanf (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int __isnanf (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern int isnanf (float __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern float j0f (float) __attribute__ ((__nothrow__)); extern float __j0f (float) __attribute__ ((__nothrow__));
extern float j1f (float) __attribute__ ((__nothrow__)); extern float __j1f (float) __attribute__ ((__nothrow__));
extern float jnf (int, float) __attribute__ ((__nothrow__)); extern float __jnf (int, float) __attribute__ ((__nothrow__));
extern float y0f (float) __attribute__ ((__nothrow__)); extern float __y0f (float) __attribute__ ((__nothrow__));
extern float y1f (float) __attribute__ ((__nothrow__)); extern float __y1f (float) __attribute__ ((__nothrow__));
extern float ynf (int, float) __attribute__ ((__nothrow__)); extern float __ynf (int, float) __attribute__ ((__nothrow__));






extern float erff (float) __attribute__ ((__nothrow__)); extern float __erff (float) __attribute__ ((__nothrow__));
extern float erfcf (float) __attribute__ ((__nothrow__)); extern float __erfcf (float) __attribute__ ((__nothrow__));
extern float lgammaf (float) __attribute__ ((__nothrow__)); extern float __lgammaf (float) __attribute__ ((__nothrow__));






extern float tgammaf (float) __attribute__ ((__nothrow__)); extern float __tgammaf (float) __attribute__ ((__nothrow__));





extern float gammaf (float) __attribute__ ((__nothrow__)); extern float __gammaf (float) __attribute__ ((__nothrow__));






extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__));







extern float rintf (float __x) __attribute__ ((__nothrow__)); extern float __rintf (float __x) __attribute__ ((__nothrow__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__));




extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__));



extern float roundf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__));
extern long long int llrintf (float __x) __attribute__ ((__nothrow__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__));
extern long long int llroundf (float __x) __attribute__ ((__nothrow__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__));



extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__));








extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__));
# 95 "/usr/include/math.h" 2 3 4
# 141 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) __attribute__ ((__nothrow__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__));

extern long double asinl (long double __x) __attribute__ ((__nothrow__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__));

extern long double atanl (long double __x) __attribute__ ((__nothrow__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__));

extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__));


extern long double cosl (long double __x) __attribute__ ((__nothrow__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__));

extern long double sinl (long double __x) __attribute__ ((__nothrow__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__));

extern long double tanl (long double __x) __attribute__ ((__nothrow__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__));




extern long double coshl (long double __x) __attribute__ ((__nothrow__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__));

extern long double sinhl (long double __x) __attribute__ ((__nothrow__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__));

extern long double tanhl (long double __x) __attribute__ ((__nothrow__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__));

# 87 "/usr/include/bits/mathcalls.h" 3 4


extern long double acoshl (long double __x) __attribute__ ((__nothrow__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__));

extern long double asinhl (long double __x) __attribute__ ((__nothrow__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__));

extern long double atanhl (long double __x) __attribute__ ((__nothrow__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__));







extern long double expl (long double __x) __attribute__ ((__nothrow__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__));


extern long double logl (long double __x) __attribute__ ((__nothrow__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__));


extern long double log10l (long double __x) __attribute__ ((__nothrow__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__));

# 127 "/usr/include/bits/mathcalls.h" 3 4


extern long double expm1l (long double __x) __attribute__ ((__nothrow__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__));


extern long double log1pl (long double __x) __attribute__ ((__nothrow__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__));






extern long double exp2l (long double __x) __attribute__ ((__nothrow__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__));


extern long double log2l (long double __x) __attribute__ ((__nothrow__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__));








extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__));





extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__));






extern long double cbrtl (long double __x) __attribute__ ((__nothrow__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__));








extern long double ceill (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__));




extern int __isinfl (long double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int isinfl (long double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern int finitel (long double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__));





extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));






extern long double nanl (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __nanl (__const char *__tagb) __attribute__ ((__nothrow__)) __attribute__ ((__const__));





extern int __isnanl (long double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern int isnanl (long double __value) __attribute__ ((__nothrow__)) __attribute__ ((__const__));


extern long double j0l (long double) __attribute__ ((__nothrow__)); extern long double __j0l (long double) __attribute__ ((__nothrow__));
extern long double j1l (long double) __attribute__ ((__nothrow__)); extern long double __j1l (long double) __attribute__ ((__nothrow__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__));
extern long double y0l (long double) __attribute__ ((__nothrow__)); extern long double __y0l (long double) __attribute__ ((__nothrow__));
extern long double y1l (long double) __attribute__ ((__nothrow__)); extern long double __y1l (long double) __attribute__ ((__nothrow__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__));






extern long double erfl (long double) __attribute__ ((__nothrow__)); extern long double __erfl (long double) __attribute__ ((__nothrow__));
extern long double erfcl (long double) __attribute__ ((__nothrow__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__));
extern long double lgammal (long double) __attribute__ ((__nothrow__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__));






extern long double tgammal (long double) __attribute__ ((__nothrow__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__));





extern long double gammal (long double) __attribute__ ((__nothrow__)); extern long double __gammal (long double) __attribute__ ((__nothrow__));






extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__));







extern long double rintl (long double __x) __attribute__ ((__nothrow__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__));




extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__));
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__));
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__));


extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__));



extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__))
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__));








extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__));
# 142 "/usr/include/math.h" 2 3 4
# 157 "/usr/include/math.h" 3 4
extern int signgam;
# 198 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN,

    FP_INFINITE,

    FP_ZERO,

    FP_SUBNORMAL,

    FP_NORMAL

  };
# 291 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 316 "/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);
# 416 "/usr/include/math.h" 3 4
# 1 "/usr/include/bits/mathinline.h" 1 3 4
# 25 "/usr/include/bits/mathinline.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 26 "/usr/include/bits/mathinline.h" 2 3 4
# 37 "/usr/include/bits/mathinline.h" 3 4
extern __inline int
__attribute__ ((__nothrow__)) __signbitf (float __x)
{




  int __m;
  __asm ("pmovmskb %1, %0" : "=r" (__m) : "x" (__x));
  return __m & 0x8;

}
extern __inline int
__attribute__ ((__nothrow__)) __signbit (double __x)
{




  int __m;
  __asm ("pmovmskb %1, %0" : "=r" (__m) : "x" (__x));
  return __m & 0x80;

}
extern __inline int
__attribute__ ((__nothrow__)) __signbitl (long double __x)
{
  __extension__ union { long double __l; int __i[3]; } __u = { __l: __x };
  return (__u.__i[2] & 0x8000) != 0;
}
# 417 "/usr/include/math.h" 2 3 4
# 472 "/usr/include/math.h" 3 4

# 32 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c" 2
# 1 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/mosaic_util.h" 1
# 13 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/mosaic_util.h"
void error_handler(const char *msg);
int nearest_index(double value, const double *array, int ia);
int lon_fix(double *x, double *y, int n_in, double tlon);
double minval_double(int size, const double *data);
double maxval_double(int size, const double *data);
double avgval_double(int size, const double *data);
void latlon2xyz(int size, const double *lon, const double *lat, double *x, double *y, double *z);
void xyz2latlon(int size, const double *x, const double *y, const double *z, double *lon, double *lat);
double box_area(double ll_lon, double ll_lat, double ur_lon, double ur_lat);
double poly_area(const double lon[], const double lat[], int n);
double poly_area_no_adjust(const double x[], const double y[], int n);
int fix_lon(double lon[], double lat[], int n, double tlon);
void tokenize(const char * const string, const char *tokens, unsigned int varlen,
       unsigned int maxvar, char * pstring, unsigned int * const nstr);
double great_circle_distance(double *p1, double *p2);
double spherical_excess_area(const double* p_ll, const double* p_ul,
        const double* p_lr, const double* p_ur, double radius);
void vect_cross(const double *p1, const double *p2, double *e );
double spherical_angle(const double *v1, const double *v2, const double *v3);
void normalize_vect(double *e);
void unit_vect_latlon(int size, const double *lon, const double *lat, double *vlon, double *vlat);
# 33 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c" 2
# 1 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.h" 1






double poly_ctrlon(const double lon[], const double lat[], int n, double clon);
double poly_ctrlat(const double lon[], const double lat[], int n);
double box_ctrlon(double ll_lon, double ll_lat, double ur_lon, double ur_lat, double clon);
double box_ctrlat(double ll_lon, double ll_lat, double ur_lon, double ur_lat);
int get_maxxgrid(void);
void get_grid_area(const int *nlon, const int *nlat, const double *lon, const double *lat, double *area);
void get_grid_area_no_adjust(const int *nlon, const int *nlat, const double *lon, const double *lat, double *area);
int clip(const double lon_in[], const double lat_in[], int n_in, double ll_lon, double ll_lat,
  double ur_lon, double ur_lat, double lon_out[], double lat_out[]);
int clip_2dx2d(const double lon1_in[], const double lat1_in[], int n1_in,
        const double lon2_in[], const double lat2_in[], int n2_in,
        double lon_out[], double lat_out[]);
int create_xgrid_1dx2d_order1(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out, const double *lon_in,
         const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out,
         int *j_out, double *xgrid_area);
int create_xgrid_1dx2d_order2(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
         double *xgrid_area, double *xgrid_clon, double *xgrid_clat);
int create_xgrid_2dx1d_order1(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out, const double *lon_in,
         const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out,
         int *j_out, double *xgrid_area);
int create_xgrid_2dx1d_order2(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
         double *xgrid_area, double *xgrid_clon, double *xgrid_clat);
int create_xgrid_2dx2d_order1(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out,
         int *j_out, double *xgrid_area);
int create_xgrid_2dx2d_order2(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
         double *xgrid_area, double *xgrid_clon, double *xgrid_clat);
# 34 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c" 2
# 1 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/constant.h" 1
# 35 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c" 2




double grid_box_radius(const double *x, const double *y, const double *z, int n);
double dist_between_boxes(const double *x1, const double *y1, const double *z1, int n1,
     const double *x2, const double *y2, const double *z2, int n2);
int inside_edge(double x0, double y0, double x1, double y1, double x, double y);




int get_maxxgrid(void)
{
  return 1e7;
}

int get_maxxgrid_(void)
{
  return get_maxxgrid();
}





void get_grid_area_(const int *nlon, const int *nlat, const double *lon, const double *lat, double *area)
{
  get_grid_area(nlon, nlat, lon, lat, area);
}

void get_grid_area(const int *nlon, const int *nlat, const double *lon, const double *lat, double *area)
{
  int nx, ny, nxp, i, j, n_in;
  double x_in[20], y_in[20];

  nx = *nlon;
  ny = *nlat;
  nxp = nx + 1;

  for(j=0; j<ny; j++) for(i=0; i < nx; i++) {
    x_in[0] = lon[j*nxp+i];
    x_in[1] = lon[j*nxp+i+1];
    x_in[2] = lon[(j+1)*nxp+i+1];
    x_in[3] = lon[(j+1)*nxp+i];
    y_in[0] = lat[j*nxp+i];
    y_in[1] = lat[j*nxp+i+1];
    y_in[2] = lat[(j+1)*nxp+i+1];
    y_in[3] = lat[(j+1)*nxp+i];
    n_in = fix_lon(x_in, y_in, 4, 3.14159265358979323846);
    area[j*nx+i] = poly_area(x_in, y_in, n_in);
  }

};


void get_grid_area_no_adjust(const int *nlon, const int *nlat, const double *lon, const double *lat, double *area)
{
  int nx, ny, nxp, i, j, n_in;
  double x_in[20], y_in[20];

  nx = *nlon;
  ny = *nlat;
  nxp = nx + 1;

  for(j=0; j<ny; j++) for(i=0; i < nx; i++) {
    x_in[0] = lon[j*nxp+i];
    x_in[1] = lon[j*nxp+i+1];
    x_in[2] = lon[(j+1)*nxp+i+1];
    x_in[3] = lon[(j+1)*nxp+i];
    y_in[0] = lat[j*nxp+i];
    y_in[1] = lat[j*nxp+i+1];
    y_in[2] = lat[(j+1)*nxp+i+1];
    y_in[3] = lat[(j+1)*nxp+i];
    n_in = 4;
    area[j*nx+i] = poly_area_no_adjust(x_in, y_in, n_in);
  }

};







int create_xgrid_1dx2d_order1_(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
          const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
          const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out, double *xgrid_area)
{
  int nxgrid;

  nxgrid = create_xgrid_1dx2d_order1(nlon_in, nlat_in, nlon_out, nlat_out, lon_in, lat_in, lon_out, lat_out, mask_in,
          i_in, j_in, i_out, j_out, xgrid_area);
  return nxgrid;

};

int create_xgrid_1dx2d_order1(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out, const double *lon_in,
         const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out,
         int *j_out, double *xgrid_area)
{

  int nx1, ny1, nx2, ny2, nx1p, nx2p;
  int i1, j1, i2, j2, nxgrid;
  double ll_lon, ll_lat, ur_lon, ur_lat, x_in[50], y_in[50], x_out[50], y_out[50];
  double *area_in, *area_out, min_area;
  double *tmpx, *tmpy;

  nx1 = *nlon_in;
  ny1 = *nlat_in;
  nx2 = *nlon_out;
  ny2 = *nlat_out;

  nxgrid = 0;
  nx1p = nx1 + 1;
  nx2p = nx2 + 1;

  area_in = (double *)malloc(nx1*ny1*sizeof(double));
  area_out = (double *)malloc(nx2*ny2*sizeof(double));
  tmpx = (double *)malloc((nx1+1)*(ny1+1)*sizeof(double));
  tmpy = (double *)malloc((nx1+1)*(ny1+1)*sizeof(double));
  for(j1=0; j1<=ny1; j1++) for(i1=0; i1<=nx1; i1++) {
    tmpx[j1*nx1p+i1] = lon_in[i1];
    tmpy[j1*nx1p+i1] = lat_in[j1];
  }

  if(nx1 > 1)
     get_grid_area(nlon_in, nlat_in, tmpx, tmpy, area_in);
  else
    get_grid_area_no_adjust(nlon_in, nlat_in, tmpx, tmpy, area_in);

  get_grid_area(nlon_out, nlat_out, lon_out, lat_out, area_out);
  free(tmpx);
  free(tmpy);

  for(j1=0; j1<ny1; j1++) for(i1=0; i1<nx1; i1++) if( mask_in[j1*nx1+i1] > (0.5) ) {

    ll_lon = lon_in[i1]; ll_lat = lat_in[j1];
    ur_lon = lon_in[i1+1]; ur_lat = lat_in[j1+1];
    for(j2=0; j2<ny2; j2++) for(i2=0; i2<nx2; i2++) {
      int n_in, n_out;
      double Xarea;

      y_in[0] = lat_out[j2*nx2p+i2];
      y_in[1] = lat_out[j2*nx2p+i2+1];
      y_in[2] = lat_out[(j2+1)*nx2p+i2+1];
      y_in[3] = lat_out[(j2+1)*nx2p+i2];
      if ( (y_in[0]<=ll_lat) && (y_in[1]<=ll_lat)
     && (y_in[2]<=ll_lat) && (y_in[3]<=ll_lat) ) continue;
      if ( (y_in[0]>=ur_lat) && (y_in[1]>=ur_lat)
     && (y_in[2]>=ur_lat) && (y_in[3]>=ur_lat) ) continue;

      x_in[0] = lon_out[j2*nx2p+i2];
      x_in[1] = lon_out[j2*nx2p+i2+1];
      x_in[2] = lon_out[(j2+1)*nx2p+i2+1];
      x_in[3] = lon_out[(j2+1)*nx2p+i2];
      n_in = fix_lon(x_in, y_in, 4, (ll_lon+ur_lon)/2);

      if ( (n_out = clip ( x_in, y_in, n_in, ll_lon, ll_lat, ur_lon, ur_lat, x_out, y_out )) > 0 ) {
 Xarea = poly_area (x_out, y_out, n_out ) * mask_in[j1*nx1+i1];
 min_area = (area_in[j1*nx1+i1]<area_out[j2*nx2+i2] ? area_in[j1*nx1+i1]:area_out[j2*nx2+i2]);
 if( Xarea/min_area > (1.e-6) ) {
         xgrid_area[nxgrid] = Xarea;
   i_in[nxgrid] = i1;
   j_in[nxgrid] = j1;
   i_out[nxgrid] = i2;
   j_out[nxgrid] = j2;
   ++nxgrid;
   if(nxgrid > 1e7) error_handler("nxgrid is greater than MAXXGRID, increase MAXXGRID");
 }
      }
    }
  }

  free(area_in);
  free(area_out);

  return nxgrid;

};
# 225 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
int create_xgrid_1dx2d_order2_(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
          const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
          const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
          double *xgrid_area, double *xgrid_clon, double *xgrid_clat)
{
  int nxgrid;
  nxgrid = create_xgrid_1dx2d_order2(nlon_in, nlat_in, nlon_out, nlat_out, lon_in, lat_in, lon_out, lat_out, mask_in, i_in,
                                     j_in, i_out, j_out, xgrid_area, xgrid_clon, xgrid_clat);
  return nxgrid;

};
int create_xgrid_1dx2d_order2(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
         double *xgrid_area, double *xgrid_clon, double *xgrid_clat)
{

  int nx1, ny1, nx2, ny2, nx1p, nx2p;
  int i1, j1, i2, j2, nxgrid, n;
  double ll_lon, ll_lat, ur_lon, ur_lat, x_in[50], y_in[50], x_out[50], y_out[50];
  double *area_in, *area_out, min_area;
  double *tmpx, *tmpy;

  nx1 = *nlon_in;
  ny1 = *nlat_in;
  nx2 = *nlon_out;
  ny2 = *nlat_out;

  nxgrid = 0;
  nx1p = nx1 + 1;
  nx2p = nx2 + 1;

  area_in = (double *)malloc(nx1*ny1*sizeof(double));
  area_out = (double *)malloc(nx2*ny2*sizeof(double));
  tmpx = (double *)malloc((nx1+1)*(ny1+1)*sizeof(double));
  tmpy = (double *)malloc((nx1+1)*(ny1+1)*sizeof(double));
  for(j1=0; j1<=ny1; j1++) for(i1=0; i1<=nx1; i1++) {
    tmpx[j1*nx1p+i1] = lon_in[i1];
    tmpy[j1*nx1p+i1] = lat_in[j1];
  }
  get_grid_area(nlon_in, nlat_in, tmpx, tmpy, area_in);
  get_grid_area(nlon_out, nlat_out, lon_out, lat_out, area_out);
  free(tmpx);
  free(tmpy);

  for(j1=0; j1<ny1; j1++) for(i1=0; i1<nx1; i1++) if( mask_in[j1*nx1+i1] > (0.5) ) {

    ll_lon = lon_in[i1]; ll_lat = lat_in[j1];
    ur_lon = lon_in[i1+1]; ur_lat = lat_in[j1+1];
    for(j2=0; j2<ny2; j2++) for(i2=0; i2<nx2; i2++) {
      int n_in, n_out;
      double xarea, lon_in_avg;

      y_in[0] = lat_out[j2*nx2p+i2];
      y_in[1] = lat_out[j2*nx2p+i2+1];
      y_in[2] = lat_out[(j2+1)*nx2p+i2+1];
      y_in[3] = lat_out[(j2+1)*nx2p+i2];
      if ( (y_in[0]<=ll_lat) && (y_in[1]<=ll_lat)
     && (y_in[2]<=ll_lat) && (y_in[3]<=ll_lat) ) continue;
      if ( (y_in[0]>=ur_lat) && (y_in[1]>=ur_lat)
     && (y_in[2]>=ur_lat) && (y_in[3]>=ur_lat) ) continue;

      x_in[0] = lon_out[j2*nx2p+i2];
      x_in[1] = lon_out[j2*nx2p+i2+1];
      x_in[2] = lon_out[(j2+1)*nx2p+i2+1];
      x_in[3] = lon_out[(j2+1)*nx2p+i2];
      n_in = fix_lon(x_in, y_in, 4, (ll_lon+ur_lon)/2);
      lon_in_avg = avgval_double(n_in, x_in);

      if ( (n_out = clip ( x_in, y_in, n_in, ll_lon, ll_lat, ur_lon, ur_lat, x_out, y_out )) > 0 ) {
 xarea = poly_area (x_out, y_out, n_out ) * mask_in[j1*nx1+i1];
        min_area = (area_in[j1*nx1+i1]<area_out[j2*nx2+i2] ? area_in[j1*nx1+i1]:area_out[j2*nx2+i2]);
 if(xarea/min_area > (1.e-6) ) {
   xgrid_area[nxgrid] = xarea;
   xgrid_clon[nxgrid] = poly_ctrlon(x_out, y_out, n_out, lon_in_avg);
   xgrid_clat[nxgrid] = poly_ctrlat (x_out, y_out, n_out );
   i_in[nxgrid] = i1;
   j_in[nxgrid] = j1;
   i_out[nxgrid] = i2;
   j_out[nxgrid] = j2;
   ++nxgrid;
   if(nxgrid > 1e7) error_handler("nxgrid is greater than MAXXGRID, increase MAXXGRID");
 }
      }
    }
  }
  free(area_in);
  free(area_out);

  return nxgrid;

};
# 325 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
int create_xgrid_2dx1d_order1_(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
          const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
          const double *mask_in, int *i_in, int *j_in, int *i_out,
          int *j_out, double *xgrid_area)
{
  int nxgrid;

  nxgrid = create_xgrid_2dx1d_order1(nlon_in, nlat_in, nlon_out, nlat_out, lon_in, lat_in, lon_out, lat_out, mask_in,
          i_in, j_in, i_out, j_out, xgrid_area);
  return nxgrid;

};
int create_xgrid_2dx1d_order1(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out, const double *lon_in,
         const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out,
         int *j_out, double *xgrid_area)
{

  int nx1, ny1, nx2, ny2, nx1p, nx2p;
  int i1, j1, i2, j2, nxgrid;
  double ll_lon, ll_lat, ur_lon, ur_lat, x_in[50], y_in[50], x_out[50], y_out[50];
  double *area_in, *area_out, min_area;
  double *tmpx, *tmpy;

  nx1 = *nlon_in;
  ny1 = *nlat_in;
  nx2 = *nlon_out;
  ny2 = *nlat_out;

  nxgrid = 0;
  nx1p = nx1 + 1;
  nx2p = nx2 + 1;
  area_in = (double *)malloc(nx1*ny1*sizeof(double));
  area_out = (double *)malloc(nx2*ny2*sizeof(double));
  tmpx = (double *)malloc((nx2+1)*(ny2+1)*sizeof(double));
  tmpy = (double *)malloc((nx2+1)*(ny2+1)*sizeof(double));
  for(j2=0; j2<=ny2; j2++) for(i2=0; i2<=nx2; i2++) {
    tmpx[j2*nx2p+i2] = lon_out[i2];
    tmpy[j2*nx2p+i2] = lat_out[j2];
  }
  get_grid_area(nlon_in, nlat_in, lon_in, lat_in, area_in);
  get_grid_area(nlon_out, nlat_out, tmpx, tmpy, area_out);

  free(tmpx);
  free(tmpy);

  for(j2=0; j2<ny2; j2++) for(i2=0; i2<nx2; i2++) {

    ll_lon = lon_out[i2]; ll_lat = lat_out[j2];
    ur_lon = lon_out[i2+1]; ur_lat = lat_out[j2+1];
    for(j1=0; j1<ny1; j1++) for(i1=0; i1<nx1; i1++) if( mask_in[j1*nx1+i1] > (0.5) ) {
      int n_in, n_out;
      double Xarea;

      y_in[0] = lat_in[j1*nx1p+i1];
      y_in[1] = lat_in[j1*nx1p+i1+1];
      y_in[2] = lat_in[(j1+1)*nx1p+i1+1];
      y_in[3] = lat_in[(j1+1)*nx1p+i1];
      if ( (y_in[0]<=ll_lat) && (y_in[1]<=ll_lat)
     && (y_in[2]<=ll_lat) && (y_in[3]<=ll_lat) ) continue;
      if ( (y_in[0]>=ur_lat) && (y_in[1]>=ur_lat)
     && (y_in[2]>=ur_lat) && (y_in[3]>=ur_lat) ) continue;

      x_in[0] = lon_in[j1*nx1p+i1];
      x_in[1] = lon_in[j1*nx1p+i1+1];
      x_in[2] = lon_in[(j1+1)*nx1p+i1+1];
      x_in[3] = lon_in[(j1+1)*nx1p+i1];

      n_in = fix_lon(x_in, y_in, 4, (ll_lon+ur_lon)/2);

      if ( (n_out = clip ( x_in, y_in, n_in, ll_lon, ll_lat, ur_lon, ur_lat, x_out, y_out )) > 0 ) {
 Xarea = poly_area ( x_out, y_out, n_out ) * mask_in[j1*nx1+i1];
 min_area = (area_in[j1*nx1+i1]<area_out[j2*nx2+i2] ? area_in[j1*nx1+i1]:area_out[j2*nx2+i2]);
 if( Xarea/min_area > (1.e-6) ) {
         xgrid_area[nxgrid] = Xarea;
   i_in[nxgrid] = i1;
   j_in[nxgrid] = j1;
   i_out[nxgrid] = i2;
   j_out[nxgrid] = j2;
   ++nxgrid;
   if(nxgrid > 1e7) error_handler("nxgrid is greater than MAXXGRID, increase MAXXGRID");
 }
      }
    }
  }

  free(area_in);
  free(area_out);

  return nxgrid;

};
# 426 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
int create_xgrid_2dx1d_order2_(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
          const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
          const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
          double *xgrid_area, double *xgrid_clon, double *xgrid_clat)
{
  int nxgrid;
  nxgrid = create_xgrid_2dx1d_order2(nlon_in, nlat_in, nlon_out, nlat_out, lon_in, lat_in, lon_out, lat_out, mask_in, i_in,
                                     j_in, i_out, j_out, xgrid_area, xgrid_clon, xgrid_clat);
  return nxgrid;

};

int create_xgrid_2dx1d_order2(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
         double *xgrid_area, double *xgrid_clon, double *xgrid_clat)
{

  int nx1, ny1, nx2, ny2, nx1p, nx2p;
  int i1, j1, i2, j2, nxgrid, n;
  double ll_lon, ll_lat, ur_lon, ur_lat, x_in[50], y_in[50], x_out[50], y_out[50];
  double *tmpx, *tmpy;
  double *area_in, *area_out, min_area;
  double lon_in_avg;

  nx1 = *nlon_in;
  ny1 = *nlat_in;
  nx2 = *nlon_out;
  ny2 = *nlat_out;

  nxgrid = 0;
  nx1p = nx1 + 1;
  nx2p = nx2 + 1;

  area_in = (double *)malloc(nx1*ny1*sizeof(double));
  area_out = (double *)malloc(nx2*ny2*sizeof(double));
  tmpx = (double *)malloc((nx2+1)*(ny2+1)*sizeof(double));
  tmpy = (double *)malloc((nx2+1)*(ny2+1)*sizeof(double));
  for(j2=0; j2<=ny2; j2++) for(i2=0; i2<=nx2; i2++) {
    tmpx[j2*nx2p+i2] = lon_out[i2];
    tmpy[j2*nx2p+i2] = lat_out[j2];
  }
  get_grid_area(nlon_in, nlat_in, lon_in, lat_in, area_in);
  get_grid_area(nlon_out, nlat_out, tmpx, tmpy, area_out);

  free(tmpx);
  free(tmpy);

  for(j2=0; j2<ny2; j2++) for(i2=0; i2<nx2; i2++) {

    ll_lon = lon_out[i2]; ll_lat = lat_out[j2];
    ur_lon = lon_out[i2+1]; ur_lat = lat_out[j2+1];
    for(j1=0; j1<ny1; j1++) for(i1=0; i1<nx1; i1++) if( mask_in[j1*nx1+i1] > (0.5) ) {
      int n_in, n_out;
      double xarea;

      y_in[0] = lat_in[j1*nx1p+i1];
      y_in[1] = lat_in[j1*nx1p+i1+1];
      y_in[2] = lat_in[(j1+1)*nx1p+i1+1];
      y_in[3] = lat_in[(j1+1)*nx1p+i1];
      if ( (y_in[0]<=ll_lat) && (y_in[1]<=ll_lat)
     && (y_in[2]<=ll_lat) && (y_in[3]<=ll_lat) ) continue;
      if ( (y_in[0]>=ur_lat) && (y_in[1]>=ur_lat)
     && (y_in[2]>=ur_lat) && (y_in[3]>=ur_lat) ) continue;

      x_in[0] = lon_in[j1*nx1p+i1];
      x_in[1] = lon_in[j1*nx1p+i1+1];
      x_in[2] = lon_in[(j1+1)*nx1p+i1+1];
      x_in[3] = lon_in[(j1+1)*nx1p+i1];

      n_in = fix_lon(x_in, y_in, 4, (ll_lon+ur_lon)/2);
      lon_in_avg = avgval_double(n_in, x_in);

      if ( (n_out = clip ( x_in, y_in, n_in, ll_lon, ll_lat, ur_lon, ur_lat, x_out, y_out )) > 0 ) {
 xarea = poly_area (x_out, y_out, n_out ) * mask_in[j1*nx1+i1];
 min_area = (area_in[j1*nx1+i1]<area_out[j2*nx2+i2] ? area_in[j1*nx1+i1]:area_out[j2*nx2+i2]);
 if(xarea/min_area > (1.e-6) ) {
   xgrid_area[nxgrid] = xarea;
   xgrid_clon[nxgrid] = poly_ctrlon(x_out, y_out, n_out, lon_in_avg);
   xgrid_clat[nxgrid] = poly_ctrlat (x_out, y_out, n_out );
   i_in[nxgrid] = i1;
   j_in[nxgrid] = j1;
   i_out[nxgrid] = i2;
   j_out[nxgrid] = j2;
   ++nxgrid;
   if(nxgrid > 1e7) error_handler("nxgrid is greater than MAXXGRID, increase MAXXGRID");
 }
      }
    }
  }

  free(area_in);
  free(area_out);

  return nxgrid;

};
# 532 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
int create_xgrid_2dx2d_order1_(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
          const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
          const double *mask_in, int *i_in, int *j_in, int *i_out,
          int *j_out, double *xgrid_area)
{
  int nxgrid;

  nxgrid = create_xgrid_2dx2d_order1(nlon_in, nlat_in, nlon_out, nlat_out, lon_in, lat_in, lon_out, lat_out, mask_in,
          i_in, j_in, i_out, j_out, xgrid_area);
  return nxgrid;

};

int create_xgrid_2dx2d_order1(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out,
         int *j_out, double *xgrid_area)
{

  int nx1, ny1, nx2, ny2, nx1p, nx2p, ny1p, ny2p, nxgrid, n1_in, n2_in;
  int n0, n1, n2, n3, i1, j1, i2, j2, l;
  double x1_in[50], y1_in[50], x2_in[50], y2_in[50], x_out[50], y_out[50];
  double lon_in_min, lon_out_min, lon_in_max, lon_out_max, lat_in_min, lat_in_max, lat_out_min, lat_out_max;
  double lon_in_avg;
  double *area_in, *area_out, min_area;

  nx1 = *nlon_in;
  ny1 = *nlat_in;
  nx2 = *nlon_out;
  ny2 = *nlat_out;

  nxgrid = 0;
  nx1p = nx1 + 1;
  nx2p = nx2 + 1;

  area_in = (double *)malloc(nx1*ny1*sizeof(double));
  area_out = (double *)malloc(nx2*ny2*sizeof(double));
  get_grid_area(nlon_in, nlat_in, lon_in, lat_in, area_in);
  get_grid_area(nlon_out, nlat_out, lon_out, lat_out, area_out);

  for(j1=0; j1<ny1; j1++) for(i1=0; i1<nx1; i1++) if( mask_in[j1*nx1+i1] > (0.5) ) {
    n0 = j1*nx1p+i1; n1 = j1*nx1p+i1+1;
    n2 = (j1+1)*nx1p+i1+1; n3 = (j1+1)*nx1p+i1;
    x1_in[0] = lon_in[n0]; y1_in[0] = lat_in[n0];
    x1_in[1] = lon_in[n1]; y1_in[1] = lat_in[n1];
    x1_in[2] = lon_in[n2]; y1_in[2] = lat_in[n2];
    x1_in[3] = lon_in[n3]; y1_in[3] = lat_in[n3];
    lat_in_min = minval_double(4, y1_in);
    lat_in_max = maxval_double(4, y1_in);
    n1_in = fix_lon(x1_in, y1_in, 4, 3.14159265358979323846);
    lon_in_min = minval_double(n1_in, x1_in);
    lon_in_max = maxval_double(n1_in, x1_in);
    lon_in_avg = avgval_double(n1_in, x1_in);

    for(j2=0; j2<ny2; j2++) for(i2=0; i2<nx2; i2++) {
      int n_in, n_out;
      double Xarea;
      n0 = j2*nx2p+i2; n1 = j2*nx2p+i2+1;
      n2 = (j2+1)*nx2p+i2+1; n3 = (j2+1)*nx2p+i2;
      x2_in[0] = lon_out[n0]; y2_in[0] = lat_out[n0];
      x2_in[1] = lon_out[n1]; y2_in[1] = lat_out[n1];
      x2_in[2] = lon_out[n2]; y2_in[2] = lat_out[n2];
      x2_in[3] = lon_out[n3]; y2_in[3] = lat_out[n3];

      lat_out_min = minval_double(4, y2_in);
      lat_out_max = maxval_double(4, y2_in);
      if(lat_out_min >= lat_in_max || lat_out_max <= lat_in_min ) continue;
      n2_in = fix_lon(x2_in, y2_in, 4, lon_in_avg);
      lon_out_min = minval_double(n2_in, x2_in);
      lon_out_max = maxval_double(n2_in, x2_in);




      if(lon_out_min >= lon_in_max || lon_out_max <= lon_in_min ) continue;

      if ( (n_out = clip_2dx2d ( x1_in, y1_in, n1_in, x2_in, y2_in, n2_in, x_out, y_out )) > 0) {
 Xarea = poly_area (x_out, y_out, n_out) * mask_in[j1*nx1+i1];
 min_area = (area_in[j1*nx1+i1]<area_out[j2*nx2+i2] ? area_in[j1*nx1+i1]:area_out[j2*nx2+i2]);
 if( Xarea/min_area > (1.e-6) ) {
   xgrid_area[nxgrid] = Xarea;
   i_in[nxgrid] = i1;
   j_in[nxgrid] = j1;
   i_out[nxgrid] = i2;
   j_out[nxgrid] = j2;
   ++nxgrid;
   if(nxgrid > 1e7) error_handler("nxgrid is greater than MAXXGRID, increase MAXXGRID");
 }
      }
    }
  }

  free(area_in);
  free(area_out);
  return nxgrid;

};
# 638 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
int create_xgrid_2dx2d_order2_(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
          const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
          const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
          double *xgrid_area, double *xgrid_clon, double *xgrid_clat)
{
  int nxgrid;
  nxgrid = create_xgrid_2dx2d_order2(nlon_in, nlat_in, nlon_out, nlat_out, lon_in, lat_in, lon_out, lat_out, mask_in, i_in,
                                     j_in, i_out, j_out, xgrid_area, xgrid_clon, xgrid_clat);
  return nxgrid;

};

int create_xgrid_2dx2d_order2(const int *nlon_in, const int *nlat_in, const int *nlon_out, const int *nlat_out,
         const double *lon_in, const double *lat_in, const double *lon_out, const double *lat_out,
         const double *mask_in, int *i_in, int *j_in, int *i_out, int *j_out,
         double *xgrid_area, double *xgrid_clon, double *xgrid_clat)
{

  int nx1, nx2, ny1, ny2, nx1p, nx2p, ny1p, ny2p, nxgrid, n1_in, n2_in;
  int n0, n1, n2, n3, i1, j1, i2, j2, l, n;
  double x1_in[50], y1_in[50], x2_in[50], y2_in[50], x_out[50], y_out[50];
  double lon_in_min, lon_out_min, lon_in_max, lon_out_max, lat_in_min, lat_in_max, lat_out_min, lat_out_max;
  double lon_in_avg, xctrlon, xctrlat;
  double *area_in, *area_out, min_area;

  nx1 = *nlon_in;
  ny1 = *nlat_in;
  nx2 = *nlon_out;
  ny2 = *nlat_out;
  nxgrid = 0;
  nx1p = nx1 + 1;
  nx2p = nx2 + 1;
  ny1p = ny1 + 1;
  ny2p = ny2 + 1;

  area_in = (double *)malloc(nx1*ny1*sizeof(double));
  area_out = (double *)malloc(nx2*ny2*sizeof(double));
  get_grid_area(nlon_in, nlat_in, lon_in, lat_in, area_in);
  get_grid_area(nlon_out, nlat_out, lon_out, lat_out, area_out);

  for(j1=0; j1<ny1; j1++) for(i1=0; i1<nx1; i1++) if( mask_in[j1*nx1+i1] > (0.5) ) {
    n0 = j1*nx1p+i1; n1 = j1*nx1p+i1+1;
    n2 = (j1+1)*nx1p+i1+1; n3 = (j1+1)*nx1p+i1;
    x1_in[0] = lon_in[n0]; y1_in[0] = lat_in[n0];
    x1_in[1] = lon_in[n1]; y1_in[1] = lat_in[n1];
    x1_in[2] = lon_in[n2]; y1_in[2] = lat_in[n2];
    x1_in[3] = lon_in[n3]; y1_in[3] = lat_in[n3];
    lat_in_min = minval_double(4, y1_in);
    lat_in_max = maxval_double(4, y1_in);
    n1_in = fix_lon(x1_in, y1_in, 4, 3.14159265358979323846);
    lon_in_min = minval_double(n1_in, x1_in);
    lon_in_max = maxval_double(n1_in, x1_in);
    lon_in_avg = avgval_double(n1_in, x1_in);

    for(j2=0; j2<ny2; j2++) for(i2=0; i2<nx2; i2++) {
      int n_in, n_out;
      double xarea;
      n0 = j2*nx2p+i2; n1 = j2*nx2p+i2+1;
      n2 = (j2+1)*nx2p+i2+1; n3 = (j2+1)*nx2p+i2;
      x2_in[0] = lon_out[n0]; y2_in[0] = lat_out[n0];
      x2_in[1] = lon_out[n1]; y2_in[1] = lat_out[n1];
      x2_in[2] = lon_out[n2]; y2_in[2] = lat_out[n2];
      x2_in[3] = lon_out[n3]; y2_in[3] = lat_out[n3];

      lat_out_min = minval_double(4, y2_in);
      lat_out_max = maxval_double(4, y2_in);
      if(lat_out_min >= lat_in_max || lat_out_max <= lat_in_min ) continue;
      n2_in = fix_lon(x2_in, y2_in, 4, lon_in_avg);
      lon_out_min = minval_double(n2_in, x2_in);
      lon_out_max = maxval_double(n2_in, x2_in);




      if(lon_out_min >= lon_in_max || lon_out_max <= lon_in_min ) continue;

      if ( (n_out = clip_2dx2d( x1_in, y1_in, n1_in, x2_in, y2_in, n2_in, x_out, y_out )) > 0) {
 xarea = poly_area (x_out, y_out, n_out ) * mask_in[j1*nx1+i1];
 min_area = (area_in[j1*nx1+i1]<area_out[j2*nx2+i2] ? area_in[j1*nx1+i1]:area_out[j2*nx2+i2]);
 if( xarea/min_area > (1.e-6) ) {
   xgrid_area[nxgrid] = xarea;
   xgrid_clon[nxgrid] = poly_ctrlon(x_out, y_out, n_out, lon_in_avg);
   xgrid_clat[nxgrid] = poly_ctrlat (x_out, y_out, n_out );
   i_in[nxgrid] = i1;
   j_in[nxgrid] = j1;
   i_out[nxgrid] = i2;
   j_out[nxgrid] = j2;
   ++nxgrid;
   if(nxgrid > 1e7) error_handler("nxgrid is greater than MAXXGRID, increase MAXXGRID");
 }
      }
    }
  }

  free(area_in);
  free(area_out);

  return nxgrid;

};





int clip(const double lon_in[], const double lat_in[], int n_in, double ll_lon, double ll_lat,
  double ur_lon, double ur_lat, double lon_out[], double lat_out[])
{
  double x_tmp[50], y_tmp[50], x_last, y_last;
  int i_in, i_out, n_out, inside_last, inside;


  x_last = lon_in[n_in-1];
  y_last = lat_in[n_in-1];
  inside_last = (x_last >= ll_lon);
  for (i_in=0,i_out=0;i_in<n_in;i_in++) {


    if ((inside=(lon_in[i_in] >= ll_lon))!=inside_last) {
      x_tmp[i_out] = ll_lon;
      y_tmp[i_out++] = y_last + (ll_lon - x_last) * (lat_in[i_in] - y_last) / (lon_in[i_in] - x_last);
    }


    if (inside) {
      x_tmp[i_out] = lon_in[i_in];
      y_tmp[i_out++] = lat_in[i_in];
    }
    x_last = lon_in[i_in];
    y_last = lat_in[i_in];
    inside_last = inside;
  }
  if (!(n_out=i_out)) return(0);


  x_last = x_tmp[n_out-1];
  y_last = y_tmp[n_out-1];
  inside_last = (x_last <= ur_lon);
  for (i_in=0,i_out=0;i_in<n_out;i_in++) {


    if ((inside=(x_tmp[i_in] <= ur_lon))!=inside_last) {
      lon_out[i_out] = ur_lon;
      lat_out[i_out++] = y_last + (ur_lon - x_last) * (y_tmp[i_in] - y_last)
                                                 / (x_tmp[i_in] - x_last);
    }


    if (inside) {
      lon_out[i_out] = x_tmp[i_in];
      lat_out[i_out++] = y_tmp[i_in];
    }

    x_last = x_tmp[i_in];
    y_last = y_tmp[i_in];
    inside_last = inside;
  }
  if (!(n_out=i_out)) return(0);


  x_last = lon_out[n_out-1];
  y_last = lat_out[n_out-1];
  inside_last = (y_last >= ll_lat);
  for (i_in=0,i_out=0;i_in<n_out;i_in++) {


    if ((inside=(lat_out[i_in] >= ll_lat))!=inside_last) {
      y_tmp[i_out] = ll_lat;
      x_tmp[i_out++] = x_last + (ll_lat - y_last) * (lon_out[i_in] - x_last) / (lat_out[i_in] - y_last);
    }


    if (inside) {
      x_tmp[i_out] = lon_out[i_in];
      y_tmp[i_out++] = lat_out[i_in];
    }
    x_last = lon_out[i_in];
    y_last = lat_out[i_in];
    inside_last = inside;
  }
  if (!(n_out=i_out)) return(0);


  x_last = x_tmp[n_out-1];
  y_last = y_tmp[n_out-1];
  inside_last = (y_last <= ur_lat);
  for (i_in=0,i_out=0;i_in<n_out;i_in++) {


    if ((inside=(y_tmp[i_in] <= ur_lat))!=inside_last) {
      lat_out[i_out] = ur_lat;
      lon_out[i_out++] = x_last + (ur_lat - y_last) * (x_tmp[i_in] - x_last) / (y_tmp[i_in] - y_last);
    }


    if (inside) {
      lon_out[i_out] = x_tmp[i_in];
      lat_out[i_out++] = y_tmp[i_in];
    }
    x_last = x_tmp[i_in];
    y_last = y_tmp[i_in];
    inside_last = inside;
  }
  return(i_out);
};







int clip_2dx2d(const double lon1_in[], const double lat1_in[], int n1_in,
  const double lon2_in[], const double lat2_in[], int n2_in,
  double lon_out[], double lat_out[])
{
  double lon_tmp[50], lat_tmp[50];
  double x1_0, y1_0, x1_1, y1_1, x2_0, y2_0, x2_1, y2_1;
  double dx1, dy1, dx2, dy2, determ, ds1, ds2;
  int i_out, n_out, inside_last, inside, i1, i2;



  n_out = n1_in;
  for(i1=0; i1<n1_in; i1++) {
    lon_tmp[i1] = lon1_in[i1];
    lat_tmp[i1] = lat1_in[i1];
  }
  x2_0 = lon2_in[n2_in-1];
  y2_0 = lat2_in[n2_in-1];
  for(i2=0; i2<n2_in; i2++) {
    x2_1 = lon2_in[i2];
    y2_1 = lat2_in[i2];
    x1_0 = lon_tmp[n_out-1];
    y1_0 = lat_tmp[n_out-1];
    inside_last = inside_edge( x2_0, y2_0, x2_1, y2_1, x1_0, y1_0);
    for(i1=0, i_out=0; i1<n_out; i1++) {
      x1_1 = lon_tmp[i1];
      y1_1 = lat_tmp[i1];
      if((inside = inside_edge(x2_0, y2_0, x2_1, y2_1, x1_1, y1_1)) != inside_last ) {



 dy1 = y1_1-y1_0;
 dy2 = y2_1-y2_0;
 dx1 = x1_1-x1_0;
 dx2 = x2_1-x2_0;
 ds1 = y1_0*x1_1 - y1_1*x1_0;
 ds2 = y2_0*x2_1 - y2_1*x2_0;
 determ = dy2*dx1 - dy1*dx2;
        if(fabs(determ) < (1.0e-30)) {
   error_handler("the line between <x1_0,y1_0> and  <x1_1,y1_1> should not parallel to "
         "the line between <x2_0,y2_0> and  <x2_1,y2_1>");
 }
 lon_out[i_out] = (dx2*ds1 - dx1*ds2)/determ;
 lat_out[i_out++] = (dy2*ds1 - dy1*ds2)/determ;


      }
      if(inside) {
 lon_out[i_out] = x1_1;
 lat_out[i_out++] = y1_1;
      }
      x1_0 = x1_1;
      y1_0 = y1_1;
      inside_last = inside;
    }
    if(!(n_out=i_out)) return 0;
    for(i1=0; i1<n_out; i1++) {
      lon_tmp[i1] = lon_out[i1];
      lat_tmp[i1] = lat_out[i1];
    }

    x2_0 = x2_1;
    y2_0 = y2_1;
  }
  return(n_out);
};







double poly_ctrlat(const double x[], const double y[], int n)
{
  double ctrlat = 0.0;
  int i;

  for (i=0;i<n;i++) {
    int ip = (i+1) % n;
    double dx = (x[ip]-x[i]);
    double dy, avg_y, hdy;
    double lat1, lat2;
    lat1 = y[ip];
    lat2 = y[i];
    dy = lat2 - lat1;
    hdy = dy*0.5;
    avg_y = (lat1+lat2)*0.5;
    if (dx==0.0) continue;
    if(dx > 3.14159265358979323846) dx = dx - 2.0*3.14159265358979323846;
    if(dx < -3.14159265358979323846) dx = dx + 2.0*3.14159265358979323846;

    if ( fabs(hdy)< ( 1.e-10 ) )
      ctrlat -= dx*(2*cos(avg_y) + lat2*sin(avg_y) - cos(lat1) );
    else
      ctrlat -= dx*( (sin(hdy)/hdy)*(2*cos(avg_y) + lat2*sin(avg_y)) - cos(lat1) );
  }
  return (ctrlat*(6371000.)*(6371000.));
};





double poly_ctrlon(const double x[], const double y[], int n, double clon)
{
  double ctrlon = 0.0;
  int i;

  clon = clon;
  for (i=0;i<n;i++) {
    int ip = (i+1) % n;
    double phi1, phi2, dphi, lat1, lat2, dphi1, dphi2;
    double f1, f2, fac, fint;
    phi1 = x[ip];
    phi2 = x[i];
    lat1 = y[ip];
    lat2 = y[i];
    dphi = phi1 - phi2;

    if (dphi==0.0) continue;

    f1 = 0.5*(cos(lat1)*sin(lat1)+lat1);
    f2 = 0.5*(cos(lat2)*sin(lat2)+lat2);



    if(dphi > 3.14159265358979323846) dphi = dphi - 2.0*3.14159265358979323846;
    if(dphi < -3.14159265358979323846) dphi = dphi + 2.0*3.14159265358979323846;
    dphi1 = phi1 - clon;
    if( dphi1 > 3.14159265358979323846) dphi1 -= 2.0*3.14159265358979323846;
    if( dphi1 <-3.14159265358979323846) dphi1 += 2.0*3.14159265358979323846;
    dphi2 = phi2 -clon;
    if( dphi2 > 3.14159265358979323846) dphi2 -= 2.0*3.14159265358979323846;
    if( dphi2 <-3.14159265358979323846) dphi2 += 2.0*3.14159265358979323846;

    if(abs(dphi2 -dphi1) < 3.14159265358979323846) {
      ctrlon -= dphi * (dphi1*f1+dphi2*f2)/2.0;
    }
    else {
      if(dphi1 > 0.0)
 fac = 3.14159265358979323846;
      else
 fac = -3.14159265358979323846;
      fint = f1 + (f2-f1)*(fac-dphi1)/abs(dphi);
      ctrlon -= 0.5*dphi1*(dphi1-fac)*f1 - 0.5*dphi2*(dphi2+fac)*f2
 + 0.5*fac*(dphi1+dphi2)*fint;
 }

  }
  return (ctrlon*(6371000.)*(6371000.));
};





double box_ctrlat(double ll_lon, double ll_lat, double ur_lon, double ur_lat)
{
  double dphi = ur_lon-ll_lon;
  double ctrlat;

  if(dphi > 3.14159265358979323846) dphi = dphi - 2.0*3.14159265358979323846;
  if(dphi < -3.14159265358979323846) dphi = dphi + 2.0*3.14159265358979323846;
  ctrlat = dphi*(cos(ur_lat) + ur_lat*sin(ur_lat)-(cos(ll_lat) + ll_lat*sin(ll_lat)));
  return (ctrlat*(6371000.)*(6371000.));
};





double box_ctrlon(double ll_lon, double ll_lat, double ur_lon, double ur_lat, double clon)
{
  double phi1, phi2, dphi, lat1, lat2, dphi1, dphi2;
  double f1, f2, fac, fint;
  double ctrlon = 0.0;
  int i;
  clon = clon;
  for( i =0; i<2; i++) {
    if(i == 0) {
      phi1 = ur_lon;
      phi2 = ll_lon;
      lat1 = lat2 = ll_lat;
    }
    else {
      phi1 = ll_lon;
      phi2 = ur_lon;
      lat1 = lat2 = ur_lat;
    }
    dphi = phi1 - phi2;
    f1 = 0.5*(cos(lat1)*sin(lat1)+lat1);
    f2 = 0.5*(cos(lat2)*sin(lat2)+lat2);

    if(dphi > 3.14159265358979323846) dphi = dphi - 2.0*3.14159265358979323846;
    if(dphi < -3.14159265358979323846) dphi = dphi + 2.0*3.14159265358979323846;

    dphi1 = phi1 - clon;
    if( dphi1 > 3.14159265358979323846) dphi1 -= 2.0*3.14159265358979323846;
    if( dphi1 <-3.14159265358979323846) dphi1 += 2.0*3.14159265358979323846;
    dphi2 = phi2 -clon;
    if( dphi2 > 3.14159265358979323846) dphi2 -= 2.0*3.14159265358979323846;
    if( dphi2 <-3.14159265358979323846) dphi2 += 2.0*3.14159265358979323846;

    if(abs(dphi2 -dphi1) < 3.14159265358979323846) {
      ctrlon -= dphi * (dphi1*f1+dphi2*f2)/2.0;
    }
    else {
      if(dphi1 > 0.0)
 fac = 3.14159265358979323846;
      else
 fac = -3.14159265358979323846;
      fint = f1 + (f2-f1)*(fac-dphi1)/abs(dphi);
      ctrlon -= 0.5*dphi1*(dphi1-fac)*f1 - 0.5*dphi2*(dphi2+fac)*f2
 + 0.5*fac*(dphi1+dphi2)*fint;
    }
  }
  return (ctrlon*(6371000.)*(6371000.));
}






double grid_box_radius(const double *x, const double *y, const double *z, int n)
{
  double radius;
  int i, j;

  radius = 0;
  for(i=0; i<n-1; i++) {
    for(j=i+1; j<n; j++) {
      radius = (radius>pow(x[i]-x[j],2.)+pow(y[i]-y[j],2.)+pow(z[i]-z[j],2.) ? radius:pow(x[i]-x[j],2.)+pow(y[i]-y[j],2.)+pow(z[i]-z[j],2.));
    }
  }

  radius = sqrt(radius);

  return (radius);

};







double dist_between_boxes(const double *x1, const double *y1, const double *z1, int n1,
     const double *x2, const double *y2, const double *z2, int n2)
{
  double dist;
  int i, j;

  for(i=0; i<n1; i++) {
    for(j=0; j<n2; j++) {
      dist = (dist>pow(x1[i]-x2[j],2.)+pow(y1[i]-y2[j],2.)+pow(z1[i]-z2[j],2.) ? dist:pow(x1[i]-x2[j],2.)+pow(y1[i]-y2[j],2.)+pow(z1[i]-z2[j],2.));
    }
  }

  dist = sqrt(dist);
  return (dist);

};
# 1125 "/iitm4/cccr/cmip6/Sandeep/Historical_aerosol_run/src/mom4p1/src/shared/mosaic/create_xgrid.c"
 int inside_edge(double x0, double y0, double x1, double y1, double x, double y)
 {
   const double SMALL = 1.e-12;
   double product;

   product = ( x-x0 )*(y1-y0) + (x0-x1)*(y-y0);
   return (product<=SMALL) ? 1:0;

 };
