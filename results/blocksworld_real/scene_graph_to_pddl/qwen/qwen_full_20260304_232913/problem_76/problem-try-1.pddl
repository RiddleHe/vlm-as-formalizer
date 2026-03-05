(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        yellow_block
        purple_block
        green_block
        blue_block
        robot_arm - robot
    )
    (:init
        (on yellow_block purple_block)
        (on purple_block green_block)
        (on green_block blue_block)
        (on blue_block orange_block)
        (ontable orange_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on red_block purple_block)
        (on yellow_block green_block)
        (on green_block orange_block)
        (on orange_block blue_block)
        (clear red_block)
        (clear yellow_block)
    ))
)