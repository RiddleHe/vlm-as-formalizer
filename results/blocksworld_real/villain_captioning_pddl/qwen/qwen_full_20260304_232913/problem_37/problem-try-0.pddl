(define (problem blocksworld_stack)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        purple - block
        yellow - block
        blue - block
        green - block
        robot - robot
    )
    (:init
        (ontable red)
        (on orange red)
        (on purple orange)
        (on yellow purple)
        (on blue yellow)
        (on green blue)
        (clear green)
        (handempty robot)
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