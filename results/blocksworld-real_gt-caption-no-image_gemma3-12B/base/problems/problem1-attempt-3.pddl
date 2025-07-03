(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        purple - block
        orange - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable green)
        (ontable blue)
        (ontable red)
        (ontable yellow)
        (on purple orange)
        (clear green)
        (clear blue)
        (clear red)
        (clear yellow)
        (clear purple)
        (clear orange)
    )
    (:goal
        (and
            (on orange yellow)
            (on green blue)
            (on red purple)
        )
    )
)