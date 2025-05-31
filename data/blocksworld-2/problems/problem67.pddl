(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        purple - block
        red - block
        yellow - block
        orange - block
        green - block
        blue - block
        robot - robot
    )
    (:init
        (ontable purple)
        (on red purple)
        (on yellow red)
        (on orange yellow)
        (on green orange)
        (on blue green)
        (clear blue)
        ; purple -> red -> yellow -> orange -> green -> blue
    )
    (:goal (and (on blue yellow)
        (on purple blue)
        (on red purple)
        (on orange red)
        (on green orange)))
)
    