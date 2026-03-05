(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        orange_block
        purple_block
        green_block
        blue_block
        yellow_block
        red_block
        robot_arm - robot
    )
    (:init
        (ontable orange_block)
        (ontable purple_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable red_block)
        (clear orange_block)
        (clear purple_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on blue_block purple_block)
        (on green_block yellow_block)
        (on red_block orange_block)
    ))
)