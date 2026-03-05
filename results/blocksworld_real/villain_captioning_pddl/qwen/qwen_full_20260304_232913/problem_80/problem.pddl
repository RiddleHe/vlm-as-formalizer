(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        green - block
        red - block
        blue - block
        purple - block
        orange - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable green)
        (ontable red)
        (ontable blue)
        (ontable purple)
        (ontable orange)
        (clear yellow)
        (clear green)
        (clear red)
        (clear blue)
        (clear purple)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on yellow green)
        (on red blue)
        (on purple orange)
    ))
)