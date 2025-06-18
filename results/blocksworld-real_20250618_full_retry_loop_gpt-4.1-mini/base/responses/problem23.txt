(define (problem blocksworldreal1)
    (:domain blocksworld)
    (:objects
        yellow blue red orange green purple - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable blue)
        (ontable red)
        (ontable orange)
        (ontable green)
        (ontable purple)

        (clear yellow)
        (clear blue)
        (clear red)
        (clear orange)
        (clear green)
        (clear purple)

        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on orange green)
        (on green purple)
        (on red orange)
    ))
)