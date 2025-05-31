(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        yellow - block
        orange - block
        red - block
        blue - block
        robot - robot
    )
    (:init
        (ontable green)
        (on purple green)
        (clear purple)
        (ontable yellow)
        (on orange yellow)
        (clear orange)
        (ontable red)
        (on blue red)
        (clear blue)
        ; green -> purple
        ; yellow -> orange
        ; red -> blue
    )
    (:goal (and (on yellow blue)
        (on green purple)
        (on orange red)))
)
    