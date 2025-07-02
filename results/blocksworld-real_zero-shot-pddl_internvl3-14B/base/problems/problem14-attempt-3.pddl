(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange - block
        yellow - block
        purple - block
        green - block
        blue - block
        red - block
        robot1 - robot
    )
    (:init
        (clear purple)
        (clear red)
        (clear green)
        (clear blue)
        (clear yellow)
        (ontable orange)
        (ontable green)
        (clear green)
        (handempty robot1)
        (on purple yellow)
        (on yellow orange)
        (on blue red)
        (on red green)
    )
    (:goal
        (and
            (on purple yellow)
            (on yellow orange)
            (clear purple)
            (on blue red)
            (on red green)
            (clear blue)
        )
    )
)