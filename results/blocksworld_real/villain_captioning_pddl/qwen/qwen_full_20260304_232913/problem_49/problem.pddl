(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        orange - block
        green - block
        purple - block
        blue - block
        robot - robot
    )
    (:init
        (on purple blue)
        (on blue red)
        (ontable red)
        (clear purple)
        (on orange yellow)
        (ontable yellow)
        (clear orange)
        (ontable green)
        (clear green)
        (handempty robot)
    )
    (:goal (and
        (on blue purple)
        (on purple green)
        (on green orange)
        (on orange yellow)
        (on yellow red)
        (ontable red)
        (clear blue)
    ))
)