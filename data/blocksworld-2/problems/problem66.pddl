(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        purple - block
        green - block
        blue - block
        orange - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable red)
        (on purple red)
        (clear purple)
        (ontable green)
        (on blue green)
        (on orange blue)
        (on yellow orange)
        (clear yellow)
        ; red -> purple
        ; green -> blue -> orange -> yellow
    )
    (:goal (and (on yellow red)
        (on purple yellow)
        (on blue purple)
        (on green orange)))
)
    