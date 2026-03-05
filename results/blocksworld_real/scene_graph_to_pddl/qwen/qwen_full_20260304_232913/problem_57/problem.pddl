(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        yellow_block
        green_block
        purple_block
        red_block
        orange_block
        blue_block
        robot1 - robot
    )
    (:init
        (ontable purple_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear red_block)
        (handempty robot1)
        (on yellow_block green_block)
        (on green_block purple_block)
        (on red_block orange_block)
        (on orange_block blue_block)
    )
    (:goal (and
        (on red_block yellow_block)
        (on yellow_block orange_block)
        (on green_block blue_block)
        (on blue_block purple_block)
        (clear red_block)
        (clear green_block)
        (ontable purple_block)
    ))
)