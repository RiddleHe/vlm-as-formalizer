(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        yellow - block
        blue - block
        red - block
        green - block
        orange - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on yellow purple)
        (clear yellow)
        (ontable blue)
        (on red blue)
        (clear red)
        (ontable green)
        (on orange green)
        (clear orange)
        ; purple -> yellow
        ; blue -> red
        ; green -> orange
    )
    (:goal (and (on yellow orange)
        (on blue red)
        (on green purple)))
)
    