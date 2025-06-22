(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green orange yellow red blue purple - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable orange)
        (ontable yellow)
        (ontable red)
        (ontable blue)
        (ontable purple)

        (clear green)
        (clear orange)
        (clear yellow)
        (clear red)
        (clear blue)
        (clear purple)

        (handempty robot1)
    )
    (:goal (and
        (on blue green)
        (on red yellow)
        (on purple orange)
    ))
)