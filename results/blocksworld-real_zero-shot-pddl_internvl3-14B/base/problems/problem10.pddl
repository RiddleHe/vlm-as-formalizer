(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        red - block
        yellow - block
        purple - block
        orange - block
        robot1 - robot
    )
    (:init
        ; Initial state
        (clear blue)
        (clear green)
        (clear red)
        (clear yellow)
        (clear purple)
        (clear orange)
        (ontable blue)
        (ontable green)
        (ontable red)
        (ontable yellow)
        (ontable purple)
        (ontable orange)
        (handempty robot1)
    )
    (:goal
        ; Goal state
        (and
            (on blue green)
            (on red yellow)
            (on purple orange)
        )
    )
)