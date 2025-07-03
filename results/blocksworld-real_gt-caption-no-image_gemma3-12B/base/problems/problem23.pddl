(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        purple - block
        red - block
        blue - block
        green - block
        yellow - block
        orange - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (clear purple)
        (ontable red)
        (clear red)
        (ontable blue)
        (clear blue)
        (ontable green)
        (clear green)
        (ontable yellow)
        (clear yellow)
        (ontable orange)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on red orange)
        (on orange green)
        (on green purple)
    ))
)