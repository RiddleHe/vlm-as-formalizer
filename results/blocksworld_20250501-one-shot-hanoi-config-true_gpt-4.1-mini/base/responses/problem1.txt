(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects 
        pink red yellow green - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable yellow)
        (ontable pink)
        (ontable red)
        (clear green)
        (clear yellow)
        (clear pink)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on pink red)
        (on red yellow)
        (on yellow green)
    ))
)