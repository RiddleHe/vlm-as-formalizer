(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow blue purple red orange green - block
        robot1 - robot
    )
    (:init 
        (handempty robot1)
        (clear yellow)
        (on yellow blue)
        (clear blue)
        (ontable blue)
        (clear purple)
        (ontable purple)
        (clear red)
        (ontable red)
        (clear orange)
        (ontable orange)
        (clear green)
        (ontable green)
    )
    (:goal 
        (and 
            (on yellow blue)
            (on blue purple)
            (clear yellow)
            (on red orange)
            (on orange green)
            (clear red)
        )
    )
)