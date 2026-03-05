(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        green - block
        blue - block
        orange - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable red)
        (on purple orange)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear red)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on green yellow)
        (on blue orange)
        (on purple red)
    ))
)