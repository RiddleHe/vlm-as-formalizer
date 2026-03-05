(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        red_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        orange_block - block
        robot1 - robot
    )
    (:init
        (on red_block yellow_block)
        (on yellow_block green_block)
        (on green_block blue_block)
        (on blue_block purple_block)
        (ontable purple_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
    ))
)