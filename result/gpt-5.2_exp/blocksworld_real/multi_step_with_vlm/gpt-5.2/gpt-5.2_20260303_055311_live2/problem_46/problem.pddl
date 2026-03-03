(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block orange_block)
        (on orange_block purple_block)
        (on purple_block blue_block)
        (on blue_block green_block)
        (ontable green_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on yellow_block green_block)
    (on blue_block purple_block)
    (on orange_block red_block)
)))
