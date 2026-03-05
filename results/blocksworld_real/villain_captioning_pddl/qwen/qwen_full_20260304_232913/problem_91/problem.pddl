(define (problem blocksworld-goal1)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        purple - block
        yellow - block
        orange - block
        red - block
        robot - robot
    )
    (:init
        (on green blue)
        (on yellow orange)
        (ontable blue)
        (ontable orange)
        (ontable purple)
        (ontable red)
        (clear green)
        (clear yellow)
        (clear purple)
        (clear red)
        (handempty robot)
    )
    (:goal (and
        (on orange purple)
        (on purple red)
        (on red yellow)
        (on yellow green)
        (on green blue)
        (ontable blue)
        (clear orange)
    ))
)