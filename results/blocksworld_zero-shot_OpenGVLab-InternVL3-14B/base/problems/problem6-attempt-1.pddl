(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        robot
        purple_block - block
        pink_block - block
        orange_block - block
        yellow_block - block
    )
    (:init
        (ontable purple_block)
        (clear purple_block)
        (ontable pink_block)
        (clear pink_block)
        (ontable orange_block)
        (clear orange_block)
        (holding yellow_block)
        (on yellow_block orange_block)
        (clear yellow_block)
        (handfull robot)
    )
    (:goal (and
        (on pink_block purple_block)
        (on yellow_block orange_block)
    ))
)