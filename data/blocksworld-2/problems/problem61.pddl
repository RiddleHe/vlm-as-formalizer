(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        blue - block
        orange - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on blue yellow)
        (on orange blue)
        (on red orange)
        (on purple red)
        (clear purple)
        ; green -> yellow -> blue -> orange -> red -> purple
    )
    (:goal (and (on orange green)
        (on blue orange)
        (on red blue)
        (on purple red)
        (on yellow purple)))
)
    