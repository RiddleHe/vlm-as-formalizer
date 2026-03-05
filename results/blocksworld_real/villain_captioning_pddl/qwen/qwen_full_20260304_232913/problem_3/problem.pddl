(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        red - block
        yellow - block
        purple - block
        robot1 - robot
    )
    (:init
        (on purple yellow)
        (on yellow red)
        (on red orange)
        (on orange blue)
        (on blue green)
        (ontable green)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on purple red)
        (ontable red)
        (on yellow orange)
        (on orange green)
        (on green blue)
        (ontable blue)
        (clear purple)
        (clear yellow)
    ))
)