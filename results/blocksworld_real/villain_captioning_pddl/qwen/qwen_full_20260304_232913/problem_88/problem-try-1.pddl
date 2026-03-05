(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        orange - block
        blue - block
        green - block
        red - block
        yellow - block
        purple - block
        robot1 - robot
    )
    (:init
        (on orange green)
        (on green blue)
        (on red yellow)
        (ontable blue)
        (ontable yellow)
        (ontable purple)
        (clear orange)
        (clear red)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on green blue)
        (on yellow red)
        (on red purple)
        (on purple orange)
        (ontable blue)
        (ontable yellow)
        (clear green)
        (clear orange)
    ))
)