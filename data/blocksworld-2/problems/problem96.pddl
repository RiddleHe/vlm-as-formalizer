(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        green - block
        yellow - block
        purple - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on green orange)
        (clear green)
        (ontable yellow)
        (on purple yellow)
        (clear purple)
        (ontable blue)
        (on red blue)
        (clear red)
        ; orange -> green
        ; yellow -> purple
        ; blue -> red
    )
    (:goal (and (on purple green)
        (on orange blue)
        (on red yellow)))
)
    