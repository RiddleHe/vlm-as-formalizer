(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        blue - block
        green - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (on orange yellow)
        (on blue orange)
        (on green blue)
        (on purple green)
        (on red purple)
        (clear red)
        ; yellow -> orange -> blue -> green -> purple -> red
    )
    (:goal (and (on yellow purple)
        (on orange yellow)
        (on red orange)
        (on blue red)
        (on green blue)))
)
    