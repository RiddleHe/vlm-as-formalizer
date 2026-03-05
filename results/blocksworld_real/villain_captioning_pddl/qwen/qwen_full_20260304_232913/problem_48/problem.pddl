(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        green - block
        purple - block
        blue - block
        orange - block
        robot - robot
    )
    (:init
        (on red yellow)
        (on yellow green)
        (ontable green)
        (on purple blue)
        (on blue orange)
        (ontable orange)
        (clear red)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on blue purple)
        (on red yellow)
        (on green orange)
    ))
)