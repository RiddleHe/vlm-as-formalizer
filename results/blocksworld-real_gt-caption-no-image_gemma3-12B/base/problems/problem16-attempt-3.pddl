(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        green red orange purple blue yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable green)
        (clear green)
        (ontable yellow)
        (clear yellow)
        (on red yellow)
        (ontable orange)
        (clear orange)
        (on purple orange)
        (ontable blue)
        (clear blue)
        (on blue purple)
    )
    (:goal (and
        (on green red)
        (on red orange)
        (on orange purple)
        (on purple blue)
        (on blue yellow)
    ))
)