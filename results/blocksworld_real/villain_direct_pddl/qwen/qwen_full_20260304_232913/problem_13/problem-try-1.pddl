(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        blue_block - block
        yellow_block - block
        orange_block - block
        red_block - block
        purple_block - block
        green_block - block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable purple_block)
        (ontable green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear orange_block)
        (clear red_block)
        (clear purple_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block yellow_block)
        (on orange_block red_block)
        (on red_block purple_block)
        (on purple_block green_block)
    ))
)