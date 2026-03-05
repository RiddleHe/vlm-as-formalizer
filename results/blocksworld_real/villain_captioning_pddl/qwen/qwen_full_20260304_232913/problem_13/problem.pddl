(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow - block
        purple - block
        blue - block
        green - block
        red - block
        orange - block
        robot1 - robot
    )
    (:init
        (ontable yellow)
        (ontable green)
        (on purple yellow)
        (on blue purple)
        (on red green)
        (on orange red)
        (clear blue)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on blue yellow)
        (on orange red)
        (on red purple)
        (on purple green)
        (clear blue)
        (clear orange)
        (ontable yellow)
        (ontable green)
    ))
)