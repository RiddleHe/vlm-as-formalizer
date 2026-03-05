(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block
        yellow_block
        orange_block
        purple_block
        blue_block
        green_block
        robot_arm - robot
    )
    (:init
        (ontable green_block)
        (on blue_block green_block)
        (on purple_block blue_block)
        (on orange_block purple_block)
        (on red_block orange_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on yellow_block green_block)
        (on blue_block purple_block)
        (on orange_block red_block)
    ))
)