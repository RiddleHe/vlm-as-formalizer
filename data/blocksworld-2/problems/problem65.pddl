(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        blue - block
        red - block
        green - block
        orange - block
        purple - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on blue yellow)
        (on red blue)
        (on green red)
        (on orange green)
        (on purple orange)
        (clear purple)
        ; yellow -> blue -> red -> green -> orange -> purple
    )
    (:goal (and (on orange green)
        (on purple orange)
        (on red purple)
        (on yellow red)
        (on blue yellow)))
)
    