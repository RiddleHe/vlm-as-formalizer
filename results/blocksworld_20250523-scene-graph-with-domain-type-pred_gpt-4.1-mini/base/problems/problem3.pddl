(define (problem blocksworld_task1)
    (:domain blocksworld)
    (:objects
        yellow green pink red purple - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable green)
        (ontable pink)
        (on purple red)
        (clear yellow)
        (clear green)
        (clear pink)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on yellow green)
        (on green pink)
        (on red purple)
    ))
)