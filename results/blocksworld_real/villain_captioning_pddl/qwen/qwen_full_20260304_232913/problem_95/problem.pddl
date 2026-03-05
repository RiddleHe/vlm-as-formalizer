(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        green - block
        red - block
        purple - block
        yellow - block
        robot1 - robot
    )
    (:init
        (on blue orange)
        (on orange green)
        (ontable green)
        (on red purple)
        (ontable purple)
        (ontable yellow)
        (clear blue)
        (clear red)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (ontable red)
        (on blue orange)
        (on orange purple)
        (on purple yellow)
        (ontable yellow)
        (clear blue)
    ))
)