(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - block
        yellow - block
        purple - block
        orange - block
        green - block
        red - block
        blue - block
    )
    (:init
        (clear yellow)
        (clear purple)
        (clear orange)
        (clear green)
        (clear red)
        (clear blue)
        (ontable yellow)
        (ontable purple)
        (ontable orange)
        (ontable green)
        (ontable red)
        (ontable blue)
        (handempty robot1)
        (ontable table)
    )
    (:goal
        (and
            (on blue orange)
            (on orange green)
            (on green red)
            (on red purple)
            (on purple yellow)
            (clear blue)
            (clear orange)
            (clear green)
            (clear red)
            (clear purple)
            (clear yellow)
        )
    )
)