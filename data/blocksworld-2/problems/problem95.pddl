(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        blue - block
        green - block
        purple - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on red orange)
        (clear red)
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable purple)
        (on yellow purple)
        (clear yellow)
        ; orange -> red
        ; blue -> green
        ; purple -> yellow
    )
    (:goal (and (on green red)
        (on orange blue)
        (on purple yellow)))
)
    