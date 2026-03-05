(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        yellow_block
        orange_block
        purple_block
        red_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable red_block)
        (on orange_block purple_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear red_block)
        (clear orange_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block orange_block)
        (on orange_block blue_block)
        (on blue_block yellow_block)
        (on purple_block red_block)
        (clear green_block)
        (clear purple_block)
        (ontable yellow_block)
        (ontable red_block)
    ))
)