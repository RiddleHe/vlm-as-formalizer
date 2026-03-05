(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        blue - block
        orange - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable purple)
        (ontable blue)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (clear green)
        (clear purple)
        (clear blue)
        (clear orange)
        (clear red)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on red orange)
        (on orange green)
        (clear yellow)
        (clear red)
        (ontable purple)
        (ontable green)
    ))
)