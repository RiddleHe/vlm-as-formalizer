(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        orange yellow blue purple red
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (on purple red)
        (ontable red)
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