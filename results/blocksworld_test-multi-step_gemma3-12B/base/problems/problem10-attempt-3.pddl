(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue - block
        pink - block
        red - block
        yellow - block
        orange - block
        green - block
    )
    (:init
        (ontable blue)
        (ontable pink)
        (ontable red)
        (ontable yellow)
        (ontable orange)
        (ontable green)
        (clear blue)
        (clear pink)
        (clear red)
        (clear yellow)
        (clear green)
    )
    (:goal (and 
        (on blue pink)
        (on pink red)
        (on yellow orange)
        (on orange green)
      )
    ))
