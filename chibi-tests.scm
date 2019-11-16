(import (scheme base))
(import (chibi test))
(import (srfi 174))

(define ts1 (timespec 1 2))
(define ts2 (timespec 1 2))
(define ts3 (timespec 1 3))
(define ts4 (timespec 2 2))
(define ts-neg1 (timespec -1 2))
(define ts-neg2 (timespec -1 5))
(define ts-neg3 (timespec -2 0))

(test-group "srfi-174"

(test-assert "timespec?" (timespec? ts1))
(test-assert "not timespec?" (not (timespec? #f)))
(test "seconds" 1 (timespec-seconds ts1))
(test "nanos" 2 (timespec-nanoseconds ts1))
(test-assert "equal" (timespec=? ts1 ts2))
(test-assert "less nanos" (timespec<? ts1 ts3))
(test-assert "less seconds" (timespec<? ts1 ts4))
(test-assert "less -nanos" (timespec<? ts-neg2 ts-neg1))
(test-assert "less -seconds" (timespec<? ts-neg3 ts-neg2))
(test-assert "positive hash" (positive? (timespec-hash ts-neg1)))
)

(test-exit)
