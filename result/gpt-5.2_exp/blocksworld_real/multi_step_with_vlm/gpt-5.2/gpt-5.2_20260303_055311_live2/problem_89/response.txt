(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        blue_block - block
        red_block - block
        orange_block - block
        purple_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block blue_block)
        (on purple_block orange_block)
        (on green_block purple_block)
        (ontable red_block)
        (ontable orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on purple_block green_block)
    (on green_block blue_block)
    (on blue_block yellow_block)
    (on orange_block red_block)
)))
