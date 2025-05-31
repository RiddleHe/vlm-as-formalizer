(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        red - block
        green - block
        orange - block
        purple - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on red blue)
        (clear red)
        (ontable green)
        (on orange green)
        (clear orange)
        (ontable purple)
        (on yellow purple)
        (clear yellow)
        ; blue -> red
        ; green -> orange
        ; purple -> yellow
    )
    (:goal (and (on purple blue)
        (on red orange)
        (on yellow green)))
)
    