(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        green - block
        purple - block
        red - block
        blue - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (clear orange)
        (ontable green)
        (on purple green)
        (clear purple)
        (ontable red)
        (on blue red)
        (clear blue)
        ; yellow -> orange
        ; green -> purple
        ; red -> blue
    )
    (:goal (and (on yellow purple)
        (on blue red)
        (on orange green)))
)
    