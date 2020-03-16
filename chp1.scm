; Exercise 1.3

(define (square x) (* x x))

(define (sum-of-squares x y) (+ x y))

(define (two-biggest a b c) (cond ((and (< c a) (< c b)) (sum-of-squares a b))
                                  ((and (< a b) (< a c)) (sum-of-squares b c))
                                  (else (sum-of-squares a c))))


(= (two-biggest 10 20 30) (sum-of-squares 20 30))
(= (two-biggest 10 10 20) (sum-of-squares 10 20))
(= (two-biggest 10 30 30) (sum-of-squares 30 30))


