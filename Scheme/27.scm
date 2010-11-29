;Use prime? defined in miller-rabin.scm

(define (create-quadratic a b)
  (lambda (n) (+ (* n n) (* a n) b))
)


(let loop ((a -999) (b -999) (n 0) (maxnum-primes 0) (max-a-b (cons 0 0)))
  (cond
   ((>= a 1000) max-a-b)
   ((>= b 1000) (loop (+ a 1) -999 0 maxnum-primes max-a-b))
   ((prime? ((create-quadratic a b) n)) 
	(loop a b (+ n 1) maxnum-primes max-a-b)
    )
   ((> n maxnum-primes)
       (begin (display "consecutive prime for values ") (display a) (display " ") (display b) (display " ") (display n )(display " ") (display maxnum-primes)  (newline))
	(loop a (+ b 1) 0 n (cons a b))
	;(loop a (+ b 1) 0 maxnum-primes max-a-b)
    )

   (else (loop a (+ b 1) 0 maxnum-primes max-a-b))
  )
)



(let ((quad (create-quadratic -783 229)))
(let loop ((n 0) (maxprimes 0))
  (cond
   ;((< (quad n) 0) (display "what?")(newline))
   ((prime? (quad n)) (loop (+ n 1) (+ maxprimes 1)))
   (else maxprimes)
  )
)
)