(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        purple - block
        orange - block
        green - block
        blue - block
        yellow - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable orange)
        (ontable green)
        (ontable blue)
        (ontable yellow)
        (ontable red)
        (clear purple)
        (clear orange)
        (clear green)
        (clear blue)
        (clear yellow)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple red)
        (on red yellow)
        (on green blue)
        (clear orange)
        (clear green)
    ))
)