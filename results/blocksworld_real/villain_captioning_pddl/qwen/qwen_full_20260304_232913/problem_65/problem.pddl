(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red - block
        purple - block
        blue - block
        orange - block
        yellow - block
        green - block
        robot1 - robot
    )
    (:init
        (on red purple)
        (on purple blue)
        (ontable blue)
        (ontable orange)
        (ontable green)
        (ontable yellow)
        (clear red)
        (clear orange)
        (clear green)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on yellow purple)
        (on purple blue)
        (on blue orange)
        (ontable orange)
        (clear green)
        (clear yellow)
    ))
)