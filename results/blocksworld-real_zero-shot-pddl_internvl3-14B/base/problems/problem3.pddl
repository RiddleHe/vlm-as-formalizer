(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        purple - block
        yellow - block
        orange - block
        red - block
        blue - block
        green - block
    )
    (:init
        ; Robot1 is empty-handed
        (handempty robot1)
        ; Clear blocks and their current stack situation
        (clear blue)
        (ontable blue)
        (clear red)
        (on red blue)
        (clear green)
        (on green red)
        (clear orange)
        (on orange green)
        (clear yellow)
        (on yellow orange)
        (clear purple)
        (ontable purple)
    )
    (:goal
        ; As per the instruction to create two stacks, but currently all are stacked in one
        (and 
            (on purple red)
            (on yellow orange)
            (on orange green)
            (on green red)
            (on red blue)
            (ontable blue)
            (clear blue)
        )
    )
)