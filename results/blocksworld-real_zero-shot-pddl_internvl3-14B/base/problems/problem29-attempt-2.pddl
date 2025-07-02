(define (problem blocksworld_problem1_corrected)
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
        ; Initial block states as per image
        (ontable red_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear yellow_block)
        (clear purple_block)
        (not (clear orange_block)) ; already on green, not clear
        (clear blue_block)
        (clear red_block)
        (on green_block orange_block)
        (on orange_block red_block)
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
            (clear blue_block) ; Ensuring blue is on top.
        )
    )
)