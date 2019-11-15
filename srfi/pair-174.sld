(define-library (srfi pair-174)

(import (scheme base))
(import (srfi 128))

(export timespec timespec? timespec-seconds timespec-nanoseconds
        timespec=? timespec<? timespec-hash)
(begin

(define timespec cons)
(define timespec-seconds car)
(define timespec-nanoseconds cdr)

(define (timespec? obj)
  (and (pair? obj)
       (exact-integer? (car obj))
       (exact-integer? (cdr obj))
       (<= 0 (cdr obj) 999999999)))

(define (timespec=? a b)
  (and (= (timespec-seconds a) (timespec-seconds b))
       (= (timespec-nanoseconds a) (timespec-nanoseconds b))))

(define (timespec<? a b)
  (or (< (timespec-seconds a) (timespec-seconds b))
      (and (= (timespec-seconds a) (timespec-seconds b))
	   (< (timespec-nanoseconds a) (timespec-nanoseconds b)))))

(define (timespec-hash a)
  (abs (+ (* (timespec-seconds a) #e1e9) (timespec-nanoseconds a))))

