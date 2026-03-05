(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        red_block - block
        green_block - block
        orange_block - block
        blue_block - block
        purple_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (ontable red_block)
        (clear red_block)
        (ontable orange_block)
        (on blue_block orange_block)
        (on yellow_block blue_block)
        (on purple_block yellow_block)
        (on green_block purple_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
        (on red_block green_block)
        (clear red_block)
        (ontable orange_block)
        (on blue_block orange_block)
        (on purple_block blue_block)
        (on yellow_block purple_block)
        (clear yellow_block)
    ))
)