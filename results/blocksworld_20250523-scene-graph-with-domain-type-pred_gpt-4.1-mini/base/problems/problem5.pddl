(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        yellow red blue orange green - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (clear yellow)
        (clear blue)
        (ontable yellow)
        (ontable blue)
        (ontable orange)
        (ontable green)
        (on yellow red)
        (on red green)
    )
    (:goal (and
        (on yellow red)
        (on red blue)
        (on blue orange)
        (on orange green)
    ))
)