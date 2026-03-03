(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        red_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (on green_block yellow_block)
        (on purple_block red_block)
        (ontable yellow_block)
        (ontable red_block)
        (ontable orange_block)
        (clear blue_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block blue_block)
    (on red_block orange_block)
    (on orange_block green_block)
    (on green_block purple_block)
)))
