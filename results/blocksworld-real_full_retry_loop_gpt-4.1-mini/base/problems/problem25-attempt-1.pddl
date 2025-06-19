(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        yellow red orange blue purple green - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable red)
        (ontable orange)
        (ontable blue)
        (ontable purple)
        (ontable green)
        (clear orange)
        (clear blue)
        (clear purple)
        (clear yellow)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on orange red)
        (on red yellow)
        (on blue purple)
        (on purple green)
    ))
)