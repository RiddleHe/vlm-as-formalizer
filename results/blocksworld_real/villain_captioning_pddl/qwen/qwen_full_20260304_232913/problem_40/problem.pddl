(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        blue - block
        yellow - block
        purple - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable red)
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (ontable green)
        (clear orange)
        (clear red)
        (clear blue)
        (clear yellow)
        (clear purple)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on purple blue)
        (on blue yellow)
        (on yellow orange)
        (on green red)
        (clear purple)
        (clear green)
        (ontable orange)
        (ontable red)
    ))
)