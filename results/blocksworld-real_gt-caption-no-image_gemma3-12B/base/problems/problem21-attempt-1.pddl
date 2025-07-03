(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        green red blue orange purple yellow robot1 - block robot - robot
    )
    (:init
        (ontable green)
        (on green red)
        (ontable orange)
        (on blue orange)
        (on orange purple)
        (on purple yellow)
        (clear blue)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on orange purple)
        (on blue yellow)
    ))
)