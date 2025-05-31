(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        green - block
        red - block
        blue - block
        purple - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (on green orange)
        (clear green)
        (ontable red)
        (on blue red)
        (on purple blue)
        (clear purple)
        ; yellow -> orange -> green
        ; red -> blue -> purple
    )
    (:goal (and (on red yellow)
        (on blue red)
        (on orange blue)
        (on green purple)))
)
    