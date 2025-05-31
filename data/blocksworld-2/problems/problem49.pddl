(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        red - block
        orange - block
        yellow - block
        blue - block
        green - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on red purple)
        (on orange red)
        (on yellow orange)
        (clear yellow)
        (ontable blue)
        (on green blue)
        (clear green)
        ; purple -> red -> orange -> yellow
        ; blue -> green
    )
    (:goal (and (on yellow blue)
        (on orange yellow)
        (on green purple)
        (on red green)))
)
    