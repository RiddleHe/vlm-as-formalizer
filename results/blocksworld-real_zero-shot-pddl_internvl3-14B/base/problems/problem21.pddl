(define (problem blockstack)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green - block
        red - block
        orange - block
        purple - block
        blue - block
        yellow - block
    )
    (:init
        (ontable yellow)
        (ontable blue)
        (ontable orange)
        (ontable purple)
        (ontable red)
        (ontable green)
        (handempty robot1)
        (clear green)
        (clear red)
        (clear orange)
        (clear purple)
        (clear yellow)
        (clear blue)
    )
    (:goal
        (and
            (on green red)
            (on orange purple)
            (on blue yellow)
        )
    )
)