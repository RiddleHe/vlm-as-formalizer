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
        (handempty robot1)
        (ontable orange)
        (on orange red)
        (on red blue)
        (on blue green)
        (on green purple)
        (on purple yellow)
        (clear yellow)
    )
    (:goal (and
        (on purple green)
        (on green blue)
        (on blue red)
        (on red orange)
        (on orange yellow)
    ))
)