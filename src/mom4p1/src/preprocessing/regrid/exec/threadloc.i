# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c"
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/preprocessing/regrid/exec//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c"
# 31 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c"
# 1 "/usr/include/stdio.h" 1 3 4
# 28 "/usr/include/stdio.h" 3 4
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
# 29 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 211 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 35 "/usr/include/stdio.h" 2 3 4

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
# 37 "/usr/include/stdio.h" 2 3 4
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
# 91 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;
# 103 "/usr/include/stdio.h" 3 4
typedef __ssize_t ssize_t;







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

# 32 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c" 2
# 1 "/usr/include/unistd.h" 1 3 4
# 28 "/usr/include/unistd.h" 3 4

# 203 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/bits/posix_opt.h" 1 3 4
# 204 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/bits/environments.h" 1 3 4
# 23 "/usr/include/bits/environments.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/environments.h" 2 3 4
# 208 "/usr/include/unistd.h" 2 3 4
# 227 "/usr/include/unistd.h" 3 4
# 1 "/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include/stddef.h" 1 3 4
# 228 "/usr/include/unistd.h" 2 3 4





typedef __gid_t gid_t;




typedef __uid_t uid_t;
# 256 "/usr/include/unistd.h" 3 4
typedef __useconds_t useconds_t;




typedef __pid_t pid_t;






typedef __intptr_t intptr_t;






typedef __socklen_t socklen_t;
# 288 "/usr/include/unistd.h" 3 4
extern int access (__const char *__name, int __type) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 305 "/usr/include/unistd.h" 3 4
extern int faccessat (int __fd, __const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2))) ;
# 331 "/usr/include/unistd.h" 3 4
extern __off_t lseek (int __fd, __off_t __offset, int __whence) __attribute__ ((__nothrow__));
# 350 "/usr/include/unistd.h" 3 4
extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, __const void *__buf, size_t __n) ;
# 373 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, __const void *__buf, size_t __n,
         __off_t __offset) ;
# 414 "/usr/include/unistd.h" 3 4
extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__)) ;
# 429 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__));
# 441 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);







extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__));






extern int usleep (__useconds_t __useconds);
# 466 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (__const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__)) ;




extern int lchown (__const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, __const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2))) ;



extern int chdir (__const char *__path) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) __attribute__ ((__nothrow__)) ;
# 508 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__)) ;
# 522 "/usr/include/unistd.h" 3 4
extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) __attribute__ ((__nothrow__)) ;


extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__));
# 540 "/usr/include/unistd.h" 3 4
extern char **__environ;







extern int execve (__const char *__path, char *__const __argv[],
     char *__const __envp[]) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));




extern int fexecve (int __fd, char *__const __argv[], char *__const __envp[])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));




extern int execv (__const char *__path, char *__const __argv[])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execle (__const char *__path, __const char *__arg, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execl (__const char *__path, __const char *__arg, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));



extern int execvp (__const char *__file, char *__const __argv[])
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));




extern int execlp (__const char *__file, __const char *__arg, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 595 "/usr/include/unistd.h" 3 4
extern int nice (int __inc) __attribute__ ((__nothrow__)) ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/bits/confname.h" 1 3 4
# 26 "/usr/include/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,


    _CS_V6_ENV,

    _CS_V7_ENV

  };
# 607 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (__const char *__path, int __name)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__));


extern long int sysconf (int __name) __attribute__ ((__nothrow__));



extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__));




extern __pid_t getpid (void) __attribute__ ((__nothrow__));


extern __pid_t getppid (void) __attribute__ ((__nothrow__));




extern __pid_t getpgrp (void) __attribute__ ((__nothrow__));
# 643 "/usr/include/unistd.h" 3 4
extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__));

extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__));






extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__));
# 669 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) __attribute__ ((__nothrow__));
# 686 "/usr/include/unistd.h" 3 4
extern __pid_t setsid (void) __attribute__ ((__nothrow__));



extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__));



extern __uid_t getuid (void) __attribute__ ((__nothrow__));


extern __uid_t geteuid (void) __attribute__ ((__nothrow__));


extern __gid_t getgid (void) __attribute__ ((__nothrow__));


extern __gid_t getegid (void) __attribute__ ((__nothrow__));




extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__)) ;
# 719 "/usr/include/unistd.h" 3 4
extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__));




extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__));




extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__));






extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__));




extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__));




extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__));
# 775 "/usr/include/unistd.h" 3 4
extern __pid_t fork (void) __attribute__ ((__nothrow__));







extern __pid_t vfork (void) __attribute__ ((__nothrow__));





extern char *ttyname (int __fd) __attribute__ ((__nothrow__));



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) __attribute__ ((__nothrow__));





extern int ttyslot (void) __attribute__ ((__nothrow__));




extern int link (__const char *__from, __const char *__to)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, __const char *__from, int __tofd,
     __const char *__to, int __flags)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (__const char *__from, __const char *__to)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (__const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (__const char *__from, int __tofd,
        __const char *__to) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, __const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, __const char *__name, int __flag)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (2)));



extern int rmdir (__const char *__path) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__));


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__));






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (__const char *__name) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 890 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/getopt.h" 1 3 4
# 59 "/usr/include/getopt.h" 3 4
extern char *optarg;
# 73 "/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 152 "/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__));
# 891 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int sethostname (__const char *__name, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) __attribute__ ((__nothrow__)) ;





extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (__const char *__name, size_t __len)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) __attribute__ ((__nothrow__));


extern int revoke (__const char *__file) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int acct (__const char *__name) __attribute__ ((__nothrow__));



extern char *getusershell (void) __attribute__ ((__nothrow__));
extern void endusershell (void) __attribute__ ((__nothrow__));
extern void setusershell (void) __attribute__ ((__nothrow__));





extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__)) ;






extern int chroot (__const char *__path) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (__const char *__prompt) __attribute__ ((__nonnull__ (1)));
# 976 "/usr/include/unistd.h" 3 4
extern int fsync (int __fd);






extern long int gethostid (void);


extern void sync (void) __attribute__ ((__nothrow__));





extern int getpagesize (void) __attribute__ ((__nothrow__)) __attribute__ ((__const__));




extern int getdtablesize (void) __attribute__ ((__nothrow__));
# 1007 "/usr/include/unistd.h" 3 4
extern int truncate (__const char *__file, __off_t __length)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1))) ;
# 1026 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off_t __length) __attribute__ ((__nothrow__)) ;
# 1047 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) __attribute__ ((__nothrow__)) ;





extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__));
# 1068 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__));
# 1091 "/usr/include/unistd.h" 3 4
extern int lockf (int __fd, int __cmd, __off_t __len) ;
# 1122 "/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);
# 1151 "/usr/include/unistd.h" 3 4
extern char *ctermid (char *__s) __attribute__ ((__nothrow__));
# 1160 "/usr/include/unistd.h" 3 4

# 33 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c" 2

# 1 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h" 1
# 83 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int MPI_Datatype;
# 102 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
static const MPI_Datatype mpich_mpi_char = ((MPI_Datatype)0x4c000101);
static const MPI_Datatype mpich_mpi_signed_char = ((MPI_Datatype)0x4c000118);
static const MPI_Datatype mpich_mpi_unsigned_char = ((MPI_Datatype)0x4c000102);

static const MPI_Datatype mpich_mpi_wchar = ((MPI_Datatype)0x4c00040e);
static const MPI_Datatype mpich_mpi_short = ((MPI_Datatype)0x4c000203);
static const MPI_Datatype mpich_mpi_unsigned_short = ((MPI_Datatype)0x4c000204);
static const MPI_Datatype mpich_mpi_int = ((MPI_Datatype)0x4c000405);
static const MPI_Datatype mpich_mpi_unsigned = ((MPI_Datatype)0x4c000406);
static const MPI_Datatype mpich_mpi_long = ((MPI_Datatype)0x4c000807);
static const MPI_Datatype mpich_mpi_unsigned_long = ((MPI_Datatype)0x4c000808);
static const MPI_Datatype mpich_mpi_float = ((MPI_Datatype)0x4c00040a);
static const MPI_Datatype mpich_mpi_double = ((MPI_Datatype)0x4c00080b);
static const MPI_Datatype mpich_mpi_long_double = ((MPI_Datatype)0x4c00100c);
static const MPI_Datatype mpich_mpi_long_long_int = ((MPI_Datatype)0x4c000809);
static const MPI_Datatype mpich_mpi_unsigned_long_long = ((MPI_Datatype)0x4c000819);
# 138 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
struct mpich_struct_mpi_float_int { float f; int i; };
struct mpich_struct_mpi_double_int { double d; int i; };
struct mpich_struct_mpi_long_int { long l; int i; };
struct mpich_struct_mpi_short_int { short s; int i; };
struct mpich_struct_mpi_2int { int i1; int i2; };
struct mpich_struct_mpi_long_double_int { long double ld; int i; };

static const MPI_Datatype mpich_mpi_float_int = ((MPI_Datatype)0x8c000000);
static const MPI_Datatype mpich_mpi_double_int = ((MPI_Datatype)0x8c000001);
static const MPI_Datatype mpich_mpi_long_int = ((MPI_Datatype)0x8c000002);
static const MPI_Datatype mpich_mpi_short_int = ((MPI_Datatype)0x8c000003);
static const MPI_Datatype mpich_mpi_2int = ((MPI_Datatype)0x4c000816);
static const MPI_Datatype mpich_mpi_long_double_int = ((MPI_Datatype)0x8c000004);
# 198 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
static const MPI_Datatype mpich_mpi_int8_t = ((MPI_Datatype)0x4c000137);
static const MPI_Datatype mpich_mpi_int16_t = ((MPI_Datatype)0x4c000238);
static const MPI_Datatype mpich_mpi_int32_t = ((MPI_Datatype)0x4c000439);
static const MPI_Datatype mpich_mpi_int64_t = ((MPI_Datatype)0x4c00083a);
static const MPI_Datatype mpich_mpi_uint8_t = ((MPI_Datatype)0x4c00013b);
static const MPI_Datatype mpich_mpi_uint16_t = ((MPI_Datatype)0x4c00023c);
static const MPI_Datatype mpich_mpi_uint32_t = ((MPI_Datatype)0x4c00043d);
static const MPI_Datatype mpich_mpi_uint64_t = ((MPI_Datatype)0x4c00083e);
# 214 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
static const MPI_Datatype mpich_mpi_c_bool = ((MPI_Datatype)0x4c00013f);
static const MPI_Datatype mpich_mpi_c_float_complex = ((MPI_Datatype)0x4c000840);
static const MPI_Datatype mpich_mpi_c_double_complex = ((MPI_Datatype)0x4c001041);
static const MPI_Datatype mpich_mpi_c_long_double_complex = ((MPI_Datatype)0x4c002042);
# 229 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int MPI_Comm;




typedef int MPI_Group;



typedef int MPI_Win;





typedef int MPI_File;



typedef int MPI_Op;
# 304 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
static const MPI_Datatype mpich_mpi_datatype_null = ((MPI_Datatype)0x0c000000);
# 317 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef enum MPIR_Win_flavor_e {
    MPIX_WIN_FLAVOR_CREATE = 1,
    MPIX_WIN_FLAVOR_ALLOCATE = 2,
    MPIX_WIN_FLAVOR_DYNAMIC = 3,
    MPIX_WIN_FLAVOR_SHARED = 4
} MPIR_Win_flavor_t;


typedef enum MPIR_Win_model_e {
    MPIX_WIN_SEPARATE = 1,
    MPIX_WIN_UNIFIED = 2
} MPIR_Win_model_t;





typedef enum MPIR_Topo_type { MPI_GRAPH=1, MPI_CART=2, MPI_DIST_GRAPH=3 } MPIR_Topo_type;


extern int * const MPI_UNWEIGHTED;
# 353 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef void (MPI_Handler_function) ( MPI_Comm *, int *, ... );
typedef int (MPI_Comm_copy_attr_function)(MPI_Comm, int, void *, void *,
       void *, int *);
typedef int (MPI_Comm_delete_attr_function)(MPI_Comm, int, void *, void *);
typedef int (MPI_Type_copy_attr_function)(MPI_Datatype, int, void *, void *,
       void *, int *);
typedef int (MPI_Type_delete_attr_function)(MPI_Datatype, int, void *, void *);
typedef int (MPI_Win_copy_attr_function)(MPI_Win, int, void *, void *, void *,
      int *);
typedef int (MPI_Win_delete_attr_function)(MPI_Win, int, void *, void *);

typedef void (MPI_Comm_errhandler_function)(MPI_Comm *, int *, ...);
typedef void (MPI_File_errhandler_function)(MPI_File *, int *, ...);
typedef void (MPI_Win_errhandler_function)(MPI_Win *, int *, ...);

typedef MPI_Comm_errhandler_function MPI_Comm_errhandler_fn;
typedef MPI_File_errhandler_function MPI_File_errhandler_fn;
typedef MPI_Win_errhandler_function MPI_Win_errhandler_fn;
# 381 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int MPI_Errhandler;
# 402 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int MPI_Request;


typedef int MPIX_Message;


typedef void (MPI_User_function) ( void *, void *, int *, MPI_Datatype * );


typedef int (MPI_Copy_function) ( MPI_Comm, int, void *, void *, void *, int * );
typedef int (MPI_Delete_function) ( MPI_Comm, int, void *, void * );
# 456 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
enum MPIR_Combiner_enum {
    MPI_COMBINER_NAMED = 1,
    MPI_COMBINER_DUP = 2,
    MPI_COMBINER_CONTIGUOUS = 3,
    MPI_COMBINER_VECTOR = 4,
    MPI_COMBINER_HVECTOR_INTEGER = 5,
    MPI_COMBINER_HVECTOR = 6,
    MPI_COMBINER_INDEXED = 7,
    MPI_COMBINER_HINDEXED_INTEGER = 8,
    MPI_COMBINER_HINDEXED = 9,
    MPI_COMBINER_INDEXED_BLOCK = 10,
    MPIX_COMBINER_HINDEXED_BLOCK = 11,
    MPI_COMBINER_STRUCT_INTEGER = 12,
    MPI_COMBINER_STRUCT = 13,
    MPI_COMBINER_SUBARRAY = 14,
    MPI_COMBINER_DARRAY = 15,
    MPI_COMBINER_F90_REAL = 16,
    MPI_COMBINER_F90_COMPLEX = 17,
    MPI_COMBINER_F90_INTEGER = 18,
    MPI_COMBINER_RESIZED = 19
};


typedef int MPI_Info;
# 505 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef long MPI_Aint;
typedef int MPI_Fint;

static const MPI_Datatype mpich_mpi_aint = ((MPI_Datatype)0x4c000843);
# 521 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef long long MPI_Offset;

static const MPI_Datatype mpich_mpi_offset = ((MPI_Datatype)0x4c000844);


typedef struct MPI_Status {
    int count;
    int cancelled;
    int MPI_SOURCE;
    int MPI_TAG;
    int MPI_ERROR;

} MPI_Status;


struct MPIR_T_enum;
typedef struct MPIR_T_enum * MPIX_T_enum;
struct MPIR_T_cvar_handle;
typedef struct MPIR_T_cvar_handle * MPIX_T_cvar_handle;
struct MPIR_T_pvar_handle;
typedef struct MPIR_T_pvar_handle * MPIX_T_pvar_handle;
struct MPIR_T_pvar_session;
typedef struct MPIR_T_pvar_session * MPIX_T_pvar_session;


extern struct MPIR_T_pvar_handle * const MPIX_T_PVAR_ALL_HANDLES;
# 555 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
enum MPIR_T_verbosity_t {


    MPIX_T_VERBOSITY_INVALID = 0,


    MPIX_T_VERBOSITY_USER_BASIC = 221,
    MPIX_T_VERBOSITY_USER_DETAIL,
    MPIX_T_VERBOSITY_USER_ALL,

    MPIX_T_VERBOSITY_TUNER_BASIC,
    MPIX_T_VERBOSITY_TUNER_DETAIL,
    MPIX_T_VERBOSITY_TUNER_ALL,

    MPIX_T_VERBOSITY_MPIDEV_BASIC,
    MPIX_T_VERBOSITY_MPIDEV_DETAIL,
    MPIX_T_VERBOSITY_MPIDEV_ALL
};

enum MPIR_T_bind_t {


    MPIX_T_BIND_INVALID = 0,


    MPIX_T_BIND_NO_OBJECT = 9700,
    MPIX_T_BIND_MPI_COMM,
    MPIX_T_BIND_MPI_DATATYPE,
    MPIX_T_BIND_MPI_ERRHANDLER,
    MPIX_T_BIND_MPI_FILE,
    MPIX_T_BIND_MPI_GROUP,
    MPIX_T_BIND_MPI_OP,
    MPIX_T_BIND_MPI_REQUEST,
    MPIX_T_BIND_MPI_WIN,
    MPIX_T_BIND_MPI_MESSAGE,
    MPIX_T_BIND_MPI_INFO
};

enum MPIR_T_scope_t {


    MPIX_T_SCOPE_INVALID = 0,


    MPIX_T_SCOPE_READONLY = 60439,
    MPIX_T_SCOPE_LOCAL,
    MPIX_T_SCOPE_GROUP,
    MPIX_T_SCOPE_GROUP_EQ,
    MPIX_T_SCOPE_ALL,
    MPIX_T_SCOPE_ALL_EQ
};

enum MPIR_T_pvar_class_t {


    MPIX_T_PVAR_CLASS_INVALID = 0,


    MPIX_T_PVAR_CLASS_STATE = 240,
    MPIX_T_PVAR_CLASS_LEVEL,
    MPIX_T_PVAR_CLASS_SIZE,
    MPIX_T_PVAR_CLASS_PERCENTAGE,
    MPIX_T_PVAR_CLASS_HIGHWATERMARK,
    MPIX_T_PVAR_CLASS_LOWWATERMARK,
    MPIX_T_PVAR_CLASS_COUNTER,
    MPIX_T_PVAR_CLASS_AGGREGATE,
    MPIX_T_PVAR_CLASS_TIMER,
    MPIX_T_PVAR_CLASS_GENERIC
};
# 673 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
extern MPI_Fint * MPI_F_STATUS_IGNORE;
extern MPI_Fint * MPI_F_STATUSES_IGNORE;
# 692 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int (MPI_Grequest_cancel_function)(void *, int);
typedef int (MPI_Grequest_free_function)(void *);
typedef int (MPI_Grequest_query_function)(void *, MPI_Status *);
# 786 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int (MPI_Datarep_conversion_function)(void *, MPI_Datatype, int,
             void *, MPI_Offset, void *);
typedef int (MPI_Datarep_extent_function)(MPI_Datatype datatype, MPI_Aint *,
       void *);
# 809 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
int MPI_Send( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int MPI_Recv(void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Status *) ;
int MPI_Get_count( MPI_Status *, MPI_Datatype, int *);
int MPI_Bsend( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int MPI_Ssend( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int MPI_Rsend( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int MPI_Buffer_attach( void*, int);
int MPI_Buffer_detach( void*, int *);
int MPI_Isend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int MPI_Ibsend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int MPI_Issend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int MPI_Irsend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int MPI_Irecv(void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int MPI_Wait(MPI_Request *, MPI_Status *);
int MPI_Test(MPI_Request *, int *, MPI_Status *);
int MPI_Request_free(MPI_Request *);
int MPI_Waitany(int, MPI_Request *, int *, MPI_Status *);
int MPI_Testany(int, MPI_Request *, int *, int *, MPI_Status *);
int MPI_Waitall(int, MPI_Request *, MPI_Status *);
int MPI_Testall(int, MPI_Request *, int *, MPI_Status *);
int MPI_Waitsome(int, MPI_Request *, int *, int *, MPI_Status *);
int MPI_Testsome(int, MPI_Request *, int *, int *, MPI_Status *);
int MPI_Iprobe(int, int, MPI_Comm, int *, MPI_Status *);
int MPI_Probe(int, int, MPI_Comm, MPI_Status *);
int MPI_Cancel(MPI_Request *);
int MPI_Test_cancelled( MPI_Status *, int *);
int MPI_Send_init( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int MPI_Bsend_init( void*, int, MPI_Datatype, int,int, MPI_Comm, MPI_Request *) ;
int MPI_Ssend_init( void*, int, MPI_Datatype, int,int, MPI_Comm, MPI_Request *) ;
int MPI_Rsend_init( void*, int, MPI_Datatype, int,int, MPI_Comm, MPI_Request *) ;
int MPI_Recv_init(void*, int, MPI_Datatype, int,int, MPI_Comm, MPI_Request *) ;
int MPI_Start(MPI_Request *);
int MPI_Startall(int, MPI_Request *);
int MPI_Sendrecv( void *, int, MPI_Datatype,int, int, void *, int, MPI_Datatype, int, int, MPI_Comm, MPI_Status *) ;
int MPI_Sendrecv_replace(void*, int, MPI_Datatype, int, int, int, int, MPI_Comm, MPI_Status *) ;
int MPI_Type_contiguous(int, MPI_Datatype, MPI_Datatype *);
int MPI_Type_vector(int, int, int, MPI_Datatype, MPI_Datatype *);
int MPI_Type_hvector(int, int, MPI_Aint, MPI_Datatype, MPI_Datatype *);
int MPI_Type_indexed(int, int *, int *, MPI_Datatype, MPI_Datatype *);
int MPI_Type_hindexed(int, int *, MPI_Aint *, MPI_Datatype, MPI_Datatype *);
int MPI_Type_struct(int, int *, MPI_Aint *, MPI_Datatype *, MPI_Datatype *);
int MPI_Address( void*, MPI_Aint *);

int MPI_Type_extent(MPI_Datatype, MPI_Aint *);



int MPI_Type_size(MPI_Datatype, int *);

int MPI_Type_lb(MPI_Datatype, MPI_Aint *);
int MPI_Type_ub(MPI_Datatype, MPI_Aint *);
int MPI_Type_commit(MPI_Datatype *);
int MPI_Type_free(MPI_Datatype *);
int MPI_Get_elements( MPI_Status *, MPI_Datatype, int *);
int MPI_Pack( void*, int, MPI_Datatype, void *, int, int *, MPI_Comm) ;
int MPI_Unpack( void*, int, int *, void *, int, MPI_Datatype, MPI_Comm) ;
int MPI_Pack_size(int, MPI_Datatype, MPI_Comm, int *);
int MPI_Barrier(MPI_Comm );
int MPI_Bcast(void*, int, MPI_Datatype, int, MPI_Comm) ;
int MPI_Gather( void* , int, MPI_Datatype, void*, int, MPI_Datatype, int, MPI_Comm) ;
int MPI_Gatherv( void* , int, MPI_Datatype, void*, int *,
                int *, MPI_Datatype, int, MPI_Comm) ;
int MPI_Scatter( void* , int, MPI_Datatype, void*, int, MPI_Datatype, int, MPI_Comm) ;
int MPI_Scatterv( void* , int *, int *, MPI_Datatype, void*, int, MPI_Datatype, int, MPI_Comm) ;
int MPI_Allgather( void* , int, MPI_Datatype, void*, int, MPI_Datatype, MPI_Comm) ;
int MPI_Allgatherv( void* , int, MPI_Datatype, void*, int *,
                   int *, MPI_Datatype, MPI_Comm) ;
int MPI_Alltoall( void* , int, MPI_Datatype, void*, int, MPI_Datatype, MPI_Comm) ;
int MPI_Alltoallv( void* , int *, int *, MPI_Datatype,
                  void*, int *, int *, MPI_Datatype, MPI_Comm) ;
int MPI_Reduce( void* , void*, int, MPI_Datatype, MPI_Op, int, MPI_Comm) ;
int MPI_Op_create(MPI_User_function *, int, MPI_Op *);
int MPI_Op_free( MPI_Op *);
int MPI_Allreduce( void*, void*, int, MPI_Datatype, MPI_Op, MPI_Comm) ;
int MPI_Reduce_scatter( void* , void*, int *, MPI_Datatype, MPI_Op, MPI_Comm) ;
int MPI_Scan( void* , void*, int, MPI_Datatype, MPI_Op, MPI_Comm) ;
int MPI_Group_size(MPI_Group, int *);
int MPI_Group_rank(MPI_Group, int *);
int MPI_Group_translate_ranks (MPI_Group, int, int *, MPI_Group, int *);
int MPI_Group_compare(MPI_Group, MPI_Group, int *);
int MPI_Comm_group(MPI_Comm, MPI_Group *);
int MPI_Group_union(MPI_Group, MPI_Group, MPI_Group *);
int MPI_Group_intersection(MPI_Group, MPI_Group, MPI_Group *);
int MPI_Group_difference(MPI_Group, MPI_Group, MPI_Group *);
int MPI_Group_incl(MPI_Group, int, int *, MPI_Group *);
int MPI_Group_excl(MPI_Group, int, int *, MPI_Group *);
int MPI_Group_range_incl(MPI_Group, int, int [][3], MPI_Group *);
int MPI_Group_range_excl(MPI_Group, int, int [][3], MPI_Group *);
int MPI_Group_free(MPI_Group *);
int MPI_Comm_size(MPI_Comm, int *);
int MPI_Comm_rank(MPI_Comm, int *);
int MPI_Comm_compare(MPI_Comm, MPI_Comm, int *);
int MPI_Comm_dup(MPI_Comm, MPI_Comm *);
int MPI_Comm_create(MPI_Comm, MPI_Group, MPI_Comm *);
int MPI_Comm_split(MPI_Comm, int, int, MPI_Comm *);
int MPI_Comm_free(MPI_Comm *);
int MPI_Comm_test_inter(MPI_Comm, int *);
int MPI_Comm_remote_size(MPI_Comm, int *);
int MPI_Comm_remote_group(MPI_Comm, MPI_Group *);
int MPI_Intercomm_create(MPI_Comm, int, MPI_Comm, int, int, MPI_Comm * );
int MPI_Intercomm_merge(MPI_Comm, int, MPI_Comm *);
int MPI_Keyval_create(MPI_Copy_function *, MPI_Delete_function *, int *, void*);
int MPI_Keyval_free(int *);
int MPI_Attr_put(MPI_Comm, int, void*);
int MPI_Attr_get(MPI_Comm, int, void *, int *);
int MPI_Attr_delete(MPI_Comm, int);
int MPI_Topo_test(MPI_Comm, int *);
int MPI_Cart_create(MPI_Comm, int, int *, int *, int, MPI_Comm *);
int MPI_Dims_create(int, int, int *);
int MPI_Graph_create(MPI_Comm, int, int *, int *, int, MPI_Comm *);
int MPI_Graphdims_get(MPI_Comm, int *, int *);
int MPI_Graph_get(MPI_Comm, int, int, int *, int *);
int MPI_Cartdim_get(MPI_Comm, int *);
int MPI_Cart_get(MPI_Comm, int, int *, int *, int *);
int MPI_Cart_rank(MPI_Comm, int *, int *);
int MPI_Cart_coords(MPI_Comm, int, int, int *);
int MPI_Graph_neighbors_count(MPI_Comm, int, int *);
int MPI_Graph_neighbors(MPI_Comm, int, int, int *);
int MPI_Cart_shift(MPI_Comm, int, int, int *, int *);
int MPI_Cart_sub(MPI_Comm, int *, MPI_Comm *);
int MPI_Cart_map(MPI_Comm, int, int *, int *, int *);
int MPI_Graph_map(MPI_Comm, int, int *, int *, int *);
int MPI_Get_processor_name(char *, int *);
int MPI_Get_version(int *, int *);
int MPI_Errhandler_create(MPI_Handler_function *, MPI_Errhandler *);
int MPI_Errhandler_set(MPI_Comm, MPI_Errhandler);
int MPI_Errhandler_get(MPI_Comm, MPI_Errhandler *);
int MPI_Errhandler_free(MPI_Errhandler *);
int MPI_Error_string(int, char *, int *);
int MPI_Error_class(int, int *);
double MPI_Wtime(void);
double MPI_Wtick(void);

double PMPI_Wtime(void);
double PMPI_Wtick(void);

int MPI_Init(int *, char ***);
int MPI_Finalize(void);
int MPI_Initialized(int *);
int MPI_Abort(MPI_Comm, int);




int MPI_Pcontrol(const int, ...);

int MPIR_Dup_fn ( MPI_Comm, int, void *, void *, void *, int * );





int MPI_Close_port( char *);
int MPI_Comm_accept( char *, MPI_Info, int, MPI_Comm, MPI_Comm *);
int MPI_Comm_connect( char *, MPI_Info, int, MPI_Comm, MPI_Comm *);
int MPI_Comm_disconnect(MPI_Comm *);
int MPI_Comm_get_parent(MPI_Comm *);
int MPI_Comm_join(int, MPI_Comm *);
int MPI_Comm_spawn( char *, char *[], int, MPI_Info, int, MPI_Comm, MPI_Comm *,
                   int []);
int MPI_Comm_spawn_multiple(int, char *[], char **[], int [], MPI_Info [], int,
       MPI_Comm, MPI_Comm *, int []);
int MPI_Lookup_name( char *, MPI_Info, char *);
int MPI_Open_port(MPI_Info, char *);
int MPI_Publish_name( char *, MPI_Info, char *);
int MPI_Unpublish_name( char *, MPI_Info, char *);


int MPI_Accumulate( void *, int, MPI_Datatype, int, MPI_Aint, int,
                   MPI_Datatype, MPI_Op, MPI_Win) ;
int MPI_Get(void *, int, MPI_Datatype, int, MPI_Aint, int, MPI_Datatype,
            MPI_Win) ;
int MPI_Put( void *, int, MPI_Datatype, int, MPI_Aint, int, MPI_Datatype,
            MPI_Win) ;
int MPI_Win_complete(MPI_Win);
int MPI_Win_create(void *, MPI_Aint, int, MPI_Info, MPI_Comm, MPI_Win *);
int MPI_Win_fence(int, MPI_Win);
int MPI_Win_free(MPI_Win *);
int MPI_Win_get_group(MPI_Win, MPI_Group *);
int MPI_Win_lock(int, int, int, MPI_Win);
int MPI_Win_post(MPI_Group, int, MPI_Win);
int MPI_Win_start(MPI_Group, int, MPI_Win);
int MPI_Win_test(MPI_Win, int *);
int MPI_Win_unlock(int, MPI_Win);
int MPI_Win_wait(MPI_Win);


int MPIX_Win_allocate(MPI_Aint size, int disp_unit, MPI_Info info,
                      MPI_Comm comm, void *baseptr, MPI_Win *win);
int MPIX_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm,
                             void *baseptr, MPI_Win *win);
int MPIX_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr);
int MPIX_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win);
int MPIX_Win_attach(MPI_Win win, void *base, MPI_Aint size);
int MPIX_Win_detach(MPI_Win win, const void *base);

int MPIX_Get_accumulate(const void *origin_addr, int origin_count,
                        MPI_Datatype origin_datatype, void *result_addr, int result_count,
                        MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp,
                        int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win);
int MPIX_Fetch_and_op(const void *origin_addr, void *result_addr,
                      MPI_Datatype datatype, int target_rank, MPI_Aint target_disp,
                      MPI_Op op, MPI_Win win);
int MPIX_Compare_and_swap(const void *origin_addr, const void *compare_addr,
                          void *result_addr, MPI_Datatype datatype, int target_rank,
                          MPI_Aint target_disp, MPI_Win win);
int MPIX_Rput(const void *origin_addr, int origin_count,
              MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp,
              int target_count, MPI_Datatype target_datatype, MPI_Win win,
              MPI_Request *request);
int MPIX_Rget(void *origin_addr, int origin_count,
              MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp,
              int target_count, MPI_Datatype target_datatype, MPI_Win win,
              MPI_Request *request);
int MPIX_Raccumulate(const void *origin_addr, int origin_count,
                     MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp,
                     int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win,
                     MPI_Request *request);
int MPIX_Rget_accumulate(const void *origin_addr, int origin_count,
                         MPI_Datatype origin_datatype, void *result_addr, int result_count,
                         MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp,
                         int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win,
                         MPI_Request *request);

int MPIX_Win_lock_all(int assert, MPI_Win win);
int MPIX_Win_unlock_all(MPI_Win win);
int MPIX_Win_flush(int rank, MPI_Win win);
int MPIX_Win_flush_all(MPI_Win win);
int MPIX_Win_flush_local(int rank, MPI_Win win);
int MPIX_Win_flush_local_all(MPI_Win win);
int MPIX_Win_sync(MPI_Win win);



int MPI_Alltoallw( void *, int [], int [],
                  MPI_Datatype [], void *, int [],
    int [], MPI_Datatype [], MPI_Comm);
int MPI_Exscan( void *, void *, int, MPI_Datatype, MPI_Op, MPI_Comm) ;


int MPI_Add_error_class(int *);
int MPI_Add_error_code(int, int *);
int MPI_Add_error_string(int, char *);
int MPI_Comm_call_errhandler(MPI_Comm, int);
int MPI_Comm_create_keyval(MPI_Comm_copy_attr_function *,
                           MPI_Comm_delete_attr_function *, int *, void *);
int MPI_Comm_delete_attr(MPI_Comm, int);
int MPI_Comm_free_keyval(int *);
int MPI_Comm_get_attr(MPI_Comm, int, void *, int *);
int MPI_Comm_get_name(MPI_Comm, char *, int *);
int MPI_Comm_set_attr(MPI_Comm, int, void *);
int MPI_Comm_set_name(MPI_Comm, char *);
int MPI_File_call_errhandler(MPI_File, int);
int MPI_Grequest_complete(MPI_Request);
int MPI_Grequest_start(MPI_Grequest_query_function *,
                       MPI_Grequest_free_function *,
                       MPI_Grequest_cancel_function *, void *, MPI_Request *);
int MPI_Init_thread(int *, char ***, int, int *);
int MPI_Is_thread_main(int *);
int MPI_Query_thread(int *);
int MPI_Status_set_cancelled(MPI_Status *, int);
int MPI_Status_set_elements(MPI_Status *, MPI_Datatype, int);
int MPI_Type_create_keyval(MPI_Type_copy_attr_function *,
                           MPI_Type_delete_attr_function *, int *, void *);
int MPI_Type_delete_attr(MPI_Datatype, int);
int MPI_Type_dup(MPI_Datatype, MPI_Datatype *);
int MPI_Type_free_keyval(int *);
int MPI_Type_get_attr(MPI_Datatype, int, void *, int *);
int MPI_Type_get_contents(MPI_Datatype, int, int, int, int [], MPI_Aint [],
                          MPI_Datatype []);
int MPI_Type_get_envelope(MPI_Datatype, int *, int *, int *, int *);
int MPI_Type_get_name(MPI_Datatype, char *, int *);
int MPI_Type_set_attr(MPI_Datatype, int, void *);
int MPI_Type_set_name(MPI_Datatype, char *);
int MPI_Type_match_size( int, int, MPI_Datatype *);
int MPI_Win_call_errhandler(MPI_Win, int);
int MPI_Win_create_keyval(MPI_Win_copy_attr_function *,
                         MPI_Win_delete_attr_function *, int *, void *);
int MPI_Win_delete_attr(MPI_Win, int);
int MPI_Win_free_keyval(int *);
int MPI_Win_get_attr(MPI_Win, int, void *, int *);
int MPI_Win_get_name(MPI_Win, char *, int *);
int MPI_Win_set_attr(MPI_Win, int, void *);
int MPI_Win_set_name(MPI_Win, char *);
# 1114 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
int MPI_Alloc_mem(MPI_Aint, MPI_Info info, void *baseptr);
int MPI_Comm_create_errhandler(MPI_Comm_errhandler_function *, MPI_Errhandler *);
int MPI_Comm_get_errhandler(MPI_Comm, MPI_Errhandler *);
int MPI_Comm_set_errhandler(MPI_Comm, MPI_Errhandler);
int MPI_File_create_errhandler(MPI_File_errhandler_function *, MPI_Errhandler *);
int MPI_File_get_errhandler(MPI_File, MPI_Errhandler *);
int MPI_File_set_errhandler(MPI_File, MPI_Errhandler);
int MPI_Finalized(int *);
int MPI_Free_mem(void *);
int MPI_Get_address( void *, MPI_Aint *);
int MPI_Info_create(MPI_Info *);
int MPI_Info_delete(MPI_Info, char *);
int MPI_Info_dup(MPI_Info, MPI_Info *);
int MPI_Info_free(MPI_Info *info);
int MPI_Info_get(MPI_Info, char *, int, char *, int *);
int MPI_Info_get_nkeys(MPI_Info, int *);
int MPI_Info_get_nthkey(MPI_Info, int, char *);
int MPI_Info_get_valuelen(MPI_Info, char *, int *, int *);
int MPI_Info_set(MPI_Info, char *, char *);
int MPI_Pack_external( char *, void *, int, MPI_Datatype, void *,
                      MPI_Aint, MPI_Aint *) ;
int MPI_Pack_external_size( char *, int, MPI_Datatype, MPI_Aint *);
int MPI_Request_get_status(MPI_Request, int *, MPI_Status *);
int MPI_Status_c2f( MPI_Status *, MPI_Fint *);
int MPI_Status_f2c( MPI_Fint *, MPI_Status *);
int MPI_Type_create_darray(int, int, int, int [], int [],
                           int [], int [], int,
                           MPI_Datatype, MPI_Datatype *);
int MPI_Type_create_hindexed(int, int [], MPI_Aint [], MPI_Datatype,
                             MPI_Datatype *);
int MPI_Type_create_hvector(int, int, MPI_Aint, MPI_Datatype, MPI_Datatype *);
int MPI_Type_create_indexed_block(int, int, int [], MPI_Datatype,
                                  MPI_Datatype *);
int MPIX_Type_create_hindexed_block(int, int, const MPI_Aint [], MPI_Datatype, MPI_Datatype *);
int MPI_Type_create_resized(MPI_Datatype, MPI_Aint, MPI_Aint, MPI_Datatype *);
int MPI_Type_create_struct(int, int [], MPI_Aint [],
                           MPI_Datatype [], MPI_Datatype *);
int MPI_Type_create_subarray(int, int [], int [], int [],
                             int, MPI_Datatype, MPI_Datatype *);
int MPI_Type_get_extent(MPI_Datatype, MPI_Aint *, MPI_Aint *);
int MPI_Type_get_true_extent(MPI_Datatype, MPI_Aint *, MPI_Aint *);
int MPI_Unpack_external( char *, void *, MPI_Aint, MPI_Aint *, void *,
                        int, MPI_Datatype) ;
int MPI_Win_create_errhandler(MPI_Win_errhandler_function *, MPI_Errhandler *);
int MPI_Win_get_errhandler(MPI_Win, MPI_Errhandler *);
int MPI_Win_set_errhandler(MPI_Win, MPI_Errhandler);




int MPI_Type_create_f90_integer( int, MPI_Datatype * );
int MPI_Type_create_f90_real( int, int, MPI_Datatype * );
int MPI_Type_create_f90_complex( int, int, MPI_Datatype * );


int MPI_Reduce_local( void *inbuf, void *inoutbuf, int count, MPI_Datatype datatype, MPI_Op op) ;
int MPI_Op_commutative(MPI_Op op, int *commute);
int MPI_Reduce_scatter_block( void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm) ;
int MPI_Dist_graph_create_adjacent(MPI_Comm comm_old, int indegree, int [], int [], int outdegree, int [], int [], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph);
int MPI_Dist_graph_create(MPI_Comm comm_old, int n, int [], int [], int [], int [], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph);
int MPI_Dist_graph_neighbors_count(MPI_Comm comm, int *indegree, int *outdegree, int *weighted);
int MPI_Dist_graph_neighbors(MPI_Comm comm, int maxindegree, int [], int [], int maxoutdegree, int [], int []);


int MPIX_Improbe(int source, int tag, MPI_Comm comm, int *flag, MPIX_Message *message, MPI_Status *status);
int MPIX_Imrecv(void *buf, int count, MPI_Datatype datatype, MPIX_Message *message, MPI_Request *request) ;
int MPIX_Mprobe(int source, int tag, MPI_Comm comm, MPIX_Message *message, MPI_Status *status);
int MPIX_Mrecv(void *buf, int count, MPI_Datatype datatype, MPIX_Message *message, MPI_Status *status) ;


int MPIX_Comm_idup(MPI_Comm comm, MPI_Comm *newcomm, MPI_Request *request);


int MPIX_Ibarrier(MPI_Comm comm, MPI_Request *request);
int MPIX_Ibcast(void *buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Igather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Igatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int *recvcounts, const int *displs, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iscatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iscatterv(const void *sendbuf, const int *sendcounts, const int *displs, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iallgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iallgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int *recvcounts, const int *displs, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ialltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ialltoallv(const void *sendbuf, const int *sendcounts, const int *sdispls, MPI_Datatype sendtype, void *recvbuf, const int *recvcounts, const int *rdispls, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ialltoallw(const void *sendbuf, const int *sendcounts, const int *sdispls, const MPI_Datatype *sendtypes, void *recvbuf, const int *recvcounts, const int *rdispls, const MPI_Datatype *recvtypes, MPI_Comm comm, MPI_Request *request);
int MPIX_Ireduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iallreduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ireduce_scatter(const void *sendbuf, void *recvbuf, const int *recvcounts, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ireduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iscan(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Iexscan(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;


int MPIX_Ineighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ineighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ineighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ineighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int MPIX_Ineighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm, MPI_Request *request);
int MPIX_Neighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm) ;
int MPIX_Neighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, MPI_Comm comm) ;
int MPIX_Neighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm) ;
int MPIX_Neighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm) ;
int MPIX_Neighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm);


int MPIX_Comm_split_type(MPI_Comm comm, int split_type, int key, MPI_Info info, MPI_Comm *newcomm);


int MPIX_Comm_create_group(MPI_Comm comm, MPI_Group group, int tag, MPI_Comm * newcomm);


int MPIX_Comm_group_failed(MPI_Comm, MPI_Group *);
int MPIX_Comm_remote_group_failed(MPI_Comm, MPI_Group *);
int MPIX_Comm_reenable_anysource(MPI_Comm, MPI_Group *);


struct mpixi_mutex_s;
typedef struct mpixi_mutex_s * MPIX_Mutex;

int MPIX_Mutex_create(int count, MPI_Comm comm, MPIX_Mutex *hdl);
int MPIX_Mutex_free(MPIX_Mutex *hdl);
int MPIX_Mutex_lock(MPIX_Mutex hdl, int mutex, int proc);
int MPIX_Mutex_unlock(MPIX_Mutex hdl, int mutex, int proc);






int MPIX_T_init_thread(int required, int *provided);
int MPIX_T_finalize(void);
int MPIX_T_enum_get_info(MPIX_T_enum enumtype, int num, char *name, int *name_len);
int MPIX_T_enum_get_item(MPIX_T_enum enumtype, int num, int *value, char *name, int *name_len);
int MPIX_T_cvar_get_num(int *num_cvar);
int MPIX_T_cvar_get_info(int cvar_index, char *name, int *name_len, int *verbosity, MPI_Datatype *datatype, MPIX_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *scope);
int MPIX_T_cvar_handle_alloc(int cvar_index, void *obj_handle, MPIX_T_cvar_handle *handle, int *count);
int MPIX_T_cvar_handle_free(MPIX_T_cvar_handle *handle);
int MPIX_T_cvar_read(MPIX_T_cvar_handle handle, void *buf);
int MPIX_T_cvar_write(MPIX_T_cvar_handle handle, void *buf);
int MPIX_T_pvar_get_num(int *num_pvar);
int MPIX_T_pvar_get_info(int pvar_index, char *name, int *name_len, int *verbosity, int *var_class, MPI_Datatype *datatype, MPIX_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *readonly, int *continuous, int *atomic);
int MPIX_T_pvar_session_create(MPIX_T_pvar_session *session);
int MPIX_T_pvar_session_free(MPIX_T_pvar_session *session);
int MPIX_T_pvar_handle_alloc(MPIX_T_pvar_session session, int pvar_index, void *obj_handle, MPIX_T_pvar_handle *handle, int *count);
int MPIX_T_pvar_handle_free(MPIX_T_pvar_session session, MPIX_T_pvar_handle *handle);
int MPIX_T_pvar_start(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle);
int MPIX_T_pvar_stop(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle);
int MPIX_T_pvar_read(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle, void *buf);
int MPIX_T_pvar_write(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle, void *buf);
int MPIX_T_pvar_reset(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle);
int MPIX_T_pvar_readreset(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle, void *buf);
int MPIX_T_category_get_num(int *num_cat);
int MPIX_T_category_get_info(int cat_index, char *name, int *name_len, char *desc, int *desc_len, int *num_controlvars, int *num_pvars, int *num_categories);
int MPIX_T_category_get_cvars(int cat_index, int len, int indices[]);
int MPIX_T_category_get_pvars(int cat_index[], int len, int indices[]);
int MPIX_T_category_get_categories(int cat_index, int len, int indices[]);
int MPIX_T_category_changed(int *stamp);
# 1278 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
int PMPI_Send( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int PMPI_Recv(void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Status *) ;
int PMPI_Get_count( MPI_Status *, MPI_Datatype, int *);
int PMPI_Bsend( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int PMPI_Ssend( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int PMPI_Rsend( void*, int, MPI_Datatype, int, int, MPI_Comm) ;
int PMPI_Buffer_attach( void* buffer, int);
int PMPI_Buffer_detach( void* buffer, int *);
int PMPI_Isend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Ibsend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Issend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Irsend( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Irecv(void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Wait(MPI_Request *, MPI_Status *);
int PMPI_Test(MPI_Request *, int *, MPI_Status *);
int PMPI_Request_free(MPI_Request *);
int PMPI_Waitany(int, MPI_Request *, int *, MPI_Status *);
int PMPI_Testany(int, MPI_Request *, int *, int *, MPI_Status *);
int PMPI_Waitall(int, MPI_Request *, MPI_Status *);
int PMPI_Testall(int, MPI_Request *, int *, MPI_Status *);
int PMPI_Waitsome(int, MPI_Request *, int *, int *, MPI_Status *);
int PMPI_Testsome(int, MPI_Request *, int *, int *, MPI_Status *);
int PMPI_Iprobe(int, int, MPI_Comm, int *, MPI_Status *);
int PMPI_Probe(int, int, MPI_Comm, MPI_Status *);
int PMPI_Cancel(MPI_Request *);
int PMPI_Test_cancelled( MPI_Status *, int *);
int PMPI_Send_init( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Bsend_init( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Ssend_init( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Rsend_init( void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Recv_init(void*, int, MPI_Datatype, int, int, MPI_Comm, MPI_Request *) ;
int PMPI_Start(MPI_Request *);
int PMPI_Startall(int, MPI_Request *);
int PMPI_Sendrecv( void *, int, MPI_Datatype, int, int, void *, int, MPI_Datatype, int, int, MPI_Comm, MPI_Status *) ;
int PMPI_Sendrecv_replace(void*, int, MPI_Datatype, int, int, int, int, MPI_Comm, MPI_Status *) ;
int PMPI_Type_contiguous(int, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_vector(int, int, int, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_hvector(int, int, MPI_Aint, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_indexed(int, int *, int *, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_hindexed(int, int *, MPI_Aint *, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_struct(int, int *, MPI_Aint *, MPI_Datatype *, MPI_Datatype *);
int PMPI_Address( void*, MPI_Aint *);
int PMPI_Type_extent(MPI_Datatype, MPI_Aint *);
int PMPI_Type_size(MPI_Datatype, int *);
int PMPI_Type_lb(MPI_Datatype, MPI_Aint *);
int PMPI_Type_ub(MPI_Datatype, MPI_Aint *);
int PMPI_Type_commit(MPI_Datatype *);
int PMPI_Type_free(MPI_Datatype *);
int PMPI_Get_elements( MPI_Status *, MPI_Datatype, int *);
int PMPI_Pack( void*, int, MPI_Datatype, void *, int, int *, MPI_Comm) ;
int PMPI_Unpack( void*, int, int *, void *, int, MPI_Datatype, MPI_Comm) ;
int PMPI_Pack_size(int, MPI_Datatype, MPI_Comm, int *);
int PMPI_Barrier(MPI_Comm );
int PMPI_Bcast(void* buffer, int, MPI_Datatype, int, MPI_Comm );
int PMPI_Gather( void* , int, MPI_Datatype, void*, int, MPI_Datatype, int, MPI_Comm) ;
int PMPI_Gatherv( void* , int, MPI_Datatype, void*, int *, int *, MPI_Datatype, int, MPI_Comm) ;
int PMPI_Scatter( void* , int, MPI_Datatype, void*, int, MPI_Datatype, int, MPI_Comm) ;
int PMPI_Scatterv( void* , int *, int *, MPI_Datatype, void*, int, MPI_Datatype, int, MPI_Comm) ;
int PMPI_Allgather( void* , int, MPI_Datatype, void*, int, MPI_Datatype, MPI_Comm) ;
int PMPI_Allgatherv( void* , int, MPI_Datatype, void*, int *,
                    int *, MPI_Datatype, MPI_Comm) ;
int PMPI_Alltoall( void* , int, MPI_Datatype, void*, int, MPI_Datatype, MPI_Comm) ;
int PMPI_Alltoallv( void* , int *, int *, MPI_Datatype,
                   void*, int *, int *, MPI_Datatype, MPI_Comm) ;
int PMPI_Reduce( void* , void*, int, MPI_Datatype, MPI_Op, int, MPI_Comm) ;
int PMPI_Op_create(MPI_User_function *, int, MPI_Op *);
int PMPI_Op_free( MPI_Op *);
int PMPI_Allreduce( void* , void*, int, MPI_Datatype, MPI_Op, MPI_Comm) ;
int PMPI_Reduce_scatter( void* , void*, int *, MPI_Datatype, MPI_Op, MPI_Comm) ;
int PMPI_Scan( void* , void*, int, MPI_Datatype, MPI_Op, MPI_Comm) ;
int PMPI_Group_size(MPI_Group, int *);
int PMPI_Group_rank(MPI_Group, int *);
int PMPI_Group_translate_ranks(MPI_Group, int, int *, MPI_Group, int *);
int PMPI_Group_compare(MPI_Group, MPI_Group, int *);
int PMPIX_Comm_group_failed(MPI_Comm, MPI_Group *);
int PMPIX_Comm_reenable_anysource(MPI_Comm, MPI_Group *);
int PMPIX_Comm_remote_group_failed(MPI_Comm, MPI_Group *);
int PMPIX_Mutex_create(int count, MPI_Comm comm, MPIX_Mutex *hdl);
int PMPIX_Mutex_free(MPIX_Mutex *hdl);
int PMPIX_Mutex_lock(MPIX_Mutex hdl, int mutex, int proc);
int PMPIX_Mutex_unlock(MPIX_Mutex hdl, int mutex, int proc);
int PMPI_Comm_group(MPI_Comm, MPI_Group *);
int PMPI_Group_union(MPI_Group, MPI_Group, MPI_Group *);
int PMPI_Group_intersection(MPI_Group, MPI_Group, MPI_Group *);
int PMPI_Group_difference(MPI_Group, MPI_Group, MPI_Group *);
int PMPI_Group_incl(MPI_Group, int, int *, MPI_Group *);
int PMPI_Group_excl(MPI_Group, int, int *, MPI_Group *);
int PMPI_Group_range_incl(MPI_Group, int, int [][3], MPI_Group *);
int PMPI_Group_range_excl(MPI_Group, int, int [][3], MPI_Group *);
int PMPI_Group_free(MPI_Group *);
int PMPI_Comm_size(MPI_Comm, int *);
int PMPI_Comm_rank(MPI_Comm, int *);
int PMPI_Comm_compare(MPI_Comm, MPI_Comm, int *);
int PMPI_Comm_dup(MPI_Comm, MPI_Comm *);
int PMPI_Comm_create(MPI_Comm, MPI_Group, MPI_Comm *);
int PMPI_Comm_split(MPI_Comm, int, int, MPI_Comm *);
int PMPI_Comm_free(MPI_Comm *);
int PMPI_Comm_test_inter(MPI_Comm, int *);
int PMPI_Comm_remote_size(MPI_Comm, int *);
int PMPI_Comm_remote_group(MPI_Comm, MPI_Group *);
int PMPI_Intercomm_create(MPI_Comm, int, MPI_Comm, int, int, MPI_Comm *);
int PMPI_Intercomm_merge(MPI_Comm, int, MPI_Comm *);
int PMPI_Keyval_create(MPI_Copy_function *, MPI_Delete_function *, int *, void*);
int PMPI_Keyval_free(int *);
int PMPI_Attr_put(MPI_Comm, int, void*);
int PMPI_Attr_get(MPI_Comm, int, void *, int *);
int PMPI_Attr_delete(MPI_Comm, int);
int PMPI_Topo_test(MPI_Comm, int *);
int PMPI_Cart_create(MPI_Comm, int, int *, int *, int, MPI_Comm *);
int PMPI_Dims_create(int, int, int *);
int PMPI_Graph_create(MPI_Comm, int, int *, int *, int, MPI_Comm *);
int PMPI_Graphdims_get(MPI_Comm, int *, int *);
int PMPI_Graph_get(MPI_Comm, int, int, int *, int *);
int PMPI_Cartdim_get(MPI_Comm, int *);
int PMPI_Cart_get(MPI_Comm, int, int *, int *, int *);
int PMPI_Cart_rank(MPI_Comm, int *, int *);
int PMPI_Cart_coords(MPI_Comm, int, int, int *);
int PMPI_Graph_neighbors_count(MPI_Comm, int, int *);
int PMPI_Graph_neighbors(MPI_Comm, int, int, int *);
int PMPI_Cart_shift(MPI_Comm, int, int, int *, int *);
int PMPI_Cart_sub(MPI_Comm, int *, MPI_Comm *);
int PMPI_Cart_map(MPI_Comm, int, int *, int *, int *);
int PMPI_Graph_map(MPI_Comm, int, int *, int *, int *);
int PMPI_Get_processor_name(char *, int *);
int PMPI_Get_version(int *, int *);
int PMPI_Errhandler_create(MPI_Handler_function *, MPI_Errhandler *);
int PMPI_Errhandler_set(MPI_Comm, MPI_Errhandler);
int PMPI_Errhandler_get(MPI_Comm, MPI_Errhandler *);
int PMPI_Errhandler_free(MPI_Errhandler *);
int PMPI_Error_string(int, char *, int *);
int PMPI_Error_class(int, int *);


int PMPI_Init(int *, char ***);
int PMPI_Finalize(void);
int PMPI_Initialized(int *);
int PMPI_Abort(MPI_Comm, int);

int PMPI_Pcontrol(const int, ...);




int PMPI_Close_port( char *);
int PMPI_Comm_accept( char *, MPI_Info, int, MPI_Comm, MPI_Comm *);
int PMPI_Comm_connect( char *, MPI_Info, int, MPI_Comm, MPI_Comm *);
int PMPI_Comm_disconnect(MPI_Comm *);
int PMPI_Comm_get_parent(MPI_Comm *);
int PMPI_Comm_join(int, MPI_Comm *);
int PMPI_Comm_spawn( char *, char *[], int, MPI_Info, int, MPI_Comm, MPI_Comm *,
                   int []);
int PMPI_Comm_spawn_multiple(int, char *[], char **[], int [], MPI_Info [], int,
       MPI_Comm, MPI_Comm *, int []);
int PMPI_Lookup_name( char *, MPI_Info, char *);
int PMPI_Open_port(MPI_Info, char *);
int PMPI_Publish_name( char *, MPI_Info, char *);
int PMPI_Unpublish_name( char *, MPI_Info, char *);


int PMPI_Accumulate( void *, int, MPI_Datatype, int, MPI_Aint, int,
     MPI_Datatype, MPI_Op, MPI_Win) ;
int PMPI_Get(void *, int, MPI_Datatype, int, MPI_Aint, int, MPI_Datatype,
     MPI_Win) ;
int PMPI_Put( void *, int, MPI_Datatype, int, MPI_Aint, int, MPI_Datatype,
     MPI_Win) ;
int PMPI_Win_complete(MPI_Win);
int PMPI_Win_create(void *, MPI_Aint, int, MPI_Info, MPI_Comm, MPI_Win *);
int PMPI_Win_fence(int, MPI_Win);
int PMPI_Win_free(MPI_Win *);
int PMPI_Win_get_group(MPI_Win, MPI_Group *);
int PMPI_Win_lock(int, int, int, MPI_Win);
int PMPI_Win_post(MPI_Group, int, MPI_Win);
int PMPI_Win_start(MPI_Group, int, MPI_Win);
int PMPI_Win_test(MPI_Win, int *);
int PMPI_Win_unlock(int, MPI_Win);
int PMPI_Win_wait(MPI_Win);


int PMPIX_Win_allocate(MPI_Aint size, int disp_unit, MPI_Info info,
                       MPI_Comm comm, void *baseptr, MPI_Win *win);
int PMPIX_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm,
                              void *baseptr, MPI_Win *win);
int PMPIX_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr);
int PMPIX_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win);
int PMPIX_Win_attach(MPI_Win win, void *base, MPI_Aint size);
int PMPIX_Win_detach(MPI_Win win, const void *base);

int PMPIX_Get_accumulate(const void *origin_addr, int origin_count,
                         MPI_Datatype origin_datatype, void *result_addr, int result_count,
                         MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp,
                         int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win);
int PMPIX_Fetch_and_op(const void *origin_addr, void *result_addr,
                       MPI_Datatype datatype, int target_rank, MPI_Aint target_disp,
                       MPI_Op op, MPI_Win win);
int PMPIX_Compare_and_swap(const void *origin_addr, const void *compare_addr,
                           void *result_addr, MPI_Datatype datatype, int target_rank,
                           MPI_Aint target_disp, MPI_Win win);
int PMPIX_Rput(const void *origin_addr, int origin_count,
               MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp,
               int target_count, MPI_Datatype target_datatype, MPI_Win win,
               MPI_Request *request);
int PMPIX_Rget(void *origin_addr, int origin_count,
               MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp,
               int target_count, MPI_Datatype target_datatype, MPI_Win win,
               MPI_Request *request);
int PMPIX_Raccumulate(const void *origin_addr, int origin_count,
                      MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp,
                      int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win,
                      MPI_Request *request);
int PMPIX_Rget_accumulate(const void *origin_addr, int origin_count,
                          MPI_Datatype origin_datatype, void *result_addr, int result_count,
                          MPI_Datatype result_datatype, int target_rank, MPI_Aint target_disp,
                          int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win,
                          MPI_Request *request);

int PMPIX_Win_lock_all(int assert, MPI_Win win);
int PMPIX_Win_unlock_all(MPI_Win win);
int PMPIX_Win_flush(int rank, MPI_Win win);
int PMPIX_Win_flush_all(MPI_Win win);
int PMPIX_Win_flush_local(int rank, MPI_Win win);
int PMPIX_Win_flush_local_all(MPI_Win win);
int PMPIX_Win_sync(MPI_Win win);


int PMPI_Alltoallw( void *, int [], int [],
                   MPI_Datatype [], void *, int [],
                   int [], MPI_Datatype [], MPI_Comm);
int PMPI_Exscan( void *, void *, int, MPI_Datatype, MPI_Op, MPI_Comm) ;


int PMPI_Add_error_class(int *);
int PMPI_Add_error_code(int, int *);
int PMPI_Add_error_string(int, char *);
int PMPI_Comm_call_errhandler(MPI_Comm, int);
int PMPI_Comm_create_keyval(MPI_Comm_copy_attr_function *,
                           MPI_Comm_delete_attr_function *, int *, void *);
int PMPI_Comm_delete_attr(MPI_Comm, int);
int PMPI_Comm_free_keyval(int *);
int PMPI_Comm_get_attr(MPI_Comm, int, void *, int *);
int PMPI_Comm_get_name(MPI_Comm, char *, int *);
int PMPI_Comm_set_attr(MPI_Comm, int, void *);
int PMPI_Comm_set_name(MPI_Comm, char *);
int PMPI_File_call_errhandler(MPI_File, int);
int PMPI_Grequest_complete(MPI_Request);
int PMPI_Grequest_start(MPI_Grequest_query_function *,
                       MPI_Grequest_free_function *,
                       MPI_Grequest_cancel_function *, void *, MPI_Request *);
int PMPI_Init_thread(int *, char ***, int, int *);
int PMPI_Is_thread_main(int *);
int PMPI_Query_thread(int *);
int PMPI_Status_set_cancelled(MPI_Status *, int);
int PMPI_Status_set_elements(MPI_Status *, MPI_Datatype, int);
int PMPI_Type_create_keyval(MPI_Type_copy_attr_function *,
                           MPI_Type_delete_attr_function *, int *, void *);
int PMPI_Type_delete_attr(MPI_Datatype, int);
int PMPI_Type_dup(MPI_Datatype, MPI_Datatype *);
int PMPI_Type_free_keyval(int *);
int PMPI_Type_get_attr(MPI_Datatype, int, void *, int *);
int PMPI_Type_get_contents(MPI_Datatype, int, int, int, int [], MPI_Aint [],
                          MPI_Datatype []);
int PMPI_Type_get_envelope(MPI_Datatype, int *, int *, int *, int *);
int PMPI_Type_get_name(MPI_Datatype, char *, int *);
int PMPI_Type_set_attr(MPI_Datatype, int, void *);
int PMPI_Type_set_name(MPI_Datatype, char *);
int PMPI_Type_match_size( int, int, MPI_Datatype *);
int PMPI_Win_call_errhandler(MPI_Win, int);
int PMPI_Win_create_keyval(MPI_Win_copy_attr_function *,
                         MPI_Win_delete_attr_function *, int *, void *);
int PMPI_Win_delete_attr(MPI_Win, int);
int PMPI_Win_free_keyval(int *);
int PMPI_Win_get_attr(MPI_Win, int, void *, int *);
int PMPI_Win_get_name(MPI_Win, char *, int *);
int PMPI_Win_set_attr(MPI_Win, int, void *);
int PMPI_Win_set_name(MPI_Win, char *);




int PMPI_Type_create_f90_integer( int, MPI_Datatype * );
int PMPI_Type_create_f90_real( int, int, MPI_Datatype * );
int PMPI_Type_create_f90_complex( int, int, MPI_Datatype * );


int PMPI_Alloc_mem(MPI_Aint, MPI_Info info, void *baseptr);
int PMPI_Comm_create_errhandler(MPI_Comm_errhandler_function *, MPI_Errhandler *);
int PMPI_Comm_get_errhandler(MPI_Comm, MPI_Errhandler *);
int PMPI_Comm_set_errhandler(MPI_Comm, MPI_Errhandler);
int PMPI_File_create_errhandler(MPI_File_errhandler_function *, MPI_Errhandler *);
int PMPI_File_get_errhandler(MPI_File, MPI_Errhandler *);
int PMPI_File_set_errhandler(MPI_File, MPI_Errhandler);
int PMPI_Finalized(int *);
int PMPI_Free_mem(void *);
int PMPI_Get_address( void *, MPI_Aint *);
int PMPI_Info_create(MPI_Info *);
int PMPI_Info_delete(MPI_Info, char *);
int PMPI_Info_dup(MPI_Info, MPI_Info *);
int PMPI_Info_free(MPI_Info *info);
int PMPI_Info_get(MPI_Info, char *, int, char *, int *);
int PMPI_Info_get_nkeys(MPI_Info, int *);
int PMPI_Info_get_nthkey(MPI_Info, int, char *);
int PMPI_Info_get_valuelen(MPI_Info, char *, int *, int *);
int PMPI_Info_set(MPI_Info, char *, char *);
int PMPI_Pack_external( char *, void *, int, MPI_Datatype, void *,
                       MPI_Aint, MPI_Aint *) ;
int PMPI_Pack_external_size( char *, int, MPI_Datatype, MPI_Aint *);
int PMPI_Request_get_status(MPI_Request, int *, MPI_Status *);
int PMPI_Status_c2f( MPI_Status *, MPI_Fint *);
int PMPI_Status_f2c( MPI_Fint *, MPI_Status *);
int PMPI_Type_create_darray(int, int, int, int [], int [],
                            int [], int [], int,
                           MPI_Datatype, MPI_Datatype *);
int PMPI_Type_create_hindexed(int, int [], MPI_Aint [], MPI_Datatype,
                             MPI_Datatype *);
int PMPI_Type_create_hvector(int, int, MPI_Aint, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_create_indexed_block(int, int, int [], MPI_Datatype,
                                  MPI_Datatype *);
int PMPIX_Type_create_hindexed_block(int, int, const MPI_Aint [], MPI_Datatype, MPI_Datatype *);
int PMPI_Type_create_resized(MPI_Datatype, MPI_Aint, MPI_Aint, MPI_Datatype *);
int PMPI_Type_create_struct(int, int [], MPI_Aint [],
                            MPI_Datatype [], MPI_Datatype *);
int PMPI_Type_create_subarray(int, int [], int [], int [],
                              int, MPI_Datatype, MPI_Datatype *);
int PMPI_Type_get_extent(MPI_Datatype, MPI_Aint *, MPI_Aint *);
int PMPI_Type_get_true_extent(MPI_Datatype, MPI_Aint *, MPI_Aint *);
int PMPI_Unpack_external( char *, void *, MPI_Aint, MPI_Aint *, void *,
                         int, MPI_Datatype) ;
int PMPI_Win_create_errhandler(MPI_Win_errhandler_function *, MPI_Errhandler *);
int PMPI_Win_get_errhandler(MPI_Win, MPI_Errhandler *);
int PMPI_Win_set_errhandler(MPI_Win, MPI_Errhandler);
int PMPI_Reduce_local( void *inbuf, void *inoutbuf, int count, MPI_Datatype datatype, MPI_Op op) ;
int PMPI_Op_commutative(MPI_Op op, int *commute);
int PMPI_Reduce_scatter_block( void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm) ;
int PMPI_Dist_graph_create_adjacent(MPI_Comm comm_old, int indegree, int [], int [], int outdegree, int [], int [], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph);
int PMPI_Dist_graph_create(MPI_Comm comm_old, int n, int [], int [], int [], int [], MPI_Info info, int reorder, MPI_Comm *comm_dist_graph);
int PMPI_Dist_graph_neighbors_count(MPI_Comm comm, int *indegree, int *outdegree, int *weighted);
int PMPI_Dist_graph_neighbors(MPI_Comm comm, int maxindegree, int [], int [], int maxoutdegree, int [], int []);
int PMPIX_Comm_idup(MPI_Comm comm, MPI_Comm *newcomm, MPI_Request *request);
int PMPIX_Improbe(int source, int tag, MPI_Comm comm, int *flag, MPIX_Message *message, MPI_Status *status);
int PMPIX_Imrecv(void *buf, int count, MPI_Datatype datatype, MPIX_Message *message, MPI_Request *request) ;
int PMPIX_Mprobe(int source, int tag, MPI_Comm comm, MPIX_Message *message, MPI_Status *status);
int PMPIX_Mrecv(void *buf, int count, MPI_Datatype datatype, MPIX_Message *message, MPI_Status *status) ;
int PMPIX_Ibarrier(MPI_Comm comm, MPI_Request *request);
int PMPIX_Ibcast(void *buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Igather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Igatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int *recvcounts, const int *displs, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iscatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iscatterv(const void *sendbuf, const int *sendcounts, const int *displs, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iallgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iallgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int *recvcounts, const int *displs, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ialltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ialltoallv(const void *sendbuf, const int *sendcounts, const int *sdispls, MPI_Datatype sendtype, void *recvbuf, const int *recvcounts, const int *rdispls, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ialltoallw(const void *sendbuf, const int *sendcounts, const int *sdispls, const MPI_Datatype *sendtypes, void *recvbuf, const int *recvcounts, const int *rdispls, const MPI_Datatype *recvtypes, MPI_Comm comm, MPI_Request *request);
int PMPIX_Ireduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iallreduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ireduce_scatter(const void *sendbuf, void *recvbuf, const int *recvcounts, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ireduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iscan(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Iexscan(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ineighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ineighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ineighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ineighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request) ;
int PMPIX_Ineighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm, MPI_Request *request);
int PMPIX_Neighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm) ;
int PMPIX_Neighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, MPI_Comm comm) ;
int PMPIX_Neighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm) ;
int PMPIX_Neighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm) ;
int PMPIX_Neighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm);
int PMPIX_Comm_split_type(MPI_Comm comm, int split_type, int key, MPI_Info info, MPI_Comm *newcomm);
int PMPIX_Comm_create_group(MPI_Comm comm, MPI_Group group, int tag, MPI_Comm * newcomm);
int PMPIX_T_init_thread(int required, int *provided);
int PMPIX_T_finalize(void);
int PMPIX_T_enum_get_info(MPIX_T_enum enumtype, int num, char *name, int *name_len);
int PMPIX_T_enum_get_item(MPIX_T_enum enumtype, int num, int *value, char *name, int *name_len);
int PMPIX_T_cvar_get_num(int *num_cvar);
int PMPIX_T_cvar_get_info(int cvar_index, char *name, int *name_len, int *verbosity, MPI_Datatype *datatype, MPIX_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *scope);
int PMPIX_T_cvar_handle_alloc(int cvar_index, void *obj_handle, MPIX_T_cvar_handle *handle, int *count);
int PMPIX_T_cvar_handle_free(MPIX_T_cvar_handle *handle);
int PMPIX_T_cvar_read(MPIX_T_cvar_handle handle, void *buf);
int PMPIX_T_cvar_write(MPIX_T_cvar_handle handle, void *buf);
int PMPIX_T_pvar_get_num(int *num_pvar);
int PMPIX_T_pvar_get_info(int pvar_index, char *name, int *name_len, int *verbosity, int *var_class, MPI_Datatype *datatype, MPIX_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *readonly, int *continuous, int *atomic);
int PMPIX_T_pvar_session_create(MPIX_T_pvar_session *session);
int PMPIX_T_pvar_session_free(MPIX_T_pvar_session *session);
int PMPIX_T_pvar_handle_alloc(MPIX_T_pvar_session session, int pvar_index, void *obj_handle, MPIX_T_pvar_handle *handle, int *count);
int PMPIX_T_pvar_handle_free(MPIX_T_pvar_session session, MPIX_T_pvar_handle *handle);
int PMPIX_T_pvar_start(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle);
int PMPIX_T_pvar_stop(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle);
int PMPIX_T_pvar_read(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle, void *buf);
int PMPIX_T_pvar_write(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle, void *buf);
int PMPIX_T_pvar_reset(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle);
int PMPIX_T_pvar_readreset(MPIX_T_pvar_session session, MPIX_T_pvar_handle handle, void *buf);
int PMPIX_T_category_get_num(int *num_cat);
int PMPIX_T_category_get_info(int cat_index, char *name, int *name_len, char *desc, int *desc_len, int *num_controlvars, int *num_pvars, int *num_categories);
int PMPIX_T_category_get_cvars(int cat_index, int len, int indices[]);
int PMPIX_T_category_get_pvars(int cat_index[], int len, int indices[]);
int PMPIX_T_category_get_categories(int cat_index, int len, int indices[]);
int PMPIX_T_category_changed(int *stamp);
# 1691 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
# 1 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h" 1
# 13 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h"
# 1 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h" 1
# 14 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h" 2
# 119 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h"
int MPI_File_open(MPI_Comm, char *, int, MPI_Info, MPI_File *);
int MPI_File_close(MPI_File *);
int MPI_File_delete( char *, MPI_Info);
int MPI_File_set_size(MPI_File, MPI_Offset);
int MPI_File_preallocate(MPI_File, MPI_Offset);
int MPI_File_get_size(MPI_File, MPI_Offset *);
int MPI_File_get_group(MPI_File, MPI_Group *);
int MPI_File_get_amode(MPI_File, int *);
int MPI_File_set_info(MPI_File, MPI_Info);
int MPI_File_get_info(MPI_File, MPI_Info *);


int MPI_File_set_view(MPI_File, MPI_Offset, MPI_Datatype,
          MPI_Datatype, char *, MPI_Info);
int MPI_File_get_view(MPI_File, MPI_Offset *,
                 MPI_Datatype *, MPI_Datatype *, char *);


int MPI_File_read_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;
int MPI_File_read_at_all(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;
int MPI_File_write_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;
int MPI_File_write_at_all(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;





int MPI_File_iread_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Request *)
              ;
int MPI_File_iwrite_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Request *)
              ;


int MPI_File_read(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                  ;
int MPI_File_read_all(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                      ;
int MPI_File_write(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                   ;
int MPI_File_write_all(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                       ;





int MPI_File_iread(MPI_File, void *, int, MPI_Datatype, MPI_Request *)
                   ;
int MPI_File_iwrite(MPI_File, void *, int, MPI_Datatype, MPI_Request *)
                    ;

int MPI_File_seek(MPI_File, MPI_Offset, int);
int MPI_File_get_position(MPI_File, MPI_Offset *);
int MPI_File_get_byte_offset(MPI_File, MPI_Offset, MPI_Offset *);


int MPI_File_read_shared(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                         ;
int MPI_File_write_shared(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                          ;
int MPI_File_iread_shared(MPI_File, void *, int, MPI_Datatype, MPI_Request *)
                          ;
int MPI_File_iwrite_shared(MPI_File, void *, int,
      MPI_Datatype, MPI_Request *)
                           ;
int MPI_File_read_ordered(MPI_File, void *, int,
                          MPI_Datatype, MPI_Status *)
                          ;
int MPI_File_write_ordered(MPI_File, void *, int,
                           MPI_Datatype, MPI_Status *)
                           ;
int MPI_File_seek_shared(MPI_File, MPI_Offset, int);
int MPI_File_get_position_shared(MPI_File, MPI_Offset *);


int MPI_File_read_at_all_begin(MPI_File, MPI_Offset, void *,
                               int, MPI_Datatype)
                               ;
int MPI_File_read_at_all_end(MPI_File, void *, MPI_Status *);
int MPI_File_write_at_all_begin(MPI_File, MPI_Offset, void *,
                                int, MPI_Datatype)
                                ;
int MPI_File_write_at_all_end(MPI_File, void *, MPI_Status *);
int MPI_File_read_all_begin(MPI_File, void *, int, MPI_Datatype)
                            ;
int MPI_File_read_all_end(MPI_File, void *, MPI_Status *);
int MPI_File_write_all_begin(MPI_File, void *, int, MPI_Datatype)
                             ;
int MPI_File_write_all_end(MPI_File, void *, MPI_Status *);
int MPI_File_read_ordered_begin(MPI_File, void *, int, MPI_Datatype)
                                ;
int MPI_File_read_ordered_end(MPI_File, void *, MPI_Status *);
int MPI_File_write_ordered_begin(MPI_File, void *, int, MPI_Datatype)
                                 ;
int MPI_File_write_ordered_end(MPI_File, void *, MPI_Status *);


int MPI_File_get_type_extent(MPI_File, MPI_Datatype, MPI_Aint *);


int MPI_Register_datarep( char *,
    MPI_Datarep_conversion_function *,
    MPI_Datarep_conversion_function *,
    MPI_Datarep_extent_function *,
    void *);


int MPI_File_set_atomicity(MPI_File, int);
int MPI_File_get_atomicity(MPI_File, int *);
int MPI_File_sync(MPI_File);
# 272 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h"
MPI_File MPI_File_f2c(MPI_Fint);
MPI_Fint MPI_File_c2f(MPI_File);
# 329 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h"
int PMPI_File_open(MPI_Comm, char *, int, MPI_Info, MPI_File *);
int PMPI_File_close(MPI_File *);
int PMPI_File_delete( char *, MPI_Info);
int PMPI_File_set_size(MPI_File, MPI_Offset);
int PMPI_File_preallocate(MPI_File, MPI_Offset);
int PMPI_File_get_size(MPI_File, MPI_Offset *);
int PMPI_File_get_group(MPI_File, MPI_Group *);
int PMPI_File_get_amode(MPI_File, int *);
int PMPI_File_set_info(MPI_File, MPI_Info);
int PMPI_File_get_info(MPI_File, MPI_Info *);


int PMPI_File_set_view(MPI_File, MPI_Offset,
    MPI_Datatype, MPI_Datatype, char *, MPI_Info);
int PMPI_File_get_view(MPI_File, MPI_Offset *,
      MPI_Datatype *, MPI_Datatype *, char *);


int PMPI_File_read_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;
int PMPI_File_read_at_all(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;
int PMPI_File_write_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;
int PMPI_File_write_at_all(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Status *)
              ;





int PMPI_File_iread_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Request *)
              ;
int PMPI_File_iwrite_at(MPI_File, MPI_Offset, void *,
       int, MPI_Datatype, MPI_Request *)
              ;


int PMPI_File_read(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                   ;
int PMPI_File_read_all(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                       ;
int PMPI_File_write(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                    ;
int PMPI_File_write_all(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                        ;





int PMPI_File_iread(MPI_File, void *, int, MPI_Datatype, MPI_Request *)
                    ;
int PMPI_File_iwrite(MPI_File, void *, int, MPI_Datatype, MPI_Request *)
                     ;

int PMPI_File_seek(MPI_File, MPI_Offset, int);
int PMPI_File_get_position(MPI_File, MPI_Offset *);
int PMPI_File_get_byte_offset(MPI_File, MPI_Offset, MPI_Offset *);


int PMPI_File_read_shared(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                          ;
int PMPI_File_write_shared(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                           ;
int PMPI_File_iread_shared(MPI_File, void *, int,
      MPI_Datatype, MPI_Request *)
                           ;
int PMPI_File_iwrite_shared(MPI_File, void *, int,
       MPI_Datatype, MPI_Request *)
                            ;
int PMPI_File_read_ordered(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                           ;
int PMPI_File_write_ordered(MPI_File, void *, int, MPI_Datatype, MPI_Status *)
                            ;
int PMPI_File_seek_shared(MPI_File, MPI_Offset, int);
int PMPI_File_get_position_shared(MPI_File, MPI_Offset *);


int PMPI_File_read_at_all_begin(MPI_File, MPI_Offset, void *,
                               int, MPI_Datatype)
                               ;
int PMPI_File_read_at_all_end(MPI_File, void *, MPI_Status *);
int PMPI_File_write_at_all_begin(MPI_File, MPI_Offset, void *,
                                 int, MPI_Datatype)
                                 ;
int PMPI_File_write_at_all_end(MPI_File, void *, MPI_Status *);
int PMPI_File_read_all_begin(MPI_File, void *, int, MPI_Datatype)
                             ;
int PMPI_File_read_all_end(MPI_File, void *, MPI_Status *);
int PMPI_File_write_all_begin(MPI_File, void *, int, MPI_Datatype)
                              ;
int PMPI_File_write_all_end(MPI_File, void *, MPI_Status *);
int PMPI_File_read_ordered_begin(MPI_File, void *, int, MPI_Datatype)
                                 ;
int PMPI_File_read_ordered_end(MPI_File, void *, MPI_Status *);
int PMPI_File_write_ordered_begin(MPI_File, void *, int, MPI_Datatype)
                                  ;
int PMPI_File_write_ordered_end(MPI_File, void *, MPI_Status *);


int PMPI_File_get_type_extent(MPI_File, MPI_Datatype, MPI_Aint *);


int PMPI_Register_datarep( char *,
    MPI_Datarep_conversion_function *,
    MPI_Datarep_conversion_function *,
    MPI_Datarep_extent_function *,
    void *);


int PMPI_File_set_atomicity(MPI_File, int);
int PMPI_File_get_atomicity(MPI_File, int *);
int PMPI_File_sync(MPI_File);
# 467 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpio.h"
MPI_File PMPI_File_f2c(MPI_Fint);
MPI_Fint PMPI_File_c2f(MPI_File);
# 1692 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h" 2
# 1714 "/opt/ibmhpc/pecurrent/mpich2/gnu/include64/mpi.h"
typedef int (MPIX_Grequest_poll_function)(void *, MPI_Status *);
typedef int (MPIX_Grequest_wait_function)(int, void **, double, MPI_Status *);

typedef int MPIX_Grequest_class;
int MPIX_Grequest_class_create(MPI_Grequest_query_function *,
                       MPI_Grequest_free_function *,
                       MPI_Grequest_cancel_function *,
         MPIX_Grequest_poll_function *,
         MPIX_Grequest_wait_function *,
         MPIX_Grequest_class *);

int MPIX_Grequest_class_allocate(MPIX_Grequest_class,
         void *,
         MPI_Request *);

int MPIX_Grequest_start(MPI_Grequest_query_function *,
                       MPI_Grequest_free_function *,
                       MPI_Grequest_cancel_function *,
         MPIX_Grequest_poll_function *,
         MPIX_Grequest_wait_function *, void *, MPI_Request *);

int PMPIX_Grequest_class_create(MPI_Grequest_query_function *,
                       MPI_Grequest_free_function *,
                       MPI_Grequest_cancel_function *,
         MPIX_Grequest_poll_function *,
         MPIX_Grequest_wait_function *,
         MPIX_Grequest_class *);

int PMPIX_Grequest_class_allocate(MPIX_Grequest_class,
         void *,
         MPI_Request *);
int PMPIX_Grequest_start(MPI_Grequest_query_function *,
                       MPI_Grequest_free_function *,
                       MPI_Grequest_cancel_function *,
         MPIX_Grequest_poll_function *,
         MPIX_Grequest_wait_function *, void *, MPI_Request *);
# 35 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c" 2

int pe, npes;
# 78 "/iitm1/cccr/sandeep/iitm-esm-preind-volcano/iitm-esm-cmip6/src/mom4p1/src/shared/mpp/threadloc.c"
int mld_id_() {
  return 0;
}
