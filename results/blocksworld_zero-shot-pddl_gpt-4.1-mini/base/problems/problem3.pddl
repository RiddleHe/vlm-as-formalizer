(define (problem stacks2)
    (:domain blocksworld)
    (:objects
        yellow green pink red purple - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable green)
        (ontable pink)
        (ontable red)
        (ontable purple)
        (clear yellow)
        (clear green)
        (clear pink)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on yellow green)
        (on green pink)
        (ontable pink)
        (on red purple)
        (ontable purple)
    ))
)