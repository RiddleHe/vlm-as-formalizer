(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        blue - block
        orange - block
        yellow - block
        red - block
        green - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on blue purple)
        (clear blue)
        (ontable orange)
        (on yellow orange)
        (on red yellow)
        (on green red)
        (clear green)
        ; purple -> blue
        ; orange -> yellow -> red -> green
    )
    (:goal (and (on orange red)
        (on purple orange)
        (on blue yellow)
        (on green blue)))
)
    