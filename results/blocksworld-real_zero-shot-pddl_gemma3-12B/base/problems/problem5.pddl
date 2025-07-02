(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        red orange purple green blue yellow - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable red)
        (ontable orange)
        (ontable purple)
        (ontable green)
        (ontable blue)
        (ontable yellow)
        (clear red)
        (clear orange)
        (clear purple)
        (clear green)
        (clear blue)
        (clear yellow)
    )
    (:goal (and
        (on yellow purple)
        (on blue red)
        (on orange green)
    ))
)