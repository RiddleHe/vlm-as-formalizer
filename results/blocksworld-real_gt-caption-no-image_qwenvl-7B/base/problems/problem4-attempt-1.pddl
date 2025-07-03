(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        orange - block
        red - block
        purple - block
        blue - block
        yellow - block
        green - block
        table - table
    )
    (:init
        (clear orange)
        (clear red)
        (clear purple)
        (clear blue)
        (clear yellow)
        (clear green)
        (ontable orange)
        (ontable red)
        (ontable purple)
        (ontable blue)
        (ontable yellow)
        (ontable green)
        (handempty robot1)
    )
    (:goal
        (and
            (on purple green)
            (on blue red orange yellow)
        )
    )
)