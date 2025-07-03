(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        purple - block
        green - block
        yellow - block
        blue - block
        orange - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (on purple green)
        (on green yellow)
        (on yellow blue)
        (on blue orange)
        (on orange red)
        (clear red)
        (handempty robot1)
    )
    (:goal
        (and
            (on yellow orange)
            (on purple green)
            (on red blue)
        )
    )
)