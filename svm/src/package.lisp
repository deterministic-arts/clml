(in-package :cl-user)

(defpackage :clml.svm.mu
  (:nicknames :svm)
  (:use :common-lisp
        :hjs.util.meta)
  (:export :kernel
           :polynomial-kernel 
           :+linear-kernel+
           :radial-kernel :gaussian-kernel
           :sigmoid-kernel
           :svm)
  (:documentation "support vector machine package

Iterative solution, as in
Multiplicative Updates for Nonnegative Quadratic Programming in
Support Vector Machines, F. Sha, L. K. Saul, D. D. Lee.
and the sum constraint is described in
Multiplicative Updates for Large Margin Classifiers,
F. Sha, L. K. Saul, D. D. Lee.

A nice and clear explanation of SVMs can be found in
[[http://www.csd.uwo.ca/courses/CS9860b/papers/][Support Vector Machines Explained, Tristan Fletcher, 2008]]

")
  )

(defpackage :clml.svm.wss3
  (:nicknames :svm.wss3)
  (:use :cl
	:hjs.util.meta
	:hjs.util.vector
	:hjs.learn.read-data
    :hjs.util.matrix)
  (:import-from :decision-tree
		#:sum-up)
  (:export #:make-svm-learner
	   #:load-svm-learner
	   #:make-linear-kernel
	   #:make-rbf-kernel
	   #:make-polynomial-kernel
	   #:make-one-class-svm-kernel
	   #:svm-validation
       #:sign
       #:call-kernel-function-uncached
       #:call-kernel-function
       #:define-kernel-function
	   ))


(defpackage :clml.svm.one-class
  (:use :cl
	:clml.svm.wss3
	:hjs.util.meta
	:hjs.util.vector
	:hjs.learn.read-data
    :hjs.util.matrix)
  (:nicknames :one-class-svm)
  (:import-from :svm.wss3
		#:sign
		#:call-kernel-function-uncached
		#:call-kernel-function)
  (:export #:one-class-svm
           #:qp-solver
           )
  (:documentation "Support Vector Regression Package using SMO-type algorithm

Reference: "A Study on SMO-type Decomposition Methods for Support Vector Machines"
Pai-Hsuen Chen, Rong-En Fan, and Chih-Jen Lin"))

(defpackage :clml.svm.pwss3
  (:nicknames :pwss3-svm)
  (:use :cl
          :hjs.util.meta
          :hjs.util.vector
          :hjs.learn.read-data
          :hjs.util.matrix)
  (:import-from :decision-tree
		#:sum-up)
  (:export #:make-svm-learner
	   #:load-svm-learner
	   #:make-linear-kernel
	   #:make-rbf-kernel
	   #:make-polynomial-kernel
	   #:make-one-class-svm-kernel
	   #:svm-validation
	   ))

(defpackage :clml.svm.smo
  (:use :cl
	:hjs.learn.read-data
        :hjs.util.vector
        :hjs.util.matrix
        :hjs.util.meta)
  (:import-from :decision-tree
		#:sum-up)
  (:export
   #:linear-kernel
   #:make-rbf-kernel
   #:make-polynomial-kernel
   #:make-svm-learner
   #:svm-validation
   #:load-svm-learner
   #:call-kernel-function-with-indices
   #:call-kernel-function-with-vectors)
  (:documentation "Support-Vector-Machine (Soft Margin)
Support Vector Machine Package using SMO algorithm
Reference: Jhon C. Platt. "Fast Training of Support Vector Machines using Sequential Minimal Optimization"
")
  )


(defpackage :clml.svm.svr
  (:nicknames :svr)
  (:use :cl
	:svm.wss3
	:hjs.util.meta
	:hjs.util.vector
	:hjs.learn.read-data
        :hjs.util.matrix)
  (:import-from :svm.wss3
		#:call-kernel-function-uncached
		#:call-kernel-function
		#:define-kernel-function)
  (:export #:make-svr-learner
	   #:load-svr-learner
	   #:svr-validation
	   )
  (:documentation "Support-Vector-Regression

Support Vector Regression Package using SMO-type algorithm
Reference: "A Study on SMO-type Decomposition Methods for Support Vector Machines"
Pai-Hsuen Chen, Rong-En Fan, and Chih-Jen Lin
"))