(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects 
        purple pink yellow orange red
        robot1 - robot
    )
    (:init
        (on purple pink)
        (ontable purple)
        (ontable yellow)
        (ontable orange)
        (on red orange)
        (clear purple)
        (clear yellow)
        (clear red)
        (handempty robot1)
    )
    (:goal (and 
        (on pink purple)
        (on yellow orange)
    ))
)