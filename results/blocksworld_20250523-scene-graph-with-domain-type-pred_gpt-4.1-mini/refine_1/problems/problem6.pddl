(define (problem stack_blocks)
(:domain blocksworld)
(:objects 
    purple pink yellow orange red
    robot1 - robot
)
(:init
    (on purple pink)
    (on pink red)
    (ontable purple)
    (ontable orange)
    (ontable yellow)
    (clear purple)
    (clear orange)
    (clear yellow)
    (handempty robot1)
)
(:goal (and 
    (on pink purple)
    (on yellow orange)
))
)