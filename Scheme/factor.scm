(load "miller-rabin.scm")

(define (factor num)
  (let loop ((n num)
	     (f 2)
	     (num-cur-factor 0)
	     (factors '())
	     )
  (cond
   ((= n 1) (reverse (cons (cons f num-cur-factor )factors)))
   ((= 0 (modulo n f)) (loop (/ n f) f (+ num-cur-factor 1) factors))
   (else (loop n (+ f 1) 0 (if (not (= 0 num-cur-factor)) (cons (cons f num-cur-factor) factors) factors))))
  )
)
