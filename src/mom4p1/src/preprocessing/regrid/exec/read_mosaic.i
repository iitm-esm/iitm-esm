# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c"
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/preprocessing/regrid/exec//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c"
# 29 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c"
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

# 30 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2
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

# 31 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2
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

# 32 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 29 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 35 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 95 "/usr/include/string.h" 3 4
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 126 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 28 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 163 "/usr/include/string.h" 2 3 4


extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 210 "/usr/include/string.h" 3 4

# 235 "/usr/include/string.h" 3 4
extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 262 "/usr/include/string.h" 3 4
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 281 "/usr/include/string.h" 3 4



extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 314 "/usr/include/string.h" 3 4
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 342 "/usr/include/string.h" 3 4
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3)));
# 397 "/usr/include/string.h" 3 4


extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (__const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__));

# 427 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__))

                        __attribute__ ((__nonnull__ (2)));
# 445 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 489 "/usr/include/string.h" 3 4
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 517 "/usr/include/string.h" 3 4
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
# 536 "/usr/include/string.h" 3 4
extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 559 "/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__));


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 634 "/usr/include/string.h" 3 4
# 1 "/usr/include/bits/string.h" 1 3 4
# 635 "/usr/include/string.h" 2 3 4


# 1 "/usr/include/bits/string2.h" 1 3 4
# 394 "/usr/include/bits/string2.h" 3 4
extern void *__rawmemchr (const void *__s, int __c);
# 969 "/usr/include/bits/string2.h" 3 4
extern __inline size_t __strcspn_c1 (__const char *__s, int __reject);
extern __inline size_t
__strcspn_c1 (__const char *__s, int __reject)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c2 (__const char *__s, int __reject1,
         int __reject2);
extern __inline size_t
__strcspn_c2 (__const char *__s, int __reject1, int __reject2)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject1
  && __s[__result] != __reject2)
    ++__result;
  return __result;
}

extern __inline size_t __strcspn_c3 (__const char *__s, int __reject1,
         int __reject2, int __reject3);
extern __inline size_t
__strcspn_c3 (__const char *__s, int __reject1, int __reject2,
       int __reject3)
{
  register size_t __result = 0;
  while (__s[__result] != '\0' && __s[__result] != __reject1
  && __s[__result] != __reject2 && __s[__result] != __reject3)
    ++__result;
  return __result;
}
# 1045 "/usr/include/bits/string2.h" 3 4
extern __inline size_t __strspn_c1 (__const char *__s, int __accept);
extern __inline size_t
__strspn_c1 (__const char *__s, int __accept)
{
  register size_t __result = 0;

  while (__s[__result] == __accept)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c2 (__const char *__s, int __accept1,
        int __accept2);
extern __inline size_t
__strspn_c2 (__const char *__s, int __accept1, int __accept2)
{
  register size_t __result = 0;

  while (__s[__result] == __accept1 || __s[__result] == __accept2)
    ++__result;
  return __result;
}

extern __inline size_t __strspn_c3 (__const char *__s, int __accept1,
        int __accept2, int __accept3);
extern __inline size_t
__strspn_c3 (__const char *__s, int __accept1, int __accept2, int __accept3)
{
  register size_t __result = 0;

  while (__s[__result] == __accept1 || __s[__result] == __accept2
  || __s[__result] == __accept3)
    ++__result;
  return __result;
}
# 1121 "/usr/include/bits/string2.h" 3 4
extern __inline char *__strpbrk_c2 (__const char *__s, int __accept1,
         int __accept2);
extern __inline char *
__strpbrk_c2 (__const char *__s, int __accept1, int __accept2)
{

  while (*__s != '\0' && *__s != __accept1 && *__s != __accept2)
    ++__s;
  return *__s == '\0' ? ((void *)0) : (char *) (size_t) __s;
}

extern __inline char *__strpbrk_c3 (__const char *__s, int __accept1,
         int __accept2, int __accept3);
extern __inline char *
__strpbrk_c3 (__const char *__s, int __accept1, int __accept2,
       int __accept3)
{

  while (*__s != '\0' && *__s != __accept1 && *__s != __accept2
  && *__s != __accept3)
    ++__s;
  return *__s == '\0' ? ((void *)0) : (char *) (size_t) __s;
}
# 1172 "/usr/include/bits/string2.h" 3 4
extern __inline char *__strtok_r_1c (char *__s, char __sep, char **__nextp);
extern __inline char *
__strtok_r_1c (char *__s, char __sep, char **__nextp)
{
  char *__result;
  if (__s == ((void *)0))
    __s = *__nextp;
  while (*__s == __sep)
    ++__s;
  __result = ((void *)0);
  if (*__s != '\0')
    {
      __result = __s++;
      while (*__s != '\0')
 if (*__s++ == __sep)
   {
     __s[-1] = '\0';
     break;
   }
    }
  *__nextp = __s;
  return __result;
}
# 1204 "/usr/include/bits/string2.h" 3 4
extern char *__strsep_g (char **__stringp, __const char *__delim);
# 1222 "/usr/include/bits/string2.h" 3 4
extern __inline char *__strsep_1c (char **__s, char __reject);
extern __inline char *
__strsep_1c (char **__s, char __reject)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0) && (*__s = (__extension__ (__builtin_constant_p (__reject) && !__builtin_constant_p (__retval) && (__reject) == '\0' ? (char *) __rawmemchr (__retval, __reject) : __builtin_strchr (__retval, __reject)))) != ((void *)0))
    *(*__s)++ = '\0';
  return __retval;
}

extern __inline char *__strsep_2c (char **__s, char __reject1, char __reject2);
extern __inline char *
__strsep_2c (char **__s, char __reject1, char __reject2)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      register char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}

extern __inline char *__strsep_3c (char **__s, char __reject1, char __reject2,
       char __reject3);
extern __inline char *
__strsep_3c (char **__s, char __reject1, char __reject2, char __reject3)
{
  register char *__retval = *__s;
  if (__retval != ((void *)0))
    {
      register char *__cp = __retval;
      while (1)
 {
   if (*__cp == '\0')
     {
       __cp = ((void *)0);
   break;
     }
   if (*__cp == __reject1 || *__cp == __reject2 || *__cp == __reject3)
     {
       *__cp++ = '\0';
       break;
     }
   ++__cp;
 }
      *__s = __cp;
    }
  return __retval;
}
# 1303 "/usr/include/bits/string2.h" 3 4
extern char *__strdup (__const char *__string) __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));
# 1322 "/usr/include/bits/string2.h" 3 4
extern char *__strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__)) __attribute__ ((__malloc__));
# 638 "/usr/include/string.h" 2 3 4
# 646 "/usr/include/string.h" 3 4

# 33 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.h" 1



int read_mosaic_xgrid_size( const char *xgrid_file );
void read_mosaic_xgrid_order1(const char *xgrid_file, int *i1, int *j1, int *i2, int *j2, double *area );
void read_mosaic_xgrid_order2(const char *xgrid_file, int *i1, int *j1, int *i2, int *j2,
                              double *area, double *di, double *dj );
int read_mosaic_ntiles(const char *mosaic_file);
int read_mosaic_ncontacts(const char *mosaic_file);
void read_mosaic_grid_sizes(const char *mosaic_file, int *nx, int *ny);
void read_mosaic_contact(const char *mosaic_file, int *tile1, int *tile2, int *istart1, int *iend1,
    int *jstart1, int *jend1, int *istart2, int *iend2, int *jstart2, int *jend2);
void read_mosaic_grid_data(const char *mosaic_file, const char *name, int nx, int ny,
                           double *data, int level, int ioff, int joff);
# 34 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/constant.h" 1
# 35 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/mosaic_util.h" 1
# 13 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/mosaic_util.h"
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
# 36 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2

# 1 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h" 1
# 14 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 149 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 15 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h" 2
# 1 "/usr/include/errno.h" 1 3 4
# 32 "/usr/include/errno.h" 3 4




# 1 "/usr/include/bits/errno.h" 1 3 4
# 25 "/usr/include/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4



# 1 "/usr/include/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4



# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 5 "/usr/include/asm-generic/errno.h" 2 3 4
# 1 "/usr/include/asm/errno.h" 2 3 4
# 5 "/usr/include/linux/errno.h" 2 3 4
# 26 "/usr/include/bits/errno.h" 2 3 4
# 47 "/usr/include/bits/errno.h" 3 4
extern int *__errno_location (void) __attribute__ ((__nothrow__)) __attribute__ ((__const__));
# 37 "/usr/include/errno.h" 2 3 4
# 59 "/usr/include/errno.h" 3 4

# 16 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h" 2


typedef int nc_type;
# 416 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern const char *
nc_inq_libvers(void);

 extern const char *
nc_strerror(int ncerr);

 extern int
nc__create(const char *path, int cmode, size_t initialsz,
  size_t *chunksizehintp, int *ncidp);

 extern int
nc_create(const char *path, int cmode, int *ncidp);

 extern int
nc__open(const char *path, int mode,
 size_t *chunksizehintp, int *ncidp);

 extern int
nc_open(const char *path, int mode, int *ncidp);


 extern int
nc_inq_path(int ncid, size_t *pathlen, char *path);







 extern int
nc_var_par_access(int ncid, int varid, int par_access);



 extern int
nc_inq_ncid(int ncid, const char *name, int *grp_ncid);



 extern int
nc_inq_grps(int ncid, int *numgrps, int *ncids);


 extern int
nc_inq_grpname(int ncid, char *name);



 extern int
nc_inq_grpname_full(int ncid, size_t *lenp, char *full_name);


 extern int
nc_inq_grpname_len(int ncid, size_t *lenp);


 extern int
nc_inq_grp_parent(int ncid, int *parent_ncid);


 extern int
nc_inq_grp_ncid(int ncid, const char *grp_name, int *grp_ncid);


 extern int
nc_inq_grp_full_ncid(int ncid, const char *full_name, int *grp_ncid);


 extern int
nc_inq_varids(int ncid, int *nvars, int *varids);



 extern int
nc_inq_dimids(int ncid, int *ndims, int *dimids, int include_parents);



 extern int
nc_inq_typeids(int ncid, int *ntypes, int *typeids);


 extern int
nc_inq_type_equal(int ncid1, nc_type typeid1, int ncid2,
    nc_type typeid2, int *equal);


 extern int
nc_def_grp(int parent_ncid, const char *name, int *new_ncid);




 extern int
nc_def_compound(int ncid, size_t size, const char *name, nc_type *typeidp);


 extern int
nc_insert_compound(int ncid, nc_type xtype, const char *name,
     size_t offset, nc_type field_typeid);


 extern int
nc_insert_array_compound(int ncid, nc_type xtype, const char *name,
    size_t offset, nc_type field_typeid,
    int ndims, const int *dim_sizes);


 extern int
nc_inq_type(int ncid, nc_type xtype, char *name, size_t *size);


 extern int
nc_inq_typeid(int ncid, const char *name, nc_type *typeidp);


 extern int
nc_inq_compound(int ncid, nc_type xtype, char *name, size_t *sizep,
  size_t *nfieldsp);


 extern int
nc_inq_compound_name(int ncid, nc_type xtype, char *name);


 extern int
nc_inq_compound_size(int ncid, nc_type xtype, size_t *sizep);


 extern int
nc_inq_compound_nfields(int ncid, nc_type xtype, size_t *nfieldsp);


 extern int
nc_inq_compound_field(int ncid, nc_type xtype, int fieldid, char *name,
        size_t *offsetp, nc_type *field_typeidp, int *ndimsp,
        int *dim_sizesp);


 extern int
nc_inq_compound_fieldname(int ncid, nc_type xtype, int fieldid,
     char *name);


 extern int
nc_inq_compound_fieldindex(int ncid, nc_type xtype, const char *name,
      int *fieldidp);


 extern int
nc_inq_compound_fieldoffset(int ncid, nc_type xtype, int fieldid,
       size_t *offsetp);


 extern int
nc_inq_compound_fieldtype(int ncid, nc_type xtype, int fieldid,
     nc_type *field_typeidp);



 extern int
nc_inq_compound_fieldndims(int ncid, nc_type xtype, int fieldid,
      int *ndimsp);



 extern int
nc_inq_compound_fielddim_sizes(int ncid, nc_type xtype, int fieldid,
          int *dim_sizes);


typedef struct {
    size_t len;
    void *p;
} nc_vlen_t;
# 600 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern int
nc_def_vlen(int ncid, const char *name, nc_type base_typeid, nc_type *xtypep);


 extern int
nc_inq_vlen(int ncid, nc_type xtype, char *name, size_t *datum_sizep,
     nc_type *base_nc_typep);





 extern int
nc_free_vlen(nc_vlen_t *vl);

 extern int
nc_free_vlens(size_t len, nc_vlen_t vlens[]);


 extern int
nc_put_vlen_element(int ncid, int typeid1, void *vlen_element,
      size_t len, const void *data);

 extern int
nc_get_vlen_element(int ncid, int typeid1, const void *vlen_element,
      size_t *len, void *data);





 extern int
nc_free_string(size_t len, char **data);


 extern int
nc_inq_user_type(int ncid, nc_type xtype, char *name, size_t *size,
   nc_type *base_nc_typep, size_t *nfieldsp, int *classp);


 extern int
nc_put_att(int ncid, int varid, const char *name, nc_type xtype,
    size_t len, const void *op);


 extern int
nc_get_att(int ncid, int varid, const char *name, void *ip);





 extern int
nc_def_enum(int ncid, nc_type base_typeid, const char *name,
     nc_type *typeidp);



 extern int
nc_insert_enum(int ncid, nc_type xtype, const char *name,
        const void *value);



 extern int
nc_inq_enum(int ncid, nc_type xtype, char *name, nc_type *base_nc_typep,
     size_t *base_sizep, size_t *num_membersp);



 extern int
nc_inq_enum_member(int ncid, nc_type xtype, int idx, char *name,
     void *value);



 extern int
nc_inq_enum_ident(int ncid, nc_type xtype, long long value, char *identifier);




 extern int
nc_def_opaque(int ncid, size_t size, const char *name, nc_type *xtypep);


 extern int
nc_inq_opaque(int ncid, nc_type xtype, char *name, size_t *sizep);


 extern int
nc_put_var(int ncid, int varid, const void *op);


 extern int
nc_get_var(int ncid, int varid, void *ip);


 extern int
nc_put_var1(int ncid, int varid, const size_t *indexp,
     const void *op);


 extern int
nc_get_var1(int ncid, int varid, const size_t *indexp, void *ip);


 extern int
nc_put_vara(int ncid, int varid, const size_t *startp,
     const size_t *countp, const void *op);


 extern int
nc_get_vara(int ncid, int varid, const size_t *startp,
     const size_t *countp, void *ip);


 extern int
nc_put_vars(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const void *op);


 extern int
nc_get_vars(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     void *ip);


 extern int
nc_put_varm(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t *imapp, const void *op);


 extern int
nc_get_varm(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t *imapp, void *ip);





 extern int
nc_def_var_deflate(int ncid, int varid, int shuffle, int deflate,
     int deflate_level);


 extern int
nc_inq_var_deflate(int ncid, int varid, int *shufflep,
     int *deflatep, int *deflate_levelp);


 extern int
nc_inq_var_szip(int ncid, int varid, int *options_maskp, int *pixels_per_blockp);



 extern int
nc_def_var_fletcher32(int ncid, int varid, int fletcher32);


 extern int
nc_inq_var_fletcher32(int ncid, int varid, int *fletcher32p);



 extern int
nc_def_var_chunking(int ncid, int varid, int storage, const size_t *chunksizesp);


 extern int
nc_inq_var_chunking(int ncid, int varid, int *storagep, size_t *chunksizesp);



 extern int
nc_def_var_fill(int ncid, int varid, int no_fill, const void *fill_value);


 extern int
nc_inq_var_fill(int ncid, int varid, int *no_fill, void *fill_valuep);


 extern int
nc_def_var_endian(int ncid, int varid, int endian);


 extern int
nc_inq_var_endian(int ncid, int varid, int *endianp);


 extern int
nc_set_fill(int ncid, int fillmode, int *old_modep);



 extern int
nc_set_default_format(int format, int *old_formatp);


 extern int
nc_set_chunk_cache(size_t size, size_t nelems, float preemption);


 extern int
nc_get_chunk_cache(size_t *sizep, size_t *nelemsp, float *preemptionp);


 extern int
nc_set_var_chunk_cache(int ncid, int varid, size_t size, size_t nelems,
         float preemption);


 extern int
nc_get_var_chunk_cache(int ncid, int varid, size_t *sizep, size_t *nelemsp,
         float *preemptionp);

 extern int
nc_redef(int ncid);

 extern int
nc__enddef(int ncid, size_t h_minfree, size_t v_align,
 size_t v_minfree, size_t r_align);

 extern int
nc_enddef(int ncid);

 extern int
nc_sync(int ncid);

 extern int
nc_abort(int ncid);

 extern int
nc_close(int ncid);

 extern int
nc_inq(int ncid, int *ndimsp, int *nvarsp, int *nattsp, int *unlimdimidp);

 extern int
nc_inq_ndims(int ncid, int *ndimsp);

 extern int
nc_inq_nvars(int ncid, int *nvarsp);

 extern int
nc_inq_natts(int ncid, int *nattsp);

 extern int
nc_inq_unlimdim(int ncid, int *unlimdimidp);


 extern int
nc_inq_unlimdims(int ncid, int *nunlimdimsp, int *unlimdimidsp);


 extern int
nc_inq_format(int ncid, int *formatp);



 extern int
nc_def_dim(int ncid, const char *name, size_t len, int *idp);

 extern int
nc_inq_dimid(int ncid, const char *name, int *idp);

 extern int
nc_inq_dim(int ncid, int dimid, char *name, size_t *lenp);

 extern int
nc_inq_dimname(int ncid, int dimid, char *name);

 extern int
nc_inq_dimlen(int ncid, int dimid, size_t *lenp);

 extern int
nc_rename_dim(int ncid, int dimid, const char *name);




 extern int
nc_inq_att(int ncid, int varid, const char *name,
    nc_type *xtypep, size_t *lenp);

 extern int
nc_inq_attid(int ncid, int varid, const char *name, int *idp);

 extern int
nc_inq_atttype(int ncid, int varid, const char *name, nc_type *xtypep);

 extern int
nc_inq_attlen(int ncid, int varid, const char *name, size_t *lenp);

 extern int
nc_inq_attname(int ncid, int varid, int attnum, char *name);

 extern int
nc_copy_att(int ncid_in, int varid_in, const char *name, int ncid_out, int varid_out);

 extern int
nc_rename_att(int ncid, int varid, const char *name, const char *newname);

 extern int
nc_del_att(int ncid, int varid, const char *name);




 extern int
nc_put_att_text(int ncid, int varid, const char *name,
  size_t len, const char *op);

 extern int
nc_get_att_text(int ncid, int varid, const char *name, char *ip);

 extern int
nc_put_att_uchar(int ncid, int varid, const char *name, nc_type xtype,
   size_t len, const unsigned char *op);

 extern int
nc_get_att_uchar(int ncid, int varid, const char *name, unsigned char *ip);

 extern int
nc_put_att_schar(int ncid, int varid, const char *name, nc_type xtype,
   size_t len, const signed char *op);

 extern int
nc_get_att_schar(int ncid, int varid, const char *name, signed char *ip);

 extern int
nc_put_att_short(int ncid, int varid, const char *name, nc_type xtype,
   size_t len, const short *op);

 extern int
nc_get_att_short(int ncid, int varid, const char *name, short *ip);

 extern int
nc_put_att_int(int ncid, int varid, const char *name, nc_type xtype,
        size_t len, const int *op);

 extern int
nc_get_att_int(int ncid, int varid, const char *name, int *ip);

 extern int
nc_put_att_long(int ncid, int varid, const char *name, nc_type xtype,
  size_t len, const long *op);

 extern int
nc_get_att_long(int ncid, int varid, const char *name, long *ip);

 extern int
nc_put_att_float(int ncid, int varid, const char *name, nc_type xtype,
   size_t len, const float *op);

 extern int
nc_get_att_float(int ncid, int varid, const char *name, float *ip);

 extern int
nc_put_att_double(int ncid, int varid, const char *name, nc_type xtype,
    size_t len, const double *op);

 extern int
nc_get_att_double(int ncid, int varid, const char *name, double *ip);

 extern int
nc_put_att_ushort(int ncid, int varid, const char *name, nc_type xtype,
    size_t len, const unsigned short *op);

 extern int
nc_get_att_ushort(int ncid, int varid, const char *name, unsigned short *ip);

 extern int
nc_put_att_uint(int ncid, int varid, const char *name, nc_type xtype,
  size_t len, const unsigned int *op);

 extern int
nc_get_att_uint(int ncid, int varid, const char *name, unsigned int *ip);

 extern int
nc_put_att_longlong(int ncid, int varid, const char *name, nc_type xtype,
   size_t len, const long long *op);

 extern int
nc_get_att_longlong(int ncid, int varid, const char *name, long long *ip);

 extern int
nc_put_att_ulonglong(int ncid, int varid, const char *name, nc_type xtype,
       size_t len, const unsigned long long *op);

 extern int
nc_get_att_ulonglong(int ncid, int varid, const char *name,
       unsigned long long *ip);

 extern int
nc_put_att_string(int ncid, int varid, const char *name,
    size_t len, const char **op);

 extern int
nc_get_att_string(int ncid, int varid, const char *name, char **ip);




 extern int
nc_def_var(int ncid, const char *name, nc_type xtype, int ndims,
    const int *dimidsp, int *varidp);

 extern int
nc_inq_var(int ncid, int varid, char *name, nc_type *xtypep,
    int *ndimsp, int *dimidsp, int *nattsp);

 extern int
nc_inq_varid(int ncid, const char *name, int *varidp);

 extern int
nc_inq_varname(int ncid, int varid, char *name);

 extern int
nc_inq_vartype(int ncid, int varid, nc_type *xtypep);

 extern int
nc_inq_varndims(int ncid, int varid, int *ndimsp);

 extern int
nc_inq_vardimid(int ncid, int varid, int *dimidsp);

 extern int
nc_inq_varnatts(int ncid, int varid, int *nattsp);

 extern int
nc_rename_var(int ncid, int varid, const char *name);

 extern int
nc_copy_var(int ncid_in, int varid, int ncid_out);
# 1047 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern int
nc_put_var1_text(int ncid, int varid, const size_t *indexp, const char *op);

 extern int
nc_get_var1_text(int ncid, int varid, const size_t *indexp, char *ip);

 extern int
nc_put_var1_uchar(int ncid, int varid, const size_t *indexp,
    const unsigned char *op);

 extern int
nc_get_var1_uchar(int ncid, int varid, const size_t *indexp,
    unsigned char *ip);

 extern int
nc_put_var1_schar(int ncid, int varid, const size_t *indexp,
    const signed char *op);

 extern int
nc_get_var1_schar(int ncid, int varid, const size_t *indexp,
    signed char *ip);

 extern int
nc_put_var1_short(int ncid, int varid, const size_t *indexp,
    const short *op);

 extern int
nc_get_var1_short(int ncid, int varid, const size_t *indexp,
    short *ip);

 extern int
nc_put_var1_int(int ncid, int varid, const size_t *indexp, const int *op);

 extern int
nc_get_var1_int(int ncid, int varid, const size_t *indexp, int *ip);

 extern int
nc_put_var1_long(int ncid, int varid, const size_t *indexp, const long *op);

 extern int
nc_get_var1_long(int ncid, int varid, const size_t *indexp, long *ip);

 extern int
nc_put_var1_float(int ncid, int varid, const size_t *indexp, const float *op);

 extern int
nc_get_var1_float(int ncid, int varid, const size_t *indexp, float *ip);

 extern int
nc_put_var1_double(int ncid, int varid, const size_t *indexp, const double *op);

 extern int
nc_get_var1_double(int ncid, int varid, const size_t *indexp, double *ip);

 extern int
nc_put_var1_ushort(int ncid, int varid, const size_t *indexp,
     const unsigned short *op);

 extern int
nc_get_var1_ushort(int ncid, int varid, const size_t *indexp,
     unsigned short *ip);

 extern int
nc_put_var1_uint(int ncid, int varid, const size_t *indexp,
   const unsigned int *op);

 extern int
nc_get_var1_uint(int ncid, int varid, const size_t *indexp,
   unsigned int *ip);

 extern int
nc_put_var1_longlong(int ncid, int varid, const size_t *indexp,
       const long long *op);

 extern int
nc_get_var1_longlong(int ncid, int varid, const size_t *indexp,
    long long *ip);

 extern int
nc_put_var1_ulonglong(int ncid, int varid, const size_t *indexp,
     const unsigned long long *op);

 extern int
nc_get_var1_ulonglong(int ncid, int varid, const size_t *indexp,
     unsigned long long *ip);

 extern int
nc_put_var1_string(int ncid, int varid, const size_t *indexp,
     const char **op);

 extern int
nc_get_var1_string(int ncid, int varid, const size_t *indexp,
     char **ip);




 extern int
nc_put_vara_text(int ncid, int varid, const size_t *startp,
   const size_t *countp, const char *op);

 extern int
nc_get_vara_text(int ncid, int varid, const size_t *startp,
   const size_t *countp, char *ip);

 extern int
nc_put_vara_uchar(int ncid, int varid, const size_t *startp,
    const size_t *countp, const unsigned char *op);

 extern int
nc_get_vara_uchar(int ncid, int varid, const size_t *startp,
    const size_t *countp, unsigned char *ip);

 extern int
nc_put_vara_schar(int ncid, int varid, const size_t *startp,
    const size_t *countp, const signed char *op);

 extern int
nc_get_vara_schar(int ncid, int varid, const size_t *startp,
    const size_t *countp, signed char *ip);

 extern int
nc_put_vara_short(int ncid, int varid, const size_t *startp,
    const size_t *countp, const short *op);

 extern int
nc_get_vara_short(int ncid, int varid, const size_t *startp,
    const size_t *countp, short *ip);

 extern int
nc_put_vara_int(int ncid, int varid, const size_t *startp,
  const size_t *countp, const int *op);

 extern int
nc_get_vara_int(int ncid, int varid, const size_t *startp,
  const size_t *countp, int *ip);

 extern int
nc_put_vara_long(int ncid, int varid, const size_t *startp,
   const size_t *countp, const long *op);

 extern int
nc_get_vara_long(int ncid, int varid,
 const size_t *startp, const size_t *countp, long *ip);

 extern int
nc_put_vara_float(int ncid, int varid,
 const size_t *startp, const size_t *countp, const float *op);

 extern int
nc_get_vara_float(int ncid, int varid,
 const size_t *startp, const size_t *countp, float *ip);

 extern int
nc_put_vara_double(int ncid, int varid, const size_t *startp,
     const size_t *countp, const double *op);

 extern int
nc_get_vara_double(int ncid, int varid, const size_t *startp,
     const size_t *countp, double *ip);

 extern int
nc_put_vara_ushort(int ncid, int varid, const size_t *startp,
     const size_t *countp, const unsigned short *op);

 extern int
nc_get_vara_ushort(int ncid, int varid, const size_t *startp,
     const size_t *countp, unsigned short *ip);

 extern int
nc_put_vara_uint(int ncid, int varid, const size_t *startp,
   const size_t *countp, const unsigned int *op);

 extern int
nc_get_vara_uint(int ncid, int varid, const size_t *startp,
   const size_t *countp, unsigned int *ip);

 extern int
nc_put_vara_longlong(int ncid, int varid, const size_t *startp,
    const size_t *countp, const long long *op);

 extern int
nc_get_vara_longlong(int ncid, int varid, const size_t *startp,
    const size_t *countp, long long *ip);

 extern int
nc_put_vara_ulonglong(int ncid, int varid, const size_t *startp,
     const size_t *countp, const unsigned long long *op);

 extern int
nc_get_vara_ulonglong(int ncid, int varid, const size_t *startp,
     const size_t *countp, unsigned long long *ip);

 extern int
nc_put_vara_string(int ncid, int varid, const size_t *startp,
     const size_t *countp, const char **op);

 extern int
nc_get_vara_string(int ncid, int varid, const size_t *startp,
     const size_t *countp, char **ip);




 extern int
nc_put_vars_text(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const char *op);

 extern int
nc_get_vars_text(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 char *ip);

 extern int
nc_put_vars_uchar(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const unsigned char *op);

 extern int
nc_get_vars_uchar(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 unsigned char *ip);

 extern int
nc_put_vars_schar(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const signed char *op);

 extern int
nc_get_vars_schar(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 signed char *ip);

 extern int
nc_put_vars_short(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const short *op);

 extern int
nc_get_vars_short(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    short *ip);

 extern int
nc_put_vars_int(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const int *op);

 extern int
nc_get_vars_int(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 int *ip);

 extern int
nc_put_vars_long(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const long *op);

 extern int
nc_get_vars_long(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 long *ip);

 extern int
nc_put_vars_float(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const float *op);

 extern int
nc_get_vars_float(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 float *ip);

 extern int
nc_put_vars_double(int ncid, int varid,
 const size_t *startp, const size_t *countp, const ptrdiff_t *stridep,
 const double *op);

 extern int
nc_get_vars_double(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     double *ip);

 extern int
nc_put_vars_ushort(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const unsigned short *op);

 extern int
nc_get_vars_ushort(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     unsigned short *ip);

 extern int
nc_put_vars_uint(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const unsigned int *op);

 extern int
nc_get_vars_uint(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   unsigned int *ip);

 extern int
nc_put_vars_longlong(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const long long *op);

 extern int
nc_get_vars_longlong(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    long long *ip);

 extern int
nc_put_vars_ulonglong(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const unsigned long long *op);

 extern int
nc_get_vars_ulonglong(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     unsigned long long *ip);

 extern int
nc_put_vars_string(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const char **op);

 extern int
nc_get_vars_string(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     char **ip);




 extern int
nc_put_varm_text(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const ptrdiff_t *imapp, const char *op);

 extern int
nc_get_varm_text(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const ptrdiff_t *imapp, char *ip);

 extern int
nc_put_varm_uchar(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, const unsigned char *op);

 extern int
nc_get_varm_uchar(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, unsigned char *ip);

 extern int
nc_put_varm_schar(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, const signed char *op);

 extern int
nc_get_varm_schar(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, signed char *ip);

 extern int
nc_put_varm_short(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, const short *op);

 extern int
nc_get_varm_short(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, short *ip);

 extern int
nc_put_varm_int(int ncid, int varid, const size_t *startp,
  const size_t *countp, const ptrdiff_t *stridep,
  const ptrdiff_t *imapp, const int *op);

 extern int
nc_get_varm_int(int ncid, int varid, const size_t *startp,
  const size_t *countp, const ptrdiff_t *stridep,
  const ptrdiff_t *imapp, int *ip);

 extern int
nc_put_varm_long(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const ptrdiff_t *imapp, const long *op);

 extern int
nc_get_varm_long(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const ptrdiff_t *imapp, long *ip);

 extern int
nc_put_varm_float(int ncid, int varid,const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, const float *op);

 extern int
nc_get_varm_float(int ncid, int varid,const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t *imapp, float *ip);

 extern int
nc_put_varm_double(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t *imapp, const double *op);

 extern int
nc_get_varm_double(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, double *ip);

 extern int
nc_put_varm_ushort(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, const unsigned short *op);

 extern int
nc_get_varm_ushort(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, unsigned short *ip);

 extern int
nc_put_varm_uint(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const ptrdiff_t * imapp, const unsigned int *op);

 extern int
nc_get_varm_uint(int ncid, int varid, const size_t *startp,
   const size_t *countp, const ptrdiff_t *stridep,
   const ptrdiff_t * imapp, unsigned int *ip);

 extern int
nc_put_varm_longlong(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t * imapp, const long long *op);

 extern int
nc_get_varm_longlong(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t * imapp, long long *ip);

 extern int
nc_put_varm_ulonglong(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, const unsigned long long *op);

 extern int
nc_get_varm_ulonglong(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, unsigned long long *ip);

 extern int
nc_put_varm_string(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, const char **op);

 extern int
nc_get_varm_string(int ncid, int varid, const size_t *startp,
     const size_t *countp, const ptrdiff_t *stridep,
     const ptrdiff_t * imapp, char **ip);




 extern int
nc_put_var_text(int ncid, int varid, const char *op);

 extern int
nc_get_var_text(int ncid, int varid, char *ip);

 extern int
nc_put_var_uchar(int ncid, int varid, const unsigned char *op);

 extern int
nc_get_var_uchar(int ncid, int varid, unsigned char *ip);

 extern int
nc_put_var_schar(int ncid, int varid, const signed char *op);

 extern int
nc_get_var_schar(int ncid, int varid, signed char *ip);

 extern int
nc_put_var_short(int ncid, int varid, const short *op);

 extern int
nc_get_var_short(int ncid, int varid, short *ip);

 extern int
nc_put_var_int(int ncid, int varid, const int *op);

 extern int
nc_get_var_int(int ncid, int varid, int *ip);

 extern int
nc_put_var_long(int ncid, int varid, const long *op);

 extern int
nc_get_var_long(int ncid, int varid, long *ip);

 extern int
nc_put_var_float(int ncid, int varid, const float *op);

 extern int
nc_get_var_float(int ncid, int varid, float *ip);

 extern int
nc_put_var_double(int ncid, int varid, const double *op);

 extern int
nc_get_var_double(int ncid, int varid, double *ip);

 extern int
nc_put_var_ushort(int ncid, int varid, const unsigned short *op);

 extern int
nc_get_var_ushort(int ncid, int varid, unsigned short *ip);

 extern int
nc_put_var_uint(int ncid, int varid, const unsigned int *op);

 extern int
nc_get_var_uint(int ncid, int varid, unsigned int *ip);

 extern int
nc_put_var_longlong(int ncid, int varid, const long long *op);

 extern int
nc_get_var_longlong(int ncid, int varid, long long *ip);

 extern int
nc_put_var_ulonglong(int ncid, int varid, const unsigned long long *op);

 extern int
nc_get_var_ulonglong(int ncid, int varid, unsigned long long *ip);

 extern int
nc_put_var_string(int ncid, int varid, const char **op);

 extern int
nc_get_var_string(int ncid, int varid, char **ip);


 extern int
nc_put_att_ubyte(int ncid, int varid, const char *name, nc_type xtype,
   size_t len, const unsigned char *op);
 extern int
nc_get_att_ubyte(int ncid, int varid, const char *name,
   unsigned char *ip);
 extern int
nc_put_var1_ubyte(int ncid, int varid, const size_t *indexp,
    const unsigned char *op);
 extern int
nc_get_var1_ubyte(int ncid, int varid, const size_t *indexp,
    unsigned char *ip);
 extern int
nc_put_vara_ubyte(int ncid, int varid, const size_t *startp,
    const size_t *countp, const unsigned char *op);
 extern int
nc_get_vara_ubyte(int ncid, int varid, const size_t *startp,
    const size_t *countp, unsigned char *ip);
 extern int
nc_put_vars_ubyte(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const unsigned char *op);
 extern int
nc_get_vars_ubyte(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    unsigned char *ip);
 extern int
nc_put_varm_ubyte(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t * imapp, const unsigned char *op);
 extern int
nc_get_varm_ubyte(int ncid, int varid, const size_t *startp,
    const size_t *countp, const ptrdiff_t *stridep,
    const ptrdiff_t * imapp, unsigned char *ip);
 extern int
nc_put_var_ubyte(int ncid, int varid, const unsigned char *op);
 extern int
nc_get_var_ubyte(int ncid, int varid, unsigned char *ip);
# 1654 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern int
nc_show_metadata(int ncid);
# 1674 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern int
nc__create_mp(const char *path, int cmode, size_t initialsz, int basepe,
  size_t *chunksizehintp, int *ncidp);

 extern int
nc__open_mp(const char *path, int mode, int basepe,
 size_t *chunksizehintp, int *ncidp);

 extern int
nc_delete(const char *path);

 extern int
nc_delete_mp(const char *path, int basepe);

 extern int
nc_set_base_pe(int ncid, int pe);

 extern int
nc_inq_base_pe(int ncid, int *pe);




 extern int
nctypelen(nc_type datatype);
# 1727 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern int ncerr;
# 1740 "/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.2.1/include/netcdf.h"
 extern int ncopts;

 extern void
nc_advise(const char *cdf_routine_name, int err, const char *fmt,...);







typedef int nclong;

 extern int
nccreate(const char* path, int cmode);

 extern int
ncopen(const char* path, int mode);

 extern int
ncsetfill(int ncid, int fillmode);

 extern int
ncredef(int ncid);

 extern int
ncendef(int ncid);

 extern int
ncsync(int ncid);

 extern int
ncabort(int ncid);

 extern int
ncclose(int ncid);

 extern int
ncinquire(int ncid, int *ndimsp, int *nvarsp, int *nattsp, int *unlimdimp);

 extern int
ncdimdef(int ncid, const char *name, long len);

 extern int
ncdimid(int ncid, const char *name);

 extern int
ncdiminq(int ncid, int dimid, char *name, long *lenp);

 extern int
ncdimrename(int ncid, int dimid, const char *name);

 extern int
ncattput(int ncid, int varid, const char *name, nc_type xtype,
 int len, const void *op);

 extern int
ncattinq(int ncid, int varid, const char *name, nc_type *xtypep, int *lenp);

 extern int
ncattget(int ncid, int varid, const char *name, void *ip);

 extern int
ncattcopy(int ncid_in, int varid_in, const char *name, int ncid_out,
 int varid_out);

 extern int
ncattname(int ncid, int varid, int attnum, char *name);

 extern int
ncattrename(int ncid, int varid, const char *name, const char *newname);

 extern int
ncattdel(int ncid, int varid, const char *name);

 extern int
ncvardef(int ncid, const char *name, nc_type xtype,
 int ndims, const int *dimidsp);

 extern int
ncvarid(int ncid, const char *name);

 extern int
ncvarinq(int ncid, int varid, char *name, nc_type *xtypep,
 int *ndimsp, int *dimidsp, int *nattsp);

 extern int
ncvarput1(int ncid, int varid, const long *indexp, const void *op);

 extern int
ncvarget1(int ncid, int varid, const long *indexp, void *ip);

 extern int
ncvarput(int ncid, int varid, const long *startp, const long *countp,
 const void *op);

 extern int
ncvarget(int ncid, int varid, const long *startp, const long *countp,
 void *ip);

 extern int
ncvarputs(int ncid, int varid, const long *startp, const long *countp,
 const long *stridep, const void *op);

 extern int
ncvargets(int ncid, int varid, const long *startp, const long *countp,
 const long *stridep, void *ip);

 extern int
ncvarputg(int ncid, int varid, const long *startp, const long *countp,
 const long *stridep, const long *imapp, const void *op);

 extern int
ncvargetg(int ncid, int varid, const long *startp, const long *countp,
 const long *stridep, const long *imapp, void *ip);

 extern int
ncvarrename(int ncid, int varid, const char *name);

 extern int
ncrecinq(int ncid, int *nrecvarsp, int *recvaridsp, long *recsizesp);

 extern int
ncrecget(int ncid, long recnum, void **datap);

 extern int
ncrecput(int ncid, long recnum, void *const *datap);
# 38 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c" 2






void handle_netcdf_error(const char *msg, int status )
{
  char errmsg[512];

  sprintf( errmsg, "%s: %s", msg, nc_strerror(status) );
  error_handler(errmsg);

};






void get_file_dir(const char *file, char *dir)
{
  int len;
  char *strptr = ((void *)0);



  strptr = strrchr(file, '/');
  if(strptr) {
    len = strptr - file;
    __builtin_strncpy (dir, file, len);
  }
  else {
    len = 1;
    strcpy(dir, ".");
  }
  dir[len] = 0;

};


int field_exist(const char* file, const char *name)
{
  int ncid, varid, status, existed;
  char msg[512];

  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "field_exist: in opening file %s", file);
    handle_netcdf_error(msg, status);
  }
  status = nc_inq_varid(ncid, name, &varid);
  if(status == 0)
    existed = 1;
  else
    existed = 0;

  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "field_exist: in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }

  return existed;




  return 0;
};

int get_dimlen(const char* file, const char *name)
{
  int ncid, dimid, status, len;
  size_t size;
  char msg[512];

  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "in opening file %s", file);
    handle_netcdf_error(msg, status);
  }

  status = nc_inq_dimid(ncid, name, &dimid);
  if(status != 0) {
    sprintf(msg, "in getting dimid of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }

  status = nc_inq_dimlen(ncid, dimid, &size);
  if(status != 0) {
    sprintf(msg, "in getting dimension size of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }

  len = size;
  if(status != 0) {
    sprintf(msg, "in closing file %s", file);
    handle_netcdf_error(msg, status);
  }




  return len;

};





void get_string_data(const char *file, const char *name, char *data)
{
  int ncid, varid, status;
  char msg[512];

  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "in opening file %s", file);
    handle_netcdf_error(msg, status);
  }
  status = nc_inq_varid(ncid, name, &varid);
  if(status != 0) {
    sprintf(msg, "in getting varid of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_get_var_text(ncid, varid, data);
  if(status != 0) {
    sprintf(msg, "in getting data of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }




};





void get_string_data_level(const char *file, const char *name, char *data, const int *level)
{
  int ncid, varid, status, i;
  size_t start[4], nread[4];
  char msg[512];

  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "in opening file %s", file);
    handle_netcdf_error(msg, status);
  }
  status = nc_inq_varid(ncid, name, &varid);
  if(status != 0) {
    sprintf(msg, "in getting varid of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  for(i=0; i<4; i++) {
    start[i] = 0; nread[i] = 1;
  }
  start[0] = *level; nread[1] = 255;
  status = nc_get_vara_text(ncid, varid, start, nread, data);
  if(status != 0) {
    sprintf(msg, "in getting data of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }




};






void get_int_data(const char *file, const char *name, int *data)
{
  int ncid, varid, status;
  char msg[512];

  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "in opening file %s", file);
    handle_netcdf_error(msg, status);
  }
  status = nc_inq_varid(ncid, name, &varid);
  if(status != 0) {
    sprintf(msg, "in getting varid of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_get_var_int(ncid, varid, data);
  if(status != 0) {
    sprintf(msg, "in getting data of %s from file %s", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }




};





void get_double_data(const char *file, const char *name, double *data)
{

  int ncid, varid, status;
  char msg[512];

  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "in opening file %s", file);
    handle_netcdf_error(msg, status);
  }
  status = nc_inq_varid(ncid, name, &varid);
  if(status != 0) {
    sprintf(msg, "in getting varid of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_get_var_double(ncid, varid, data);
  if(status != 0) {
    sprintf(msg, "in getting data of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }




};





void get_var_text_att(const char *file, const char *name, const char *attname, char *att)
{
  int ncid, varid, status;
  char msg[512];


  status = nc_open(file, 0x0000, &ncid);
  if(status != 0) {
    sprintf(msg, "in opening file %s", file);
    handle_netcdf_error(msg, status);
  }
  status = nc_inq_varid(ncid, name, &varid);
  if(status != 0) {
    sprintf(msg, "in getting varid of %s from file %s.", name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_get_att_text(ncid, varid, attname, att);
  if(status != 0) {
    sprintf(msg, "in getting attribute %s of %s from file %s.", attname, name, file);
    handle_netcdf_error(msg, status);
  }
  status = nc_close(ncid);
  if(status != 0) {
    sprintf(msg, "in closing file %s.", file);
    handle_netcdf_error(msg, status);
  }




};





int read_mosaic_xgrid_size_( const char *xgrid_file )
{
  return read_mosaic_xgrid_size(xgrid_file);
}


int read_mosaic_xgrid_size( const char *xgrid_file )
{
  int ncells;

  ncells = get_dimlen(xgrid_file, "ncells");
  return ncells;
}





void read_mosaic_xgrid_order1_(const char *xgrid_file, int *i1, int *j1, int *i2, int *j2, double *area )
{
  read_mosaic_xgrid_order1(xgrid_file, i1, j1, i2, j2, area);

};


void read_mosaic_xgrid_order1(const char *xgrid_file, int *i1, int *j1, int *i2, int *j2, double *area )
{
  int ncells, n;
  int *tile1_cell, *tile2_cell;
  double garea;

  ncells = get_dimlen(xgrid_file, "ncells");

  tile1_cell = (int *)malloc(ncells*2*sizeof(int));
  tile2_cell = (int *)malloc(ncells*2*sizeof(int));
  get_int_data(xgrid_file, "tile1_cell", tile1_cell);
  get_int_data(xgrid_file, "tile2_cell", tile2_cell);
  get_double_data(xgrid_file, "xgrid_area", area);
  garea = 4*3.14159265358979323846*(6371000.)*(6371000.);

  for(n=0; n<ncells; n++) {
    i1[n] = tile1_cell[n*2] - 1;
    j1[n] = tile1_cell[n*2+1] - 1;
    i2[n] = tile2_cell[n*2] - 1;
    j2[n] = tile2_cell[n*2+1] - 1;
    area[n] /= garea;
  }

  free(tile1_cell);
  free(tile2_cell);

};




void read_mosaic_xgrid_order2_(const char *xgrid_file, int *i1, int *j1, int *i2, int *j2, double *area, double *di, double *dj )
{
  read_mosaic_xgrid_order2(xgrid_file, i1, j1, i2, j2, area, di, dj);

};


void read_mosaic_xgrid_order2(const char *xgrid_file, int *i1, int *j1, int *i2, int *j2, double *area, double *di, double *dj )
{
  int ncells, n;
  int *tile1_cell, *tile2_cell;
  double *tile1_distance;
  double garea;

  ncells = get_dimlen(xgrid_file, "ncells");

  tile1_cell = (int *)malloc(ncells*2*sizeof(int ));
  tile2_cell = (int *)malloc(ncells*2*sizeof(int ));
  tile1_distance = (double *)malloc(ncells*2*sizeof(double));
  get_int_data(xgrid_file, "tile1_cell", tile1_cell);
  get_int_data(xgrid_file, "tile2_cell", tile2_cell);
  get_double_data(xgrid_file, "xgrid_area", area);
  get_double_data(xgrid_file, "tile1_distance", tile1_distance);
  garea = 4*3.14159265358979323846*(6371000.)*(6371000.);

  for(n=0; n<ncells; n++) {
    i1[n] = tile1_cell[n*2] - 1;
    j1[n] = tile1_cell[n*2+1] - 1;
    i2[n] = tile2_cell[n*2] - 1;
    j2[n] = tile2_cell[n*2+1] - 1;
    di[n] = tile1_distance[n*2];
    dj[n] = tile1_distance[n*2+1];
    area[n] /= garea;
  }

  free(tile1_cell);
  free(tile2_cell);
  free(tile1_distance);

};






int read_mosaic_ntiles_(const char *mosaic_file)
{
  return read_mosaic_ntiles(mosaic_file);
}

int read_mosaic_ntiles(const char *mosaic_file)
{

  int ntiles;

  ntiles = get_dimlen(mosaic_file, "ntiles");

  return ntiles;

};






int read_mosaic_ncontacts_(const char *mosaic_file)
{
  return read_mosaic_ncontacts(mosaic_file);
}

int read_mosaic_ncontacts(const char *mosaic_file)
{

  int ncontacts;

  if(field_exist(mosaic_file, "contacts") )
    ncontacts = get_dimlen(mosaic_file, "ncontact");
  else
    ncontacts = 0;

  return ncontacts;

};
# 487 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c"
void read_mosaic_grid_sizes_(const char *mosaic_file, int *nx, int *ny)
{
  read_mosaic_grid_sizes(mosaic_file, nx, ny);
}

void read_mosaic_grid_sizes(const char *mosaic_file, int *nx, int *ny)
{
  int ntiles, n;
  char gridfile[255], tilefile[2*255];
  char dir[255];
  const int x_refine = 2, y_refine = 2;

  get_file_dir(mosaic_file, dir);
  ntiles = get_dimlen(mosaic_file, "ntiles");
  for(n = 0; n < ntiles; n++) {
    get_string_data_level(mosaic_file, "gridfiles", gridfile, &n);
    sprintf(tilefile, "%s/%s", dir, gridfile);
    nx[n] = get_dimlen(tilefile, "nx");
    ny[n] = get_dimlen(tilefile, "ny");
    if(nx[n]%x_refine != 0) error_handler("Error from read_mosaic_grid_sizes: nx is not divided by x_refine");
    if(ny[n]%y_refine != 0) error_handler("Error from read_mosaic_grid_sizes: ny is not divided by y_refine");
    nx[n] /= x_refine;
    ny[n] /= y_refine;
  }

};







void read_mosaic_contact_(const char *mosaic_file, int *tile1, int *tile2, int *istart1, int *iend1,
    int *jstart1, int *jend1, int *istart2, int *iend2, int *jstart2, int *jend2)
{
  read_mosaic_contact(mosaic_file, tile1, tile2, istart1, iend1, jstart1, jend1, istart2, iend2, jstart2, jend2);
}


void read_mosaic_contact(const char *mosaic_file, int *tile1, int *tile2, int *istart1, int *iend1,
    int *jstart1, int *jend1, int *istart2, int *iend2, int *jstart2, int *jend2)
{
  char contacts[255];
  char **gridtiles;

  char pstring[40][255];
  int ntiles, ncontacts, n, m, l, nstr, found;
  const int x_refine = 2, y_refine = 2;

  ntiles = get_dimlen(mosaic_file, "ntiles");
  gridtiles = (char **)malloc(ntiles*sizeof(char *));
  for(n=0; n<ntiles; n++) {
    gridtiles[n] = (char *)malloc(255*sizeof(char));
    get_string_data_level(mosaic_file, "gridtiles", gridtiles[n], &n);
  }

  ncontacts = get_dimlen(mosaic_file, "ncontact");
  for(n = 0; n < ncontacts; n++) {
    get_string_data_level(mosaic_file, "contacts", contacts, &n);

    tokenize( contacts, ":", 255, 40, pstring, &nstr);
    if(nstr != 4) error_handler("Error from read_mosaic: number of elements "
     "in contact seperated by :/:: should be 4");
    found = 0;
    for(m=0; m<ntiles; m++) {
      if(__extension__ ({ size_t __s1_len, __s2_len; (__builtin_constant_p (gridtiles[m]) && __builtin_constant_p (pstring[1]) && (__s1_len = strlen (gridtiles[m]), __s2_len = strlen (pstring[1]), (!((size_t)(const void *)((gridtiles[m]) + 1) - (size_t)(const void *)(gridtiles[m]) == 1) || __s1_len >= 4) && (!((size_t)(const void *)((pstring[1]) + 1) - (size_t)(const void *)(pstring[1]) == 1) || __s2_len >= 4)) ? __builtin_strcmp (gridtiles[m], pstring[1]) : (__builtin_constant_p (gridtiles[m]) && ((size_t)(const void *)((gridtiles[m]) + 1) - (size_t)(const void *)(gridtiles[m]) == 1) && (__s1_len = strlen (gridtiles[m]), __s1_len < 4) ? (__builtin_constant_p (pstring[1]) && ((size_t)(const void *)((pstring[1]) + 1) - (size_t)(const void *)(pstring[1]) == 1) ? __builtin_strcmp (gridtiles[m], pstring[1]) : (__extension__ ({ __const unsigned char *__s2 = (__const unsigned char *) (__const char *) (pstring[1]); register int __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[0] - __s2[0]); if (__s1_len > 0 && __result == 0) { __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[1] - __s2[1]); if (__s1_len > 1 && __result == 0) { __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[2] - __s2[2]); if (__s1_len > 2 && __result == 0) __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[3] - __s2[3]); } } __result; }))) : (__builtin_constant_p (pstring[1]) && ((size_t)(const void *)((pstring[1]) + 1) - (size_t)(const void *)(pstring[1]) == 1) && (__s2_len = strlen (pstring[1]), __s2_len < 4) ? (__builtin_constant_p (gridtiles[m]) && ((size_t)(const void *)((gridtiles[m]) + 1) - (size_t)(const void *)(gridtiles[m]) == 1) ? __builtin_strcmp (gridtiles[m], pstring[1]) : (__extension__ ({ __const unsigned char *__s1 = (__const unsigned char *) (__const char *) (gridtiles[m]); register int __result = __s1[0] - ((__const unsigned char *) (__const char *) (pstring[1]))[0]; if (__s2_len > 0 && __result == 0) { __result = (__s1[1] - ((__const unsigned char *) (__const char *) (pstring[1]))[1]); if (__s2_len > 1 && __result == 0) { __result = (__s1[2] - ((__const unsigned char *) (__const char *) (pstring[1]))[2]); if (__s2_len > 2 && __result == 0) __result = (__s1[3] - ((__const unsigned char *) (__const char *) (pstring[1]))[3]); } } __result; }))) : __builtin_strcmp (gridtiles[m], pstring[1])))); }) == 0) {
 found = 1;
 tile1[n] = m+1;
 break;
      }
    }
    if(!found) error_handler("error from read_mosaic: the first tile name specified "
        "in contact is not found in tile list");
    found = 0;
    for(m=0; m<ntiles; m++) {
      if(__extension__ ({ size_t __s1_len, __s2_len; (__builtin_constant_p (gridtiles[m]) && __builtin_constant_p (pstring[3]) && (__s1_len = strlen (gridtiles[m]), __s2_len = strlen (pstring[3]), (!((size_t)(const void *)((gridtiles[m]) + 1) - (size_t)(const void *)(gridtiles[m]) == 1) || __s1_len >= 4) && (!((size_t)(const void *)((pstring[3]) + 1) - (size_t)(const void *)(pstring[3]) == 1) || __s2_len >= 4)) ? __builtin_strcmp (gridtiles[m], pstring[3]) : (__builtin_constant_p (gridtiles[m]) && ((size_t)(const void *)((gridtiles[m]) + 1) - (size_t)(const void *)(gridtiles[m]) == 1) && (__s1_len = strlen (gridtiles[m]), __s1_len < 4) ? (__builtin_constant_p (pstring[3]) && ((size_t)(const void *)((pstring[3]) + 1) - (size_t)(const void *)(pstring[3]) == 1) ? __builtin_strcmp (gridtiles[m], pstring[3]) : (__extension__ ({ __const unsigned char *__s2 = (__const unsigned char *) (__const char *) (pstring[3]); register int __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[0] - __s2[0]); if (__s1_len > 0 && __result == 0) { __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[1] - __s2[1]); if (__s1_len > 1 && __result == 0) { __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[2] - __s2[2]); if (__s1_len > 2 && __result == 0) __result = (((__const unsigned char *) (__const char *) (gridtiles[m]))[3] - __s2[3]); } } __result; }))) : (__builtin_constant_p (pstring[3]) && ((size_t)(const void *)((pstring[3]) + 1) - (size_t)(const void *)(pstring[3]) == 1) && (__s2_len = strlen (pstring[3]), __s2_len < 4) ? (__builtin_constant_p (gridtiles[m]) && ((size_t)(const void *)((gridtiles[m]) + 1) - (size_t)(const void *)(gridtiles[m]) == 1) ? __builtin_strcmp (gridtiles[m], pstring[3]) : (__extension__ ({ __const unsigned char *__s1 = (__const unsigned char *) (__const char *) (gridtiles[m]); register int __result = __s1[0] - ((__const unsigned char *) (__const char *) (pstring[3]))[0]; if (__s2_len > 0 && __result == 0) { __result = (__s1[1] - ((__const unsigned char *) (__const char *) (pstring[3]))[1]); if (__s2_len > 1 && __result == 0) { __result = (__s1[2] - ((__const unsigned char *) (__const char *) (pstring[3]))[2]); if (__s2_len > 2 && __result == 0) __result = (__s1[3] - ((__const unsigned char *) (__const char *) (pstring[3]))[3]); } } __result; }))) : __builtin_strcmp (gridtiles[m], pstring[3])))); }) == 0) {
 found = 1;
 tile2[n] = m+1;
 break;
      }
    }
    if(!found) error_handler("error from read_mosaic: the second tile name specified "
        "in contact is not found in tile list");
    get_string_data_level(mosaic_file, "contact_index", contacts, &n);

    tokenize( contacts, ":,", 255, 40, pstring, &nstr);
    if(nstr != 8) error_handler("Error from read_mosaic: number of elements "
     "in contact_index seperated by :/, should be 8");

    for(m=0; m<nstr; m++) for(l=0; l<strlen(pstring[m]); l++) {
      if(pstring[m][l] > '9' || pstring[m][l] < '0' ) {
 error_handler("Error from read_mosaic: some of the character in "
        "contact_indices except token is not digit number");
      }
    }
    istart1[n] = atoi(pstring[0]);
    iend1[n] = atoi(pstring[1]);
    jstart1[n] = atoi(pstring[2]);
    jend1[n] = atoi(pstring[3]);
    istart2[n] = atoi(pstring[4]);
    iend2[n] = atoi(pstring[5]);
    jstart2[n] = atoi(pstring[6]);
    jend2[n] = atoi(pstring[7]);
    if(istart1[n] == iend1[n] ) {
      istart1[n] = (istart1[n]+1)/x_refine-1;
      iend1[n] = istart1[n];
      if( jend1[n] > jstart1[n] ) {
 jstart1[n] -= 1;
 jend1[n] -= y_refine;
      }
      else if( jend1[n] < jstart1[n] ) {
 jstart1[n] -= y_refine;
 jend1[n] -= 1;
      }
      else
 error_handler("Error from read_mosaic_contact: jstart1 and jend1 should not be equal when istart1=iend1");

      if(jstart1[n]%y_refine || jend1[n]%y_refine)
 error_handler("Error from read_mosaic_contact: mismatch between y_refine and jstart1/jend1 when istart1=iend1");
      jstart1[n] /= y_refine;
      jend1[n] /= y_refine;
    }
    else if( jstart1[n] == jend1[n] ) {
      jstart1[n] = (jstart1[n]+1)/y_refine-1;
      jend1[n] = jstart1[n];
      if(iend1[n] > istart1[n] ) {
 istart1[n] -= 1;
 iend1[n] -= x_refine;
      }
      else if(istart1[n] > iend1[n] ) {
 istart1[n] -= x_refine;
 iend1[n] -= 1;
      }
      else
 error_handler("Error from read_mosaic_contact: istart1 and iend1 should not be equal when jstart1=jend1");

      if(istart1[n]%x_refine || iend1[n]%x_refine)
 error_handler("Error from read_mosaic_contact: mismatch between x_refine and istart1/iend1 when jstart1=jend1");
      istart1[n] /= x_refine;
      iend1[n] /= x_refine;
    }
    else {
      error_handler("Error from read_mosaic_contact: only line contact is supported now, contact developer");
    }
    if(istart2[n] == iend2[n] ) {
      istart2[n] = (istart2[n]+1)/x_refine-1;
      iend2[n] = istart2[n];
      if( jend2[n] > jstart2[n] ) {
 jstart2[n] -= 1;
 jend2[n] -= y_refine;
      }
      else if( jstart2[n] > jend2[n] ) {
 jstart2[n] -= y_refine;
 jend2[n] -= 1;
      }
      else
 error_handler("Error from read_mosaic_contact: jstart2 and jend2 should not be equal when istart2=iend2");

      if(jstart2[n]%y_refine || jend2[n]%y_refine )
 error_handler("Error from read_mosaic_contact: mismatch between y_refine and jstart2/jend2 when istart2=iend2");

      jstart2[n] /= y_refine;
      jend2[n] /= y_refine;
    }
    else if( jstart2[n] == jend2[n] ) {
      jstart2[n] = (jstart2[n]+1)/y_refine-1;
      jend2[n] = jstart2[n];
      if(iend2[n] > istart2[n] ) {
 istart2[n] -= 1;
 iend2[n] -= x_refine;
      }
      else if(istart2[n] > iend2[n] ) {
 istart2[n] -= x_refine;
 iend2[n] -= 1;
      }
      else
 error_handler("Error from read_mosaic_contact: istart2 and iend2 should not be equal when jstart2=jend2");

      if(istart2[n]%x_refine || iend2[n]%x_refine)
 error_handler("Error from read_mosaic_contact: mismatch between x_refine and istart2/iend2 when jstart2=jend2");
      istart2[n] /= x_refine;
      iend2[n] /= x_refine;
    }
    else {
      error_handler("Error from read_mosaic_contact: only line contact is supported now, contact developer");
    }

  }

};
# 689 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mosaic/read_mosaic.c"
void read_mosaic_grid_data(const char *mosaic_file, const char *name, int nx, int ny,
                           double *data, int level, int ioff, int joff)
{
  char tilefile[255], gridfile[255], dir[255];
  double *tmp;
  int ni, nj, nxp, nyp, i, j;

  get_file_dir(mosaic_file, dir);

  get_string_data_level(mosaic_file, "gridfiles", gridfile, &level);
  sprintf(tilefile, "%s/%s", dir, gridfile);

  ni = get_dimlen(tilefile, "nx");
  nj = get_dimlen(tilefile, "ny");

  if( ni != nx*2 || nj != ny*2) error_handler("supergrid size should be double of the model grid size");
  tmp = (double *)malloc((ni+1)*(nj+1)*sizeof(double));
  get_double_data( tilefile, name, tmp);
  nxp = nx + 1 - ioff;
  nyp = ny + 1 - joff;
  for(j=0; j<nyp; j++) for(i=0; i<nxp; i++) data[j*nxp+i] = tmp[(2*j+joff)*(ni+1)+2*i+ioff];
  free(tmp);

};
