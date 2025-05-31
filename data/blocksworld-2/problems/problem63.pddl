(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        red - block
        yellow - block
        orange - block
        purple - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on green blue)
        (on red green)
        (on yellow red)
        (clear yellow)
        (ontable orange)
        (on purple orange)
        (clear purple)
        ; blue -> green -> red -> yellow
        ; orange -> purple
    )
    (:goal (and (on purple blue)
        (on red purple)
        (on green red)
        (on yellow orange)))
)
    