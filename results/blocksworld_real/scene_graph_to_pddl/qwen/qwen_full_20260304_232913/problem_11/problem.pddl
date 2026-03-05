(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow_block
        purple_block
        green_block
        blue_block
        orange_block
        red_block
        robot_arm - robot
    )
    (:init
        (ontable yellow_block)
        (ontable orange_block)
        (ontable red_block)
        (clear yellow_block)
        (clear purple_block)
        (clear blue_block)
        (clear orange_block)
        (clear red_block)
        (on purple_block yellow_block)
        (on green_block orange_block)
        (on blue_block green_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on green_block blue_block)
        (on blue_block purple_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
        (clear green_block)
        (clear red_block)
        (ontable orange_block)
        (ontable yellow_block)
    ))
)