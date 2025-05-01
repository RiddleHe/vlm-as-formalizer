(define (problem two_stacks)
    (:domain blocksworld)
    (:objects
        pink purple yellow orange
        robot1
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