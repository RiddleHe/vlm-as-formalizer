(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        green - block
        red - block
        purple - block
        yellow - block
        blue - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable blue)
        (on yellow blue)
        (on purple yellow)
        (on red purple)
        (on green red)
        (on orange green)
        (clear orange)
    )
    (:goal (and
        (on blue orange)
        (on orange green)
        (on green purple)
        (on purple yellow)
        (on yellow red)
        (on red orange)
    ))
)