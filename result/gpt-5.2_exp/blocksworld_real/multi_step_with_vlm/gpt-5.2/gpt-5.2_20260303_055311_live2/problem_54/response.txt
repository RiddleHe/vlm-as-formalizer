(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        orange_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block green_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (clear red_block)
        (clear orange_block)
        (clear yellow_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block orange_block)
    (on orange_block purple_block)
    (on purple_block green_block)
    (on green_block blue_block)
    (on blue_block red_block)
)))
