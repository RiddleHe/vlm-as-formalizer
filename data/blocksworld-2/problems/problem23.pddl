(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        purple - block
        green - block
        blue - block
        orange - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on purple yellow)
        (on green purple)
        (on blue green)
        (on orange blue)
        (on red orange)
        (clear red)
        ; yellow -> purple -> green -> blue -> orange -> red
    )
    (:goal (and (on orange red)
        (on yellow orange)
        (on purple yellow)
        (on green purple)
        (on blue green)))
)
    