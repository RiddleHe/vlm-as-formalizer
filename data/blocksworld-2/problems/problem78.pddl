(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        yellow - block
        red - block
        green - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on blue orange)
        (clear blue)
        (ontable yellow)
        (on red yellow)
        (on green red)
        (on purple green)
        (clear purple)
        ; orange -> blue
        ; yellow -> red -> green -> purple
    )
    (:goal (and (on orange blue)
        (on green yellow)
        (on red green)
        (on purple red)))
)
    