(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        red - block
        yellow - block
        purple - block
        orange - block
        blue - block
        robot - robot
    )
    (:init
        (ontable green)
        (on red green)
        (on yellow red)
        (on purple yellow)
        (on orange purple)
        (on blue orange)
        (clear blue)
        ; green -> red -> yellow -> purple -> orange -> blue
    )
    (:goal (and (on purple blue)
        (on red purple)
        (on green red)
        (on yellow green)
        (on orange yellow)))
)
    