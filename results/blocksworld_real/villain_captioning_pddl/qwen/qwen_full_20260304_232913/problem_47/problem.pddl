(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        yellow - block
        orange - block
        blue - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable purple)
        (ontable yellow)
        (ontable orange)
        (ontable red)
        (on blue red)
        (clear green)
        (clear purple)
        (clear yellow)
        (clear orange)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on green purple)
        (on purple red)
        (on red blue)
        (on blue yellow)
        (on yellow orange)
        (ontable orange)
        (clear green)
    ))
)