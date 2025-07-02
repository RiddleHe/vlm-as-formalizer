(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        green - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        ; Blue on orange
        (on orange green)
        (on blue orange)
        ; Yellow, green, red, and purple are on the table
        (clear yellow)
        (ontable yellow)
        (ontable red)
        (ontable purple)
        (handempty robot1)
    )
    (:goal
        (and 
            (on blue orange)
            (on yellow green)
            (on red yellow)
            (on purple red)
        )
    )
)