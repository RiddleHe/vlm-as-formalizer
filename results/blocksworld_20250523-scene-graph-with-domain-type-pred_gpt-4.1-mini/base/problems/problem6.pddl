(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple pink yellow orange red
        robot1 - robot
    )
    (:init
        (on purple pink)
        (on orange red)
        (ontable yellow)
        (ontable red)
        (clear purple)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on pink purple)
        (on yellow orange)
    ))
)