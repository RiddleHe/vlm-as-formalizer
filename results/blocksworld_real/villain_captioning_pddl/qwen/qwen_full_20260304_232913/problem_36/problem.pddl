(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        cyan - block
        red - block
        green - block
        purple - block
        robot - robot
    )
    (:init
        (on orange yellow)
        (on cyan red)
        (ontable yellow)
        (ontable red)
        (ontable green)
        (ontable purple)
        (clear orange)
        (clear cyan)
        (clear green)
        (clear purple)
        (handempty robot)
    )
    (:goal (and
        (on red yellow)
        (on yellow cyan)
        (ontable cyan)
        (on orange green)
        (on green purple)
        (ontable purple)
    ))
)