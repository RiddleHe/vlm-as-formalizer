(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow_block
        green_block
        red_block
        orange_block
        purple_block
        blue_block
        robot_arm
    )
    (:init
        (ontable yellow_block)
        (ontable green_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear green_block)
        (clear red_block)
        (clear orange_block)
        (clear purple_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on purple_block yellow_block)
        (on green_block red_block)
        (on blue_block orange_block)
    ))
)