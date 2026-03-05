(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        purple - block
        green - block
        orange - block
        yellow - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (ontable blue)
        (on red yellow)
        (on green red)
        (on purple green)
        (on orange blue)
        (clear purple)
        (clear orange)
        (handempty robot)
    )
    (:goal (and
        (on orange purple)
        (on green blue)
        (on yellow red)
        (clear orange)
        (clear green)
        (clear yellow)
    ))
)