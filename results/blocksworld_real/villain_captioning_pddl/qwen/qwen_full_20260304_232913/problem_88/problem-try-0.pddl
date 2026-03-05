(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        red - block
        yellow - block
        purple - block
        robot - robot
    )
    (:init
        (ontable green)
        (ontable yellow)
        (ontable purple)
        (on blue green)
        (on orange blue)
        (on red yellow)
        (clear orange)
        (clear red)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on green blue)
        (on yellow red)
        (on red purple)
        (on purple orange)
        (clear orange)
        (clear green)
    ))
)