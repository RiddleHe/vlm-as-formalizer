(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        blue orange green purple red yellow - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable orange)
        (ontable green)
        (ontable purple)
        (ontable red)
        (ontable yellow)
        (clear blue)
        (clear orange)
        (clear green)
        (clear purple)
        (clear red)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on blue orange)
        (on orange green)
        (on green purple)
        (on purple red)
        (on red yellow)
    ))
)