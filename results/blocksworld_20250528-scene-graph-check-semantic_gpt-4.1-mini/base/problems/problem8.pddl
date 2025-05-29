(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        green yellow pink purple orange red - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (on orange red)
        (on purple orange)
        (on pink red)
        (on yellow pink)
        (on green yellow)
        (clear green)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green yellow)
        (on yellow pink)
        (on pink red)
        (on purple orange)
        (on orange red)
        (clear green)
        (clear purple)
    ))
)