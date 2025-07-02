(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        blue - block
        yellow - block
        green - block
        purple - block
        robot - robot
    )
    (:init
        (ontable red)
        (on orange red)
        (on blue orange)
        (on yellow blue)
        (on green yellow)
        (on purple green)
        (clear purple)
        (handempty robot)
        ; red -> orange -> blue -> yellow -> green -> purple
    )
    (:goal (and (on yellow orange)
        (clear yellow)
        (on purple green)
        (clear purple)
        (on red blue)
        (clear red)))
)
    