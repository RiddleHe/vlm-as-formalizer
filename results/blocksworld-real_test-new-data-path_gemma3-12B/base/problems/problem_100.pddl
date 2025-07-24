(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        red yellow green orange purple blue - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable yellow)
        (ontable green)
        (ontable orange)
        (ontable purple)
        (ontable blue)
        (clear red)
        (clear yellow)
        (clear green)
        (clear orange)
        (clear purple)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on red yellow)
        (on yellow blue)
        (on green orange)
        (on orange purple)
    ))
)