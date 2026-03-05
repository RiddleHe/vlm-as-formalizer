(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        red - block
        yellow - block
        orange - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable blue)
        (ontable red)
        (ontable yellow)
        (ontable orange)
        (ontable purple)
        (clear green)
        (clear blue)
        (clear red)
        (clear yellow)
        (clear orange)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on blue red)
        (on red yellow)
        (on yellow orange)
        (on orange purple)
        (ontable purple)
        (clear green)
    ))
)