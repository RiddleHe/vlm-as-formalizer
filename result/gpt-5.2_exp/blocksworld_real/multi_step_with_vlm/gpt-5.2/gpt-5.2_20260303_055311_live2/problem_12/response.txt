(define (problem blocksworld)    (:domain blocksworld)    (:objects
        purple_block - block
        green_block - block
        yellow_block - block
        blue_block - block
        orange_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on green_block yellow_block)
        (on yellow_block blue_block)
        (on blue_block orange_block)
        (on orange_block red_block)
        (on red_block orange_block)
        (ontable red_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block orange_block)
    (on purple_block green_block)
    (on red_block blue_block)
)))
