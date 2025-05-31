(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        purple - block
        green - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (clear orange)
        (ontable purple)
        (on green purple)
        (clear green)
        (ontable blue)
        (on red blue)
        (clear red)
        ; yellow -> orange
        ; purple -> green
        ; blue -> red
    )
    (:goal (and (on blue yellow)
        (on red orange)
        (on purple green)))
)
    