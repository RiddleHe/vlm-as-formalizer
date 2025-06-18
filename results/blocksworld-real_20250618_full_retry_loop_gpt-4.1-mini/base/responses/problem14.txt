(define (problem blocksworld_real_problem)
    (:domain blocksworld)
    (:objects
        purple yellow orange blue red green - block
        robot1 - robot
    )
    (:init
        (ontable purple) (clear purple)
        (ontable yellow) (clear yellow)
        (ontable orange) (clear orange)
        (ontable blue) (clear blue)
        (ontable red) (clear red)
        (ontable green) (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on purple yellow)
        (on yellow orange)
        (ontable orange)
        (on blue red)
        (on red green)
        (ontable green)
    ))
)