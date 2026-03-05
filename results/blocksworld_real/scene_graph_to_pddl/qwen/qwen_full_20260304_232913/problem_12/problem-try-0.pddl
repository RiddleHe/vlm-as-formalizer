(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        red_block
        orange_block
        yellow_block
        blue_block
        green_block
        purple_block
        robot_arm - robot
    )
    (:init
        (ontable red_block)
        (on orange_block red_block)
        (on blue_block orange_block)
        (on yellow_block blue_block)
        (on green_block yellow_block)
        (on purple_block green_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on yellow_block orange_block)
        (on purple_block green_block)
        (on red_block blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear red_block)
    ))
)