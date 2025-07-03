(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        purple red blue green yellow orange - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable purple)
        (ontable blue)
        (ontable orange)
        (on purple red)
        (clear purple)
        (clear yellow)
        (clear orange)
        (on blue green)
        (on green yellow)
        (clear red)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on red orange)
        (on orange green)
        (on green purple)
    ))
)