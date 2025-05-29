(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        pink purple yellow orange red
        robot1 - robot
    )
    (:init
        (on pink purple)
        (on orange red)
        (ontable purple)
        (ontable yellow)
        (ontable red)
        (clear pink)
        (clear yellow)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on pink purple)
        (on yellow orange)
    ))
)