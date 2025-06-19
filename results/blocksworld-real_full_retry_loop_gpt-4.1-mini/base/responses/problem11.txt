(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        blue purple orange red yellow green - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable purple)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable green)

        (clear blue)
        (clear purple)
        (clear orange)
        (clear red)
        (clear yellow)
        (clear green)

        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on blue purple)
        (on purple orange)
        (on red yellow)
        (ontable orange)
        (ontable yellow)
    ))
)