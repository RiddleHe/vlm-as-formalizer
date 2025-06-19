(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green blue purple orange red yellow - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (clear green)
        (ontable blue)
        (clear blue)
        (ontable purple)
        (clear purple)
        (ontable orange)
        (clear orange)
        (ontable red)
        (clear red)
        (ontable yellow)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on green blue)
        (on red purple)
    ))
)