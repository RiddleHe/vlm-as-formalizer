(define (problem blocksworld4)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        orange - block
        blue - block
        green - block
        purple - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable yellow)
        (ontable red)
        (ontable purple)
        (ontable green)
        (ontable blue)
        (on orange blue)
        (on blue green)
        (on green purple)
        (clear yellow)
        (clear red)
        (clear purple)
        (clear orange)
    )
    (:goal (and
        (on blue orange)
        (on yellow green)
        (on green red)
        (on red purple)
    ))
)