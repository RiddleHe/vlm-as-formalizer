(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        orange_block
        blue_block
        purple_block
        green_block
        red_block
        yellow_block
        robot_arm
    )
    (:init
        (ontable orange_block)
        (ontable purple_block)
        (ontable green_block)
        (ontable red_block)
        (ontable yellow_block)
        (ontable blue_block)
        (clear orange_block)
        (clear blue_block)
        (clear purple_block)
        (clear green_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot_arm)
        (on blue_block orange_block)
        (on red_block green_block)
        (on yellow_block red_block)
    )
    (:goal (and
        (on orange_block red_block)
        (on red_block yellow_block)
        (on blue_block purple_block)
        (on purple_block green_block)
        (clear orange_block)
        (clear blue_block)
        (ontable yellow_block)
        (ontable green_block)
    ))
)