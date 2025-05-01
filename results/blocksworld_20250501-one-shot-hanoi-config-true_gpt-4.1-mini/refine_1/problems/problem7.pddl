(define (problem stack_blocks)
(:domain blocksworld)
(:objects
    yellow pink green red purple blue - block
    robot1 - robot
)
(:init
    (ontable green)
    (ontable red)
    (ontable purple)
    (ontable blue)
    (on yellow pink)
    (on pink green)
    (clear yellow)
    (clear red)
    (clear purple)
    (clear blue)
    (handempty robot1)
)
(:goal (and
    (on yellow pink)
    (on pink green)
    (on green red)
    (on red purple)
    (on purple blue)
))
)