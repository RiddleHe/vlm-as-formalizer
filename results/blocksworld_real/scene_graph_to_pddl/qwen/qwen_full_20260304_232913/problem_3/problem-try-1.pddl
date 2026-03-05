(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        green_block
        blue_block
        orange_block
        red_block
        yellow_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (on blue_block green_block)
        (on orange_block blue_block)
        (on red_block orange_block)
        (on yellow_block red_block)
        (on purple_block yellow_block)
        (clear purple_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block red_block)
        (on yellow_block orange_block)
        (on orange_block green_block)
        (on green_block blue_block)
        (clear purple_block)
        (clear yellow_block)
    ))
)