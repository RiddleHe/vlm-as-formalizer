(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        purple_block - block
        orange_block - block
        yellow_block - block
        blue_block - block
        red_block - block
        robot_arm - robot
    )
    (:init
        (on orange_block yellow_block)
        (on blue_block red_block)
        (ontable green_block)
        (ontable purple_block)
        (clear green_block)
        (clear purple_block)
        (clear orange_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on red_block yellow_block)
    (on yellow_block blue_block)
    (on orange_block green_block)
    (on green_block purple_block)
)))
