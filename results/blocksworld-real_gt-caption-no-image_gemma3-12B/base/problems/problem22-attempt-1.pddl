(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        blue - block
        green - block
        purple - block
        yellow - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (on orange red)
        (on red blue)
        (on blue green)
        (on green purple)
        (on purple yellow)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green orange)
        (on purple yellow)
        (on yellow red)
        (on red blue)
    ))
)