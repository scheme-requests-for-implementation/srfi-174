(import (scheme base))
(import (srfi 128))
(import (chibi test))
(import (srfi 174))

(define ts1 (timespec 1 2))
(define ts2 (timespec 1 2))
(define ts3 (timespec 1 3))
(define ts4 (timespec 2 2))
(define ts-odd (timespec 1 1000000001))
(define ts-neg (timespec -1 2))
(test-group "srfi-174"

(test-assert "timespec?" (timespec? ts1))
(test-assert "not timespec?" (not (timespec? #f)))
(test "seconds" 1 (timespec-seconds ts1))
(test "nanos" 2 (timespec-nanoseconds ts1))
(test-assert "equal" (=? timespec-comparator ts1 ts2))
(test-assert "less nanos" (<? timespec-comparator ts1 ts3))
(test-assert "less seconds" (<? timespec-comparator ts1 ts3))
(test-assert "odd" (<? timespec-comparator ts1 ts-odd))
(test-assert "positive hash"
  (positive? (comparator-hash timespec-comparator ts-neg)))
)

(test-exit)
