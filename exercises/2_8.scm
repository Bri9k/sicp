(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let
      ((p1 (* (lower-bound x) (lower-bound y)))
       (p2 (* (lower-bound x) (upper-bound y)))
       (p3 (* (upper-bound x) (lower-bound y)))
       (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1 (upper-bound y))
                  (/ 1 (lower-bound y)))))
; Note:
; I first thought that this will not work for negative fractions
; When y is -4 to -2, the second argument of make-interval will be
; (-0.5 to -0.25)- which is incorrect
; However, Alyssa is a smart Hacker.
; Because of the cases made in multiplication, it does not matter what order the arguments go in,
; the use of 'min' and 'max' fixes everything.

; The actual point of 2.8

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define a
  (make-interval (- 2) 2))

(define b
  (make-interval 4 7))

(add-interval a b)
(sub-interval a b)
(mul-interval a b)
(div-interval a b)