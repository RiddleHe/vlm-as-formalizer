(define (problem blocksworld_goal)
    (:domain blocksworld)
    (:objects
        blue_block
        red_block
        orange_block
        purple_block
        green_block
        yellow_block
        robot_arm - robot
    )
    (:init
        (ontable yellow_block)
        (on green_block yellow_block)
        (on purple_block green_block)
        (on orange_block purple_block)
        (on blue_block orange_block)
        (on red_block blue_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on red_block blue_block)
        (on blue_block green_block)
        (on green_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block purple_block)
        (clear red_block)
        (ontable purple_block)
    ))
)