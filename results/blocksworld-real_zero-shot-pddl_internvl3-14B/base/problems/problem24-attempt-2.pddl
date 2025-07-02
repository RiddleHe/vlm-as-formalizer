(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        blue - block
        orange - block
        green - block
        purple - block
        red - block
        yellow - block
        robot1 - robot
    )
    (:init
        (on purple blue)
        (on blue green)
        (ontable green)
        (ontable orange)
        (on yellow red)
        (clear orange)
        (clear green)
        (clear red)
        (handempty robot1)
    )
    (:goal
        (and 
            (on blue orange)
            (on orange green)
            (on green purple)
            (on purple red)
            (on red yellow)
            (clear blue)
            (ontable yellow)
        )
    )
)