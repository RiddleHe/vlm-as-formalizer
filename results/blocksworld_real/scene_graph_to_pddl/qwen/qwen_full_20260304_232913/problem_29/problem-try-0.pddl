(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        blue_block
        yellow_block
        orange_block
        green_block
        red_block
        purple_block
        robot_arm - robot
    )
    (:init
        (ontable blue_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear orange_block)
        (on orange_block green_block)
        (on green_block red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block green_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block yellow_block)
        (clear blue_block)
        (ontable yellow_block)
    ))
)