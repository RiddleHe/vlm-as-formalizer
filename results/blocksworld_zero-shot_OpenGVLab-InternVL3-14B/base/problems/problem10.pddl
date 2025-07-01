(define (problem blockstacking)
    (:domain blocksworld)
    (:objects
        blue - block
        pink - block
        red - block
        yellow - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        (clear blue)
        (on blue pink)
        (clear pink)
        (on pink red)
        (clear red)
        (ontable red)
        (clear yellow)
        (on yellow orange)
        (clear orange)
        (ontable orange)
        (clear green)
        (ontable green)
        (handempty robot)
    )
    (:goal
        (and
            (on blue pink)
            (on pink red)
            (on red blue)
            (on yellow orange)
            (on orange green)
            (on green orange)
        )
    )
)