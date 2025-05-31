(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        purple - block
        green - block
        blue - block
        yellow - block
        red - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on purple orange)
        (clear purple)
        (ontable green)
        (on blue green)
        (on yellow blue)
        (on red yellow)
        (clear red)
        ; orange -> purple
        ; green -> blue -> yellow -> red
    )
    (:goal (and (on blue green)
        (on yellow purple)
        (on red yellow)
        (on orange red)))
)
    