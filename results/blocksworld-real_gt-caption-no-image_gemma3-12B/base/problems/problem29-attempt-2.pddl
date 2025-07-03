(define (problem blocksworld4)
    (:domain blocksworld)
    (:objects
        yellow - block
        purple - block
        orange - block
        green - block
        red - block
        blue - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable yellow)
        (ontable purple)
        (ontable blue)
        (ontable red)
        (ontable green)
        (clear yellow)
        (clear purple)
        (clear blue)
        (clear red)
        (clear green)
        (on orange green)
        (on green red)
    )
    (:goal (and
        (on blue orange)
        (on orange green)
        (on green purple)
        (on purple red)
        (on red yellow)
    ))
)