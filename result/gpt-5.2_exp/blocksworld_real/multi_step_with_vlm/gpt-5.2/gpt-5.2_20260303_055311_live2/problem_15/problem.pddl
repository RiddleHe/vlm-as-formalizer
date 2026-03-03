(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        yellow_block - block
        red_block - block
        blue_block - block
        purple_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on green_block yellow_block)
        (on yellow_block red_block)
        (on red_block blue_block)
        (on blue_block purple_block)
        (ontable purple_block)
        (clear green_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block blue_block)
    (on blue_block purple_block)
    (on purple_block orange_block)
    (on orange_block green_block)
    (on green_block red_block)
    (ontable red_block)
    (clear yellow_block)
)))
