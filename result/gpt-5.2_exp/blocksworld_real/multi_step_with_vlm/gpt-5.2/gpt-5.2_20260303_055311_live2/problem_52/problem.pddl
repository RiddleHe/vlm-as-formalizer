(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        red_block - block
        orange_block - block
        purple_block - block
        green_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block red_block)
        (on red_block orange_block)
        (on purple_block green_block)
        (ontable orange_block)
        (ontable blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on purple_block green_block)
    (on yellow_block red_block)
    (on orange_block blue_block)
)))
