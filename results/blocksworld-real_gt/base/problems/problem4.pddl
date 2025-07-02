(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        green - block
        yellow - block
        blue - block
        purple - block
        red - block
        orange - block
        robot - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on blue yellow)
        (on purple blue)
        (on red purple)
        (on orange red)
        (clear orange)
        (handempty robot)
        ; green -> yellow -> blue -> purple -> red -> orange
    )
    (:goal (and (on purple green)
        (clear purple)
        (on orange yellow)
        (on red orange)
        (on blue red)
        (clear blue)))
)
    