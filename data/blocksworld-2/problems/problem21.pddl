(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        red - block
        green - block
        orange - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on blue purple)
        (clear blue)
        (ontable red)
        (on green red)
        (on orange green)
        (on yellow orange)
        (clear yellow)
        ; purple -> blue
        ; red -> green -> orange -> yellow
    )
    (:goal (and (on yellow purple)
        (on orange red)
        (on green orange)
        (on blue green)))
)
    