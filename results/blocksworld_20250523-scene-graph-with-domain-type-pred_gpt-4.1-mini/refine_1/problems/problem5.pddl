(define (problem stack_blocks2)
(:domain blocksworld)
(:objects
    yellow red blue orange green
    robot1 - robot
)
(:init
    (on yellow red)
    (on red blue)
    (on blue orange)
    (on orange green)
    (ontable green)
    (clear yellow)
    (handempty robot1)
)
(:goal (and
    (on yellow red)
    (on red blue)
    (on blue orange)
    (on orange green)
))
)