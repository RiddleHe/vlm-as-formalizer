(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        green_block - block
        blue_block - block
        purple_block - block
        red_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block green_block)
        (on blue_block purple_block)
        (on red_block yellow_block)
        (ontable green_block)
        (ontable purple_block)
        (ontable yellow_block)
        (clear orange_block)
        (clear blue_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on blue_block yellow_block)
    (on yellow_block orange_block)
    (on green_block red_block)
    (on red_block purple_block)
)))
