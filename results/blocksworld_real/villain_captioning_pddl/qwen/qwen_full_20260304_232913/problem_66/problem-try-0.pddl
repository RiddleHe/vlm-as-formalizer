(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green red yellow blue orange purple
        robot1 - robot
    )
    (:init
        (on green red)
        (on red yellow)
        (on yellow blue)
        (ontable blue)
        (on purple orange)
        (ontable orange)
        (clear green)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on orange green)
        (ontable green)
        (on red blue)
        (on blue purple)
        (on purple yellow)
        (ontable yellow)
        (clear orange)
        (clear red)
    ))
)