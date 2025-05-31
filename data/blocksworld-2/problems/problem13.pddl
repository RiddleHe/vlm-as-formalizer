(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        red - block
        blue - block
        yellow - block
        green - block
        orange - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on red purple)
        (clear red)
        (ontable blue)
        (on yellow blue)
        (clear yellow)
        (ontable green)
        (on orange green)
        (clear orange)
        ; purple -> red
        ; blue -> yellow
        ; green -> orange
    )
    (:goal (and (on orange purple)
        (on blue yellow)
        (on green red)))
)
    