(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        green_block - block
        blue_block - block
        purple_block - block
        yellow_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on red_block green_block)
        (on yellow_block orange_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear red_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on green_block orange_block)
    (on orange_block purple_block)
    (on purple_block blue_block)
    (on yellow_block red_block)
)))
