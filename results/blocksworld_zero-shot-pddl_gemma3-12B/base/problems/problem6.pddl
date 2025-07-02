(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        purple - block
        pink - block
        yellow - block
        orange - block
        robot1 - robot
    )
    (:init
        (ontable purple)
        (ontable pink)
        (ontable yellow)
        (ontable orange)
        (clear purple)
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