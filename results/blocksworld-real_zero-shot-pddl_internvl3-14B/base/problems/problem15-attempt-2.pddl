(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        red - block
        green - block
        yellow - block
        blue - block
        purple - block
        orange - block
        robot1 - robot
    )
    (:init
        ; Initial conditions:
        ; Yellow, green are clear and on table, blue, red, purple, orange are stacked as follows:
        (on red - blue)
        (on blue - purple)
        (on purple - orange)
        (ontable orange)
        (clear yellow)
        (ontable yellow)
        (clear green)
        (ontable green)
        (handempty robot1)
    )
    (:goal
        ; Desired goal state:
        (on yellow - blue)
        (on blue - purple)
        (on purple - orange)
        (on orange - green)
        (on green - red)
    )
)