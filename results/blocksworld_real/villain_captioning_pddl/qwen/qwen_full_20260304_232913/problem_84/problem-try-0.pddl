(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        yellow - block
        orange - block
        purple - block
        red - block
        robot - robot
    )
    (:init
        (ontable green)
        (clear green)
        (ontable blue)
        (clear blue)
        (ontable yellow)
        (clear yellow)
        (ontable orange)
        (clear orange)
        (on purple red)
        (clear purple)
        (not (clear red))
        (not (ontable red))
        (handempty robot)
    )
    (:goal (and
        (on purple green)
        (on green blue)
        (on blue red)
        (on red yellow)
        (on yellow orange)
        (ontable orange)
        (clear purple)
    ))
)