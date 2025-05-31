(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        purple - block
        red - block
        blue - block
        orange - block
        green - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on purple yellow)
        (on red purple)
        (clear red)
        (ontable blue)
        (on orange blue)
        (on green orange)
        (clear green)
        ; yellow -> purple -> red
        ; blue -> orange -> green
    )
    (:goal (and (on red purple)
        (on blue red)
        (on yellow blue)
        (on green orange)))
)
    