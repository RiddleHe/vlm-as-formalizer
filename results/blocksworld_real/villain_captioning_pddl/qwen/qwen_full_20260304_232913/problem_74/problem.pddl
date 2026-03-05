(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        blue - block
        red - block
        green - block
        purple - block
        robot1 - robot
    )
    (:init
        (on yellow orange)
        (ontable orange)
        (clear yellow)
        (on red green)
        (on green purple)
        (ontable purple)
        (clear red)
        (ontable blue)
        (clear blue)
        (handempty robot1)
    )
    (:goal (and
        (on yellow green)
        (on green purple)
        (on purple red)
        (on red blue)
        (on blue orange)
        (ontable orange)
        (clear yellow)
    ))
)