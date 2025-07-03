(define (problem blockstasks)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        purple green yellow blue orange red - block
    )
    (:init
        (handempty robot1)
        (on purple green)
        (on green yellow)
        (on yellow blue)
        (on blue orange)
        (on orange red)
        (clear purple)
        (ontable red)
    )
    (:goal (and
        (on yellow orange)
        (on purple green)
        (on red blue)
        (clear yellow)
        (clear purple)
        (clear red)
        (ontable orange)
        (ontable green)
        (ontable blue)
    ))
)