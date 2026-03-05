(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        red - block
        yellow - block
        green - block
        blue - block
        purple - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (ontable yellow)
        (ontable green)
        (ontable blue)
        (ontable purple)
        (clear red)
        (clear yellow)
        (clear green)
        (clear blue)
        (clear purple)
        (handempty robot1)
    )
    (:goal (and
        (on blue red)
        (on yellow green)
        (on green red)
        (on red purple)
        (clear blue)
        (clear yellow)
    ))
)