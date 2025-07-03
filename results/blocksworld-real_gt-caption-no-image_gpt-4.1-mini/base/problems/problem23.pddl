(define (problem blocksworld_problem1)
(:domain blocksworld)
(:objects
    purple red blue green yellow orange - block
    robot1 - robot
)
(:init
    (handempty robot1)

    (ontable red)
    (on purple red)
    (clear purple)

    (ontable yellow)
    (on green yellow)
    (on blue green)
    (clear blue)

    (ontable orange)
    (clear orange)
)
(:goal (and
    (on yellow blue)
    (on red orange)
    (on orange green)
    (on green purple)
))
)