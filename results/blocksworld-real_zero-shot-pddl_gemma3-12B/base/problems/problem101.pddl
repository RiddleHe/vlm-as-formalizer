(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        yellow orange red green blue purple - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable orange)
        (ontable red)
        (ontable green)
        (ontable blue)
        (ontable purple)
        (clear yellow)
        (clear orange)
        (clear red)
        (clear green)
        (clear blue)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on red green)
        (on blue purple)
    ))
)