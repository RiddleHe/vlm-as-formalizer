(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        orange - block
        red - block
        blue - block
        yellow - block
        purple - block
        robot - robot
    )
    (:init
        (ontable green)
        (on orange green)
        (on red orange)
        (clear red)
        (ontable blue)
        (on yellow blue)
        (on purple yellow)
        (clear purple)
        ; green -> orange -> red
        ; blue -> yellow -> purple
    )
    (:goal (and (on red orange)
        (on green yellow)
        (on blue green)
        (on purple blue)))
)
    