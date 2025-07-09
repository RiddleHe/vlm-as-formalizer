(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange - block
        blue - block
        yellow - block
        purple - block
        red - block
    )
    (:init
        (on purple red)
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable red)
    )
    (:goal (and 
        (on orange yellow)
        (on yellow blue)
        (on blue purple)
        (on purple red)
      )
    ))
