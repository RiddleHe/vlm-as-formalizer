(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        red - block
        green - block
        purple - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on blue orange)
        (on red blue)
        (on green red)
        (on purple green)
        (on yellow purple)
        (clear yellow)
        ; orange -> blue -> red -> green -> purple -> yellow
    )
    (:goal (and (on purple yellow)
        (on green purple)
        (on orange green)
        (on blue orange)
        (on red blue)))
)
    