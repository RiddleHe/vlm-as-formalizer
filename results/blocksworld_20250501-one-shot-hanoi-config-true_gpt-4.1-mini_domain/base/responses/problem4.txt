(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        orange yellow blue purple red - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (clear orange)
        (ontable blue)
        (clear blue)
        (ontable yellow)
        (clear yellow)
        (on purple red)
        (clear purple)
        (handempty)
    )
    (:goal (and 
        (on orange yellow)
        (on yellow blue)
        (on purple red)
    ))
)