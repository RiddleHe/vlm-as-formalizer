(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        blue - block
        green - block
        purple - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable red)
        (on orange red)
        (clear orange)
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable purple)
        (on yellow purple)
        (clear yellow)
        ; red -> orange
        ; blue -> green
        ; purple -> yellow
    )
    (:goal (and (on green red)
        (on blue purple)
        (on yellow orange)))
)
    