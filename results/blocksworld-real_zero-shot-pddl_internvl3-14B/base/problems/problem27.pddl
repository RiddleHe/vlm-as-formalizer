(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        blue - block
        green - block
        red - block
        yellow - block
        orange - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable green)
        (ontable red)
        (ontable yellow)
        (ontable orange)
        (ontable purple)
        (handempty robot1)
        (clear blue)
        (clear green)
        (clear red)
        (clear yellow)
        (clear orange)
        (clear purple)
    )
    (:goal
        (and
            (on blue green)
            (on green red)
            (on red yellow)
            (on yellow orange)
            (on orange purple)
            (clear blue)
            (handempty robot1)
        )
    )
)