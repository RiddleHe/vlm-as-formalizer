(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        purple - block
        green - block
        blue - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on red orange)
        (clear red)
        (ontable yellow)
        (on purple yellow)
        (on green purple)
        (on blue green)
        (clear blue)
        ; orange -> red
        ; yellow -> purple -> green -> blue
    )
    (:goal (and (on green yellow)
        (on red green)
        (on orange purple)
        (on blue orange)))
)
    