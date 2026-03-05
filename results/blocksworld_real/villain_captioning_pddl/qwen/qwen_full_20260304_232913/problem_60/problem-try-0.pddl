(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        red green orange blue yellow purple
        robot
    )
    (:init
        (ontable orange)
        (on blue orange)
        (on yellow blue)
        (on purple yellow)
        (ontable red)
        (ontable green)
        (clear purple)
        (clear red)
        (clear green)
        (handempty robot)
    )
    (:goal (and
        (on red green)
        (ontable green)
        (on orange blue)
        (on blue purple)
        (on purple yellow)
        (ontable yellow)
    )
    )
)