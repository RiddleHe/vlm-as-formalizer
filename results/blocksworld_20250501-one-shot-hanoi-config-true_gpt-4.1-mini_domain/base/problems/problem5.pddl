(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        yellow red blue orange green - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable red)
        (ontable blue)
        (ontable orange)
        (ontable green)
        (clear yellow)
        (clear red)
        (clear blue)
        (clear orange)
        (clear green)
        (handempty robot1)
    )
    (:goal (and
        (on yellow red)
        (on red blue)
        (on blue orange)
        (on orange green)
        (ontable green)
    ))
)