(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        purple - block
        green - block
        orange - block
        blue - block
        yellow - block
        red - block
        robot1 - robot
    )
    (:init
        (on blue orange)
        (on orange yellow)
        (ontable yellow)
        (ontable green)
        (ontable purple)
        (ontable red)
        (clear blue)
        (clear green)
        (clear purple)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple red)
        (on red yellow)
        (ontable yellow)
        (on green blue)
        (ontable blue)
        (clear orange)
        (clear green)
    ))
)