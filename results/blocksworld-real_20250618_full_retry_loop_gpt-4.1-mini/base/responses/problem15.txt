(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        green yellow blue purple orange red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable yellow)
        (ontable blue)
        (ontable purple)
        (ontable orange)
        (ontable red)

        (clear green)
        (clear yellow)
        (clear blue)
        (clear purple)
        (clear orange)
        (clear red)

        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on purple orange)
        (on orange green)
        (on green red)
    ))
)