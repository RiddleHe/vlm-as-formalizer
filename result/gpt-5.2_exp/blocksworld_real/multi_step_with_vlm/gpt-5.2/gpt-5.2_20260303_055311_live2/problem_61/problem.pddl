(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        orange_block - block
        yellow_block - block
        red_block - block
        blue_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block blue_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable yellow_block)
        (ontable red_block)
        (clear green_block)
        (clear orange_block)
        (clear yellow_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block orange_block)
    (on blue_block red_block)
    (on green_block purple_block)
)))
