(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        purple - block
        blue - block
        green - block
        yellow - block
        robot - robot
    )
    (:init
        (ontable red)
        (on orange red)
        (on purple orange)
        (on blue purple)
        (on green blue)
        (on yellow green)
        (clear yellow)
        ; red -> orange -> purple -> blue -> green -> yellow
    )
    (:goal (and (on green orange)
        (on purple green)
        (on red purple)
        (on blue red)
        (on yellow blue)))
)
    