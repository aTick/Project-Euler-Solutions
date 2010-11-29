(define (find pred lst)

  (cond
   ((null? lst) #f)
   ((pred (car lst)) #t)
   (else (find pred (cdr lst)))
  )
)


(define (a-b-loop init-a init-b max-a-power max-b-power)
  (define (a-loop a lst)
    (define (b-loop b lst)
      (let ((val (expt a b)))
	(cond
	 ((> b max-b-power) lst)
	 ;((find (lambda (x) (= x val)) lst) (b-loop (+ 1 b) lst))
	 (else (b-loop (+ 1 b) (cons val lst)))
	)
      )
     )

    (cond
     ((> a max-a-power) lst)
     (else (a-loop (+ 1 a) (b-loop init-b lst)))
    )
    
   )

  (a-loop init-a '())
 )

 (a-b-loop 2 2 100 100)



(define (remove-duplicates-func l)
  (define (iter a l)
    (cond
     ((null? l) (reverse a))
     ((member (lambda (x) (= (car l) x)) a) (iter a (cdr l)))
     (else (iter (cons (car l) a) (cdr l)))
    )
  )
  (iter '() l)
)

(define (remove-duplicates l)
  (do ((a '() (if (member (car l) a) a (cons (car l) a)))
       (l l (cdr  l)))
      ((null? l) (reverse a))))


(length (remove-duplicates (a-b-loop 2 2 100 100)))

