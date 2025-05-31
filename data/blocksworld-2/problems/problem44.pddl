(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        red - block
        yellow - block
        purple - block
        green - block
        orange - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on red blue)
        (on yellow red)
        (clear yellow)
        (ontable purple)
        (on green purple)
        (on orange green)
        (clear orange)
        ; blue -> red -> yellow
        ; purple -> green -> orange
    )
    (:goal (and (on blue orange)
        (on yellow blue)
        (on green yellow)
        (on purple red)))
)
    