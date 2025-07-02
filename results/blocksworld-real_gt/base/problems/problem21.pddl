(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        red - block
        green - block
        yellow - block
        purple - block
        orange - block
        blue - block
        robot - robot
    )
    (:init
        (ontable red)
        (on green red)
        (clear green)
        (ontable yellow)
        (on purple yellow)
        (on orange purple)
        (on blue orange)
        (clear blue)
        (handempty robot)
        ; red -> green
        ; yellow -> purple -> orange -> blue
    )
    (:goal (and (on green red)
        (clear green)
        (on orange purple)
        (clear orange)
        (on blue yellow)
        (clear blue)))
)
    