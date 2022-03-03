
















































































 























 

 








 


 

















 



 

















 










































































 


 


 







 




 

 


 

 

 

 




 



 

















 















 








 






 









 

 







 


 


 















 


 



 

 



 





 



 


 


 


 






 


 


 


 
 










 







 



 



 


 



 

 



 

 






 




 


 


 

 


 









 



 




 

 



 




 


 




 


 





 


 





 







 
















 


 
















 








 










 

















 


 


















 


 


















 



 
















 


 


 
















 



 




 















 




 
typedef float float_t;		 
typedef double double_t;	
 

 


 







 





















 

























 



 


 
extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));




 
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));


 


 
 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 
extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));



 


 
 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));



 


 
extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));



 
extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));



 
extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));


 
extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));



 
extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));




 
extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));




 
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));




 

















 

























 



 


 
extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));




 
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 


 
 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 
extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));



 


 
 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));



 


 
extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));



 
extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));



 
extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));


 
extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));



 
extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));




 
extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));




 
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));



 

















 

























 



 


 
extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 

 
extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




 
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
 
extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 


 
 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));

 
 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 
extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 


 
 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



 


 
extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



 
extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));



 
extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));




 
extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));


 


 
extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


 
extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));

 
extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 
extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));

 
extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


 
extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));




 
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));




 
extern int signgam;


 
































 

 
enum
  {
    FP_NAN =
      0,
    FP_INFINITE =
      1,
    FP_ZERO =
      2,
    FP_SUBNORMAL =
      3,
    FP_NORMAL =
      4
  };

 

 

 

 


 

 

 



 



 
typedef enum
{
  _IEEE_ = -1,	 
  _SVID_,	 
  _XOPEN_,	 
  _POSIX_,
  _ISOC_	 
} _LIB_VERSION_TYPE;



 
extern _LIB_VERSION_TYPE _LIB_VERSION;






 
struct exception
  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };

extern int matherr (struct exception *__exc);


 

 



 



 




 






 

 
















 




 


 


 
extern __inline __attribute__ ((__always_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) __signbitf (float __x)
{
  int __m;
  __asm ("pmovmskb %1, %0" : "=r" (__m) : "x" (__x));
  return (__m & 0x8) != 0;
}
extern __inline __attribute__ ((__always_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) __signbit (double __x)
{
  int __m;
  __asm ("pmovmskb %1, %0" : "=r" (__m) : "x" (__x));
  return (__m & 0x80) != 0;
}
extern __inline __attribute__ ((__always_inline__)) int
__attribute__ ((__nothrow__ , __leaf__)) __signbitl (long double __x)
{
  __extension__ union { long double __l; int __i[3]; } __u = { __l: __x };
  return (__u.__i[2] & 0x8000) != 0;
}





 



 


 

 

 

 

 

 

 

 








 













 






 

extern int fpclassifyf    ( float              __x ) ;
extern int fpclassify     ( double           __x ) ;
extern int fpclassifyd    ( double             __x ) ;
extern int fpclassifyl    ( long double            __x ) ;

extern int __fpclassifyf  ( float              __x ) ;
extern int __fpclassify   ( double           __x ) ;
extern int __fpclassifyd  ( double             __x ) ;
extern int __fpclassifyl  ( long double            __x ) ;

extern int isinff         ( float              __x ) ;
extern int isinf          ( double           __x ) ;
extern int isinfd         ( double             __x ) ;
extern int isinfl         ( long double            __x ) ;

extern int __isinff       ( float              __x ) ;
extern int __isinf        ( double           __x ) ;
extern int __isinfd       ( double             __x ) ;
extern int __isinfl       ( long double            __x ) ;

extern int isnanf         ( float              __x ) ;
extern int isnan          ( double           __x ) ;
extern int isnand         ( double             __x ) ;
extern int isnanl         ( long double            __x ) ;

extern int __isnanf       ( float              __x ) ;
extern int __isnan        ( double           __x ) ;
extern int __isnand       ( double             __x ) ;
extern int __isnanl       ( long double            __x ) ;

extern int isnormalf      ( float              __x ) ;
extern int isnormal       ( double           __x ) ;
extern int isnormald      ( double             __x ) ;
extern int isnormall      ( long double            __x ) ;

extern int __isnormalf    ( float              __x ) ;
extern int __isnormal     ( double           __x ) ;
extern int __isnormald    ( double             __x ) ;
extern int __isnormall    ( long double            __x ) ;

extern int isfinitef      ( float              __x ) ;
extern int isfinite       ( double           __x ) ;
extern int isfinited      ( double             __x ) ;
extern int isfinitel      ( long double            __x ) ;

extern int __isfinitef    ( float              __x ) ;
extern int __isfinite     ( double           __x ) ;
extern int __isfinited    ( double             __x ) ;
extern int __isfinitel    ( long double            __x ) ;

extern int finitef        ( float              __x ) ;
extern int finite         ( double             __x ) ;
extern int finited        ( double             __x ) ;
extern int finitel        ( long double            __x ) ;

extern int __finitef      ( float              __x ) ;
extern int __finite       ( double             __x ) ;
extern int __finited      ( double             __x ) ;
extern int __finitel      ( long double            __x ) ;

extern int signbitf       ( float              __x ) ;
extern int signbit        ( double             __x ) ;
extern int signbitd       ( double             __x ) ;
extern int signbitl       ( long double            __x ) ;

extern int __signbitf     ( float              __x ) ;
extern int __signbit      ( double             __x ) ;
extern int __signbitd     ( double             __x ) ;
extern int __signbitl     ( long double            __x ) ;







 

extern int isgreaterf( float __xf, float __yf );
extern int isgreater( double __xd, double __yd );
extern int isgreaterl( long double __xl, long double __yl );
extern int __isgreaterf( float __xf, float __yf );
extern int __isgreater( double __xd, double __yd );
extern int __isgreaterl( long double __xl, long double __yl );

extern int isgreaterequalf( float __xf, float __yf );
extern int isgreaterequal( double __xd, double __yd );
extern int isgreaterequall( long double __xl, long double __yl );
extern int __isgreaterequalf( float __xf, float __yf );
extern int __isgreaterequal( double __xd, double __yd );
extern int __isgreaterequall( long double __xl, long double __yl );

extern int islessf( float __xf, float __yf );
extern int isless( double __xd, double __yd );
extern int islessl( long double __xl, long double __yl );
extern int __islessf( float __xf, float __yf );
extern int __isless( double __xd, double __yd );
extern int __islessl( long double __xl, long double __yl );

extern int islessequalf( float __xf, float __yf );
extern int islessequal( double __xd, double __yd );
extern int islessequall( long double __xl, long double __yl );
extern int __islessequalf( float __xf, float __yf );
extern int __islessequal( double __xd, double __yd );
extern int __islessequall( long double __xl, long double __yl );

extern int islessgreaterf( float __xf, float __yf );
extern int islessgreater( double __xd, double __yd );
extern int islessgreaterl( long double __xl, long double __yl );
extern int __islessgreaterf( float __xf, float __yf );
extern int __islessgreater( double __xd, double __yd );
extern int __islessgreaterl( long double __xl, long double __yl );

extern int isunorderedf( float __xf, float __yf );
extern int isunordered( double __xd, double __yd );
extern int isunorderedl( long double __xl, long double __yl );
extern int __isunorderedf( float __xf, float __yf );
extern int __isunordered( double __xd, double __yd );
extern int __isunorderedl( long double __xl, long double __yl );



 

 



extern double    cot( double __x );
extern float     cotf( float __x );
extern long double   cotl( long double __x );


 

extern double    cosd( double __x );
extern float     cosdf( float __x );
extern long double   cosdl( long double __x );

extern double    sind( double __x );
extern float     sindf( float __x );
extern long double   sindl( long double __x );

extern double    tand( double __x );
extern float     tandf( float __x );
extern long double   tandl( long double __x );

extern double    cotd( double __x );
extern float     cotdf( float __x );
extern long double   cotdl( long double __x );

extern double    acosd( double __x );
extern float     acosdf( float __x );
extern long double   acosdl( long double __x );

extern double    asind( double __x );
extern float     asindf( float __x );
extern long double   asindl( long double __x );

extern double    atand( double __x );
extern float     atandf( float __x );
extern long double   atandl( long double __x );

extern double    atand2( double __y, double __x );
extern float     atand2f( float __y, float __x );
extern long double   atand2l( long double __y, long double __x );

extern double    atan2d( double __y, double __x );
extern float     atan2df( float __y, float __x );
extern long double   atan2dl( long double __y, long double __x );

extern void      sincosd( double __x, double *__psin, double *__pcos );
extern void      sincosdf( float __x, float *__psin, float *__pcos );
extern void      sincosdl( long double __x, long double *__psin, long double *__pcos );

 


extern void      sinhcosh( double __x, double *__psinh, double *__pcosh );
extern void      sinhcoshf( float __x, float *__psinh, float *__pcosh );
extern void      sinhcoshl( long double __x, long double *__psinh, long double *__pcosh );



 












 







 





extern double    invsqrt( double __x );
extern float     invsqrtf( float __x );
extern long double   invsqrtl( long double __x );

 


extern double    cdfnorm( double __x );
extern float     cdfnormf( float __x );
extern double    cdfnorminv( double __x );
extern float     cdfnorminvf( float __x );

extern double    erfinv( double __x );
extern float     erfinvf( float __x );
extern long double   erfinvl( long double __x );
extern double    erfcinv( double __x );
extern float     erfcinvf( float __x );

extern double    gamma_r( double __x, int *__signgam );
extern float     gammaf_r( float __x, int *__signgam );
extern long double   gammal_r( long double __x, int *__signgam );




 







 





 




 


 

extern double    annuity( double __x, double __y );
extern double    compound( double __x, double __y );

extern float     annuityf( float __x, float __y );
extern long double   annuityl( long double __x, long double __y );

extern float     compoundf( float __x, float __y );
extern long double   compoundl( long double __x, long double __y );









 

 


typedef struct ____exception {
    int     type;
    const char  *name;
    double  arg1;
    double  arg2;
    double  retval;
} ___exception;


typedef struct ____exceptionf {
    int    type;
    const char *name;
    float  arg1;
    float  arg2;
    float  retval;
} ___exceptionf;

typedef struct ____exceptionl {
    int      type;
    const char   *name;
    long double  arg1;
    long double  arg2;
    long double  retval;
} ___exceptionl;

extern int  matherrf( struct ____exceptionf *__e );
extern int  matherrl( struct ____exceptionl *__e );
















 

typedef int (  *___pmatherr )( struct ____exception  *__e );
typedef int (  *___pmatherrf )( struct ____exceptionf *__e );
typedef int (  *___pmatherrl )( struct ____exceptionl *__e );

extern ___pmatherr   __libm_setusermatherr( ___pmatherr  __user_matherr );
extern ___pmatherrf  __libm_setusermatherrf( ___pmatherrf __user_matherrf );
extern ___pmatherrl  __libm_setusermatherrl( ___pmatherrl __user_matherrl );

 


extern _LIB_VERSION_TYPE  _LIB_VERSIONIMF;




















 



 




































 
typedef long ptrdiff_t;

typedef unsigned long size_t;


 

 
typedef int wchar_t;






 

















 



 


 


 

 
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

 
typedef long int __fsword_t;

typedef long int __ssize_t;  

 
typedef long int __syscall_slong_t;
 
typedef unsigned long int __syscall_ulong_t;


 
typedef __off64_t __loff_t;	 
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;

 
typedef long int __intptr_t;

 
typedef unsigned int __socklen_t;






 
struct _IO_FILE;


 
typedef struct _IO_FILE FILE;






 
typedef struct _IO_FILE __FILE;





























 



 


 
































 



 

 






 















 




 




 
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;		 
} __mbstate_t;



 



 
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


 



 


 

 








 























 


typedef __builtin_va_list va_list;



 


 
typedef __builtin_va_list __gnuc_va_list;










 



 


struct _IO_jump_t;  struct _IO_FILE;

 
typedef void _IO_lock_t;


 

struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;
  
 
   
  int _pos;
};

 
enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};


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
  __off64_t _offset;
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


 


 
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);






 
typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
				 size_t __n);






 
typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);

 
typedef int __io_close_fn (void *__cookie);





extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);





extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);

 

extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));


extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
			__gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
			 __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));





typedef __gnuc_va_list va_list;

typedef __off_t off_t;

typedef __ssize_t ssize_t;

 

typedef _G_fpos_t fpos_t;


 


 



 



 


 










 















 







 
extern struct _IO_FILE *stdin;		 
extern struct _IO_FILE *stdout;		 
extern struct _IO_FILE *stderr;		 
 


 
extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));
 
extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));


 
extern int renameat (int __oldfd, const char *__old, int __newfd,
		     const char *__new) __attribute__ ((__nothrow__ , __leaf__));





 
extern FILE *tmpfile (void) ;


 
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;



 
extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;








 
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;






 
extern int fclose (FILE *__stream);



 
extern int fflush (FILE *__stream);







 
extern int fflush_unlocked (FILE *__stream);







 
extern FILE *fopen (const char *__restrict __filename,
		    const char *__restrict __modes) ;



 
extern FILE *freopen (const char *__restrict __filename,
		      const char *__restrict __modes,
		      FILE *__restrict __stream) ;


 
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;


 
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;



 
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;




 
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


 
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
		    int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));



 
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
		       size_t __size) __attribute__ ((__nothrow__ , __leaf__));

 
extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));






 
extern int fprintf (FILE *__restrict __stream,
		    const char *__restrict __format, ...);



 
extern int printf (const char *__restrict __format, ...);
 
extern int sprintf (char *__restrict __s,
		    const char *__restrict __format, ...) __attribute__ ((__nothrow__));




 
extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
		     __gnuc_va_list __arg);



 
extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);
 
extern int vsprintf (char *__restrict __s, const char *__restrict __format,
		     __gnuc_va_list __arg) __attribute__ ((__nothrow__));



 
extern int snprintf (char *__restrict __s, size_t __maxlen,
		     const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
		      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));



 
extern int vdprintf (int __fd, const char *__restrict __fmt,
		     __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));






 
extern int fscanf (FILE *__restrict __stream,
		   const char *__restrict __format, ...) ;



 
extern int scanf (const char *__restrict __format, ...) ;
 
extern int sscanf (const char *__restrict __s,
		   const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));



 
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__));







 
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
		    __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;




 
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;

 
extern int vsscanf (const char *__restrict __s,
		    const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));



 
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__format__ (__scanf__, 2, 0)));








 
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);




 
extern int getchar (void);



 




 
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);






 
extern int fgetc_unlocked (FILE *__stream);









 
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);




 
extern int putchar (int __c);



 






 
extern int fputc_unlocked (int __c, FILE *__stream);




 
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);


 
extern int getw (FILE *__stream);

 
extern int putw (int __w, FILE *__stream);






 
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;











 
extern char *gets (char *__s)  __attribute__ ((__deprecated__));













 
extern __ssize_t __getdelim (char **__restrict __lineptr,
			       size_t *__restrict __n, int __delimiter,
			       FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
			     size_t *__restrict __n, int __delimiter,
			     FILE *__restrict __stream) ;






 
extern __ssize_t getline (char **__restrict __lineptr,
			    size_t *__restrict __n,
			    FILE *__restrict __stream) ;






 
extern int fputs (const char *__restrict __s, FILE *__restrict __stream);




 
extern int puts (const char *__s);





 
extern int ungetc (int __c, FILE *__stream);





 
extern size_t fread (void *__restrict __ptr, size_t __size,
		     size_t __n, FILE *__restrict __stream) ;



 
extern size_t fwrite (const void *__restrict __ptr, size_t __size,
		      size_t __n, FILE *__restrict __s);








 
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
			      size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
			       size_t __n, FILE *__restrict __stream);






 
extern int fseek (FILE *__stream, long int __off, int __whence);



 
extern long int ftell (FILE *__stream) ;



 
extern void rewind (FILE *__stream);





 




 
extern int fseeko (FILE *__stream, __off_t __off, int __whence);



 
extern __off_t ftello (FILE *__stream) ;





 
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);



 
extern int fsetpos (FILE *__stream, const fpos_t *__pos);




 
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
 
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
 
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


 
extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;






 
extern void perror (const char *__s);





 
















 


 

extern int sys_nerr;
extern const char *const sys_errlist[];


 
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

 
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;





 
extern FILE *popen (const char *__command, const char *__modes) ;




 
extern int pclose (FILE *__stream);


 
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));






 

 
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

 
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



 
















 





 
 
extern __inline int
vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
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




 
extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x10) != 0);
}

 
extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x20) != 0);
}



 


 



















 



 



 































 



 

 






 




 
















 



 

 

















 



 


 

 

 

 

 

 


 

 

 


















 









 


 
 




 




 
















 



 


 

 

 
















 



 

static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}


 

static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}







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





 





 

 
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));


 


 
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



 



 


 
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;



 
extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
 
extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
 
extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



 
__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



 
extern double strtod (const char *__restrict __nptr,
		      char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern float strtof (const char *__restrict __nptr,
		     char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
			    char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern long int strtol (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
extern unsigned long int strtoul (const char *__restrict __nptr,
				  char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
__extension__
extern long long int strtoq (const char *__restrict __nptr,
			     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
				       char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
__extension__
extern long long int strtoll (const char *__restrict __nptr,
			      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
 
__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
					char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void*)0), 10);
}
extern __inline long int
__attribute__ ((__nothrow__ , __leaf__)) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void*)0), 10);
}



__extension__ extern __inline long long int
__attribute__ ((__nothrow__ , __leaf__)) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void*)0), 10);
}





 
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;

 
extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

















 



 






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;

typedef __loff_t loff_t;

typedef __ino_t ino_t;

typedef __dev_t dev_t;

typedef __gid_t gid_t;

typedef __mode_t mode_t;

typedef __nlink_t nlink_t;

typedef __uid_t uid_t;


typedef __pid_t pid_t;

typedef __id_t id_t;


typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;

typedef __key_t key_t;
















 



 







 
typedef __clock_t clock_t;







 
typedef __time_t time_t;






 
typedef __clockid_t clockid_t;




 
typedef __timer_t timer_t;







































 



 

 






 

 
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;

 


 

typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));

typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));



 


 

 
















 

 



 

 















 


 


 







 
















 


typedef int __sig_atomic_t;

 

typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;







 


typedef __sigset_t sigset_t;

 















 



 












 
struct timespec
  {
    __time_t tv_sec;		 
    __syscall_slong_t tv_nsec;	 
  };




















 



 



 
struct timeval
  {
    __time_t tv_sec;		 
    __suseconds_t tv_usec;	 
  };



typedef __suseconds_t suseconds_t;


 
typedef long int __fd_mask;

 
 

 
typedef struct
  {
    
 
    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
  } fd_set;

 

 
typedef __fd_mask fd_mask;

 


 











 
extern int select (int __nfds, fd_set *__restrict __readfds,
		   fd_set *__restrict __writefds,
		   fd_set *__restrict __exceptfds,
		   struct timeval *__restrict __timeout);






 
extern int pselect (int __nfds, fd_set *__restrict __readfds,
		    fd_set *__restrict __writefds,
		    fd_set *__restrict __exceptfds,
		    const struct timespec *__restrict __timeout,
		    const __sigset_t *__restrict __sigmask);


 




 
















 





__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
					       unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

__extension__ extern __inline __attribute__ ((__const__)) unsigned int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_major (unsigned long long int __dev)
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}

__extension__ extern __inline __attribute__ ((__const__)) unsigned int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_minor (unsigned long long int __dev)
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}

__extension__ extern __inline __attribute__ ((__const__)) unsigned long long int
__attribute__ ((__nothrow__ , __leaf__)) gnu_dev_makedev (unsigned int __major, unsigned int __minor)
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
	  | (((unsigned long long int) (__minor & ~0xff)) << 12)
	  | (((unsigned long long int) (__major & ~0xfff)) << 32));
}


 



typedef __blksize_t blksize_t;

 
typedef __blkcnt_t blkcnt_t;	  
typedef __fsblkcnt_t fsblkcnt_t;  
typedef __fsfilcnt_t fsfilcnt_t;  



 















 


 


 




 
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};
typedef union pthread_attr_t pthread_attr_t;


typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;



 
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
    unsigned int __nusers;
    
 
    int __kind;
    short __spins;
    short __elision;
    __pthread_list_t __list;
 
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
    signed char __rwelision;
    unsigned char __pad1[7];
    unsigned long int __pad2;
    
 
    unsigned int __flags;
  } __data;
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










 
 
extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




 
extern char *initstate (unsigned int __seed, char *__statebuf,
			size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 

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
		     int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
			size_t __statelen,
			struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
		       struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));
 
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));


 
extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));


 

 
extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
struct drand48_data
  {
    unsigned short int __x[3];	 
    unsigned short int __old_x[3];  
    unsigned short int __c;	 
    unsigned short int __init;	 
    __extension__ unsigned long long int __a;	
 
  };

 
extern int drand48_r (struct drand48_data *__restrict __buffer,
		      double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
		      struct drand48_data *__restrict __buffer,
		      double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int lrand48_r (struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
		      struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int mrand48_r (struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
		      struct drand48_data *__restrict __buffer,
		      long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
		     struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
		      struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;
 
extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;




 


 
extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
 
extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


 
extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));
















 


































 



 

 






 



 

 
extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));





 
extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

 
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



 
extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


 
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





 
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




 
extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



 

 
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));






 
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));








 
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;






 
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;





 
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;







 
extern int system (const char *__command) ;








 
extern char *realpath (const char *__restrict __name,
		       char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;


 
typedef int (*__compar_fn_t) (const void *, const void *);




 
extern void *bsearch (const void *__key, const void *__base,
		      size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;

















 

extern __inline void *
bsearch (const void *__key, const void *__base, size_t __nmemb, size_t __size,
	 __compar_fn_t __compar)
{
  size_t __l, __u, __idx;
  const void *__p;
  int __comparison;

  __l = 0;
  __u = __nmemb;
  while (__l < __u)
    {
      __idx = (__l + __u) / 2;
      __p = (void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
	__u = __idx;
      else if (__comparison > 0)
	__l = __idx + 1;
      else
	return (void *) __p;
    }

  return ((void*)0);
}


 
extern void qsort (void *__base, size_t __nmemb, size_t __size,
		   __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));


 
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




 
 
extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern lldiv_t lldiv (long long int __numer,
				    long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




 



 
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;



 
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;



 
extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;

 
extern char *qecvt (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;



 
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign, char *__restrict __buf,
		   size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
		   int *__restrict __sign, char *__restrict __buf,
		   size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign,
		    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
		    int *__restrict __decpt, int *__restrict __sign,
		    char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));




 
extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int mbtowc (wchar_t *__restrict __pwc,
		   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

 
extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));


 
extern size_t mbstowcs (wchar_t *__restrict  __pwcs,
			const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
 
extern size_t wcstombs (char *__restrict __s,
			const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));






 
extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;







 
extern int getsubopt (char **__restrict __optionp,
		      char *const *__restrict __tokens,
		      char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;




 






 
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

















 



extern __inline double
__attribute__ ((__nothrow__ , __leaf__)) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void*)0));
}


 



















 



 





 































 



 

 






 

 



 
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
		     size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




 
extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
		      int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





 
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern char *strncpy (char *__restrict __dest,
		      const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern char *strncat (char *__restrict __dest, const char *__restrict __src,
		      size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern size_t strxfrm (char *__restrict __dest,
		       const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




 

















 





 
typedef struct __locale_struct
{
   
  struct __locale_data *__locales[13];  

   
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;

   
  const char *__names[13];
} *__locale_t;

 
typedef __locale_t locale_t;


 
extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
 
extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
			 __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

 
extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));



 
extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));



 
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
 
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





 
extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
 
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



 
extern char *__strtok_r (char *__restrict __s,
			 const char *__restrict __delim,
			 char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
		       char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));





 
extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



 
extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));



 
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));







 

 
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));



 
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

 
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


 
extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


 

 
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern char *strsep (char **__restrict __stringp,
		     const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

 
extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));

 
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern char *__stpncpy (char *__restrict __dest,
			const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
		      const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



















 

 
















 


 


 

 

















 





















 



 



















 



 














 

























 



 

 


struct stat
  {
    __dev_t st_dev;		 
    __ino_t st_ino;		 
    __nlink_t st_nlink;		 
    __mode_t st_mode;		 
    __uid_t st_uid;		 
    __gid_t st_gid;		 
    int __pad0;
    __dev_t st_rdev;		 
    __off_t st_size;			 
    __blksize_t st_blksize;	 
    __blkcnt_t st_blocks;		 
    




 
    struct timespec st_atim;		 
    struct timespec st_mtim;		 
    struct timespec st_ctim;		 
    __syscall_slong_t __glibc_reserved[3];
  };


 
 

 


 


 

 





 








 


 


 

 


 

 


 



 
extern int stat (const char *__restrict __file,
		 struct stat *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int fstat (int __fd, struct stat *__buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



 
extern int fstatat (int __fd, const char *__restrict __file,
		    struct stat *__restrict __buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));



 
extern int lstat (const char *__restrict __file,
		  struct stat *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int chmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int lchmod (const char *__file, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int fchmod (int __fd, __mode_t __mode) __attribute__ ((__nothrow__ , __leaf__));


 
extern int fchmodat (int __fd, const char *__file, __mode_t __mode,
		     int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;




 
extern __mode_t umask (__mode_t __mask) __attribute__ ((__nothrow__ , __leaf__));


 
extern int mkdir (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int mkdirat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



 
extern int mknod (const char *__path, __mode_t __mode, __dev_t __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int mknodat (int __fd, const char *__path, __mode_t __mode,
		    __dev_t __dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern int mkfifo (const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int mkfifoat (int __fd, const char *__path, __mode_t __mode)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern int utimensat (int __fd, const char *__path,
		      const struct timespec __times[2],
		      int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern int futimens (int __fd, const struct timespec __times[2]) __attribute__ ((__nothrow__ , __leaf__));














 


 
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int __xstat (int __ver, const char *__filename,
		    struct stat *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat (int __ver, const char *__filename,
		     struct stat *__stat_buf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat (int __ver, int __fildes, const char *__filename,
		       struct stat *__stat_buf, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));

extern int __xmknod (int __ver, const char *__path, __mode_t __mode,
		     __dev_t *__dev) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int __xmknodat (int __ver, int __fd, const char *__path,
		       __mode_t __mode, __dev_t *__dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 5)));

 

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) stat (const char *__path, struct stat *__statbuf)
{
  return __xstat (1, __path, __statbuf);
}

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) lstat (const char *__path, struct stat *__statbuf)
{
  return __lxstat (1, __path, __statbuf);
}

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) fstat (int __fd, struct stat *__statbuf)
{
  return __fxstat (1, __fd, __statbuf);
}

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) fstatat (int __fd, const char *__filename, struct stat *__statbuf, int __flag)
{
  return __fxstatat (1, __fd, __filename, __statbuf, __flag);
}

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) mknod (const char *__path, __mode_t __mode, __dev_t __dev)
{
  return __xmknod (0, __path, __mode, &__dev);
}

extern __inline int
__attribute__ ((__nothrow__ , __leaf__)) mknodat (int __fd, const char *__path, __mode_t __mode, __dev_t __dev)
{
  return __xmknodat (0, __fd, __path, __mode, &__dev);
}





















 



 






 

 


 

 

 

 


 


 


 


 

 

 

 

 

 


 

 




















































































 

















 


 

 

 

 

 

 

 

 

 

 


 

 

 

 

 

 

 

 

 

 

 


 

 

 

 

 

 
 
 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 


 















 


 


 

















 










 


 

 



 


 


































 



 

 






 


 



typedef __useconds_t useconds_t;


typedef __intptr_t intptr_t;

typedef __socklen_t socklen_t;


 

 
extern int access (const char *__name, int __type) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int faccessat (int __fd, const char *__file, int __type, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;


 

 






 
extern __off_t lseek (int __fd, __off_t __offset, int __whence) __attribute__ ((__nothrow__ , __leaf__));




 
extern int close (int __fd);





 
extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;




 
extern ssize_t write (int __fd, const void *__buf, size_t __n) ;






 
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
		      __off_t __offset) ;





 
extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
		       __off_t __offset) ;





 
extern int pipe (int __pipedes[2]) __attribute__ ((__nothrow__ , __leaf__)) ;








 
extern unsigned int alarm (unsigned int __seconds) __attribute__ ((__nothrow__ , __leaf__));










 
extern unsigned int sleep (unsigned int __seconds);




 
extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     __attribute__ ((__nothrow__ , __leaf__));





 
extern int usleep (__useconds_t __useconds);






 
extern int pause (void);


 
extern int chown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

 
extern int fchown (int __fd, __uid_t __owner, __gid_t __group) __attribute__ ((__nothrow__ , __leaf__)) ;



 
extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



 
extern int fchownat (int __fd, const char *__file, __uid_t __owner,
		     __gid_t __group, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;

 
extern int chdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

 
extern int fchdir (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;







 
extern char *getcwd (char *__buf, size_t __size) __attribute__ ((__nothrow__ , __leaf__)) ;




 
extern char *getwd (char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;


 
extern int dup (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;

 
extern int dup2 (int __fd, int __fd2) __attribute__ ((__nothrow__ , __leaf__));


 
extern char **__environ;



 
extern int execve (const char *__path, char *const __argv[],
		   char *const __envp[]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int fexecve (int __fd, char *const __argv[], char *const __envp[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


 
extern int execv (const char *__path, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int execle (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int execl (const char *__path, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


 
extern int execvp (const char *__file, char *const __argv[])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int execlp (const char *__file, const char *__arg, ...)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



 
extern int nice (int __inc) __attribute__ ((__nothrow__ , __leaf__)) ;


 
extern void _exit (int __status) __attribute__ ((__noreturn__));




 
















 


 
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

 
extern long int pathconf (const char *__path, int __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern long int fpathconf (int __fd, int __name) __attribute__ ((__nothrow__ , __leaf__));

 
extern long int sysconf (int __name) __attribute__ ((__nothrow__ , __leaf__));

 
extern size_t confstr (int __name, char *__buf, size_t __len) __attribute__ ((__nothrow__ , __leaf__));


 
extern __pid_t getpid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t getppid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t getpgrp (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t __getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));
extern __pid_t getpgid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));




 
extern int setpgid (__pid_t __pid, __pid_t __pgid) __attribute__ ((__nothrow__ , __leaf__));








 


 
extern int setpgrp (void) __attribute__ ((__nothrow__ , __leaf__));




 
extern __pid_t setsid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __pid_t getsid (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));

 
extern __uid_t getuid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __uid_t geteuid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __gid_t getgid (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern __gid_t getegid (void) __attribute__ ((__nothrow__ , __leaf__));



 
extern int getgroups (int __size, __gid_t __list[]) __attribute__ ((__nothrow__ , __leaf__)) ;





 
extern int setuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;


 
extern int setreuid (__uid_t __ruid, __uid_t __euid) __attribute__ ((__nothrow__ , __leaf__)) ;

 
extern int seteuid (__uid_t __uid) __attribute__ ((__nothrow__ , __leaf__)) ;




 
extern int setgid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;


 
extern int setregid (__gid_t __rgid, __gid_t __egid) __attribute__ ((__nothrow__ , __leaf__)) ;

 
extern int setegid (__gid_t __gid) __attribute__ ((__nothrow__ , __leaf__)) ;





 
extern __pid_t fork (void) __attribute__ ((__nothrow__));




 
extern __pid_t vfork (void) __attribute__ ((__nothrow__ , __leaf__));



 
extern char *ttyname (int __fd) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2))) ;


 
extern int isatty (int __fd) __attribute__ ((__nothrow__ , __leaf__));


 
extern int ttyslot (void) __attribute__ ((__nothrow__ , __leaf__));


 
extern int link (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;


 
extern int linkat (int __fromfd, const char *__from, int __tofd,
		   const char *__to, int __flags)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4))) ;

 
extern int symlink (const char *__from, const char *__to)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;



 
extern ssize_t readlink (const char *__restrict __path,
			 char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) ;

 
extern int symlinkat (const char *__from, int __tofd,
		      const char *__to) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;

 
extern ssize_t readlinkat (int __fd, const char *__restrict __path,
			   char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3))) ;

 
extern int unlink (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

 
extern int unlinkat (int __fd, const char *__name, int __flag)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

 
extern int rmdir (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


 
extern __pid_t tcgetpgrp (int __fd) __attribute__ ((__nothrow__ , __leaf__));

 
extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) __attribute__ ((__nothrow__ , __leaf__));





 
extern char *getlogin (void);





 
extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));

 
extern int setlogin (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
















 









 







 

extern char *optarg;











 

extern int optind;


 

extern int opterr;

 

extern int optopt;

























 



 
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       __attribute__ ((__nothrow__ , __leaf__));




 





 
extern int gethostname (char *__name, size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



 
extern int sethostname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;


 
extern int sethostid (long int __id) __attribute__ ((__nothrow__ , __leaf__)) ;




 
extern int getdomainname (char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (const char *__name, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




 
extern int vhangup (void) __attribute__ ((__nothrow__ , __leaf__));

 
extern int revoke (const char *__file) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;






 
extern int profil (unsigned short int *__sample_buffer, size_t __size,
		   size_t __offset, unsigned int __scale)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




 
extern int acct (const char *__name) __attribute__ ((__nothrow__ , __leaf__));


 
extern char *getusershell (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endusershell (void) __attribute__ ((__nothrow__ , __leaf__));  
extern void setusershell (void) __attribute__ ((__nothrow__ , __leaf__));  




 
extern int daemon (int __nochdir, int __noclose) __attribute__ ((__nothrow__ , __leaf__)) ;



 
extern int chroot (const char *__path) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;


 
extern char *getpass (const char *__prompt) __attribute__ ((__nonnull__ (1)));





 
extern int fsync (int __fd);





 
extern long int gethostid (void);

 
extern void sync (void) __attribute__ ((__nothrow__ , __leaf__));



 
extern int getpagesize (void)  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



 
extern int getdtablesize (void) __attribute__ ((__nothrow__ , __leaf__));




 
extern int truncate (const char *__file, __off_t __length)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;



 
extern int ftruncate (int __fd, __off_t __length) __attribute__ ((__nothrow__ , __leaf__)) ;





 
extern int brk (void *__addr) __attribute__ ((__nothrow__ , __leaf__)) ;




 
extern void *sbrk (intptr_t __delta) __attribute__ ((__nothrow__ , __leaf__));











 
extern long int syscall (long int __sysno, ...) __attribute__ ((__nothrow__ , __leaf__));





 






 


extern int lockf (int __fd, int __cmd, __off_t __len) ;




 
extern int fdatasync (int __fildes);



 



 


 












 

































 



 

 






 















 



 



 




 
















 













 





 




 

 

 



 
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

 







 








 

 


 
typedef int nc_type;




 



 

 




 
 
 







 
 
 





 







 








 


 



 

 








 
 




 

 

 
















 
 


  


 


 

 

 

 

 


















 
 
 

 


 
 
 



 
 
 




 
 
 

 



 
 




 





 



 







 





 



 




 



 







 
 




 

 

 



 

 

 



 


 


 




 

 



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
nc_rename_grp(int grpid, const char *name);

 

 
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
nc_put_var(int ncid, int varid,  const void *op);

 
 extern int
nc_get_var(int ncid, int varid,  void *ip);

 
 extern int
nc_put_var1(int ncid, int varid,  const size_t *indexp,
	    const void *op);

 
 extern int
nc_get_var1(int ncid, int varid,  const size_t *indexp, void *ip);

 
 extern int
nc_put_vara(int ncid, int varid,  const size_t *startp,
	    const size_t *countp, const void *op);

 
 extern int
nc_get_vara(int ncid, int varid,  const size_t *startp,
	    const size_t *countp, void *ip);

 
 extern int
nc_put_vars(int ncid, int varid,  const size_t *startp,
	    const size_t *countp, const ptrdiff_t *stridep,
	    const void *op);

 
 extern int
nc_get_vars(int ncid, int varid,  const size_t *startp,
	    const size_t *countp, const ptrdiff_t *stridep,
	    void *ip);

 
 extern int
nc_put_varm(int ncid, int varid,  const size_t *startp,
	    const size_t *countp, const ptrdiff_t *stridep,
	    const ptrdiff_t *imapp, const void *op);

 
 extern int
nc_get_varm(int ncid, int varid,  const size_t *startp,
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
nc_inq_format_extended(int ncid, int *formatp, int* modep);

 

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
nc_put_att_string(int ncid, int varid, const char *name,
		  size_t len, const char **op);

 extern int
nc_get_att_string(int ncid, int varid, const char *name, char **ip);

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
nc_get_vars_double(int ncid, int varid,	const size_t *startp,
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
nc_put_varm_double(int ncid, int varid,	const size_t *startp,
		   const size_t *countp, const ptrdiff_t *stridep,
		   const ptrdiff_t *imapp, const double *op);

 extern int
nc_get_varm_double(int ncid, int varid,	const size_t *startp,
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
 




 
 extern int
nc_show_metadata(int ncid);

 

 




 







 

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

 



 

 
 

 




 
 extern int ncerr;





 

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

 

 


 



 


















 



 
















 






 

 
enum __rlimit_resource
{
   
  RLIMIT_CPU = 0,

   
  RLIMIT_FSIZE = 1,

   
  RLIMIT_DATA = 2,

   
  RLIMIT_STACK = 3,

   
  RLIMIT_CORE = 4,

  


 
  __RLIMIT_RSS = 5,

   
  RLIMIT_NOFILE = 7,
  __RLIMIT_OFILE = RLIMIT_NOFILE,  

   
  RLIMIT_AS = 9,

   
  __RLIMIT_NPROC = 6,

   
  __RLIMIT_MEMLOCK = 8,

   
  __RLIMIT_LOCKS = 10,

   
  __RLIMIT_SIGPENDING = 11,

   
  __RLIMIT_MSGQUEUE = 12,

  

 
  __RLIMIT_NICE = 13,

  
 
  __RLIMIT_RTPRIO = 14,

  

 
  __RLIMIT_RTTIME = 15,

  __RLIMIT_NLIMITS = 16,
  __RLIM_NLIMITS = __RLIMIT_NLIMITS
};

 


 


 
typedef __rlim_t rlim_t;

struct rlimit
  {
     
    rlim_t rlim_cur;
     
    rlim_t rlim_max;
  };


 
enum __rusage_who
{
   
  RUSAGE_SELF = 0,

   
  RUSAGE_CHILDREN = -1

};

















 



 




 




 
struct rusage
  {
     
    struct timeval ru_utime;
     
    struct timeval ru_stime;
     
    __extension__ union
      {
	long int ru_maxrss;
	__syscall_slong_t __ru_maxrss_word;
      };
    
 
     
    __extension__ union
      {
	long int ru_ixrss;
	__syscall_slong_t __ru_ixrss_word;
      };
     
    __extension__ union
      {
	long int ru_idrss;
	__syscall_slong_t __ru_idrss_word;
      };
     
    __extension__ union
      {
	long int ru_isrss;
	 __syscall_slong_t __ru_isrss_word;
      };
    
 
    __extension__ union
      {
	long int ru_minflt;
	__syscall_slong_t __ru_minflt_word;
      };
     
    __extension__ union
      {
	long int ru_majflt;
	__syscall_slong_t __ru_majflt_word;
      };
     
    __extension__ union
      {
	long int ru_nswap;
	__syscall_slong_t __ru_nswap_word;
      };
    
 
    __extension__ union
      {
	long int ru_inblock;
	__syscall_slong_t __ru_inblock_word;
      };
     
    __extension__ union
      {
	long int ru_oublock;
	__syscall_slong_t __ru_oublock_word;
      };
     
    __extension__ union
      {
	long int ru_msgsnd;
	__syscall_slong_t __ru_msgsnd_word;
      };
     
    __extension__ union
      {
	long int ru_msgrcv;
	__syscall_slong_t __ru_msgrcv_word;
      };
     
    __extension__ union
      {
	long int ru_nsignals;
	__syscall_slong_t __ru_nsignals_word;
      };
    

 
    __extension__ union
      {
	long int ru_nvcsw;
	__syscall_slong_t __ru_nvcsw_word;
      };
    
 
    __extension__ union
      {
	long int ru_nivcsw;
	__syscall_slong_t __ru_nivcsw_word;
      };
  };

 


 
enum __priority_which
{
  PRIO_PROCESS = 0,		 
  PRIO_PGRP = 1,		 
  PRIO_USER = 2			 
};













 
typedef int __rlimit_resource_t;
typedef int __rusage_who_t;
typedef int __priority_which_t;


 
extern int getrlimit (__rlimit_resource_t __resource,
		      struct rlimit *__rlimits) __attribute__ ((__nothrow__ , __leaf__));



 
extern int setrlimit (__rlimit_resource_t __resource,
		      const struct rlimit *__rlimits) __attribute__ ((__nothrow__ , __leaf__));


 
extern int getrusage (__rusage_who_t __who, struct rusage *__usage) __attribute__ ((__nothrow__ , __leaf__));




 
extern int getpriority (__priority_which_t __which, id_t __who) __attribute__ ((__nothrow__ , __leaf__));


 
extern int setpriority (__priority_which_t __which, id_t __who, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));





 
struct fileinfo
  {
   int ncfid;   
   int ndims;   
   int nvars;   
   int ngatts;   
   int recdim;   
   char varname[8192][256];   
   nc_type datatype[8192];  
   int varndims[8192];   
   int vardim[8192][1024];   
   int natts[8192];   
   unsigned char vardecomp[8192];   
   char dimname[1024][256];   
   long dimsize[1024];   
   long dimfullsize[1024];   
   long dimstart[1024];   
   long dimend[1024];   
   unsigned char varmiss[8192];   
   unsigned char varmissval[8192][8];   
  };

 
void usage();
int process_file(char *, unsigned char, struct fileinfo *, char *, int *,
                 int *, int *, int*, int, int, int, unsigned char,
                 unsigned char);
int process_vars(struct fileinfo *, struct fileinfo *, unsigned char, int *,
                 int *, int*, int, int, int, unsigned char, unsigned char);
int flush_decomp(struct fileinfo *, int, int, int, unsigned char);
void print_debug(struct fileinfo *, unsigned char);
char *nc_type_to_str(nc_type);



static void ***varbuf = ((void*)0);   

struct rusage ruse;  
static unsigned long maxrss = 0;  
static int print_mem_usage = 0;
static unsigned long mem_allocated = 0;  

static const char version[] = "2.2.5";
static const char last_updated[] = "Mar-02-2012";

static unsigned long estimated_maxrss = 0;  
static int mem_dry_run = 0;  

static inline void check_mem_usage(void) {
  static long prev_rss = 0;
  static long PAGE_SIZE = 0;
  long rss = 0;
  if (PAGE_SIZE == 0) PAGE_SIZE = sysconf(_SC_PAGESIZE);
  if (getrusage(RUSAGE_SELF, &ruse) == 0) rss = ruse.ru_maxrss * PAGE_SIZE;
  if (rss == 0) {
     
    FILE * f = fopen("/proc/self/statm", "r");
    if (f != ((void*)0)) {
      int discard;
      fscanf(f, "%d %ld\n", &discard, &rss);
      fclose(f);
      rss *= PAGE_SIZE;
    }
  }
  if (rss > maxrss) maxrss = rss;
  printf("rss=%lu KB, delta=%ld KB, maxrss=%lu KB\n", rss/1024, (rss - prev_rss)/1024, maxrss/1024);
  prev_rss = rss;
  return;
}

static void print_estimated_mem_footprint(int verbose) {
  if (verbose) {
    printf("Estimated peak memory resident size (k=1) : %.1f MB\n", (float)estimated_maxrss/(1024*1024));
    printf("For estimating RSS for a different value of k, multiply above usage by k.\n");
  }
  else printf("%.0f\n", ceil((float)estimated_maxrss/(1024*1024)));
  return;
}



int nccp2r(int argc, char *argv[])
  {
   unsigned char verbose=0;   
   unsigned char appendnc=0;   
   unsigned char removein=0;   
   int nstart=0;   
   int nend=(-1);   
   int force=0;   
   int headerpad=16384;   
   int format=0x0004;   
   unsigned char missing=0;   
                              
   int outputarg=(-1);   
   int inputarg=(-1);   
   struct stat statbuf;   
   struct fileinfo *ncoutfile;   
   char outfilename[2048], *strptr;   
   int outlen;   
   char infilename[2048];   
   unsigned char infileerror=0;   
   unsigned char infileerrors=0;   
   unsigned char outfileerrors=0;  
   int nfiles=(-1);   
   int a, f, r, block, k, v;   
   int status;  
   int nrecs=1;   
   int bf=1;   
   int nblocks=1;  
   int peWidth = -1;  
   size_t blksz=65536;  

    
   if (argc < 2)
     {
      usage(); return(1);
     }
   for (a=1; a < argc; a++)
     {
      if (!strcmp(argv[a],"-v")) verbose=1;
      else if (!strcmp(argv[a],"-vv")) verbose=2;   
      else if (!strcmp(argv[a],"-V")) {
        fprintf(stderr, "mppnccombine version: %s\n", version);
        fprintf(stderr, "Last updated: %s\n", last_updated);
        exit(0);
      }
      else if (!strcmp(argv[a],"-M")) print_mem_usage=1;
      else if (!strcmp(argv[a],"-x")) {
        mem_dry_run=1;
      }
      else if (!strcmp(argv[a],"-a")) appendnc=1;
      else if (!strcmp(argv[a],"-r")) removein=1;
      else if (!strcmp(argv[a],"-f")) force=1;
      else if (!strcmp(argv[a],"-n"))
        {
         a++;
         if (a < argc) nstart=atoi(argv[a]);
         else
           {
            usage(); return(1);
           }
        }
      else if (!strcmp(argv[a],"-k"))
        {
         a++;
         if (a < argc) bf=atoi(argv[a]);
         else
           {
            usage(); return(1);
           }
         if (mem_dry_run) continue;
         if (bf > 100)
           {
             fprintf(stderr, "Warning: k is set to high. Choosing a more sane value of %d.\n", 100);
             bf = 100;
           }
        }
      else if (!strcmp(argv[a],"-e"))
        {
         a++;
         if (a < argc) nend=atoi(argv[a]);
         else
           {
            usage(); return(1);
           }
        }
      else if (!strcmp(argv[a],"-h"))
        {
         a++;
         if (a < argc) headerpad=atoi(argv[a]);
         else
           {
            usage(); return(1);
           }
        }
      else if (!strcmp(argv[a],"-64"))
        format=(0x0004 | 0x0200);
      else if (!strcmp(argv[a], "-n4"))
	format=(0x0004 | 0x1000 | 0x0100);
      else if (!strcmp(argv[a],"-m")) missing=1;
      
      else
        {
         outputarg=a; break;
        }
     }
   if (outputarg==(-1))
     {
      usage(); return(1);
     }
   if (argc-1 > outputarg) inputarg=outputarg+1;
   sprintf(outfilename,argv[outputarg]); outlen=strlen(outfilename);
   if (outlen > 4)
     {
      strptr=outfilename+outlen-5;
      if (!strcmp(strptr,".0000")) outfilename[outlen-5]='\0';
     }


    
   if (mem_dry_run) {
     if (bf != 1) fprintf(stderr, "-x is set, so blocking factor will be set to 1. The -k option will be ignored.\n");
     bf = 1;
     if (verbose) printf("This run will estimate peak memory resident size. No output file will be created.\n");
   }

    
   ncopts=0;

   if (!mem_dry_run) {
	    
	   if ((ncoutfile=(struct fileinfo *)malloc(sizeof(struct fileinfo)))==((void*)0))
	     {
	      fprintf(stderr,"Error: cannot allocate enough memory!\n"); return(1);
	     }
	   if (!appendnc)
	     {
	      if (stat(outfilename,&statbuf)==0)
		{
		 fprintf(stderr,"Error: output file seems to exist already!\n");
		 free(ncoutfile); return(1);
		}
	      status = nc__create(outfilename, format, 0, &blksz, &ncoutfile->ncfid);
	      if (status==(-1))
		{
		 fprintf(stderr,"Error: cannot create the output netCDF file!\n");
		 free(ncoutfile); return(1);
		}
	      ncsetfill(ncoutfile->ncfid,0x100);
	     }
	    
	   else
	     {
	      if ((ncoutfile->ncfid=ncopen(outfilename,0x0001))==(-1))
		{
		 fprintf(stderr,"Error: cannot open the output netCDF file for appending!\n");
		 free(ncoutfile); return(1);
		}
	     }
   }

    
   if (inputarg==(-1))
     {
      int num_infiles_used = 0;   
      if (nend > -1)
        for (block=0; block < nblocks; block++)
          {
           if (verbose) printf("block = %d\n",block);
           f=0; 
           for (a=nstart; a <= nend; a++)
             {
	       if (peWidth<0)
		 {
		   sprintf(infilename,"%s.%04d",outfilename,a);
		   if (stat(infilename,&statbuf)==0)
		     {
		       peWidth=4;
		     }
		   else
		     {
		       sprintf(infilename,"%s.%06d",outfilename,a);
		       if (stat(infilename,&statbuf)==0)
			 {
			   peWidth=6;
			 }
		       else
			 {
			   continue;
			 }
		     }
		 }
	       sprintf(infilename,"%s.%0*d",outfilename,peWidth,a);
               if (stat(infilename,&statbuf)!=0){
                if (force==0) {
                  printf("ERROR: missing at least %s from the input fileset.  Exiting.\n", infilename);
                  unlink(outfilename);
                  return 9;
                }else{
                  infileerrors=1;
                }
              }
              if (verbose)
                {
                 if (block==0) printf("  n files to go... ");
                 else printf("  %d files to go... ",num_infiles_used-f);
                 printf("processing \"%s\"\n",infilename);
                }
              infileerror=process_file(infilename,appendnc,ncoutfile,
                                       outfilename,&nfiles,&nrecs,&nblocks,&bf,block,f,
                                       headerpad,verbose,missing);
              if (infileerror) infileerrors=1;
              appendnc=1; f++;
              if (f==nfiles || a==nend)
                {
                 if (mem_dry_run) {
                   print_estimated_mem_footprint(verbose);
                   exit(0);
                 }
                 if (verbose > 1)
                   printf("  Write variables from previous %d files\n",f);
                 for (r=block * bf; r<min((block+1)*bf, nrecs); r++)
                   outfileerrors += flush_decomp(ncoutfile,nfiles,r,bf,verbose);
                 num_infiles_used = f;
                 break;
                }
             }
           if (num_infiles_used == 0) 
             {
               fprintf(stderr, "Warning: No input file found in range.\n");
               unlink(outfilename);
               exit(1);
             }
            
           if (verbose && print_mem_usage) printf("freeing memory allocated in block\n");
           for (k=0; k< bf; k++)
             for (v=0; v < 8192; v++)
                if (varbuf && (varbuf[k][v]!=((void*)0))) 
                  { 
                    free(varbuf[k][v]); varbuf[k][v] = ((void*)0);
                  }
          }
      else
        {
         nend=nstart+1;
         for (block=0; block < nblocks; block++)
           {
            if (verbose) printf("block = %d\n",block);
            f=0;
            for (a=nstart; a < nend; a++)
              {
	       if (peWidth<0)
		 {
		   sprintf(infilename,"%s.%04d",outfilename,a);
		   if (stat(infilename,&statbuf)==0)
		     {
		       peWidth=4;
		     }
		   else
		     {
		       sprintf(infilename,"%s.%06d",outfilename,a);
		       if (stat(infilename,&statbuf)==0)
			 {
			   peWidth=6;
			 }
		       else
			 {
			   continue;
			 }
		     }
		 }
	       sprintf(infilename,"%s.%0*d",outfilename,peWidth,a);
               if (stat(infilename,&statbuf)!=0){
                 if (force==0) {
                   printf("ERROR: missing at least %s from the input fileset.  Exiting.\n", infilename);
                   unlink(outfilename);
                   return 9;
                 }else{
                   infileerrors=1;
                 }
               }
               if (verbose)
                 {
                  if (a==nstart && block==0) printf("  n files to go... ");
                  else printf("  %d files to go... ",nend-a);
                  printf("processing \"%s\"\n",infilename);
                 }
               infileerror=process_file(infilename,appendnc,ncoutfile,
                                        outfilename,&nfiles,&nrecs,&nblocks,&bf,block,f,
                                        headerpad,verbose,missing);
               if (infileerror) infileerrors=1;
               if (a==nstart && nfiles > 0) nend=nstart+nfiles;
               appendnc=1; f++;
               if (f==nfiles || a==(nend-1))
                 {
                  if (mem_dry_run) {
                    print_estimated_mem_footprint(verbose);
                    exit(0);
                  }
                  if (verbose > 1)
                    printf("  Write variables from previous %d files\n",f);
                  for (r=block*bf; r<min((block+1)*bf, nrecs); r++)
                    outfileerrors += flush_decomp(ncoutfile,nfiles,r,bf,verbose);
                  f=0; continue;
                 }
              }
             
            if (verbose && print_mem_usage) printf("freeing memory allocated in block\n");
            for (k=0; k< bf; k++)
              for (v=0; v < 8192; v++)
                if (varbuf && (varbuf[k][v]!=((void*)0))) 
                  { 
                    free(varbuf[k][v]); varbuf[k][v] = ((void*)0);
                  }
           }
        }
     }
    
   else
     for (block=0; block < nblocks; block++)
       {
        if (verbose) printf("block = %d\n",block);
        f=0;
        for (a=inputarg; a < argc; a++)
          {
           if (verbose)
             {
              if ((argc-a)==1) printf("  1 file to go... ");
              else printf("  %d files to go... ",argc-a);
              printf("processing \"%s\"\n",argv[a]);
             }
           if (stat(argv[a],&statbuf)!=0){
             if (force==0) {
               printf("ERROR: missing at least %s from the input fileset.  Exiting.\n", argv[a]);
               unlink(outfilename);
               return 9;
             }else{
               infileerrors=1;
             }
           }
           infileerror=process_file(argv[a],appendnc,ncoutfile,
                                    outfilename,&nfiles,&nrecs,&nblocks,&bf,block,f,
                                    headerpad,verbose,missing);
           if (infileerror) infileerrors=1;
           appendnc=1; f++;
           if (f==nfiles || a==(argc-1))
             {
              if (mem_dry_run) {
                print_estimated_mem_footprint(verbose);
                exit(0);
              }
              if (verbose > 1)
                printf("  Write variables from previous %d files\n",f);
              for (r=block*bf; r<min((block+1)*bf, nrecs); r++)
                outfileerrors += flush_decomp(ncoutfile,nfiles,r,bf,verbose);
              f=0; continue;
             }
          }
         
        if (verbose && print_mem_usage) printf("freeing memory allocated in block\n");
        for (k=0; k< bf; k++)
          for (v=0; v < 8192; v++)
            if (varbuf && (varbuf[k][v]!=((void*)0))) 
              { 
                 free(varbuf[k][v]); varbuf[k][v] = ((void*)0);
              }
       }

   ncclose(ncoutfile->ncfid); free(ncoutfile);
   if ((!infileerrors) && (!outfileerrors))
     {
      if (removein)
        {
          
         if (inputarg==(-1))
           {
            f=0;
            for (a=nstart; a <= nend; a++)
              {
               
               
               
               
	       if (peWidth<0)
		 {
		   sprintf(infilename,"%s.%04d",outfilename,a);
		   if (stat(infilename,&statbuf)==0)
		     {
		       peWidth=4;
		     }
		   else
		     {
		       sprintf(infilename,"%s.%06d",outfilename,a);
		       if (stat(infilename,&statbuf)==0)
			 {
			   peWidth=6;
			 }
		       else
			 {
			   continue;
			 }
		     }
		 }
	       sprintf(infilename,"%s.%0*d",outfilename,peWidth,a);
               if (stat(infilename,&statbuf)!=0) continue;
               if (verbose) printf("Removing \"%s\"\n",infilename);
               unlink(infilename);
              }
           }
          
         else
           for (a=inputarg; a < argc; a++)
             {
              if (stat(argv[a],&statbuf)!=0) continue;
              if (verbose) printf("Removing \"%s\"\n",argv[a]);
              unlink(argv[a]);
             }
        }
     }
   else
     fprintf(stderr,"Warning: output file may be incomplete!\n");
   return(infileerrors);
  }


 
void usage()
  {
   printf("mppnccombine %s - (written by Hans.Vahlenkamp)\n\n", version);
   printf("Usage:  mppnccombine [-v] [-V] [-M] [-a] [-r] [-n #] [-k #] [-e #] [-h #] [-64] [-n4] [-m]\n");
   printf("                     output.nc [input ...]\n\n");
   printf("  -v    Print some progress information.\n");
   printf("  -V    Print version information.\n");
   printf("  -M    Print memory usage statistics.\n");
   printf("  -f    Force combine to happen even if input files are missing.\n");
   printf("  -a    Append to an existing netCDF file (not heavily tested...).\n");
   printf("  -r    Remove the \".####\" decomposed files after a successful run.\n");
   printf("  -n #  Input filename extensions start with number #### instead of 0000.\n");
   printf("  -k #  Blocking factor. k records are read from an input file at a time.\n");
   printf("        Valid values are between 0 and %d. For a given input, the maximum\n", 100);
   printf("        permissible value for k is min(total number of records, %d).\n", 100);
   printf("        Setting k to zero will set the blocking factor to this maximum\n");
   printf("        permissible value. Setting k to a value higher than this value,\n");
   printf("        will make the system implictly set k to the highest permissible value.\n");
   printf("        A value of 1 for k disables blocking. This is the default behavior.\n");
   printf("        Blocking often improves performance, but increases the peak memory\n");
   printf("        footprint (by the blocking factor). Beware of running out of\n");
   printf("        available physical memory and causing swapping to disk due to\n");
   printf("        large blocking factors and/or large input datasets.\n");
   printf("        A value of 10 for k has worked well on many input datasets.\n");
   printf("        See -x for estimating memory usage for a given input set.\n");
   printf("  -e #  Ending number #### of a specified range of input filename extensions.\n");
   printf("        Files within the range do not have to be consecutively numbered.\n");
   printf("  -h #  Add a specified number of bytes of padding at the end of the header.\n");
   printf("  -64   Create netCDF output files with the 64-bit offset format.\n");
   printf("  -n4   Create netCDF output files in NETCDF4_CLASSIC mode (no v4 enhanced features).\n");
   printf("  -m    Initialize output variables with a \"missing_value\" from the variables\n");
   printf("        of the first input file instead of the default 0 value.\n");
   printf("  -x    Print an estimate for peak memory resident size in (MB) and exit.\n");
   printf("        No output file will be created. Setting -x automatically sets\n");
   printf("        the blocking factor (-k) to 1. Any value set for -k on the\n");
   printf("        command-line will be ignored. To estimate memory usage for a\n");
   printf("        a different blocking factor, simply multiply the estimate by k.\n\n");
   printf("mppnccombine joins together an arbitrary number of netCDF input files, each\n");
   printf("containing parts of a decomposed domain, into a unified netCDF output file.\n");
   printf("An output file must be specified and it is assumed to be the first filename\n");
   printf("argument.  If the output file already exists, then it will not be modified\n");
   printf("unless the option is chosen to append to it.  If no input files are specified\n");
   printf("then their names will be based on the name of the output file plus the default\n");
   printf("numeric extension \".0000\", which will increment by 1.  There is an option for\n");
   printf("starting the filename extensions with an arbitrary number instead of 0.  There\n");
   printf("is an option for specifying an end to the range of filename extension numbers;\n");
   printf("files within the range do not have to be consecutively numbered.  If input\n");
   printf("files are specified then names will be used verbatim.\n\n");
   printf("A value of 0 is returned if execution completed successfully; a value of 1\n");
   printf("otherwise.\n");
  }


inline int min(int a, int b)
{
  if (a<b) return a;
  return b;
}

 
 
 
 
int process_file(char *ncname, unsigned char appendnc,
                 struct fileinfo *ncoutfile, char *outncname, int *nfiles,
                 int *nrecs, int *nblocks, int *bf, int block, int f, int headerpad,
                 unsigned char verbose, unsigned char missing)
  {
   struct fileinfo *ncinfile;   
   int nfiles2;   
   int d, v, n;   
   int dimid;   
   int decomp[4];   
                    
                    
                    
                    
   char attname[256];   
   unsigned char ncinfileerror=0;   

   int retval;
   if (print_mem_usage) check_mem_usage();

    
   if ((ncinfile=(struct fileinfo *)malloc(sizeof(struct fileinfo)))==((void*)0))
     {
      fprintf(stderr,"Error: cannot allocate enough memory!\n"); return(1);
     }

    
   if ((ncinfile->ncfid=ncopen(ncname,0x0000))==(-1))
     {
      fprintf(stderr,"Error: cannot open input file \"%s\"\n",ncname);
      free(ncinfile); return(1);
     }

    
   if (ncattget(ncinfile->ncfid,-1,"NumFilesInSet",
                (void *)&nfiles2)==(-1))
     {
      if (*nfiles==1)
        {
         fprintf(stderr,"Error: missing the \"NumFilesInSet\" global attribute!\n");
         return(1);
        }
      else if (*nfiles==(-1))
        {
         fprintf(stderr,"Warning: missing the \"NumFilesInSet\" global attribute.\n");
        }
     }
   *nfiles=nfiles2;

    
   if (ncinquire(ncinfile->ncfid,&(ncinfile->ndims),&(ncinfile->nvars),
                 &(ncinfile->ngatts),&(ncinfile->recdim))==(-1))
     {
      fprintf(stderr,"Error: cannot read the file's metadata!\n");
      ncclose(ncinfile->ncfid); free(ncinfile); return(1);
     }

    
   for (d=0; d < ncinfile->ndims; d++)
     {
      if ((ncdiminq(ncinfile->ncfid,d,ncinfile->dimname[d],
                    &(ncinfile->dimsize[d])))==(-1))
        {
         fprintf(stderr,"Error: cannot read dimension #%d's metadata!\n",d);
         ncclose(ncinfile->ncfid); free(ncinfile); return(1);
        }
      ncinfile->dimfullsize[d]=ncinfile->dimsize[d];
      ncinfile->dimstart[d]=1; ncinfile->dimend[d]=(-1);
     }

    
   if ((block==0) && (!mem_dry_run))
     {
      ncoutfile->nvars=ncinfile->nvars; ncoutfile->recdim=ncinfile->recdim;
     }

    
   for (v=0; v < ncinfile->nvars; v++)
     {
      if ((ncvarinq(ncinfile->ncfid,v,ncinfile->varname[v],
                    &(ncinfile->datatype[v]),&(ncinfile->varndims[v]),
                    ncinfile->vardim[v],&(ncinfile->natts[v])))==(-1))
        {
         fprintf(stderr,"Error: cannot read variable #%d's metadata!\n",v);
         ncclose(ncinfile->ncfid); free(ncinfile); return(1);
        }

       
      if ((dimid=ncdimid(ncinfile->ncfid,ncinfile->varname[v]))!=(-1))
        {
         if (ncattget(ncinfile->ncfid,v,"domain_decomposition",
             (void *)decomp)!=(-1))
           {
             
            ncinfile->dimfullsize[dimid]=decomp[1]-decomp[0]+1;
            ncinfile->dimstart[dimid]=decomp[2]-(decomp[0]-1);
            ncinfile->dimend[dimid]=decomp[3]-(decomp[0]-1);
           }
         else
           {
             
            ncinfile->dimfullsize[dimid]=ncinfile->dimsize[dimid];
            ncinfile->dimstart[dimid]=1; ncinfile->dimend[dimid]=(-1);
           }
        }
     }

    
   for (v=0; v < ncinfile->nvars; v++)
     {

       
      ncinfile->vardecomp[v]=0;

       
       
       
      for (d=0; d < ncinfile->varndims[v]; d++)
        {
          
         if (ncinfile->dimend[ncinfile->vardim[v][d]]!=(-1))
           {
            ncinfile->vardecomp[v]=1; break;
           }
        }

       
       
      if ((block==0) && (!mem_dry_run))
        {
         ncoutfile->varndims[v]=ncinfile->varndims[v];
         for (d=0; d < ncinfile->ndims; d++)
           ncoutfile->dimfullsize[d]=ncinfile->dimfullsize[d];
         for (d=0; d < ncinfile->varndims[v]; d++)
           ncoutfile->vardim[v][d]=ncinfile->vardim[v][d];
         ncoutfile->vardecomp[v]=ncinfile->vardecomp[v];
         strcpy(ncoutfile->varname[v],ncinfile->varname[v]);
         ncoutfile->varmiss[v]=0;
        }
     }

    
   if ((!appendnc) && (!mem_dry_run))
     {
      if (verbose) printf("    Creating output \"%s\"\n",outncname);

       
      for (d=0; d < ncinfile->ndims; d++)
        {
         if (d==ncinfile->recdim)
           ncdimdef(ncoutfile->ncfid,ncinfile->dimname[d],0L);
         else ncdimdef(ncoutfile->ncfid,ncinfile->dimname[d],
                       ncinfile->dimfullsize[d]);
        }

       
      for (v=0; v < ncinfile->nvars; v++)
        {
         ncvardef(ncoutfile->ncfid,ncinfile->varname[v],ncinfile->datatype[v],
                  ncinfile->varndims[v],ncinfile->vardim[v]);
         


 
         for (n=0; n < ncinfile->natts[v]; n++)
           {
            ncattname(ncinfile->ncfid,v,n,attname);
            if (missing)
              {
               if (!strcmp(attname,"missing_value"))
                 {
                  ncoutfile->varmiss[v]=1;
                  ncattget(ncinfile->ncfid,v,"missing_value",
                           (void *)(ncoutfile->varmissval[v]));
                 }
              }
            if (!strcmp(attname,"domain_decomposition")) continue;
            else
              {
               if (ncattcopy(ncinfile->ncfid,v,attname,ncoutfile->ncfid,v)==(-1))
                 {
                  fprintf(stderr,"Error: cannot copy variable \"%s\"'s attributes!\n",
                          ncinfile->varname[v]);
                  free(ncinfile); return(1);
                 }
              }
           }
        }

       
      for (n=0; n < ncinfile->ngatts; n++)
        {
         ncattname(ncinfile->ncfid,-1,n,attname);
         if (!strcmp(attname,"NumFilesInSet")) continue;
         else if (!strcmp(attname,"filename"))
           ncattput(ncoutfile->ncfid,-1,attname,2,
                    strlen(outncname),(void *)outncname);
         else
           {
            if (ncattcopy(ncinfile->ncfid,-1,attname,ncoutfile->ncfid,
                          -1)==(-1))
              {
               fprintf(stderr,"Error: cannot copy the file's global attributes!\n");
               return(1);
              }
           }
        }

       
      nc__enddef(ncoutfile->ncfid,headerpad,4,0,4);
     }

    
    
    
    
    
   int r = block * (*bf); 
   unsigned long mem_for_rec, tmp_mem_alloc;
   do 
     {
      tmp_mem_alloc = mem_allocated;  
      ncinfileerror+=process_vars(ncinfile,ncoutfile,appendnc,nrecs,nblocks,bf,r,*nfiles,
                                 f,verbose,missing);
      mem_for_rec= mem_allocated - tmp_mem_alloc;
      if (verbose && print_mem_usage) 
        if (mem_for_rec > 0) printf("  mem alloc for r=%d, infile=%s is %lu KB\n", r, ncname, mem_for_rec/1024);
      r++;
      appendnc = 1;
   } while (r<min(((block+1) * (*bf)), *nrecs)); 

    
   ncclose(ncinfile->ncfid); free(ncinfile); return(ncinfileerror);
  }


 
 
int process_vars(struct fileinfo *ncinfile, struct fileinfo *ncoutfile,
                 unsigned char appendnc, int *nrecs, int *nblocks, int* bf, int r, int nfiles,
                 int f, unsigned char verbose, unsigned char missing)
  {
   int v, d, i, j, k, l, b, s;   
   int dimid;   
   void *values = ((void*)0);   
   long instart[1024], outstart[1024];   
   long count[1024];                            
   long long recsize;   
   long long recfullsize;   
   int varrecdim;   
   static unsigned char first=1;   
   int imax, jmax, kmax, lmax;
   int imaxfull, jmaxfull, kmaxfull, lmaxfull;
   int imaxjmaxfull, imaxjmaxkmaxfull;
   int offset, ioffset, joffset, koffset, loffset;
   int recdimsize;  
   long long varbufsize;

   if ( ncinfile->recdim < 0 )
     recdimsize=1;
   else
     recdimsize=ncinfile->dimsize[ncinfile->recdim];

    
   if (*nrecs==1)
     {
       *nrecs=recdimsize;

      if ((*bf) >= 1) 
        {
         if ((*bf) > (*nrecs)) {
					 if ((*nrecs) <= 0) {
						 fprintf(stderr, "nrecs equal to zeros. \n");
        		return(1);
           }
           fprintf(stderr, "blocking factor (k) > total records (%d). Setting blocking factor to %d.\n",
                   *nrecs, *nrecs);
           *bf = *nrecs;
         }
         if (((*nrecs) % (*bf)) != 0) *nblocks = (int)((*nrecs)/(*bf)) + 1;
         else *nblocks = (int)((*nrecs)/(*bf));
        }
      else 
        {
          
         *bf = min(100,*nrecs); 
          
         *nblocks = (int)((*nrecs)/(*bf));
        }
        if (verbose) fprintf(stderr, "blocking factor=%d, num. blocks=%d, num. records=%d\n",*bf,*nblocks, *nrecs);
     }
   else
     if (recdimsize != *nrecs)
       {
        fprintf(stderr,"Error: different number of records than the first input file!\n");
        return(1);
       }

    




 
    if (varbuf == ((void*)0)) {
      int nbytes = (*bf)*sizeof(void**) + ((*bf) * 8192* sizeof(void *));
      if (verbose || print_mem_usage) fprintf(stderr, "allocating a buffer of %d bytes for the multi-dimensional pointer array\n", nbytes);
      if (mem_dry_run) estimated_maxrss += nbytes;
      varbuf = (void ***)calloc(nbytes, 1);
      if (varbuf == ((void*)0)) {
        fprintf(stderr, "Could not allocate a memory of size %lu bytes\n", sizeof(void*)*(*bf)*8192);
        exit(1);
      }
       
      int z;
      for (z=0; z<(*bf); z++) {
        varbuf[z] = (void**) ((size_t)varbuf + (*bf)*sizeof(void**) + z*8192*sizeof(void*));
      }
    













 
    }  

    
   for (v=0; v < ncinfile->nvars; v++)
     {
      if (verbose > 1) printf("    variable = %s\n",ncinfile->varname[v]);

       
      recsize=1; recfullsize=1; varrecdim=(-1);
      outstart[0]=0; outstart[1]=0; outstart[2]=0; outstart[3]=0;
      for (d=0; d < ncinfile->varndims[v]; d++)
        {
         if (ncinfile->vardim[v][d]==ncinfile->recdim)
           {
            count[d]=1; varrecdim=d;
           }
         else
           {
            count[d]=ncinfile->dimsize[ncinfile->vardim[v][d]];
            recsize*=count[d]; instart[d]=0;
            outstart[d]=ncinfile->dimstart[ncinfile->vardim[v][d]]-1;
            recfullsize*=ncinfile->dimfullsize[ncinfile->vardim[v][d]];
           }
         if (verbose > 1)
           printf("      dim %d:  instart=%ld  outstart=%ld  count=%ld\n",d,
                  instart[d],outstart[d],count[d]);
        }

       
      if (r > 0)
        {
          
         if ((dimid=ncdimid(ncinfile->ncfid,ncinfile->varname[v]))!=(-1))
           {
            if (ncinfile->recdim==dimid)
              {
               if (f!=0) continue;
              }
            else continue;
           }
          
         else
           {
            
 

             
            if (varrecdim==(-1)) continue;

             
            if (ncinfile->vardecomp[v]!=1 && f > 0) continue;
           }
        }
      else
        {
         if (ncinfile->vardecomp[v]!=1 && appendnc) continue;
        }

       
      if ((values=malloc(nctypelen(ncinfile->datatype[v])*recsize))==((void*)0))
        {
         fprintf(stderr,"Error: cannot allocate %lld bytes for decomposed variable \"%s\"'s values!\n",
                 nctypelen(ncinfile->datatype[v])*recsize,ncinfile->varname[v]);
         return(1);
        }

       
      if (varrecdim!=(-1)) instart[varrecdim]=outstart[varrecdim]=r;
      if (ncvarget(ncinfile->ncfid,v,instart,count,values)==(-1))
        {
         fprintf(stderr,"Error: cannot read variable \"%s\"'s values!\n",
                 ncinfile->varname[v]);
         return(1);
        }

       
      if ((ncinfile->vardecomp[v]!=1) && (!mem_dry_run))
        {
         if (verbose > 1)
           printf("      writing %lld bytes to file\n",
                  nctypelen(ncinfile->datatype[v])*recsize);
         if (ncvarput(ncoutfile->ncfid,v,outstart,count,values)==(-1))
           {
            fprintf(stderr,"Error: cannot write variable \"%s\"'s values!\n",
                    ncinfile->varname[v]);
            return(1);
           }
        }
       
      else
        {
          
          
          
          
         if (varbuf[(r % (*bf))][v] == ((void*)0)) 
           {
            varbufsize=nctypelen(ncinfile->datatype[v])*recfullsize;
            if (verbose && print_mem_usage)
              printf("      allocating %lld bytes for full domain of variable %s\n",
                     varbufsize, ncinfile->varname[v]);
            if (mem_dry_run) {
              estimated_maxrss += varbufsize;
              varbuf[(r % (*bf))][v] = "deadbeef";
              continue;
            }
            if ((varbuf[(r % (*bf))][v]=calloc(varbufsize,1))==((void*)0))
              {
               fprintf(stderr,"Error: cannot allocate %lld bytes for entire variable \"%s\"'s values!\n",
                       varbufsize,ncinfile->varname[v]); return(1);
              }
            mem_allocated += varbufsize;
            if (missing && ncoutfile->varmiss[v])
              switch (ncinfile->datatype[v])
                {
                 case 1:
                 case 2:
                   for (s=0; s < recfullsize; s++)
                     *((unsigned char *)(varbuf[(r % (*bf))][v])+s)=
                     *((unsigned char *)(ncoutfile->varmissval[v]));
                   break;
                 case 3:
                   for (s=0; s < recfullsize; s++)
                     *((short *)(varbuf[(r % (*bf))][v])+s)=
                     *((short *)(ncoutfile->varmissval[v]));
                   break;
                 case 4:
                   for (s=0; s < recfullsize; s++)
                     *((int *)(varbuf[(r % (*bf))][v])+s)=
                     *((int *)(ncoutfile->varmissval[v]));
                   break;
                 case 5:
                   for (s=0; s < recfullsize; s++)
                     *((float *)(varbuf[(r % (*bf))][v])+s)=
                     *((float *)(ncoutfile->varmissval[v]));
                   break;
                 case 6:
                   for (s=0; s < recfullsize; s++)
                     *((double *)(varbuf[(r % (*bf))][v])+s)=
                     *((double *)(ncoutfile->varmissval[v]));
                   break;
                }
           }
         if (varbuf[(r % (*bf))][v]==((void*)0))
           {
            fprintf(stderr,"Internal memory usage error!\n"); exit(1);
           }
         if (mem_dry_run) continue;
         if (verbose > 1)
           printf("      writing %lld bytes to memory\n",
                   nctypelen(ncinfile->datatype[v])*recsize);

         imax=ncinfile->dimsize[ncinfile->vardim[v][ncinfile->varndims[v]-1]];
         if (ncinfile->varndims[v] > 1)
           {
            dimid=ncinfile->vardim[v][ncinfile->varndims[v]-2];
            if (dimid==ncinfile->recdim) jmax=1;
            else jmax=ncinfile->dimsize[dimid];
           }
         else jmax=1;
         if (ncinfile->varndims[v] > 2)
           {
            dimid=ncinfile->vardim[v][ncinfile->varndims[v]-3];
            if (dimid==ncinfile->recdim) kmax=1;
            else kmax=ncinfile->dimsize[dimid];
           }
         else kmax=1;
         if (ncinfile->varndims[v] > 3)
           {
            dimid=ncinfile->vardim[v][ncinfile->varndims[v]-4];
            if (dimid==ncinfile->recdim) lmax=1;
            else lmax=ncinfile->dimsize[dimid];
           }
         else lmax=1;
         if (verbose > 1)
           printf("      imax=%d  jmax=%d  kmax=%d  lmax=%d\n",imax,jmax,
                  kmax,lmax);

         imaxfull=ncinfile->dimfullsize[ncinfile->vardim[v][ncinfile->varndims[v]-1]];
         if (ncinfile->varndims[v] > 1)
           jmaxfull=ncinfile->dimfullsize[ncinfile->vardim[v][ncinfile->varndims[v]-2]];
         else jmaxfull=1;
         if (ncinfile->varndims[v] > 2)
           kmaxfull=ncinfile->dimfullsize[ncinfile->vardim[v][ncinfile->varndims[v]-3]];
         else kmaxfull=1;
         if (ncinfile->varndims[v] > 3)
           {
            if (ncinfile->vardim[v][ncinfile->varndims[v]-4]!=ncinfile->recdim)
              lmaxfull=ncinfile->dimfullsize[ncinfile->vardim[v][ncinfile->varndims[v]-4]];
            else lmaxfull=1;
           }
         else lmaxfull=1;
         if (verbose > 1)
           printf("      imaxfull=%d  jmaxfull=%d  kmaxfull=%d  lmaxfull=%d\n",
                  imaxfull,jmaxfull,kmaxfull,lmaxfull);
         imaxjmaxfull=imaxfull*jmaxfull;
         imaxjmaxkmaxfull=imaxfull*jmaxfull*kmaxfull;

         ioffset=outstart[ncinfile->varndims[v]-0-1];
         if (ncinfile->varndims[v] > 1)
           joffset=outstart[ncinfile->varndims[v]-1-1];
         else joffset=0;
         if (ncinfile->varndims[v] > 2)
           koffset=outstart[ncinfile->varndims[v]-2-1];
         else koffset=0;
         if (ncinfile->varndims[v] > 3)
           loffset=outstart[ncinfile->varndims[v]-3-1];
         else loffset=0;
         if (varrecdim!=(-1))
           {
            switch (ncinfile->varndims[v])
              {
               case 1:
                 ioffset=0;
                 break;
               case 2:
                 joffset=0;
                 break;
               case 3:
                 koffset=0;
                 break;
               case 4:
                 loffset=0;
                 break;
              }
           }
         if (verbose > 1)
           printf("      ioffset=%d  joffset=%d  koffset=%d  loffset=%d\n",
                  ioffset,joffset,koffset,loffset);
         switch (ncinfile->datatype[v])
           {
            case 1:
            case 2:
              if (verbose > 1) printf("      start copying byte/char\n");
              b=0;
              for (l=0; l < lmax; l++)
                for (k=0; k < kmax; k++)
                  for (j=0; j < jmax; j++)
                    for (i=0; i < imax; i++)
                      {
                       offset=(i+ioffset)+
                              (j+joffset)*imaxfull+
                              (k+koffset)*imaxjmaxfull+
                              (l+loffset)*imaxjmaxkmaxfull;
                       *((unsigned char *)(varbuf[(r % (*bf))][v])+offset)=
                       *((unsigned char *)values+(b++));
                      }
              if (verbose > 1) printf("      end copying byte/char\n");
              break;
            case 3:
              if (verbose > 1) printf("      start copying short\n");
              b=0;
              for (l=0; l < lmax; l++)
                for (k=0; k < kmax; k++)
                  for (j=0; j < jmax; j++)
                    for (i=0; i < imax; i++)
                      {
                       offset=(i+ioffset)+
                              (j+joffset)*imaxfull+
                              (k+koffset)*imaxjmaxfull+
                              (l+loffset)*imaxjmaxkmaxfull;
                       *((short *)(varbuf[(r % (*bf))][v])+offset)=
                       *((short *)values+(b++));
                      }
              if (verbose > 1) printf("      end copying short\n");
              break;
            case 4:
              if (verbose > 1) printf("      start copying int\n");
              b=0;
              for (l=0; l < lmax; l++)
                for (k=0; k < kmax; k++)
                  for (j=0; j < jmax; j++)
                    for (i=0; i < imax; i++)
                      {
                       offset=(i+ioffset)+
                              (j+joffset)*imaxfull+
                              (k+koffset)*imaxjmaxfull+
                              (l+loffset)*imaxjmaxkmaxfull;
                       *((int *)(varbuf[(r % (*bf))][v])+offset)=
                       *((int *)values+(b++));
                      }
              if (verbose > 1) printf("      end copying int\n");
              break;
            case 5:
              if (verbose > 1) printf("      start copying float\n");
              b=0;
              for (l=0; l < lmax; l++)
                for (k=0; k < kmax; k++)
                  for (j=0; j < jmax; j++)
                    for (i=0; i < imax; i++)
                      {
                       offset=(i+ioffset)+
                              (j+joffset)*imaxfull+
                              (k+koffset)*imaxjmaxfull+
                              (l+loffset)*imaxjmaxkmaxfull;
                       *((float *)(varbuf[(r % (*bf))][v])+offset)=
                       *((float *)values+(b++));
                      }
              if (verbose > 1) printf("      end copying float\n");
              break;
            case 6:
              if (verbose > 1) printf("      start copying double\n");
              b=0;
              for (l=0; l < lmax; l++)
                for (k=0; k < kmax; k++)
                  for (j=0; j < jmax; j++)
                    for (i=0; i < imax; i++)
                      {
                       offset=(i+ioffset)+
                              (j+joffset)*imaxfull+
                              (k+koffset)*imaxjmaxfull+
                              (l+loffset)*imaxjmaxkmaxfull;
                       *((double *)(varbuf[(r % (*bf))][v])+offset)=
                       *((double *)values+(b++));
                      }
              if (verbose > 1) printf("      end copying double\n");
              break;
           }
        }

       
      if (values != ((void*)0)) free(values);
     }
   first=0; return(0);
  }


 
int flush_decomp(struct fileinfo *ncoutfile, int nfiles, int r, int bf, unsigned char verbose)
  {
   int v, d;   
   long outstart[1024];   
   long count[1024];      
   int varrecdim;   

   if (verbose > 1)
     {
      printf("    nvars=%d\n",ncoutfile->nvars);
     }

    
   for (v=0; v < ncoutfile->nvars; v++)
     {
      if (ncoutfile->vardecomp[v]==0) continue;
      if (verbose > 1) printf("    v=%d (%s)\n",v,ncoutfile->varname[v]);
      varrecdim=(-1);
      for (d=0; d < ncoutfile->varndims[v]; d++)
        {
         outstart[d]=0;
         if (ncoutfile->vardim[v][d]==ncoutfile->recdim)
           {
            count[d]=1; varrecdim=d;
           }
         else
           {
            count[d]=ncoutfile->dimfullsize[ncoutfile->vardim[v][d]];
           }
         if (verbose > 1)
           printf("      d=%d:  outstart=%ld  count=%ld\n",d,outstart[d],
                  count[d]);
        }
      if (varrecdim!=(-1)) outstart[varrecdim]=r;
      if (varrecdim==(-1) && r > 0) continue;
      if (verbose > 1)
        printf("      writing to disk\n");
      if (ncvarput(ncoutfile->ncfid,v,outstart,count,varbuf[(r % bf)][v])==(-1))
        {
         fprintf(stderr,"Error: cannot write variable \"%d\"'s values!\n",
                 v); return(1);
        }
     }
   return(0);
  }

int rmfile(char *filename[]) {
        return(remove(filename[0]));
}











































 
