;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(define (pentagonal n)
 (/ (* n (- (* 3 n) 1)) 2)
)



(define (pentagonal? n)
  (integer? (/ (+ (sqrt (+ (* 24 n) 1)) 1) 6))
)

(define (println . s) 
  (let loop ((s2 s))
    (cond
     ((null? s2) (newline))
     (else (display (car s2)) (loop (cdr s2)))
    )
  )
)

(let loop ((n 1))
  (println (println (pentagonal n)))
  (let loop2 ((i (- n 1)))
    (cond
     ((= i 0)
      (println "i is 0")
      (loop  (+ n 1)))
     ((and (pentagonal? (+ (pentagonal n) (pentagonal i))) (pentagonal? (- (pentagonal n) (pentagonal i))))
      (println "Both " n " and " i " pentagonal.")
      (list n i (- n i)))
     (else 
      ;(println "Tryinging " (- i 1))
      (loop2  (- i 1)))
    )
  )
)

