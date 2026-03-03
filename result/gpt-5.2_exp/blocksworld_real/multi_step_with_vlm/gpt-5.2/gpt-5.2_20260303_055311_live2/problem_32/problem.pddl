(define (problem blocksworld)    (:domain blocksworld)    (:objects
        yellow_block - block
        blue_block - block
        purple_block - block
        red_block - block
        green_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block yellow_block)
        (on purple_block blue_block)
        (on orange_block red_block)
        (ontable yellow_block)
        (ontable green_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on blue_block yellow_block)
    (on purple_block blue_block)
    (on red_block purple_block)
    (on green_block red_block)
    (on orange_block green_block)
)))
