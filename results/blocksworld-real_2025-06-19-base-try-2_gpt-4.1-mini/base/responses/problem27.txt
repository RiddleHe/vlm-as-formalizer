(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects 
        blue yellow orange red purple green - block
        robot1 - robot
    )
    (:init 
        (ontable blue)
        (ontable yellow)
        (ontable orange)
        (ontable red)
        (ontable purple)
        (ontable green)
        (clear blue)
        (clear yellow)
        (clear orange)
        (clear red)
        (clear purple)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on blue green)
        (on green red)
        (on red yellow)
        (on yellow orange)
        (on orange purple)
    ))
)