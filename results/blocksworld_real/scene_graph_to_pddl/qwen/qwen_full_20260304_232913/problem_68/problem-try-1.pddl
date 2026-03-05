(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        purple_block - block
        yellow_block - block
        green_block - block
        orange_block - block
        blue_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (ontable purple_block)
        (ontable yellow_block)
        (ontable green_block)
        (on red_block blue_block)
        (on blue_block orange_block)
        (clear purple_block)
        (clear yellow_block)
        (clear green_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on orange_block red_block)
        (on red_block green_block)
        (on green_block blue_block)
        (on blue_block purple_block)
        (on purple_block yellow_block)
        (ontable yellow_block)
    ))
)