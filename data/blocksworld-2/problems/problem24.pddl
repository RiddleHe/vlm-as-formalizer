(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        purple - block
        yellow - block
        red - block
        orange - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on green blue)
        (clear green)
        (ontable purple)
        (on yellow purple)
        (on red yellow)
        (on orange red)
        (clear orange)
        ; blue -> green
        ; purple -> yellow -> red -> orange
    )
    (:goal (and (on blue yellow)
        (on orange blue)
        (on green purple)
        (on red green)))
)
    