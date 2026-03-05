(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        cyan - block
        yellow - block
        red - block
        orange - block
        green - block
        purple - block
        robot1 - robot
    )
    (:init
        (on cyan yellow)
        (on yellow red)
        (on red orange)
        (on orange green)
        (ontable green)
        (ontable purple)
        (clear cyan)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on red cyan)
        (on yellow green)
        (on green orange)
        (on orange purple)
        (ontable purple)
        (clear red)
        (clear yellow)
    ))
)