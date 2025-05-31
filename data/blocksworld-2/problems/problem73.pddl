(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        yellow - block
        orange - block
        red - block
        blue - block
        robot - robot
    )
    (:init
        (ontable green)
        (on purple green)
        (on yellow purple)
        (on orange yellow)
        (on red orange)
        (on blue red)
        (clear blue)
        ; green -> purple -> yellow -> orange -> red -> blue
    )
    (:goal (and (on yellow red)
        (on green yellow)
        (on blue green)
        (on purple blue)
        (on orange purple)))
)
    