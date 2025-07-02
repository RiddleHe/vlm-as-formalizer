(define (problem blocksworld_create_stacks)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        blue - block
        purple - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable blue)
        (ontable purple)
        (ontable green)
        (clear orange)
        (clear red)
        (clear yellow)
        (clear blue)
        (clear purple)
        (clear green)
        (handempty robot1)
    )
    (:goal
        (and
            (on orange red)
            (on red yellow)
            (on blue purple)
            (on purple green)
        )
    )
)