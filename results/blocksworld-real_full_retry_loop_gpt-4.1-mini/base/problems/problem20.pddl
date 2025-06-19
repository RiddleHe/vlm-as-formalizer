(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects 
        blue green red orange yellow purple - block
        robot1 - robot
    )
    (:init 
        (ontable blue)
        (ontable green)
        (ontable red)
        (ontable orange)
        (ontable yellow)
        (ontable purple)
        (clear blue)
        (clear green)
        (clear red)
        (clear orange)
        (clear yellow)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on orange red)
        (on red purple)
        (on blue green)
    ))
)