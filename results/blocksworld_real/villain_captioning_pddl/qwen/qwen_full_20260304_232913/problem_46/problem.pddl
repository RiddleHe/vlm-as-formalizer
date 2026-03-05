(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        orange - block
        purple - block
        blue - block
        green - block
        robot1 - robot
    )
    (:init
        (on red yellow)
        (on yellow orange)
        (on orange purple)
        (on purple blue)
        (on blue green)
        (ontable green)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on yellow green)
        (on blue purple)
        (on orange red)
    ))
)