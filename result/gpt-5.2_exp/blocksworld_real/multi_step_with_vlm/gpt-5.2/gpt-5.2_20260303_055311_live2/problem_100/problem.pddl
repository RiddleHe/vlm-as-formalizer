(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        yellow_block - block
        green_block - block
        orange_block - block
        purple_block - block
        blue_block - block
        robot_arm - robot
    )
    (:init
        (ontable red_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable purple_block)
        (ontable blue_block)
        (clear red_block)
        (clear yellow_block)
        (clear green_block)
        (clear orange_block)
        (clear purple_block)
        (clear blue_block)
        (handempty robot_arm)
    )
    (:goal (and
    (on red_block yellow_block)
    (on yellow_block blue_block)
    (on green_block orange_block)
    (on orange_block purple_block)
)))
