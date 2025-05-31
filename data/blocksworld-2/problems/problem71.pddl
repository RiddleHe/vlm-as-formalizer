(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        blue - block
        green - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on yellow orange)
        (clear yellow)
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable red)
        (on purple red)
        (clear purple)
        ; orange -> yellow
        ; blue -> green
        ; red -> purple
    )
    (:goal (and (on red blue)
        (on purple orange)
        (on yellow green)))
)
    