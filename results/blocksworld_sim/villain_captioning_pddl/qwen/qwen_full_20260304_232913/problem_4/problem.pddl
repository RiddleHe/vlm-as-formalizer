(define (problem blocksworld_stack_goal)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        yellow - block
        red - block
        purple - block
        robot - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable red)
        (on purple red)
        (clear orange)
        (clear blue)
        (clear yellow)
        (clear purple)
        (not (clear red))
        (handempty robot)
    )
    (:goal (and
        (on orange yellow)
        (on yellow blue)
        (on blue purple)
        (on purple red)
        (ontable red)
        (clear orange)
    ))
)