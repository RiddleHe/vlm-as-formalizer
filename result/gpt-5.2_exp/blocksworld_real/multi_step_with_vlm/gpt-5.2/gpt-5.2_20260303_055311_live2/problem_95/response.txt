(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        orange_block - block
        green_block - block
        red_block - block
        purple_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (on red_block purple_block)
        (ontable green_block)
        (ontable yellow_block)
        (clear blue_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on green_block red_block)
    (on blue_block orange_block)
    (on orange_block purple_block)
    (on purple_block yellow_block)
)))
