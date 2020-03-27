; -- Exercise 1.3

(define (square x) (* x x))

(define (sum-of-squares x y) (+ x y))

(define (two-biggest a b c) (cond ((and (< c a) (< c b)) (sum-of-squares a b))
                                  ((and (< a b) (< a c)) (sum-of-squares b c))
                                  (else (sum-of-squares a c))))


(= (two-biggest 10 20 30) (sum-of-squares 20 30))
(= (two-biggest 10 10 20) (sum-of-squares 10 20))
(= (two-biggest 10 30 30) (sum-of-squares 30 30))


; A combination is a combination of operator and operands.
; (+ 1 2)



; Applicative-order evaluation: Evaluate the arguments and then apply the operator is what the interpreter uses.  it helps avoid calculating the same expression more than once if we were to expand an expression by continuing to substitute operands as parameters

; Normal-order evaluation: only evaluate the operands when you need to.  Subsitutde operands as parameters until you arrive at an expression with only primitive expressions (fully-expand and then evaluate)

; -- Exercise 1.5

; `p` is recursively calling itself.  If it's applicative-order evaluation, then it's going to attempt to evaluate the (p) combination before subsituting as parameters in the definition of the `test` procedure.
; If it's normal-order evaluation, it's going to subsitute the operand expressions as-is into the `test` procedure definition.  Since the predicate is only going to evaluate the consequent (the expression that results if the predicate is true)

; -- Exercise 1.6

; The `if` special form only evaluates the alternate expression if the predicate is false.  Alyssa's custom `new-if` does not short-circuit during applicative-order evaluation and would evaluate all operands and would result in an infinite loop.


; -- Exercise 1.7

; For any X smaller than 0.001, Good enough is going to accept any guess that produces a square smaller than 0.001 since 
; Is this true?  It seems to be wrong with Xs equal to or around 0.001.

; If you're looking for an absolute value of a really large number, it's possible the improvement algorithm is never going to get close enough to meet the threshold. 


#|

|#

(define (sqrt-iter guess x) 
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x) 
    (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; -- Exercise 1.8


; -- Exercise 1.9

#|

; recursive.  calculations are delayed until base case is recursively reached.

(define (+ a b)
    (if (= a 0) b (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6))))
(inc (inc 7))
(inc 8)
9


; iterative.  there's no delayed calculation and the state is in each iteration.  Starts with base case and keeps
a running total and a counter.

(define (+ a b)
    (if (= a 0) b (+ (dec a) (inc b))))

(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9

|#

; Exercise 1.11

(define (f1 n) 
    (if (< n 3) 
        n 
        (+ (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3))))))

(define (f2 n) 
    (if (< n 3) n (f-iter 0 1 2 n) ))

(define (f-iter x y z count)
    (if (= count 0) x 
        (f-iter y z (+ z (* 2 y) (* 3 x)) (- count 1))))

; Exercise 1.12

(define (pascals n) 
    (if (= n 1) 
        (list 1) 
        (getNext (pascals (- n 1)))))
        
(define (getNext previousList)
    (getNextAux previousList 
                (list) 
                0))

(define (getNextAux previousList newList index)
    (if (> (length newList) (length previousList))
        newList
        (getNextAux previousList 
                    (append newList (list (getVal previousList index))) 
                    (+ index 1))))

(define (getVal previousList index)
    (if (or (= index 0) (>= index (length previousList)))
        1
        (+ (list-ref previousList 
                     (- index 1)) 
           (list-ref previousList 
                     index))))