(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        purple - block
        red - block
        orange - block
        blue - block
        robot1 - robot
    )
    (:init
        (on green yellow)
        (on yellow purple)
        (on purple red)
        (on red orange)
        (on orange blue)
        (ontable blue)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on purple green)
        (on orange red)
        (on blue yellow)
    ))
)