
(load "/home/white/programming/Project_Euler/miller-rabin.scm")
(use-modules (srfi srfi-1))

(define (get-1/d-cycle-length d)
  (define (iter r prev-remainders)
    (cond
     ((let ((index (list-index (lambda (x) (= r x)) prev-remainders)))
	(if index
	    (cons (+ index 1) prev-remainders)
	    #f
	)
      )
     )
     ((= r 0) 0)
     (else
      (let loop ((rem r))
	(cond
	 ((< rem d) (loop (* 10 rem)))
	 (else (iter (modulo rem d) (cons r prev-remainders)))
	)
      )
     )
    )
  )

  (iter 1 '())
)

(get-1/d-cycle-length 10)

(let loop ((d 2)
	   (max-cycle 0)
	   (max-d     0)
	  )
  (cond
   ((>= d 1000) (cons max-d max-cycle))
   ((> (get-1/d-cycle-length d) max-cycle) (loop (+ d 1) (get-1/d-cycle-length d) d))
   (else (loop (+ d 1) max-cycle max-d))
  )
)

(get-1/d-cycle-length 983)