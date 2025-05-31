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
        (clear purple)
        (ontable red)
        (on blue red)
        (on orange blue)
        (on green orange)
        (clear green)
        ; yellow -> purple
        ; red -> blue -> orange -> green
    )
    (:goal (and (on orange green)
        (on purple yellow)
        (on red purple)
        (on blue red)))
)
    