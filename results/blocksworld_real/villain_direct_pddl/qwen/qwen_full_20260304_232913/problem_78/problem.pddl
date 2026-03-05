(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        green - block
        blue - block
        orange - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable red)
        (ontable green)
        (on purple orange)
        (on orange blue)
        (on blue red)
        (clear yellow)
        (clear red)
        (clear green)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on blue purple)
        (on yellow orange)
        (on orange red)
        (clear green)
        (clear yellow)
    ))
)