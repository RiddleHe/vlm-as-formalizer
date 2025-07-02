(define (problem blocksworld_problem1)
    (:domain blocksworld)
    (:objects
        blue_block - block
        orange_block - block
        green_block - block
        purple_block - block
        red_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        ; Initial block states
        (ontable yellow_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable red_block)
        (ontable blue_block)
        (ontable green_block)
        (clear yellow_block)
        (clear orange_block)
        (clear purple_block)
        (clear red_block)
        (clear blue_block)
        (not (clear green_block))
        (on green_block red_block)
        ; Initial state for robot
        (handempty robot1)
    )
    (:goal
        (and
            (on blue_block orange_block)
            (on orange_block green_block)
            (on green_block purple_block)
            (on purple_block red_block)
            (on red_block yellow_block)
        )
    )
)