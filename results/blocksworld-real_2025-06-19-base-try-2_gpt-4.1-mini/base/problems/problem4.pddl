(define (problem block_stack_problem)
    (:domain blocksworld)
    (:objects
        orange - block
        red - block
        yellow - block
        blue - block
        purple - block
        green - block
        robot1 - robot
    )
    (:init
        (clear orange)
        (clear red)
        (clear yellow)
        (clear blue)
        (clear purple)
        (clear green)
        (ontable orange)
        (ontable red)
        (ontable yellow)
        (ontable blue)
        (ontable purple)
        (ontable green)
        (handempty robot1)
    )
    (:goal (and
        (on purple green)
        (on blue red)
        (on red orange)
        (on orange yellow)
    ))
)