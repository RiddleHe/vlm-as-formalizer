(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        red - block
        purple - block
        blue - block
        orange - block
        robot - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on red yellow)
        (on purple red)
        (clear purple)
        (ontable blue)
        (on orange blue)
        (clear orange)
        ; green -> yellow -> red -> purple
        ; blue -> orange
    )
    (:goal (and (on blue purple)
        (on red blue)
        (on orange green)
        (on yellow orange)))
)
    