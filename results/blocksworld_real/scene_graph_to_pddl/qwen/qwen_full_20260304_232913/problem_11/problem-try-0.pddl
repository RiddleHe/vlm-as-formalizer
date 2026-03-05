(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        purple_block
        yellow_block
        green_block
        orange_block
        red_block
        blue_block
        robot_arm - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable blue_block)
        (clear purple_block)
        (clear yellow_block)
        (clear green_block)
        (clear orange_block)
        (clear red_block)
        (clear blue_block)
        (handempty robot_arm)
        (on blue_block green_block)
        (on red_block orange_block)
        (on purple_block yellow_block)
    )
    (:goal (and
        (on green_block blue_block)
        (on blue_block purple_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
    ))
)