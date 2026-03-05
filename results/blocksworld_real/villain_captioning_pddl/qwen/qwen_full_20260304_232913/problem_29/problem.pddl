(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        blue - block
        yellow - block
        orange - block
        green - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        (on orange green)
        (on green red)
        (ontable red)
        (ontable yellow)
        (ontable blue)
        (ontable purple)
        (clear orange)
        (clear yellow)
        (clear blue)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on orange green)
        (on green purple)
        (on purple red)
        (on red yellow)
        (ontable yellow)
        (clear blue)
    ))
)