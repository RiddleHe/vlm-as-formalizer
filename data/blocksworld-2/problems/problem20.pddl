(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        orange - block
        green - block
        blue - block
        yellow - block
        red - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on orange purple)
        (on green orange)
        (on blue green)
        (on yellow blue)
        (on red yellow)
        (clear red)
        ; purple -> orange -> green -> blue -> yellow -> red
    )
    (:goal (and (on red green)
        (on yellow red)
        (on blue yellow)
        (on orange blue)
        (on purple orange)))
)
    