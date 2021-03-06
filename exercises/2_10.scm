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

; it does not make sense to divide by and interval around zero,
; as the limit then does not exist at endpoints but at zero, where it is not defined
(define (div-interval x y)
  (let ((ly (lower-bound y))
        (uy (upper-bound y)))
    (if (and (>= uy 0) (<= ly 0))
        (error "Dividing interval spans 0")
        (mul-interval
         x
         (make-interval (/ 1 uy)
                        (/ 1 ly))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define a
  (make-interval (- 2) (- 1)))

(define b
  (make-interval 4 7))

(add-interval a b)
(sub-interval a b)
(mul-interval a b)
(div-interval a b)