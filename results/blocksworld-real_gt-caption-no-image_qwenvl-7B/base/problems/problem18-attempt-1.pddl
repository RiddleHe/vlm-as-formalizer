(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        purple - block
        red - block
        green - block
        yellow - block
        orange - block
        blue - block
    )
    (:init
        (clear purple)
        (clear red)
        (clear green)
        (clear yellow)
        (clear orange)
        (clear blue)
        (ontable purple)
        (ontable red)
        (ontable green)
        (ontable yellow)
        (ontable orange)
        (ontable blue)
        (handempty robot1)
    )
    (:goal
        (and
            (on blue red)
            (on orange blue)
            (on yellow orange)
            (on green yellow)
            (on purple green)
            (clear blue)
            (clear orange)
            (clear yellow)
            (clear green)
            (clear purple)
            (handempty robot1)
        )
    )
)