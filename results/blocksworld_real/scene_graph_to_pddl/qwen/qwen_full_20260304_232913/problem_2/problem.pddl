(define (problem block_stacking)
    (:domain blocksworld)
    (:objects
        orange_block
        blue_block
        purple_block
        red_block
        green_block
        yellow_block
        robot1 - robot
    )
    (:init
        (on orange_block blue_block)
        (on blue_block purple_block)
        (on purple_block red_block)
        (on green_block yellow_block)
        (ontable yellow_block)
        (clear orange_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block red_block)
        (on red_block purple_block)
        (on purple_block blue_block)
        (on blue_block orange_block)
        (on orange_block yellow_block)
        (clear green_block)
        (ontable yellow_block)
    ))
)