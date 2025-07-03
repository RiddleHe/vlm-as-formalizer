(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        blue - block
        purple - block
        red - block
        green - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable orange)
        (clear orange)
        (ontable yellow)
        (clear yellow)
        (ontable purple)
        (clear purple)
        (on blue purple)
        (clear blue)
        (ontable red)
        (clear red)
        (ontable green)
        (clear green)
    )
    (:goal (and
        (on blue orange)
        (on orange red)
        (on red purple)
        (on purple green)
        (on green yellow)
    ))
)