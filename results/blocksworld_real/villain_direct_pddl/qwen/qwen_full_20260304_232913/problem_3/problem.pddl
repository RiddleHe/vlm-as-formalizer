(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        purple_block - block
        yellow_block - block
        red_block - block
        orange_block - block
        green_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable blue_block)
        (clear purple_block)
        (clear yellow_block)
        (clear red_block)
        (clear orange_block)
        (clear green_block)
        (clear blue_block)
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