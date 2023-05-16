(define dx 0.0000001)

(define (smooth f)
  (lambda(x) (/
              (+
               (f (- x dx))
               (f x)
               (f (+ x dx)))
              3)))
