(define (problem blocksworld_goal_stack)
    (:domain blocksworld)
    (:objects
        red - block
        orange - block
        yellow - block
        green - block
        blue - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable orange)
        (ontable blue)
        (ontable purple)
        (ontable green)
        (on yellow green)
        (clear red)
        (clear orange)
        (clear blue)
        (clear purple)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on orange purple)
        (on purple green)
        (on green blue)
        (on blue red)
        (ontable red)
        (clear yellow)
    ))
)