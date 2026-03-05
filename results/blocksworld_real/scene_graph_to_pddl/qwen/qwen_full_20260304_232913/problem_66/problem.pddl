(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        blue_block
        yellow_block
        red_block
        orange_block
        purple_block
        green_block
        robot1 - robot
    )
    (:init
        (ontable blue_block)
        (ontable orange_block)
        (clear red_block)
        (clear purple_block)
        (clear green_block)
        (handempty robot1)
        (on red_block yellow_block)
        (on yellow_block blue_block)
        (on purple_block orange_block)
        (on green_block red_block)
    )
    (:goal (and
        (on orange_block green_block)
        (on red_block blue_block)
        (on blue_block purple_block)
        (on purple_block yellow_block)
    ))
)