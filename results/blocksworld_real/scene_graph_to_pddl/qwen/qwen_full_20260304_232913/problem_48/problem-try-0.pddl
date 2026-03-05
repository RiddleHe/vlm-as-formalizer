(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        green_block
        yellow_block
        red_block
        orange_block
        blue_block
        purple_block
        robot1 - robot
    )
    (:init
        (ontable green_block)
        (ontable orange_block)
        (on red_block yellow_block)
        (on yellow_block green_block)
        (on purple_block blue_block)
        (on blue_block orange_block)
        (clear red_block)
        (clear purple_block)
        (clear green_block)
        (clear orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on blue_block purple_block)
        (on red_block yellow_block)
        (on green_block orange_block)
    ))
)