(load "/home/white/programming/Project_Euler/miller-rabin.scm")

(define primes (genprimes (/ 28123 2)))


(define (get-prime-factors num)
  (define (iter num facs p num-current-factor)
    (cond
     ((null? p) (list (cons num 1)))
     ((= num 1) (cons (cons (car p) num-current-factor) facs))
     ((= 0 (modulo num (car p))) (iter (/ num (car p)) facs p (+ num-current-factor 1)))
     ((= 0 num-current-factor) (iter num facs (cdr p) num-current-factor))
     (else (iter num (cons (cons (car p) num-current-factor) facs) (cdr p) 0))
    )
  )

  (reverse (iter num (list) primes 0))
)


(define (get-proper-divisors num)
  (define (get-factor factor-num prime-facs)
    (cond
     ((null? prime-facs) 1)
     (else (* (expt (caar prime-facs) (modulo factor-num (+ 1 (cdar prime-facs)))) (get-factor (quotient factor-num (+ 1 (cdar prime-facs))) (cdr prime-facs))))
    )
  )
  
  (let ((divisors (get-prime-factors num)))
    (let loop ((factors '())
	       (i 0)
	      )
      (let ((current-factor (get-factor i  divisors)))
	(cond
	 ((= num current-factor) factors)
	 ;((and (not (= i 0)) (= current-factor 1)) factors)
	 (else (loop (cons current-factor factors) (+ i 1)))
	)
      )
    )
  )
)


(define (get-abundant-nums-up-to-n n)

  (define (is-abundant? num)
    (< num (reduce + 0 (get-proper-divisors num)))
  )

  (let loop ((acc '())
	     (i 12)
	    )
    (cond
     ((> i n) (reverse acc))
     ((is-abundant? i) (loop (cons i acc) (+ i 1)))
     (else (loop acc (+ i 1)))
    )
  )
   
)






