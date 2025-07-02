(define (problem blocksworld)
(:domain blocksworld)
(:objects
    green - block
    red - block
    orange - block
    blue - block
    purple - block
    yellow - block
    robot1 - robot
)
(:init
    (ontable green)
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable purple)
    (ontable yellow)
    (handempty robot1)
)
(:goal
    (and
        (on green red)
        (on red orange)
        (on orange blue)
        (on blue purple)
        (on purple yellow)
        (clear green)
        (clear red)
        (clear orange)
        (clear blue)
        (clear purple)
        (clear yellow)
    )
)
)