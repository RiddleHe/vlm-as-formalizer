(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        blue - block
        orange - block
        purple - block
        green - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on red yellow)
        (on blue red)
        (on orange blue)
        (on purple orange)
        (on green purple)
        (clear green)
        ; yellow -> red -> blue -> orange -> purple -> green
    )
    (:goal (and (on green yellow)
        (on orange green)
        (on red orange)
        (on purple red)
        (on blue purple)))
)
    