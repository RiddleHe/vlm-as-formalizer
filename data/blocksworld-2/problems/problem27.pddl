(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        green - block
        orange - block
        red - block
        purple - block
        blue - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on green yellow)
        (clear green)
        (ontable orange)
        (on red orange)
        (clear red)
        (ontable purple)
        (on blue purple)
        (clear blue)
        ; yellow -> green
        ; orange -> red
        ; purple -> blue
    )
    (:goal (and (on yellow purple)
        (on green red)
        (on blue orange)))
)
    