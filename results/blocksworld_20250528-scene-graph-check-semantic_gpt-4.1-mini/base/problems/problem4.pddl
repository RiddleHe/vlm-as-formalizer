(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        blue - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable red)
        (on purple red)
        (clear orange)
        (clear blue)
        (clear yellow)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on yellow blue)
        (on blue purple)
        (on purple red)
    ))
)