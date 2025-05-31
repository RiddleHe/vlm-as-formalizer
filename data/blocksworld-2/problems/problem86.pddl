(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        green - block
        purple - block
        yellow - block
        orange - block
        blue - block
        robot - robot
    )
    (:init
        (ontable red)
        (on green red)
        (on purple green)
        (on yellow purple)
        (on orange yellow)
        (on blue orange)
        (clear blue)
        ; red -> green -> purple -> yellow -> orange -> blue
    )
    (:goal (and (on green orange)
        (on yellow green)
        (on blue yellow)
        (on purple blue)
        (on red purple)))
)
    