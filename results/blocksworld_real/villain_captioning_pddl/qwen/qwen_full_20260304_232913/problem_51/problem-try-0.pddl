(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple - block
        yellow - block
        orange - block
        green - block
        blue - block
        red - block
        robot1 - robot
    )
    (:init
        (on blue orange)
        (ontable orange)
        (ontable green)
        (ontable purple)
        (ontable yellow)
        (ontable red)
        (clear green)
        (clear purple)
        (clear yellow)
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
    ))
)