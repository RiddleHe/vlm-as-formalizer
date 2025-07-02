(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        blue - block
        orange - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (clear yellow)
        (on red yellow)
        (clear red)
        (on blue red)
        (clear blue)
        (on orange blue)
        (clear orange)
        (on green orange)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on yellow red)
        (on red blue)
        (on blue orange)
        (on orange green)
        (on green yellow)
    ))
)