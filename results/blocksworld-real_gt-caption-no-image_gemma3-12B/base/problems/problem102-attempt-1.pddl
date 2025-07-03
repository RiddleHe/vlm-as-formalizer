(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        green red blue yellow purple orange - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on green red)
        (on red blue)
        (on blue yellow)
        (on yellow purple)
        (on purple orange)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on red orange)
        (on orange blue)
        (on blue purple)
        (on purple yellow)
        (on yellow green)
    ))
)