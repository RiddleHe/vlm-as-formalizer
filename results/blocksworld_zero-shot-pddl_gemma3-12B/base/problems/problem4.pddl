(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange blue yellow purple red - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable red)
        (ontable purple)
        (clear orange)
        (clear blue)
        (clear yellow)
        (clear red)
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