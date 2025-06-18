(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        purple blue yellow red orange green - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable blue)
        (ontable yellow)
        (ontable red)
        (ontable orange)
        (ontable green)
        (clear purple)
        (clear blue)
        (clear yellow)
        (clear red)
        (clear orange)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
            (on yellow blue)
            (on blue purple)
            (on red orange)
            (on orange green)
        )
    )
)