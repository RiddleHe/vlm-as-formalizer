(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        green - block
        blue - block
        purple - block
        orange - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on red yellow)
        (clear red)
        (ontable green)
        (on blue green)
        (on purple blue)
        (on orange purple)
        (clear orange)
        ; yellow -> red
        ; green -> blue -> purple -> orange
    )
    (:goal (and (on purple red)
        (on blue purple)
        (on green orange)
        (on yellow green)))
)
    