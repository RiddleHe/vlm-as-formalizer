(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        yellow - block
        purple - block
        red - block
        green - block
        robot - robot
    )
    (:init
        (on orange blue)
        (on yellow purple)
        (ontable blue)
        (ontable purple)
        (ontable red)
        (ontable green)
        (clear orange)
        (clear yellow)
        (clear red)
        (clear green)
        (handempty robot)
    )
    (:goal (and
        (on orange blue)
        (on blue yellow)
        (on purple red)
        (on red green)
        (ontable yellow)
        (ontable green)
        (clear orange)
        (clear purple)
    ))
)