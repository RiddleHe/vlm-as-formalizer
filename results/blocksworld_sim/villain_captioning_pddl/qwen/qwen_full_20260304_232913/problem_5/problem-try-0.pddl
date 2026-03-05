(define (problem blocksworld-goal-stack)
    (:domain blocksworld)
    (:objects
        green - block
        orange - block
        blue - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (on orange green)
        (on blue orange)
        (on red blue)
        (on yellow red)
        (ontable yellow)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on yellow red)
        (on red blue)
        (on blue orange)
        (on orange green)
        (ontable green)
        (clear yellow)
    ))
)