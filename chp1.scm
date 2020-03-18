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

