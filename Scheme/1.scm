(let loop
    ((i 1)
     (acc 0))
  (cond
   ((= i 1000) acc)
   ((or
     (= 0 (modulo i 3))
     (= 0 (modulo i 5))
    )
     (loop (+ i 1) (+ acc i))
   )
   (else (loop (+ i 1) acc))
   )
)