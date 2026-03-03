(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        blue_block - block
        green_block - block
        yellow_block - block
        purple_block - block
        orange_block - block
        robot_arm - robot
    )
    (:init
        (ontable red_block)
        (ontable blue_block)
        (ontable green_block)
        (ontable yellow_block)
        (ontable purple_block)
        (ontable orange_block)
        (clear red_block)
        (clear blue_block)
        (clear green_block)
        (clear yellow_block)
        (clear purple_block)
        (clear orange_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on yellow_block green_block)
    (on red_block blue_block)
    (on purple_block orange_block)
)))
