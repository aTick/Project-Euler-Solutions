
.123456891011121314151617181920

(+ 100   (/ (-  200 190 ) 3.))


(+ (expt 10 5) (/ (- (expt 10 6) 488889) 6.)) 

(+ (expt 10 number-of-digits) (/ (- d (+ (sum (* 9 (expt 10 i) number-of-digits)) 1)) number-of-digits))

(define (get-number-with-digit d)

  ;Should be called with numdigits = 1 and accum = 0
  (define (get-digits-less-than-current-number-of-digits d numdigits accum)
    (cond
     ((< d  (+ accum  (* 9 (expt 10 (- numdigits 1)) numdigits) 1)) (cons numdigits accum))
     (else (get-digits-less-than-current-number-of-digits d (+ numdigits 1) (+ accum (+ (* 9 (expt 10 (- numdigits 1)) numdigits ) ))))
    )
  )

  (get-digits-less-than-current-number-of-digits (expt 10 6) 1 0)

)








(define (temp num lst)
  (cond
   ((> num 200000) lst)
   (else (temp (+ num 1) (append lst (list num))))
  )
)

(temp 1 (list))

(* 1 1 5 3 7 2)

