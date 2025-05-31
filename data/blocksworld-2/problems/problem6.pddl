(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        yellow - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable green)
        (on blue green)
        (on orange blue)
        (clear orange)
        (ontable yellow)
        (on red yellow)
        (on purple red)
        (clear purple)
        ; green -> blue -> orange
        ; yellow -> red -> purple
    )
    (:goal (and (on yellow purple)
        (on red yellow)
        (on orange red)
        (on green blue)))
)
    