(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        red yellow green blue orange purple - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable orange)
        (ontable purple)

        (clear red)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear orange)
        (clear purple)

        (handempty robot1)
    )
    (:goal (and
        (on orange yellow)
        (on yellow green)
        (on green purple)
        (on purple red)
        (on red blue)
    ))
)