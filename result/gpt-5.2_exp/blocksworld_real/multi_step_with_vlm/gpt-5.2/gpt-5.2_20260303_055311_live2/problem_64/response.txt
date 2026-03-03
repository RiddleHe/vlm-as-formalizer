(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        yellow_block - block
        purple_block - block
        green_block - block
        red_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (on green_block red_block)
        (on red_block orange_block)
        (ontable blue_block)
        (ontable yellow_block)
        (ontable purple_block)
        (clear blue_block)
        (clear yellow_block)
        (clear purple_block)
        (clear green_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on orange_block blue_block)
    (on blue_block red_block)
    (on red_block purple_block)
    (on yellow_block green_block)
)))
