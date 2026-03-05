(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        red_block
        yellow_block
        orange_block
        purple_block
        blue_block
        green_block
        robot_arm
    )
    (:init
        (ontable red_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable blue_block)
        (ontable green_block)
        (clear red_block)
        (clear yellow_block)
        (clear orange_block)
        (clear purple_block)
        (clear blue_block)
        (clear green_block)
        (handempty robot_arm)
        (on red_block yellow_block)
    )
    (:goal (and
        (on yellow_block purple_block)
        (on blue_block red_block)
        (on orange_block green_block)
    ))
)