(define (problem blocksworld3)
    (:domain blocksworld)
    (:objects
        green blue - block
        yellow purple - block
        orange red - block
        robot1 - robot
    )
    (:init
        (handempty robot1)
        (ontable green)
        (clear green)
        (ontable blue)
        (clear blue)
        (on green blue)
        (ontable yellow)
        (clear yellow)
        (ontable purple)
        (clear purple)
        (on yellow purple)
        (ontable orange)
        (clear orange)
        (ontable red)
        (clear red)
        (on orange red)
    )
    (:goal
        (and
            (on yellow orange)
            (on red green)
            (on blue purple)
        )
    )
)