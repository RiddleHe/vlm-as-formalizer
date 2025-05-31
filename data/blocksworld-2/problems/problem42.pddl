(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        red - block
        blue - block
        green - block
        orange - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on red purple)
        (on blue red)
        (on green blue)
        (on orange green)
        (on yellow orange)
        (clear yellow)
        ; purple -> red -> blue -> green -> orange -> yellow
    )
    (:goal (and (on yellow blue)
        (on purple yellow)
        (on red purple)
        (on orange red)
        (on green orange)))
)
    