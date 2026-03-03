(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        orange_block - block
        green_block - block
        purple_block - block
        yellow_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (on green_block purple_block)
        (on purple_block yellow_block)
        (ontable yellow_block)
        (ontable red_block)
        (clear blue_block)
        (clear red_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on orange_block purple_block)
    (on purple_block blue_block)
    (on yellow_block red_block)
    (on red_block green_block)
)))
