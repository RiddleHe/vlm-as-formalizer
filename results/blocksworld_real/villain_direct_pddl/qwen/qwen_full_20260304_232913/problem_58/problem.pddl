(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        purple - block
        green - block
        blue - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable orange)
        (ontable purple)
        (ontable green)
        (ontable blue)
        (ontable red)
        (clear yellow)
        (clear orange)
        (clear purple)
        (clear green)
        (clear blue)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on green yellow)
        (on blue orange)
        (on purple red)
    ))
)