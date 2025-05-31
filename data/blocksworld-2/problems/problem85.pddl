(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        green - block
        blue - block
        yellow - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on red orange)
        (clear red)
        (ontable green)
        (on blue green)
        (on yellow blue)
        (on purple yellow)
        (clear purple)
        ; orange -> red
        ; green -> blue -> yellow -> purple
    )
    (:goal (and (on purple yellow)
        (on blue purple)
        (on green blue)
        (on orange red)))
)
    