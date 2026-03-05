(define (problem blocksworld_restack)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        blue - block
        orange - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (on green yellow)
        (on yellow blue)
        (on blue orange)
        (on orange purple)
        (on purple red)
        (ontable red)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on blue yellow)
        (on yellow purple)
        (on purple orange)
        (on orange red)
        (ontable red)
        (clear green)
    ))
)