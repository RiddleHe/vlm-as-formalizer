(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        pink red yellow green - block
        robot1 - robot
    )
    (:init
        (ontable pink)
        (ontable red)
        (ontable yellow)
        (ontable green)
        (clear pink)
        (clear red)
        (clear yellow)
        (clear green)
        (handempty)
    )
    (:goal (and
        (on pink red)
        (on red yellow)
        (on yellow green)
    ))
)