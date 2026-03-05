(define (problem blocksworld_task)
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
        (ontable green)
        (ontable red)
        (ontable yellow)
        (on orange yellow)
        (on purple orange)
        (clear blue)
        (clear green)
        (clear red)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on yellow orange)
        (on orange red)
        (on red purple)
        (ontable purple)
        (on blue green)
        (ontable green)
    ))
)