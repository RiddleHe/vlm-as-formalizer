(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        yellow - block
        orange - block
        purple - block
        red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (clear green)
        (ontable blue)
        (clear blue)
        (ontable yellow)
        (clear yellow)
        (ontable orange)
        (clear orange)
        (ontable red)
        (on purple red)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on blue red)
        (on red yellow)
        (on yellow orange)
        (on orange purple)
        (clear green)
        (ontable purple)
    ))
)