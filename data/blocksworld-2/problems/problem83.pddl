(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        purple - block
        orange - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on purple yellow)
        (on orange purple)
        (on blue orange)
        (on red blue)
        (clear red)
        ; green -> yellow -> purple -> orange -> blue -> red
    )
    (:goal (and (on blue red)
        (on purple blue)
        (on orange purple)
        (on yellow orange)
        (on green yellow)))
)
    