(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        red_block
        yellow_block
        orange_block
        purple_block
        blue_block
        green_block
        robot_arm - robot
    )
    (:init
        (on red_block orange_block)
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on blue_block green_block)
        (ontable green_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on yellow_block green_block)
        (on blue_block purple_block)
        (on orange_block red_block)
        (clear yellow_block)
        (clear blue_block)
        (clear orange_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable red_block)
    ))
)