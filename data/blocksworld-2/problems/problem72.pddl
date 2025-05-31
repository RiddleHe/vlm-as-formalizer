(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        red - block
        green - block
        blue - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on yellow orange)
        (on red yellow)
        (clear red)
        (ontable green)
        (on blue green)
        (on purple blue)
        (clear purple)
        ; orange -> yellow -> red
        ; green -> blue -> purple
    )
    (:goal (and (on blue red)
        (on yellow blue)
        (on orange purple)
        (on green orange)))
)
    