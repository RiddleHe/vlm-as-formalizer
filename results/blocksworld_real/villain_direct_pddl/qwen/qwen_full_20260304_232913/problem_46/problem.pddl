(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        red_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        green_block - block
        robot1 - robot
    )
    (:init
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on blue_block green_block)
        (ontable green_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on yellow_block green_block)
        (on blue_block purple_block)
        (on orange_block red_block)
        (clear yellow_block)
        (clear blue_block)
        (clear orange_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable red_block)
    ))
)