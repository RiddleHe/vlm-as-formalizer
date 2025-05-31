(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        blue - block
        orange - block
        green - block
        purple - block
        robot - robot
    )
    (:init
        (ontable red)
        (on yellow red)
        (on blue yellow)
        (on orange blue)
        (clear orange)
        (ontable green)
        (on purple green)
        (clear purple)
        ; red -> yellow -> blue -> orange
        ; green -> purple
    )
    (:goal (and (on blue orange)
        (on yellow blue)
        (on purple yellow)
        (on red green)))
)
    