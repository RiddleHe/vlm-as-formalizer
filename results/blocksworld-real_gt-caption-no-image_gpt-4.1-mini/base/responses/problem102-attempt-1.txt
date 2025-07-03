(define (problem blocks_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green red blue yellow purple orange - block
    )
    (:init
        (handempty robot1)
        (ontable green)
        (ontable orange)
        (on red green)
        (on blue red)
        (on yellow blue)
        (on purple yellow)
        (clear purple)
    )
    (:goal (and
        (on green red)
        (on red orange)
        (on orange blue)
        (on blue purple)
        (on purple yellow)
        (clear green)
        (handempty robot1)
    ))
)