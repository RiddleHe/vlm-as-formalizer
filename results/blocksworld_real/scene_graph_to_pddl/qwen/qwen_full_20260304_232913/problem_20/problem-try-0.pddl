(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        blue_block
        green_block
        orange_block
        yellow_block
        purple_block
        red_block
        robot_arm - robot
    )
    (:init
        (ontable blue_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable purple_block)
        (ontable red_block)
        (clear blue_block)
        (clear green_block)
        (clear orange_block)
        (clear yellow_block)
        (clear purple_block)
        (clear red_block)
        (handempty robot_arm)
        (on yellow_block orange_block)
        (on orange_block red_block)
        (on red_block purple_block)
    )
    (:goal (and
        (on yellow_block orange_block)
        (on orange_block red_block)
        (on red_block purple_block)
        (on blue_block green_block)
        (clear yellow_block)
        (clear blue_block)
        (ontable green_block)
        (ontable purple_block)
    ))
)