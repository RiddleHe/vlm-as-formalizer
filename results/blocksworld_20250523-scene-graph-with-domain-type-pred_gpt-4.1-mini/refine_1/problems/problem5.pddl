(define (problem stack_blocks)
(:domain blocksworld)
(:objects
    yellow red blue orange green - block
    robot1 - robot
)
(:init
    (ontable yellow)
    (on red yellow)
    (on blue red)
    (on orange blue)
    (clear green)
    (handempty robot1)
)
(:goal (and
    (on yellow red)
    (on red blue)
    (on blue orange)
    (on orange green)
))
)