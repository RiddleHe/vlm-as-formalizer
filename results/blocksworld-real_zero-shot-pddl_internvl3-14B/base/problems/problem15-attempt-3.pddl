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
        ; All blocks are on the table and clear.
        (ontable red)
        (clear red)
        (ontable green)
        (clear green)
        (ontable yellow)
        (clear yellow)
        (ontable blue)
        (clear blue)
        (ontable purple)
        (clear purple)
        (ontable orange)
        (clear orange)
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