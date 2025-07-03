(define (problem blocksworld-rearrange)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        orange - block
        blue - block
        purple - block
        red - block
        green - block
        yellow - block
    )
    (:init
        (clear orange)
        (clear blue)
        (clear purple)
        (clear red)
        (clear green)
        (clear yellow)
        (ontable orange)
        (ontable blue)
        (ontable purple)
        (ontable red)
        (ontable green)
        (ontable yellow)
        (handempty robot1)
    )
    (:goal
        (and
            (clear green)
            (clear red)
            (clear purple)
            (clear blue)
            (clear orange)
            (clear yellow)
            (ontable green)
            (ontable red)
            (ontable purple)
            (ontable blue)
            (ontable orange)
            (ontable yellow)
            (on yellow orange)
            (on orange blue)
            (on blue purple)
            (on purple red)
            (on red green)
        )
    )
)