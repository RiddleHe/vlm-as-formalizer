(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        green_block - block
        purple_block - block
        blue_block - block
        orange_block - block
        red_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable purple_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear blue_block)
        (clear orange_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block blue_block)
        (on blue_block purple_block)
        (on red_block orange_block)
        (on orange_block green_block)
        (clear yellow_block)
        (clear red_block)
    ))
)