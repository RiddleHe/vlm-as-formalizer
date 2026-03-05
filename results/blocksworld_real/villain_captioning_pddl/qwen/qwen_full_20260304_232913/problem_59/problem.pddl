(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        red - block
        purple - block
        green - block
        blue - block
        robot - robot
    )
    (:init
        (ontable yellow)
        (clear yellow)
        (ontable red)
        (clear red)
        (on purple orange)
        (ontable orange)
        (clear purple)
        (on blue green)
        (ontable green)
        (clear blue)
        (handempty robot)
    )
    (:goal (and
        (on yellow blue)
        (on orange purple)
        (on red green)
        (clear yellow)
        (clear orange)
        (clear red)
    ))
)