(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        yellow - block
        orange - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable blue)
        (ontable yellow)
        (ontable red)
        (on orange purple)
        (ontable purple)
        (clear green)
        (clear blue)
        (clear yellow)
        (clear red)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on green orange)
        (on orange blue)
        (on blue yellow)
        (ontable yellow)
        (on purple red)
        (ontable red)
        (clear green)
        (clear purple)
    ))
)