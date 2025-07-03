(define (problem stack1)
    (:domain blocksworld)
    (:objects
        blue green red purple yellow orange - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (clear orange)
        (clear purple)
        (clear yellow)
        (clear red)
        (handempty robot1)
        (on orange green)
        (on green red)
        (on red purple)
        (on purple yellow)
        (on yellow blue)
        (not (on blue orange)) ; for clarity, not explicitly needed
    )
    (:goal 
        (and
            (on blue orange)
            (on orange green)
            (on green purple)
            (on purple yellow)
            (on yellow red)
            (ontable blue)
        )
    )
)