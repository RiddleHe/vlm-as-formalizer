(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow - block
        red - block
        blue - block
        orange - block
        green - block
    )
    (:init
        (clear green)
    )
    (:goal (and 
        (on yellow red)
        (on red blue)
        (on blue orange)
        (on orange green)
      )
    ))
