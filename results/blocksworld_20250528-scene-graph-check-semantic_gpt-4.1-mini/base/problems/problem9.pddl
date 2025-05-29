(define (problem stack_puzzle)
    (:domain blocksworld)
    (:objects
        purple blue green yellow red orange - block
        robot1 - robot
    )
    (:init
        (on purple blue)
        (on blue green)
        (on green yellow)
        (on yellow red)
        (ontable red)
        (ontable orange)
        (clear purple)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on purple blue)
        (on blue green)
        (on green yellow)
        (on yellow red)
        (on red orange)
    ))
)