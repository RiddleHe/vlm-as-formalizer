(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        yellow - block
        orange - block
        purple - block
        green - block
        red - block
        blue - block
    )
    (:init
        (handempty robot1)
        (clear yellow)
        (clear orange)
        (clear purple)
        (clear green)
        (clear red)
        (clear blue)
        (ontable yellow)
        (ontable orange)
        (ontable purple)
        (ontable green)
        (ontable red)
        (ontable blue)
    )
    (:goal
        (and
            (on yellow orange)
            (on purple green)
            (on red blue)
        )
    )
)