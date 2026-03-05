(define (problem block_stack_goal)
    (:domain blocksworld)
    (:objects
        orange_block
        red_block
        yellow_block
        purple_block
        green_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (on green_block blue_block)
        (on purple_block green_block)
        (on yellow_block purple_block)
        (on red_block yellow_block)
        (on orange_block red_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on orange_block purple_block)
        (on purple_block green_block)
        (on green_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block red_block)
        (ontable red_block)
    ))
)