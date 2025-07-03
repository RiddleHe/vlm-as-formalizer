(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        green - block
        blue - block
        purple - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable purple)
        (clear orange)
        (clear red)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear purple)
    )
    (:goal
        (and
            (on green blue)
            (on purple orange)
            (on red yellow)
        )
    )
)