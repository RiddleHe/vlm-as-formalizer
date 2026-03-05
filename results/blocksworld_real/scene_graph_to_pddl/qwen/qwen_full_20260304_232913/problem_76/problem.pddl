(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        orange_block_top - block
        yellow_block - block
        purple_block - block
        green_block - block
        blue_block - block
        orange_block_bottom - block
        robot_arm - robot
    )
    (:init
        (ontable orange_block_bottom)
        (on blue_block orange_block_bottom)
        (on green_block blue_block)
        (on purple_block green_block)
        (on yellow_block purple_block)
        (on orange_block_top yellow_block)
        (clear orange_block_top)
        (handempty robot_arm)
    )
    (:goal (and
        (on red_block purple_block) ; Note: 'red_block' not in scene graph; this is an error in instruction or scene analysis
        (on yellow_block green_block)
        (on green_block orange_block)
        (on orange_block blue_block)
    ))
)