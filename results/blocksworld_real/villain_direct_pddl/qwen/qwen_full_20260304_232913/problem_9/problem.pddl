(define (problem block_stacking_goal)
    (:domain blocksworld)
    (:objects
        orange_block1 - block
        orange_block2 - block
        red_block - block
        blue_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        robot1 - robot
    )
    (:init
        (ontable orange_block1)
        (ontable orange_block2)
        (ontable red_block)
        (ontable blue_block)
        (ontable green_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear orange_block1)
        (clear orange_block2)
        (clear red_block)
        (clear blue_block)
        (clear green_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block1 blue_block)
        (on red_block green_block)
        (on yellow_block purple_block)
    ))
)