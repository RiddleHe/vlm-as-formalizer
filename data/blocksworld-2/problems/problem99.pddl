(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        blue - block
        purple - block
        green - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on red orange)
        (on yellow red)
        (on blue yellow)
        (on purple blue)
        (on green purple)
        (clear green)
        ; orange -> red -> yellow -> blue -> purple -> green
    )
    (:goal (and (on purple yellow)
        (on green purple)
        (on blue green)
        (on orange blue)
        (on red orange)))
)
    