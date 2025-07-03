(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        orange - block
        purple - block
        green - block
        blue - block
        yellow - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (clear orange)
        (ontable blue)
        (clear blue)
        (on green blue)
        (clear green)
        (on purple green)
        (clear purple)
        (ontable red)
        (clear red)
        (on yellow red)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on orange green)
        (on green purple)
        (on purple red)
        (on red yellow)
    ))
)