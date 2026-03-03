(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block purple_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable red_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear orange_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on green_block orange_block)
    (on orange_block blue_block)
    (on blue_block yellow_block)
    (on purple_block red_block)
)))
