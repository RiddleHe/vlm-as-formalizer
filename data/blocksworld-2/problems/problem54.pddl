(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        yellow - block
        green - block
        red - block
        orange - block
        blue - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on yellow purple)
        (clear yellow)
        (ontable green)
        (on red green)
        (clear red)
        (ontable orange)
        (on blue orange)
        (clear blue)
        ; purple -> yellow
        ; green -> red
        ; orange -> blue
    )
    (:goal (and (on orange blue)
        (on purple red)
        (on yellow green)))
)
    