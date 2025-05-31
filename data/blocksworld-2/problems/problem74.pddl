(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        red - block
        orange - block
        green - block
        purple - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on red blue)
        (on orange red)
        (on green orange)
        (on purple green)
        (on yellow purple)
        (clear yellow)
        ; blue -> red -> orange -> green -> purple -> yellow
    )
    (:goal (and (on green red)
        (on blue green)
        (on yellow blue)
        (on purple yellow)
        (on orange purple)))
)
    