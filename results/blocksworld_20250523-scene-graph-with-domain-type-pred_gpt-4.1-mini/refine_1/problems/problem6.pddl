(define (problem blocksworld_task)
(:domain blocksworld)
(:objects
    purple pink yellow orange red
    robot1 - robot
)
(:init
    (on purple pink)
    (on red orange)
    (ontable yellow)
    (ontable purple)
    (clear purple)
    (clear red)
    (clear yellow)
    (clear orange)
    (handempty robot1)
)
(:goal (and
    (on pink purple)
    (on yellow orange)
))
)