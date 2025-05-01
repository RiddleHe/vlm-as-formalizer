(define (problem two_stacks)
(:domain blocksworld)
(:objects
    pink purple yellow orange red
    robot1
)
(:init
    (on pink yellow)
    (ontable yellow)
    (ontable purple)
    (on orange red)
    (ontable red)
    (clear pink)
    (clear purple)
    (clear orange)
    (handempty robot1)
)
(:goal (and 
    (on pink purple)
    (on yellow orange)
))
)