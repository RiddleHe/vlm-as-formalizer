(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        red - block
        green - block
        yellow - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable orange)
        (ontable red)
        (ontable green)
        (ontable yellow)
        (ontable purple)
        (clear blue)
        (clear orange)
        (clear red)
        (clear green)
        (clear yellow)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on red yellow)
        (on yellow orange)
        (on orange blue)
        (on green purple)
        (clear red)
        (clear green)
    ))
)