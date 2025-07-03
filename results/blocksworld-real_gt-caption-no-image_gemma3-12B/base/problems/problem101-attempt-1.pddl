(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        green blue - block
        yellow purple - block
        orange red - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on green blue)
        (clear blue)
        (ontable yellow)
        (on yellow purple)
        (clear purple)
        (ontable orange)
        (on orange red)
        (clear red)
        (handempty robot1)
    )
    (:goal
        (and
            (on yellow orange)
            (on red green)
            (on blue purple)
        )
    )
)