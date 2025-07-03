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
        (on purple red)
        (ontable blue)
        (on blue green)
        (on green yellow)
        (ontable orange)
        (handempty robot1)
        (clear red)
        (clear yellow)
    )
    (:goal (and
        (on yellow blue)
        (on red orange)
        (on orange green)
        (on green purple)
    ))
)