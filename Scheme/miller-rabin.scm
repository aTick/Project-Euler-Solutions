(define (prime? n)
  (define (miller-rabin n k)

    (define (mod-expt b e n)
      (let loop ((b b) (e e) (acc 1))
	(cond
	 ((= e 0) acc)
	 ((= 0 (modulo e 2)) (loop (modulo (* b b) n) (/ e 2) acc))
	 (else (loop b (- e 1) (modulo (* b acc) n)))
	)
      )
    )

    (cond
     ((< n 0)   0)
     ((= n 1)	0)
     ((or (= n 2) (= n 3)) n)
     (else
      (let*  ((s (let loop ((val (- n 1)) (r 0))
		   (cond
		    ((= 0 (modulo val 2)) (loop (/ val 2) (+ r 1)))
		    (else r)
		    )
		   ))
	      (d (/ (- n 1) (expt 2 s)))
	      )
	
	(define (outer-loop i a x)

	  (cond
	   ((or (= n 2) (= n 3)) n)
	   ((= 0 (modulo n 2)) 0)
	   ((= i k)  n)
	   ((= a 0) (let ((a (+ 2 (random (- n 4))))) (outer-loop i a (mod-expt a d n))))
	   ((or (= x 1) (= x (- n 1))) (let ((a (+ 2 (random (- n 4))))) (outer-loop (+ i 1) a  (mod-expt a d n))))
	   ((let loop2 ((r 1)
			(y (mod-expt x 2 n))
			)
	      
	      (cond

	       ((= r s) #t) ;Composite
	       ((= y 1) #t) ;Composite
	       ((= y (- n 1))  (outer-loop (+ i 1) 0 -1))
	       (else (loop2 (+ r 1) (mod-expt y 2 n)))
	       )
	      )
	    0)
	   (else 0)
	   )

	  )

	(outer-loop 0 0 -1)
	
	)
      )
     )
    )


  (not (= 0(miller-rabin n 10)))

  )

(define (filter pred lst1)
  (let loop ((acc '()) (lst lst1))
    (cond
     ((null? lst) (reverse acc))
     ((pred (car lst)) (loop (cons (car lst) acc) (cdr lst)))
     (else (loop acc (cdr lst)))
    )
  )
)

(define (genprimes max)
  (let loop ((i 3) (primes '(2)))
    (cond
     ((> i max)  (reverse primes))
     ((prime? i) (loop (+ i 2)(cons i primes)))
     (else (loop (+ i 2) primes))
    )
  )
)

(define (reduce op init lst1)
  (let loop ((acc init) (lst lst1))
    (cond
     ((null? lst) acc)
     (else (loop (op acc (car lst)) (cdr lst)))
    )
  )
)
