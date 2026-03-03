(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        yellow_block - block
        purple_block - block
        blue_block - block
        green_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on red_block yellow_block)
        (on yellow_block purple_block)
        (on purple_block blue_block)
        (on blue_block green_block)
        (ontable green_block)
        (ontable orange_block)
        (clear red_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block blue_block)
    (on purple_block red_block)
    (on red_block green_block)
    (on green_block orange_block)
)))
