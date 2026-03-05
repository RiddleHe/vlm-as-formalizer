(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        yellow - block
        red - block
        orange - block
        purple - block
        green - block
        blue - block
        robot - robot
    )
    (:init
        (on orange red)
        (on red yellow)
        (ontable yellow)
        (ontable purple)
        (ontable green)
        (ontable blue)
        (clear orange)
        (clear purple)
        (clear green)
        (clear blue)
        (handempty robot)
    )
    (:goal (and
        (on red purple)
        (on purple yellow)
        (ontable yellow)
        (on orange blue)
        (on blue green)
        (ontable green)
    ))
)