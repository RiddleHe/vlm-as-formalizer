(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        red yellow orange purple blue green - block
    )
    (:init
        ; Initial stacks per caption:
        (handempty robot1)
        
        (on red yellow)
        (clear red)
        (ontable yellow)

        (clear orange)
        (ontable orange)

        (clear purple)
        (ontable purple)

        (clear blue)
        (ontable blue)

        (clear green)
        (ontable green)
    )
    (:goal (and
        (on yellow purple)
        (clear yellow)
        (on blue red)
        (clear blue)
        (on orange green)
        (clear orange)
    ))
)