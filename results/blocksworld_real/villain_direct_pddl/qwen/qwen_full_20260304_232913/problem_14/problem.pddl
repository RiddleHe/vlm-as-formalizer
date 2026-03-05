(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        purple_block - block
        yellow_block - block
        orange_block - block
        blue_block - block
        red_block - block
        green_block - block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable blue_block)
        (ontable red_block)
        (ontable green_block)
        (clear purple_block)
        (clear yellow_block)
        (clear orange_block)
        (clear blue_block)
        (clear red_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block yellow_block)
        (on yellow_block orange_block)
        (on blue_block red_block)
        (on red_block green_block)
        (clear purple_block)
        (clear blue_block)
        (ontable orange_block)
        (ontable green_block)
    ))
)