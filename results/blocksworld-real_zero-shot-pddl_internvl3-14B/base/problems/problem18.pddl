(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        green - block
        purple - block
        orange - block
        yellow - block
        blue - block
        red - block
        robot - robot
    )
    (:init
        (clear purple)
        (ontable purple)
        (clear orange)
        (ontable orange)
        (clear yellow)
        (ontable yellow)
        (clear blue)
        (ontable blue)
        (clear red)
        (ontable red)
        (clear green)
        (ontable green)
        (handempty robot)
    )
    (:goal 
        (and
            (on green purple)
            (on purple orange)
            (on orange yellow)
            (on yellow blue)
            (on blue red)
        )
    )
)