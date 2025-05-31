(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        green - block
        purple - block
        yellow - block
        orange - block
        robot - robot
    )
    (:init
        (ontable red)
        (on blue red)
        (clear blue)
        (ontable green)
        (on purple green)
        (clear purple)
        (ontable yellow)
        (on orange yellow)
        (clear orange)
        ; red -> blue
        ; green -> purple
        ; yellow -> orange
    )
    (:goal (and (on red orange)
        (on purple green)
        (on blue yellow)))
)
    