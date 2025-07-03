(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        purple - block
        red - block
        green - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable orange)
        (ontable blue)
        (ontable purple)
        (ontable red)
        (ontable green)
        (ontable yellow)
        (clear orange)
        (clear blue)
        (clear purple)
        (clear red)
        (clear green)
        (clear yellow)
    )
    (:goal (and
        (on green red)
        (on red purple)
        (on purple blue)
        (on blue orange)
        (on orange yellow)
    ))
)