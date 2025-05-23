(define (problem two_stacks)
(:domain blocksworld)
(:objects
    red orange purple pink yellow green - block
    robot1 - robot
)
(:init
    (ontable red)
    (on red orange)
    (on orange purple)
    (on purple pink)
    (on pink yellow)
    (on yellow green)
    (clear green)
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