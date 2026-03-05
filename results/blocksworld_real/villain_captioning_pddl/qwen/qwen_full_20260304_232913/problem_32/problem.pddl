(define (problem blocksworld_task)
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
        (on orange red)
        (on red green)
        (ontable yellow)
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