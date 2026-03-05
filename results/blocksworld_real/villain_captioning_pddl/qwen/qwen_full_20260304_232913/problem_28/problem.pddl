(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        yellow - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        (on green blue)
        (on blue orange)
        (ontable orange)
        (ontable yellow)
        (ontable red)
        (ontable purple)
        (clear green)
        (clear yellow)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on yellow green)
        (on green purple)
        (on purple red)
        (on red blue)
        (ontable blue)
        (clear orange)
    ))
)