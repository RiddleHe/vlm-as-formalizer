(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        purple - block
        yellow - block
        orange - block
        blue - block
        green - block
        robot - robot
    )
    (:init
        (ontable red)
        (on purple red)
        (on yellow purple)
        (on orange yellow)
        (on blue orange)
        (on green blue)
        (clear green)
        ; red -> purple -> yellow -> orange -> blue -> green
    )
    (:goal (and (on red blue)
        (on orange red)
        (on purple orange)
        (on yellow purple)
        (on green yellow)))
)
    