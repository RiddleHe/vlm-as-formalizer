(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        green - block
        blue - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable red)
        (ontable purple)
        (clear orange)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal
        (and
            (on orange yellow)
            (on green blue)
            (on red purple)
        )
    )
)