(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        orange_block
        purple_block
        green_block
        blue_block
        yellow_block
        red_block
        robot1 - robot
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
        (handempty robot1)
    )
    (:goal (and
        (on blue_block purple_block)
        (on green_block yellow_block)
        (on red_block orange_block)
    ))
)