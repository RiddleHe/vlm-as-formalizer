(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        purple - block
        green - block
        blue - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on red orange)
        (on yellow red)
        (on purple yellow)
        (on green purple)
        (on blue green)
        (clear blue)
        ; orange -> red -> yellow -> purple -> green -> blue
    )
    (:goal (and (on blue green)
        (on red blue)
        (on purple red)
        (on yellow purple)
        (on orange yellow)))
)
    