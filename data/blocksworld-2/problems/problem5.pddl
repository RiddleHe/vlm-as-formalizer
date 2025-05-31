(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        orange - block
        red - block
        purple - block
        green - block
        robot - robot
    )
    (:init
        (ontable blue)
        (on yellow blue)
        (clear yellow)
        (ontable orange)
        (on red orange)
        (on purple red)
        (on green purple)
        (clear green)
        ; blue -> yellow
        ; orange -> red -> purple -> green
    )
    (:goal (and (on green blue)
        (on red yellow)
        (on purple red)
        (on orange purple)))
)
    