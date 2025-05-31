(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        orange - block
        blue - block
        yellow - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable green)
        (on orange green)
        (clear orange)
        (ontable blue)
        (on yellow blue)
        (clear yellow)
        (ontable red)
        (on purple red)
        (clear purple)
        ; green -> orange
        ; blue -> yellow
        ; red -> purple
    )
    (:goal (and (on purple green)
        (on red blue)
        (on orange yellow)))
)
    