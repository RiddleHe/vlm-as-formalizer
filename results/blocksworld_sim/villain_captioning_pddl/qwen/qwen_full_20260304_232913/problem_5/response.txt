(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        blue - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on red yellow)
        (on blue red)
        (on orange blue)
        (on green orange)
        (clear green)
        (handempty robot)
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