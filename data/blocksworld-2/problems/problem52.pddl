(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        red - block
        green - block
        yellow - block
        blue - block
        orange - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on red purple)
        (clear red)
        (ontable green)
        (on yellow green)
        (clear yellow)
        (ontable blue)
        (on orange blue)
        (clear orange)
        ; purple -> red
        ; green -> yellow
        ; blue -> orange
    )
    (:goal (and (on purple red)
        (on blue green)
        (on orange yellow)))
)
    