(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        red_block - block
        purple_block - block
        blue_block - block
        yellow_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block purple_block)
        (on red_block blue_block)
        (on purple_block blue_block)
        (on blue_block yellow_block)
        (on yellow_block green_block)
        (ontable green_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on purple_block green_block)
    (on blue_block red_block)
    (on red_block orange_block)
    (on orange_block yellow_block)
)))
