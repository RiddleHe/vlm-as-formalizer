(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        purple - block
        blue - block
        red - block
        green - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on yellow orange)
        (on purple yellow)
        (on blue purple)
        (on red blue)
        (on green red)
        (clear green)
        ; orange -> yellow -> purple -> blue -> red -> green
    )
    (:goal (and (on red blue)
        (on yellow red)
        (on orange yellow)
        (on green orange)
        (on purple green)))
)
    