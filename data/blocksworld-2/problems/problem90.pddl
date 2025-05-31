(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        red - block
        yellow - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on blue purple)
        (on red blue)
        (on yellow red)
        (on orange yellow)
        (on green orange)
        (clear green)
        ; purple -> blue -> red -> yellow -> orange -> green
    )
    (:goal (and (on yellow green)
        (on blue yellow)
        (on orange blue)
        (on red orange)
        (on purple red)))
)
    