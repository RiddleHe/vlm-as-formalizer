(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange blue yellow green red purple - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable green)
        (ontable red)
        (ontable purple)

        (clear orange)
        (clear blue)
        (clear yellow)
        (clear green)
        (clear red)
        (clear purple)

        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on green red)
        (on red purple)
        (on yellow green)
    ))
)