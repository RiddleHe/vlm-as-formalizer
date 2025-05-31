(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        purple - block
        green - block
        red - block
        blue - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on purple orange)
        (clear purple)
        (ontable green)
        (on red green)
        (on blue red)
        (on yellow blue)
        (clear yellow)
        ; orange -> purple
        ; green -> red -> blue -> yellow
    )
    (:goal (and (on yellow red)
        (on green orange)
        (on blue green)
        (on purple blue)))
)
    