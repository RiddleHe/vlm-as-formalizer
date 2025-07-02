(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        green orange blue purple red yellow - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (on red green)
        (clear green)
        (ontable purple)
        (on purple orange)
        (clear orange)
        (ontable yellow)
        (on yellow blue)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on orange purple)
        (on blue yellow)
    ))
)