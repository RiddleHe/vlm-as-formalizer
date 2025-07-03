(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        green blue purple orange red yellow - block
    )
    (:init
        ; initial stacks:
        (ontable green)
        (clear green)

        (ontable blue)
        (clear blue)

        (on purple orange)
        (clear purple)

        (ontable orange)
        (not (clear orange))

        (ontable red)
        (clear red)

        (ontable yellow)
        (clear yellow)

        ; robot state
        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on green blue)
        (on red purple)
    ))
)