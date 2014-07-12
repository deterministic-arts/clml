( eval-when (:compile-toplevel)
  (setq *read-default-float-format* 'double-float)
  )

(defpackage "BLAS"
  (:use "COMMON-LISP")
  (:export "DAXPY" "DCOPY" "DDOT" "DNRM2" "DSCAL" "IDAMAX" "DASUM"
	   "DCABS1" "DGBMV" "DGEMM" "DGEMV" "DGER" "DROT" "DROTG"
	   "DSBMV" "DSPMV" "DSPR" "DSPR2" "DSWAP" "DSYMM" "DSYMV"
	   "DSYR" "DSYR2" "DSYR2K" "DSYRK" "DTBMV" "DTBSV" "DTPMV"
	   "DTPSV" "DTRMM" "DTRMV" "DTRSM" "DTRSV" "DZASUM" "DZNRM2"
	   "ICAMAX" "ISAMAX" "IZAMAX" "LSAME" "XERBLA"))
   
