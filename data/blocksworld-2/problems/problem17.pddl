(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        blue - block
        orange - block
        yellow - block
        purple - block
        green - block
        robot - robot
    )
    (:init
        (ontable red)
        (on blue red)
        (on orange blue)
        (on yellow orange)
        (on purple yellow)
        (on green purple)
        (clear green)
        ; red -> blue -> orange -> yellow -> purple -> green
    )
    (:goal (and (on yellow orange)
        (on green yellow)
        (on red green)
        (on blue red)
        (on purple blue)))
)
    