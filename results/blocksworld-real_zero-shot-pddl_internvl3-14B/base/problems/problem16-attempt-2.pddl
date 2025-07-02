(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        green_block - block
        red_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable red_block)
        (ontable orange_block)
        (on purple_block blue_block)
        (on yellow_block red_block)
        (clear green_block)
        (clear red_block)
        (clear orange_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal
        (and
            (on green_block red_block)
            (on red_block orange_block)
            (on orange_block purple_block)
            (on purple_block blue_block)
            (on blue_block yellow_block)
        )
    )
)