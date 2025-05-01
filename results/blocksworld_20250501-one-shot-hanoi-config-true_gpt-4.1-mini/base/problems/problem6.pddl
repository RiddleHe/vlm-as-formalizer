(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        pink purple yellow orange red robot1 - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (clear pink)
        (on pink purple)
        (ontable yellow)
        (ontable orange)
        (on orange red)
        (clear red)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on pink purple)
        (on yellow orange)
    ))
)