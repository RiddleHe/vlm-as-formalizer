(define (problem blocksworld_real_problem)
    (:domain blocksworld)
    (:objects
        red blue green yellow orange purple - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable blue)
        (ontable green)
        (ontable yellow)
        (ontable orange)
        (ontable purple)
        (clear red)
        (clear blue)
        (clear green)
        (clear yellow)
        (clear orange)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on purple green)
        (on red blue)
    ))
)