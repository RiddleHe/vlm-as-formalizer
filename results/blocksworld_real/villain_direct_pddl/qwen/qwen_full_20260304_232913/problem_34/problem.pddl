(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        yellow_block - block
        green_block - block
        red_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable green_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear green_block)
        (clear red_block)
        (clear orange_block)
        (clear purple_block)
        (clear blue_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block yellow_block)
        (on green_block red_block)
        (on blue_block orange_block)
        (clear purple_block)
        (clear green_block)
        (clear blue_block)
    ))
)