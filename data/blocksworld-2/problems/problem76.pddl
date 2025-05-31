(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        yellow - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable green)
        (on blue green)
        (on orange blue)
        (clear orange)
        (ontable yellow)
        (on purple yellow)
        (on red purple)
        (clear red)
        ; green -> blue -> orange
        ; yellow -> purple -> red
    )
    (:goal (and (on purple blue)
        (on red purple)
        (on green red)
        (on orange yellow)))
)
    