(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        green red blue yellow purple orange - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable green)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (ontable orange)
        (clear green)
        (clear red)
        (clear blue)
        (clear yellow)
        (clear purple)
        (clear orange)
    )
    (:goal (and
        (on green red)
        (on orange blue)
        (on blue purple)
        (on purple yellow)
    ))
)