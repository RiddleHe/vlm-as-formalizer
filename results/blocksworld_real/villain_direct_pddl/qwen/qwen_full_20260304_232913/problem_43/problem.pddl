(define (problem blockworld-task)
    (:domain blocksworld)
    (:objects
        green - block
        orange - block
        blue - block
        yellow - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable orange)
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (ontable red)
        (clear green)
        (clear orange)
        (clear blue)
        (clear yellow)
        (clear purple)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on green orange)
        (on orange blue)
        (on blue yellow)
        (on purple red)
        (clear green)
        (clear purple)
        (ontable yellow)
        (ontable red)
    ))
)