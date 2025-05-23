(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        orange blue yellow purple red - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
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