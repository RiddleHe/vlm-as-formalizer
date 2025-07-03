(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        blue - block
        orange - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable green)
        (ontable purple)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (clear green)
        (clear purple)
        (clear orange)
        (clear red)
        (clear yellow)
        (on blue orange)
        
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on purple green)
        (on red orange)
        (on orange green)
    ))
)