(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        green - block
        blue - block
        orange - block
        yellow - block
        red - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on green blue)
        (on blue orange)
        (clear orange)
        (ontable yellow)
        (clear yellow)
        (ontable red)
        (clear red)
        (ontable purple)
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