(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green_block
        red_block
        orange_block
        purple_block
        blue_block
        yellow_block
        robot_arm
    )
    (:init
        (ontable green_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable blue_block)
        (ontable yellow_block)
        (clear green_block)
        (clear red_block)
        (clear orange_block)
        (clear purple_block)
        (clear blue_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on green_block red_block)
        (on orange_block purple_block)
        (on blue_block yellow_block)
        (clear green_block)
        (clear orange_block)
        (clear blue_block)
    ))
)