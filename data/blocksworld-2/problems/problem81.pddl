(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        purple - block
        green - block
        blue - block
        yellow - block
        orange - block
        robot - robot
    )
    (:init
        (ontable red)
        (on purple red)
        (on green purple)
        (on blue green)
        (on yellow blue)
        (on orange yellow)
        (clear orange)
        ; red -> purple -> green -> blue -> yellow -> orange
    )
    (:goal (and (on red green)
        (on yellow red)
        (on orange yellow)
        (on blue orange)
        (on purple blue)))
)
    