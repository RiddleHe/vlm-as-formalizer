(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        purple - block
        green - block
        orange - block
        blue - block
        robot - robot
    )
    (:init
        (ontable red)
        (clear red)
        (ontable yellow)
        (on purple yellow)
        (on green purple)
        (on orange green)
        (on blue orange)
        (clear blue)
        (handempty robot)
        ; red
        ; yellow -> purple -> green -> orange -> blue
    )
    (:goal (and (on purple blue)
        (on orange purple)
        (clear orange)
        (on red green)
        (on yellow red)
        (clear yellow)))
)
    