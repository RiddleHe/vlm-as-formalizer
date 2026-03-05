(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        blue_block - block
        orange_block - block
        green_block - block
        red_block - block
        yellow_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable red_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear blue_block)
        (clear orange_block)
        (clear green_block)
        (clear red_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block orange_block)
        (on green_block red_block)
        (on yellow_block purple_block)
    ))
)