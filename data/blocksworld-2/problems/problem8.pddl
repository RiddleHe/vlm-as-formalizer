(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        red - block
        blue - block
        purple - block
        green - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (on red orange)
        (on blue red)
        (on purple blue)
        (on green purple)
        (clear green)
        ; yellow -> orange -> red -> blue -> purple -> green
    )
    (:goal (and (on blue green)
        (on yellow blue)
        (on orange yellow)
        (on red orange)
        (on purple red)))
)
    