(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        orange - block
        red - block
        green - block
        purple - block
        yellow - block
        blue - block
    )
    (:init
        (clear orange)
        (clear red)
        (clear green)
        (clear purple)
        (clear yellow)
        (clear blue)
        (ontable orange)
        (ontable red)
        (ontable green)
        (ontable purple)
        (ontable yellow)
        (ontable blue)
        (handempty robot1)
        (on table robot1)
    )
    (:goal
        (and
            (on purple yellow orange)
            (on blue red green)
        )
    )
)