(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        red - block
        blue - block
        green - block
        purple - block
        robot1 - robot
    )
    (:init
        (on yellow red)
        (on orange blue)
        (ontable red)
        (ontable blue)
        (ontable green)
        (ontable purple)
        (clear yellow)
        (clear orange)
        (clear green)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on orange red)
        (on yellow purple)
    ))
)