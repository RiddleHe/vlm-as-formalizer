(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        green_block
        yellow_block
        blue_block
        purple_block
        orange_block
        red_block
        robot_arm - robot
    )
    (:init
        (ontable green_block)
        (clear green_block)
        (clear yellow_block)
        (clear blue_block)
        (clear purple_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot_arm)
        (on yellow_block green_block)
        (on blue_block yellow_block)
        (on purple_block blue_block)
        (on red_block purple_block)
        (on orange_block red_block)
    )
    (:goal (and
        (on purple_block green_block)
        (on blue_block red_block)
        (on red_block orange_block)
        (on orange_block yellow_block)
        (clear purple_block)
        (clear blue_block)
        (ontable yellow_block)
    ))
)