(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects 
        orange red yellow blue green purple - block
        robot1 - robot
    )
    (:init
        (clear orange)
        (clear red)
        (clear yellow)
        (clear blue)
        (clear green)
        (clear purple)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable blue)
        (ontable green)
        (ontable purple)
        (handempty robot1)
    )
    (:goal (and
        (on orange blue)
        (on red green)
        (on yellow purple)
    ))
)