(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        orange_block - block
        red_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (on orange_block red_block)
        (on red_block yellow_block)
        (on yellow_block green_block)
        (on green_block blue_block)
        (on blue_block purple_block)
        (ontable purple_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
    ))
)