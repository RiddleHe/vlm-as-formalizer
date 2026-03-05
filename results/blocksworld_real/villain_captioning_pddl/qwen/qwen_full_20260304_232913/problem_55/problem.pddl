(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        green - block
        blue - block
        yellow - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable orange)
        (ontable green)
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (clear red)
        (clear orange)
        (clear green)
        (clear blue)
        (clear yellow)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green orange)
        (on orange red)
        (on blue purple)
        (on purple yellow)
        (clear green)
        (clear blue)
        (ontable red)
        (ontable yellow)
    ))
)