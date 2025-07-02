(define (problem blocksworld-problem)
    (:domain blocksworld)
    (:objects
        yellow - block
        orange - block
        red - block
        green - block
        blue - block
        purple - block
        robot1 - robot
    )
    (:init
        ; Current initial state as per image
        (on green yellow)
        (on yellow orange)
        (on purple red)
        (clear blue)
        (clear green)
        (clear red)
        (clear blue)
        (ontable orange)
        (ontable purple)
        (ontable blue)
        (handempty robot1)
    )
    (:goal
        (and
            ; Target stacks
            (on yellow orange)
            (on red green)
            (on blue purple)
        )
    )
)