(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        green yellow pink purple orange red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on pink yellow)
        (on purple pink)
        (on orange purple)
        (on red orange)
        (clear red)
        (handempty robot1)
    )
    (:goal (and
        (on green yellow)
        (on yellow pink)
        (on purple orange)
        (on orange red)
    ))
)