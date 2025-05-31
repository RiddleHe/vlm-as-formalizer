(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        green - block
        blue - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (on green orange)
        (on blue green)
        (on red blue)
        (on purple red)
        (clear purple)
        ; yellow -> orange -> green -> blue -> red -> purple
    )
    (:goal (and (on yellow orange)
        (on blue yellow)
        (on purple blue)
        (on green purple)
        (on red green)))
)
    