(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        purple blue green orange red yellow - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable blue)
        (ontable green)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (clear purple)
        (clear blue)
        (clear green)
        (clear orange)
        (clear red)
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