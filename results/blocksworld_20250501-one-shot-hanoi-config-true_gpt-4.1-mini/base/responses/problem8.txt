(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        pink yellow green red orange purple - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on pink yellow)
        (on purple red)
        (on orange purple)
        (ontable red)
        (clear pink)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on green yellow)
        (on yellow pink)
        (ontable pink)
        (on purple orange)
        (on orange red)
        (ontable red)
    ))
)