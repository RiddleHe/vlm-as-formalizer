(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        purple - block
        blue - block
        red - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        (on red yellow)
        (clear red)
        (ontable yellow)
        (not (clear yellow))
        (ontable orange)
        (clear orange)
        (ontable purple)
        (clear purple)
        (ontable blue)
        (clear blue)
        (ontable green)
        (clear green)
        (handempty robot)
    )
    (:goal (and
        (on yellow purple)
        (on blue red)
        (on orange green)
    ))
)