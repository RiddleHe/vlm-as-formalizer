(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        blue - block
        green - block
        orange - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on blue yellow)
        (clear blue)
        (ontable green)
        (on orange green)
        (on purple orange)
        (on red purple)
        (clear red)
        ; yellow -> blue
        ; green -> orange -> purple -> red
    )
    (:goal (and (on orange purple)
        (on red orange)
        (on green red)
        (on yellow blue)))
)
    