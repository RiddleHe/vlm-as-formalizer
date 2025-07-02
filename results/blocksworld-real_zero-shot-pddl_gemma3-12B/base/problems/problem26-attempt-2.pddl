(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        green blue purple orange red yellow - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (on yellow orange)
        (on orange green)
        (on green purple)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on purple orange)
        (on red yellow)
    ))
)