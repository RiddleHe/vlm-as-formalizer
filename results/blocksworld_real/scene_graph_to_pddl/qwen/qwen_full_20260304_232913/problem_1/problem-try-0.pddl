(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        purple_block
        orange_block
        red_block
        yellow_block
        robot_arm
    )
    (:init
        (ontable green_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable yellow_block)
        (on purple_block orange_block)
        (clear green_block)
        (clear blue_block)
        (clear red_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on orange_block yellow_block)
        (on green_block blue_block)
        (on red_block purple_block)
    ))
)