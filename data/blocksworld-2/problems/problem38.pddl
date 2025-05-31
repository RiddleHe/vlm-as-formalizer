(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        green - block
        yellow - block
        purple - block
        blue - block
        robot - robot
    )
    (:init
        (ontable red)
        (on orange red)
        (on green orange)
        (on yellow green)
        (clear yellow)
        (ontable purple)
        (on blue purple)
        (clear blue)
        ; red -> orange -> green -> yellow
        ; purple -> blue
    )
    (:goal (and (on purple red)
        (on blue purple)
        (on yellow blue)
        (on orange green)))
)
    