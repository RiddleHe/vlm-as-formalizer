(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        purple - block
        orange - block
        blue - block
        green - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on red yellow)
        (clear red)
        (ontable purple)
        (on orange purple)
        (clear orange)
        (ontable blue)
        (on green blue)
        (clear green)
        ; yellow -> red
        ; purple -> orange
        ; blue -> green
    )
    (:goal (and (on green red)
        (on purple yellow)
        (on orange blue)))
)
    