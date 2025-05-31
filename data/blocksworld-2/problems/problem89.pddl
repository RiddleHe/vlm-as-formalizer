(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        green - block
        purple - block
        red - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable orange)
        (on blue orange)
        (on green blue)
        (on purple green)
        (on red purple)
        (on yellow red)
        (clear yellow)
        ; orange -> blue -> green -> purple -> red -> yellow
    )
    (:goal (and (on yellow purple)
        (on orange yellow)
        (on red orange)
        (on blue red)
        (on green blue)))
)
    