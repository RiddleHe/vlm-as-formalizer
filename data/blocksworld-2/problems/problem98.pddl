(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        green - block
        purple - block
        blue - block
        yellow - block
        red - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on green orange)
        (on purple green)
        (on blue purple)
        (clear blue)
        (ontable yellow)
        (on red yellow)
        (clear red)
        ; orange -> green -> purple -> blue
        ; yellow -> red
    )
    (:goal (and (on red blue)
        (on orange red)
        (on purple green)
        (on yellow purple)))
)
    