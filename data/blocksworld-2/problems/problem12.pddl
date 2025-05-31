(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        orange - block
        yellow - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable green)
        (on purple green)
        (clear purple)
        (ontable orange)
        (on yellow orange)
        (clear yellow)
        (ontable blue)
        (on red blue)
        (clear red)
        ; green -> purple
        ; orange -> yellow
        ; blue -> red
    )
    (:goal (and (on yellow purple)
        (on blue green)
        (on orange red)))
)
    