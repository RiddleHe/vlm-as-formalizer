(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        green red blue orange purple yellow - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (on green red)
        (clear green)

        (ontable yellow)
        (on purple yellow)
        (on orange purple)
        (on blue orange)
        (clear blue)

        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (clear green)
        (ontable red)

        (on orange purple)
        (clear orange)
        (ontable purple)

        (on blue yellow)
        (clear blue)
        (ontable yellow)
    ))
)