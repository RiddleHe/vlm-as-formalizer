(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        red_block - block
        orange_block - block
        purple_block - block
        yellow_block - block
        blue_block - block
        green_block - block
        robot1 - robot
    )
    (:init
        (ontable red_block)
        (on orange_block red_block)
        (on purple_block orange_block)
        (on yellow_block purple_block)
        (on blue_block yellow_block)
        (on green_block blue_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block orange_block)
        (on orange_block red_block)
        (ontable red_block)
        (clear green_block)
    ))
)