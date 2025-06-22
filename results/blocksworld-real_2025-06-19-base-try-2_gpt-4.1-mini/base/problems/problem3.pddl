(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        purple red yellow orange green blue - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable red)
        (ontable yellow)
        (ontable orange)
        (ontable green)
        (ontable blue)
        (clear purple)
        (clear red)
        (clear yellow)
        (clear orange)
        (clear green)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on purple red)
        (on yellow orange)
        (on orange green)
        (on green blue)
    ))
)