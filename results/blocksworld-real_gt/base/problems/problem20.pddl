(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        red - block
        yellow - block
        orange - block
        purple - block
        robot - robot
    )
    (:init
        (ontable blue)
        (clear blue)
        (ontable green)
        (clear green)
        (ontable red)
        (clear red)
        (ontable yellow)
        (on orange yellow)
        (on purple orange)
        (clear purple)
        (handempty robot)
        ; blue
        ; green
        ; red
        ; yellow -> orange -> purple
    )
    (:goal (and (on red purple)
        (on orange red)
        (on yellow orange)
        (clear yellow)
        (on blue green)
        (clear blue)))
)
    