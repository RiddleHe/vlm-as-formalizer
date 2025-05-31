(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        purple - block
        yellow - block
        red - block
        robot - robot
    )
    (:init
        (ontable green)
        (on blue green)
        (clear blue)
        (ontable orange)
        (on purple orange)
        (clear purple)
        (ontable yellow)
        (on red yellow)
        (clear red)
        ; green -> blue
        ; orange -> purple
        ; yellow -> red
    )
    (:goal (and (on green blue)
        (on red purple)
        (on yellow orange)))
)
    