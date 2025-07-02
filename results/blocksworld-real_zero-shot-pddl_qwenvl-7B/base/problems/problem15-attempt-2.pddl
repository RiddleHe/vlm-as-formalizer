(define (problem blocksworld)
(:domain blocksworld)
(:objects
    robot1 - robot
    yellow - block
    blue - block
    purple - block
    orange - block
    green - block
    red - block
    table - table
)
(:init
    (ontable yellow)
    (ontable blue)
    (ontable purple)
    (ontable orange)
    (ontable green)
    (ontable red)
    (handempty robot1)
)
(:goal
    (and
        (on red green)
        (on green purple)
        (on purple orange)
        (on orange blue)
        (on blue yellow)
        (clear red)
        (clear green)
        (clear purple)
        (clear orange)
        (clear blue)
        (clear yellow)
    )
)
)