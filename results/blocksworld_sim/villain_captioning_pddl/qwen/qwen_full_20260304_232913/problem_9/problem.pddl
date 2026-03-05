(define (problem blocksworld_goal_stack)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        green - block
        blue - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (clear orange)
        (ontable red)
        (on yellow red)
        (clear yellow)
        (on green yellow)
        (clear green)
        (on blue green)
        (clear blue)
        (on purple blue)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on purple blue)
        (on blue green)
        (on green yellow)
        (on yellow red)
        (on red orange)
        (ontable orange)
        (clear purple)
    ))
)