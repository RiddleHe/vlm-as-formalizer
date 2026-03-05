(define (problem blocksworld_stack)
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
        (ontable orange_block)
        (clear orange_block)
        (on blue_block purple_block)
        (on green_block blue_block)
        (on yellow_block green_block)
        (on red_block yellow_block)
        (clear purple_block)
        (handempty robot1)
    )
    (:goal (and
        (on purple_block blue_block)
        (on blue_block green_block)
        (on green_block yellow_block)
        (on yellow_block red_block)
        (on red_block orange_block)
        (clear purple_block)
        (ontable orange_block)
    ))
)