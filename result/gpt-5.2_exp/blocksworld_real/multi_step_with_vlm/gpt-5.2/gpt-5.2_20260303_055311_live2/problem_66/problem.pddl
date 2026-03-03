(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        yellow_block - block
        red_block - block
        green_block - block
        orange_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on yellow_block blue_block)
        (on red_block yellow_block)
        (on green_block red_block)
        (on purple_block orange_block)
        (ontable blue_block)
        (ontable orange_block)
        (clear green_block)
        (clear purple_block)
    )
    (:goal (and 
    (on orange_block green_block)
    (on red_block blue_block)
    (on blue_block purple_block)
    (on purple_block yellow_block)
)))
