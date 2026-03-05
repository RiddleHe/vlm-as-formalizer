(define (problem block_stack_goal)
    (:domain blocksworld)
    (:objects
        green_block
        yellow_block
        blue_block
        orange_block
        purple_block
        red_block
        robot_arm - robot
    )
    (:init
        (ontable red_block)
        (on purple_block red_block)
        (on orange_block purple_block)
        (on blue_block orange_block)
        (on yellow_block blue_block)
        (on green_block yellow_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block orange_block)
        (on orange_block red_block)
        (ontable red_block)
        (clear green_block)
    ))
)