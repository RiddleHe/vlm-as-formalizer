(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        orange - block
        yellow - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable orange)
        (on yellow orange)
        (clear yellow)
        (ontable purple)
        (on red purple)
        (clear red)
        ; blue -> green
        ; orange -> yellow
        ; purple -> red
    )
    (:goal (and (on yellow blue)
        (on red orange)
        (on purple green)))
)
    