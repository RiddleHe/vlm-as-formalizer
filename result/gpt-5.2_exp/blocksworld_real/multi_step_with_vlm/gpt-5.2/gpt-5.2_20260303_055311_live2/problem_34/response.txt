(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        red_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on red_block green_block)
        (on orange_block red_block)
        (on purple_block orange_block)
        (on blue_block purple_block)
        (on yellow_block blue_block)
        (ontable blue_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on purple_block yellow_block)
    (on green_block red_block)
    (on blue_block orange_block)
)))
