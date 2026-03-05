(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        green - block
        orange - block
        yellow - block
        red - block
        blue - block
        purple - block
        robot - robot
    )
    (:init
        (on purple blue)
        (clear purple)
        (ontable blue)
        (ontable green)
        (ontable orange)
        (ontable yellow)
        (ontable red)
        (clear green)
        (clear orange)
        (clear yellow)
        (clear red)
        (handempty robot)
    )
    (:goal (and
        (on yellow orange)
        (on blue red)
        (on green purple)
        (clear yellow)
        (clear blue)
        (clear green)
        (ontable orange)
        (ontable red)
        (ontable purple)
    ))
)