(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        green - block
        yellow - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on orange blue)
        (on green orange)
        (on yellow green)
        (clear yellow)
        (ontable red)
        (on purple red)
        (clear purple)
        ; blue -> orange -> green -> yellow
        ; red -> purple
    )
    (:goal (and (on blue purple)
        (on red orange)
        (on green red)
        (on yellow green)))
)
    