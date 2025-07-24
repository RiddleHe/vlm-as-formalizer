(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange yellow green blue red purple - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable red)
        (ontable purple)
        (clear orange)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal
        (and
            (on blue green)
            (on red yellow)
            (on purple orange)
        )
    )
)