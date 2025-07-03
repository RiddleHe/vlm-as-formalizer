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
        (ontable orange robot1)
        (ontable blue robot1)
        (ontable purple robot1)
        (ontable red robot1)
        (ontable green robot1)
        (ontable yellow robot1)
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
            (ontable green robot1)
            (ontable red robot1)
            (ontable purple robot1)
            (ontable blue robot1)
            (ontable orange robot1)
            (ontable yellow robot1)
            (on yellow orange robot1)
            (on orange blue robot1)
            (on blue purple robot1)
            (on purple red robot1)
            (on red green robot1)
        )
    )
)