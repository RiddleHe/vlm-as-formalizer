(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        yellow - block
        orange - block
        red - block
        green - block
        robot - robot
    )
    (:init
        (on purple blue)
        (on blue yellow)
        (ontable yellow)
        (on orange red)
        (on red green)
        (ontable green)
        (clear purple)
        (clear orange)
        (handempty robot)
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on purple red)
        (on red green)
        (on green orange)
        (ontable yellow)
        (clear orange)
    ))
)