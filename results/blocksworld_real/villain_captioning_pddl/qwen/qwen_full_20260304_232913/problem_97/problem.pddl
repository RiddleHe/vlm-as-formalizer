(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        purple - block
        red - block
        green - block
        orange - block
        blue - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable purple)
        (ontable red)
        (ontable green)
        (ontable orange)
        (ontable blue)
        (clear yellow)
        (clear purple)
        (clear red)
        (clear green)
        (clear orange)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on green red)
        (on yellow purple)
    ))
)