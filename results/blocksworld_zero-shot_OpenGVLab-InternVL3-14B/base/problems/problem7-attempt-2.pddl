(define (problem block_stack)
    (:domain blocksworld)
    (:objects
        robot - robot
        yellow_block - block
        pink_block - block
        green_block - block
        red_block - block
        purple_block - block
        orange_block - block
    )
    (:init
        (ontable green_block)
        (on pink_block green_block)
        (on red_block pink_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear orange_block)
        (handempty robot)
    )
    (:goal
        (and
            (on yellow_block pink_block)
            (on pink_block green_block)
            (on green_block red_block)
            (on red_block purple_block)
            (clear purple_block)
            (ontable orange_block)
        )
    )
)