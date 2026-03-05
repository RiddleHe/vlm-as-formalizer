(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        orange - block
        yellow - block
        green - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable blue)
        (ontable orange)
        (ontable yellow)
        (ontable green)
        (ontable red)
        (clear purple)
        (clear blue)
        (clear orange)
        (clear yellow)
        (clear green)
        (clear red)
        (handempty robot1)
        (not (handfull robot1))
    )
    (:goal (and
        (on red green)
        (on yellow purple)
        (on blue orange)
        (clear red)
        (clear yellow)
        (clear blue)
        (not (ontable red))
        (not (ontable yellow))
        (not (ontable blue))
    ))
)