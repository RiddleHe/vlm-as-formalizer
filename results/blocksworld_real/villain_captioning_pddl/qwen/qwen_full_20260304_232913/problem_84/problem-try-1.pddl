(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        yellow - block
        orange - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (on purple red)
        (ontable green)
        (ontable blue)
        (ontable yellow)
        (ontable orange)
        (clear green)
        (clear blue)
        (clear yellow)
        (clear orange)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on purple green)
        (on green blue)
        (on blue red)
        (on red yellow)
        (on yellow orange)
        (ontable orange)
        (clear purple)
    ))
)