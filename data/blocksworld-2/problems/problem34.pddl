(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        red - block
        green - block
        yellow - block
        purple - block
        orange - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on red blue)
        (clear red)
        (ontable green)
        (on yellow green)
        (clear yellow)
        (ontable purple)
        (on orange purple)
        (clear orange)
        ; blue -> red
        ; green -> yellow
        ; purple -> orange
    )
    (:goal (and (on red blue)
        (on orange purple)
        (on yellow green)))
)
    