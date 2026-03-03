(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        blue_block - block
        orange_block - block
        purple_block - block
        red_block - block
        green_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (on purple_block orange_block)
        (ontable yellow_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable green_block)
        (clear yellow_block)
        (clear blue_block)
        (clear purple_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block blue_block)
    (on orange_block purple_block)
    (on red_block green_block)
)))
