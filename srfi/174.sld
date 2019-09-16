(define-library (srfi 174)

(import (scheme base))
(import (srfi 128))

(export timespec timespec? timespec-seconds timespec-nanoseconds
        timespec-comparator)
(begin

(define-record-type <timespec>
    (timespec seconds nanoseconds)
    timespec?
  (seconds timespec-seconds)
  (nanoseconds timespec-nanoseconds))

(define (timespec= a b)
  (and (= (timespec-seconds a) (timespec-seconds b))
       (= (timespec-nanoseconds a) (timespec-nanoseconds b))))

(define (timespec< a b)
  (or (< (timespec-seconds a) (timespec-seconds b))
      (and (= (timespec-seconds a) (timespec-seconds b))
	   (< (timespec-nanoseconds a) (timespec-nanoseconds b)))))

(define (timespec-hash a)
  (abs (+ (* (timespec-seconds a) #e1e9) (timespec-nanoseconds a))))

(define timespec-comparator
  (make-comparator
    timespec?
    timespec=
    timespec<
    timespec-hash))))
