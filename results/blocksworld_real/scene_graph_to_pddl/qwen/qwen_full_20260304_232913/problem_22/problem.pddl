(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        orange_block
        red_block
        blue_block
        green_block
        purple_block
        yellow_block
        robot_arm - robot
    )
    (:init
        (ontable yellow_block)
        (clear orange_block)
        (clear red_block)
        (clear blue_block)
        (clear green_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot_arm)
        (on orange_block red_block)
        (on red_block blue_block)
        (on blue_block green_block)
        (on green_block purple_block)
    )
    (:goal (and
        (on green_block orange_block)
        (on purple_block yellow_block)
        (on yellow_block red_block)
        (on red_block blue_block)
        (clear green_block)
        (clear purple_block)
    ))
)