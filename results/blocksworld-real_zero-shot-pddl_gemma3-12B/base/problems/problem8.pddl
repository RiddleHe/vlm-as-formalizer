(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow - block
        blue - block
        purple - block
        red - block
        orange - block
        green - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable blue)
        (ontable purple)
        (ontable red)
        (ontable orange)
        (ontable green)
        (clear yellow)
        (clear blue)
        (clear purple)
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
    ))
)