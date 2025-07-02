(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        yellow - block
        green - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        ; Initial state of the scene
        (on blue orange)
        (on yellow blue)
        (on green yellow)
        ; Purple and red are on the table and need to be stacked
        (ontable red)
        (ontable purple)
        (clear purple)
        (clear red)
        (clear blue)
        (handempty robot1)
    )
    (:goal
        (and 
            (on blue orange)
            (on yellow green)
            (on red yellow)
            (on purple red)
        )
    )
)