(define (problem stack_blocks)
(:domain blocksworld)
(:objects
    red
    orange
    yellow
    green
    blue
    purple
    robot1
)
(:init
    (ontable orange)
    (on red orange)
    (on yellow red)
    (on green yellow)
    (on blue green)
    (on purple blue)
    (clear purple)
    (armempty robot1)
)
(:goal (and
    (on purple blue)
    (on blue green)
    (on green yellow)
    (on yellow red)
    (on red orange)
    (ontable orange)
))
)