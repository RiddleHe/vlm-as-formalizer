(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        purple blue green yellow red orange - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (clear orange)
        (ontable red)
        (clear red)
        (ontable yellow)
        (clear yellow)
        (ontable green)
        (clear green)
        (ontable blue)
        (clear blue)
        (ontable purple)
        (clear purple)
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