(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        purple - block
        orange - block
        blue - block
        yellow - block
        green - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable green)
        (ontable red)
        (clear purple)
        (clear orange)
        (clear blue)
        (clear yellow)
        (clear green)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple green)
        (on green blue)
        (on blue red)
        (on red yellow)
        (ontable yellow)
        (clear orange)
    ))
)