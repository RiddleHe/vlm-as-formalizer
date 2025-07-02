(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow orange blue purple green red - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable orange)
        (ontable blue)
        (ontable purple)
        (ontable green)
        (ontable red)
        (clear yellow)
        (clear orange)
        (clear blue)
        (clear purple)
        (clear green)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on purple orange)
        (on orange green)
        (on green red)
    ))
)