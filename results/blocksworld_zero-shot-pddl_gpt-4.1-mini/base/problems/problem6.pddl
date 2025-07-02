(define (problem stackblocks)
    (:domain blocksworld)
    (:objects
        pink purple yellow orange - block
        robot1 - robot
    )
    (:init
        (ontable pink)
        (ontable purple)
        (ontable yellow)
        (ontable orange)
        (clear pink)
        (clear purple)
        (clear yellow)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on pink purple)
        (on yellow orange)
    ))
)