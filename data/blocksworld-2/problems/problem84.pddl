(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        red - block
        purple - block
        blue - block
        orange - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable green)
        (on red green)
        (on purple red)
        (on blue purple)
        (clear blue)
        (ontable orange)
        (on yellow orange)
        (clear yellow)
        ; green -> red -> purple -> blue
        ; orange -> yellow
    )
    (:goal (and (on blue yellow)
        (on orange blue)
        (on green orange)
        (on red purple)))
)
    