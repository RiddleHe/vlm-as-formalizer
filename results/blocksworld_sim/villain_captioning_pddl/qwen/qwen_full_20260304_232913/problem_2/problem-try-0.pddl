(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        pink - block
        purple - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable pink)
        (on purple pink)
        (on blue purple)
        (on red blue)
        (clear red)
        (handempty robot)
    )
    (:goal (and
        (on red blue)
        (on blue purple)
        (on purple pink)
        (ontable pink)
        (clear red)
    ))
)