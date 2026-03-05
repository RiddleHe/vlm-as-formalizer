(define (problem block_stacking_task)
    (:domain blocksworld)
    (:objects
        orange_block
        red_block
        yellow_block
        green_block
        blue_block
        purple_block
        robot1 - robot
    )
    (:init
        (on red_block orange_block)
        (on yellow_block red_block)
        (on green_block yellow_block)
        (on blue_block green_block)
        (ontable purple_block)
        (clear orange_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block blue_block)
        (on purple_block orange_block)
        (on red_block yellow_block)
    ))
)