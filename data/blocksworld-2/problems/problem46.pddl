(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        green - block
        blue - block
        red - block
        yellow - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on green orange)
        (clear green)
        (ontable blue)
        (on red blue)
        (on yellow red)
        (on purple yellow)
        (clear purple)
        ; orange -> green
        ; blue -> red -> yellow -> purple
    )
    (:goal (and (on blue green)
        (on orange yellow)
        (on purple orange)
        (on red purple)))
)
    