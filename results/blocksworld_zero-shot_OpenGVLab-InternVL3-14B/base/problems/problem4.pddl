(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        robot - robot
        orange - block
        blue - block
        yellow - block
        purple - block
        red - block
    )
    (:init
        (clear orange)
        (ontable orange)
        (clear blue)
        (ontable blue)
        (clear yellow)
        (ontable yellow)
        (clear purple)
        (ontable purple)
        (clear red)
        (ontable red)
        (handempty robot)
    )
    (:goal
        (and
            (on orange yellow)
            (on yellow blue)
            (on blue purple)
            (on purple red)
        )
    )
)