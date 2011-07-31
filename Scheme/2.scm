(let loop
    ((a 1)
     (b 2)
     (sum 0)
     (limit (* 4 (expt 10 6))))
  (cond
   ((> a limit) sum)
   ((= 0 (modulo a 2)) (loop b (+ b a) (+ a sum) limit))
   (else (loop b (+ b a) sum limit))
  )
)