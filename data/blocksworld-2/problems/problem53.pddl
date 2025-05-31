(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        purple - block
        blue - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on red yellow)
        (on purple red)
        (on blue purple)
        (clear blue)
        (ontable orange)
        (on green orange)
        (clear green)
        ; yellow -> red -> purple -> blue
        ; orange -> green
    )
    (:goal (and (on yellow purple)
        (on red green)
        (on orange red)
        (on blue orange)))
)
    