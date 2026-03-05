(define (problem blockworld-goal)
    (:domain blocksworld)
    (:objects
        green - block
        orange - block
        yellow - block
        red - block
        blue - block
        purple - block
        robot1 - robot
    )
    (:init
        (on purple blue)
        (ontable green)
        (ontable orange)
        (ontable yellow)
        (ontable red)
        (clear green)
        (clear orange)
        (clear yellow)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on blue red)
        (on green purple)
    ))
)