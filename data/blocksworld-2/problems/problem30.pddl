(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        green - block
        yellow - block
        blue - block
        purple - block
        orange - block
        robot - robot
    )
    (:init
        (ontable red)
        (on green red)
        (on yellow green)
        (on blue yellow)
        (on purple blue)
        (on orange purple)
        (clear orange)
        ; red -> green -> yellow -> blue -> purple -> orange
    )
    (:goal (and (on orange red)
        (on blue orange)
        (on yellow blue)
        (on purple yellow)
        (on green purple)))
)
    