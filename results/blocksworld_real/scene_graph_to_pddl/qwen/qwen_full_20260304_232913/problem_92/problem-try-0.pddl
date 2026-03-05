(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        orange_block
        red_block
        purple_block
        yellow_block
        green_block
        blue_block
        robot_arm - robot
    )
    (:init
        (on orange_block red_block)
        (on red_block purple_block)
        (on purple_block yellow_block)
        (on yellow_block green_block)
        (on green_block blue_block)
        (ontable blue_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on red_block green_block)
        (on green_block purple_block)
        (ontable purple_block)
        (clear red_block)
        (on orange_block blue_block)
        (on blue_block yellow_block)
        (ontable yellow_block)
        (clear orange_block)
    ))
)