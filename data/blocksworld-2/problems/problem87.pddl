(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        purple - block
        yellow - block
        blue - block
        green - block
        red - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on purple orange)
        (on yellow purple)
        (on blue yellow)
        (on green blue)
        (on red green)
        (clear red)
        ; orange -> purple -> yellow -> blue -> green -> red
    )
    (:goal (and (on green red)
        (on blue green)
        (on yellow blue)
        (on orange yellow)
        (on purple orange)))
)
    