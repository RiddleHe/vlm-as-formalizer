(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        blue orange purple yellow red green - block
        robot1 - robot
    )
    (:init
        (ontable blue)
        (ontable orange)
        (ontable purple)
        (ontable yellow)
        (ontable red)
        (ontable green)
        (clear blue)
        (clear orange)
        (clear purple)
        (clear yellow)
        (clear red)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on orange purple)
        (on purple blue)
        (on yellow red)
        (on red green)
    ))
)