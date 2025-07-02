(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        orange yellow green purple red blue - block
        robot1 - robot
    )
    (:init
        (ontable orange)
        (ontable yellow)
        (ontable green)
        (ontable purple)
        (ontable red)
        (ontable blue)
        (clear orange)
        (clear yellow)
        (clear green)
        (clear purple)
        (clear red)
        (clear blue)
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