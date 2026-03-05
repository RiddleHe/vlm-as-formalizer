(define (problem block_stack_goal)
    (:domain blocksworld)
    (:objects
        green_block
        red_block
        orange_block
        blue_block
        purple_block
        yellow_block
        robot1 - robot
    )
    (:init
        (ontable yellow_block)
        (on purple_block yellow_block)
        (on blue_block purple_block)
        (on orange_block blue_block)
        (on red_block orange_block)
        (on green_block red_block)
        (clear green_block)
        (handempty robot1)
    )
    (:goal (and
        (on green_block red_block)
        (on red_block orange_block)
        (on orange_block blue_block)
        (on blue_block purple_block)
        (on purple_block yellow_block)
        (ontable yellow_block)
        (clear green_block)
    ))
)