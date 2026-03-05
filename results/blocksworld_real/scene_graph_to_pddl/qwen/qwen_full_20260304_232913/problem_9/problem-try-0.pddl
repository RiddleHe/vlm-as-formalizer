(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        orange_block
        red_block
        purple_block
        blue_block
        yellow_block
        green_block
        robot_arm - robot
    )
    (:init
        (ontable orange_block)
        (ontable green_block)
        (clear orange_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot_arm)
        (on red_block purple_block)
        (on purple_block orange_block)
        (on blue_block yellow_block)
        (on yellow_block green_block)
    )
    (:goal (and
        (on orange_block blue_block)
        (on red_block green_block)
        (on yellow_block purple_block)
    ))
)