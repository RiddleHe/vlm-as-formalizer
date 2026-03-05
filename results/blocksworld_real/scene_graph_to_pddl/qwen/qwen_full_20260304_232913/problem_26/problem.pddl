(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        purple_block
        blue_block
        green_block
        yellow_block
        red_block
        orange_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (on blue_block purple_block)
        (on green_block blue_block)
        (on yellow_block green_block)
        (on orange_block yellow_block)
        (on red_block orange_block)
        (clear red_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
        (clear green_block)
        (clear purple_block)
        (clear red_block)
        (ontable blue_block)
        (ontable orange_block)
        (ontable yellow_block)
    ))
)