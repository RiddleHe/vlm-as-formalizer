(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        orange - block
        green - block
        blue - block
        purple - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (on orange green)
        (on blue purple)
        (on red yellow)
        (clear orange)
        (clear blue)
        (clear red)
        (ontable green)
        (ontable purple)
        (ontable yellow)
        (handempty robot1)
    )
    (:goal (and
        (on blue yellow)
        (on yellow orange)
        (on green red)
        (on red purple)
        (clear blue)
        (clear green)
        (ontable orange)
        (ontable purple)
    ))
)