(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green_block
        yellow_block
        purple_block
        orange_block
        red_block
        blue_block
        robot_arm - robot
    )
    (:init
        (on green_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block orange_block)
        (on orange_block red_block)
        (on red_block blue_block)
        (ontable blue_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on purple_block green_block)
        (on orange_block red_block)
        (on blue_block yellow_block)
    ))
)