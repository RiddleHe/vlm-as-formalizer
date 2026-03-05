(define (problem block_stack_goal)
    (:domain blocksworld)
    (:objects
        blue_block
        orange_block
        red_block
        purple_block
        green_block
        yellow_block
        robot_arm
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable green_block)
        (on blue_block purple_block)
        (clear blue_block)
        (clear orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear green_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on blue_block orange_block)
        (on orange_block red_block)
        (on red_block purple_block)
        (on purple_block green_block)
        (on green_block yellow_block)
        (ontable yellow_block)
    ))
)