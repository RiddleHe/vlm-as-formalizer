(define (problem blocksworld-rearrangement)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        blue - block
        purple - block
        yellow - block
        green - block
        red - block
        orange - block
    )
    (:init
        (clear blue)
        (clear purple)
        (clear yellow)
        (clear green)
        (clear red)
        (clear orange)
        (ontable blue)
        (ontable purple)
        (ontable yellow)
        (ontable green)
        (ontable red)
        (ontable orange)
        (handempty robot1)
        (on blue purple)
        (on purple yellow)
        (on green red)
        (on red orange)
    )
    (:goal
        (and
            (on blue yellow)
            (on orange red)
            (on red purple)
            (on purple green)
        )
    )
)