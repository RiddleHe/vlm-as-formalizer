(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        yellow_block
        purple_block
        green_block
        red_block
        blue_block
        orange_block
        robot1 - robot
    )
    (:init
        (on yellow_block purple_block)
        (on purple_block green_block)
        (on green_block red_block)
        (on red_block blue_block)
        (on blue_block orange_block)
        (ontable orange_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block red_block)
        (on yellow_block blue_block)
        (on purple_block green_block)
        (ontable red_block)
        (ontable blue_block)
        (ontable green_block)
        (clear orange_block)
        (clear yellow_block)
        (clear purple_block)
    ))
)