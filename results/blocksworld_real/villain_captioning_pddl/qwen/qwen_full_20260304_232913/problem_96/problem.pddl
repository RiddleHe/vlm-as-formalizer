(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red yellow purple blue green orange - block
        robot - robot
    )
    (:init
        (ontable green)
        (ontable orange)
        (on blue green)
        (on purple blue)
        (on yellow purple)
        (on red yellow)
        (clear red)
        (clear orange)
        (handempty robot)
    )
    (:goal (and
        (on yellow blue)
        (on purple red)
        (on red green)
        (on green orange)
        (ontable orange)
        (clear yellow)
        (clear purple)
    ))
)